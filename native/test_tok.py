"""Проверки переноса по реальным результатам оригинального TOKP.EXE."""

import math
from pathlib import Path
import json
import struct
import tempfile
import unittest

from legacy_io import format_pair_records, read_field, read_tokgr, serialize_case, write_field, write_tokgr
from plot_core import calculate_field
from resistivity import glass_resistivity
from tok_app import parameters_from_text
from tok_core import CalculationError, calculate, isolated_group_equations, load_case, parse_dat, solve_linear


ROOT = Path(__file__).resolve().parent.parent / "ТОК1"


class TokCompatibilityTests(unittest.TestCase):
    """Сравнивает перенос с DOS-эталонами и проверяет отказ на неверных данных."""

    def test_round_circle_original_dos_result(self):
        """Контрольный CIRCLE: точные R сняты из памяти оригинала, U — из LST."""
        result = calculate(load_case(ROOT / "CIRCLE.DAT"))
        self.assertAlmostEqual(result["resistance_matrix"][0][1], 0.11242856830358505, delta=2e-8)
        self.assertAlmostEqual(result["resistance_matrix"][0][2], 0.11287622898817062, delta=2e-8)
        self.assertAlmostEqual(result["group_voltages"][0], 91.828060, delta=0.0001)
        self.assertEqual(result["iterations"], 84)
        self.assertEqual([round(i) for i in result["current_magnitudes"]], [941, 944, 941])
        for component in range(2):
            self.assertAlmostEqual(sum(i[component] for i in result["currents"]), 0, delta=1e-9)
        self.assertLessEqual(max(map(abs, result["power_errors"])), 200)

    def test_flat_box_original_dos_result(self):
        """BOX: сопротивления, напряжение и токи сверены с FLAT.LST оригинала."""
        result = calculate(load_case(ROOT / "BOX.DAT"))
        self.assertAlmostEqual(result["group_voltages"][0], 73.228100, delta=0.0001)
        self.assertEqual([round(i) for i in result["current_magnitudes"]], [111, 112, 137])
        self.assertAlmostEqual(result["resistance_matrix"][0][1], 0.835, delta=0.0005)

    def test_fixed_voltage_flat_case(self):
        """TOKPL.DAT содержит заданные напряжения, а не подбор мощностей."""
        result = calculate(load_case(ROOT / "TOKPL.DAT"))
        self.assertEqual(result["pair_voltages"], [[100.0, 0.0]])
        self.assertEqual(result["iterations"], 0)
        self.assertAlmostEqual(result["currents"][0][0], -result["currents"][1][0])

    def test_three_groups_converge_to_declared_targets(self):
        """TARA проверяет совместную итерацию трёх силовых групп и баланс токов."""
        result = calculate(load_case(ROOT / "TARA" / "TARA.DAT"))
        self.assertEqual(len(result["group_voltages"]), 3)
        self.assertLessEqual(max(map(abs, result["power_errors"])), 1000)
        self.assertTrue(all(math.isfinite(v) for v in result["current_magnitudes"]))
        for component in range(2):
            self.assertAlmostEqual(sum(i[component] for i in result["currents"]), 0, delta=1e-8)

    def test_extra_equation_fills_missing_electrode_constraint(self):
        """Ручное дополнительное уравнение заменяет диалог DOS при неполной схеме."""
        case = load_case(ROOT / "CIRCLE.DAT")
        baseline = calculate(case)
        case.pairs = case.pairs[:1]
        case.voltage_terms = [row for row in case.voltage_terms if row[0] == 1]
        case.fixed_voltages = [baseline["pair_voltages"][0]]
        constraint = {"coefficients": [0.0, 1.0, 0.0], "voltage": baseline["currents"][1]}
        result = calculate(case, extra_equations=[constraint])
        self.assertAlmostEqual(result["currents"][0][0], baseline["currents"][0][0], delta=1e-8)

    def test_missing_constraints_are_not_silently_assumed(self):
        """Недостающие уравнения не заменяются вымышленной схемой соединения."""
        case = load_case(ROOT / "CIRCLE.DAT")
        case.pairs = case.pairs[:1]
        with self.assertRaisesRegex(CalculationError, "уравнений"):
            calculate(case)

    def test_explicit_isolated_groups_have_zero_total_current(self):
        """Опция изолированных источников добавляет баланс каждой цепи питания."""
        case = load_case(ROOT / "BESCWET" / "OSZ8.DAT")
        equations = isolated_group_equations(case)
        self.assertEqual(len(equations), 2)
        result = calculate(case, extra_equations=equations)
        for equation in equations:
            for component in range(2):
                total = sum(coefficient * current[component] for coefficient, current in zip(equation["coefficients"], result["currents"]))
                self.assertAlmostEqual(total, 0, delta=1e-8)

    def test_invalid_input_is_rejected(self):
        """Нецелые индексы, NaN, лишние числа и обрыв DAT не принимаются."""
        original = (ROOT / "CIRCLE.DAT").read_text(encoding="cp866")
        for text in (original + "\n42", original.replace("18.", "nan", 1), original[:40],
                     original.replace("1 2 2 3", "1.5 2 2 3")):
            with self.subTest(text=text[:30]), self.assertRaises(CalculationError):
                parse_dat(text)

    def test_singular_system_reports_error(self):
        """Вырожденная схема выдаёт ошибку вместо бесконечных или ложных токов."""
        with self.assertRaises(CalculationError):
            solve_linear([[1, 2], [2, 4]], [1, 2])

    def test_iteration_limit_reports_nonconvergence(self):
        """Защита от бесконечного расчёта не выдаёт последнюю итерацию за успех."""
        with self.assertRaisesRegex(CalculationError, "сходимости"):
            calculate(load_case(ROOT / "CIRCLE.DAT"), max_iterations=1)

    def test_manual_radii_and_lengths_are_required_when_zero(self):
        """Нулевые значения в DAT требуют ручного ввода, как в исходном PTOK."""
        case = load_case(ROOT / "CIRCLE.DAT")
        case.radius = 0
        with self.assertRaises(CalculationError):
            calculate(case)
        result = calculate(case, radii=[0.24] * 3)
        self.assertAlmostEqual(result["group_voltages"][0], 91.828060, delta=0.0001)

    def test_json_parameters_reject_invalid_shapes(self):
        """GUI/CLI не передают ошибочные типы в расчётный поток."""
        for text in ('[]', '{"unknown":1}', '{"radii":"1"}', '{"max_iterations":true}',
                     '{"extra_equations":[{"coefficients":1,"voltage":[]}]}'):
            with self.subTest(text=text), self.assertRaises(CalculationError):
                parameters_from_text(text)

    def test_case_roundtrip_preserves_connections_and_coefficients(self):
        """Сохранение понятной формы в DAT не теряет электрические коэффициенты."""
        from dataclasses import asdict
        for relative in ("CIRCLE.DAT", "BOX.DAT", "TARA/TARA.DAT", "PLOT6.DAT", "TOKPL.DAT"):
            case = load_case(ROOT / relative)
            restored = parse_dat(serialize_case(case), case.name)
            self.assertEqual(asdict(case), asdict(restored))

    def test_pair_layout_changes_only_whitespace_for_original_and_24_pairs(self):
        """Оба оформления сохраняют числа и порядок, в том числе при 24 связях."""
        original = (ROOT / "CIRCLE.DAT").read_text(encoding="cp866")
        case = load_case(ROOT / "CIRCLE.DAT")
        case.electrode_count = 25
        case.length, case.height = 100, 100
        case.coordinates = [[i - 12, 30] for i in range(25)]
        case.pairs = [[i, i + 1] for i in range(1, 25)]
        many = serialize_case(case)
        for text in (original, many):
            single = format_pair_records(text, True)
            separate = format_pair_records(single, False)
            self.assertEqual(text.split(), single.split())
            self.assertEqual(text.split(), separate.split())
            self.assertEqual(parse_dat(text).pairs, parse_dat(separate).pairs)

    def test_fixed_voltage_record_layout_keeps_voltage_components(self):
        """Оформление фиксированных напряжений сохраняет все четыре поля записи."""
        text = (ROOT / "PLOT6.DAT").read_text(encoding="cp866")
        changed = format_pair_records(text, True)
        self.assertEqual(text.split(), changed.split())
        self.assertEqual(parse_dat(text).fixed_voltages, parse_dat(changed).fixed_voltages)

    def test_plot6_matches_all_6987_original_nodes(self):
        """Сопоставляет всё поле с сохранённым бинарным результатом оригинального PLOT6."""
        result = calculate_field(load_case(ROOT / "PLOT6.DAT"))
        reference = struct.unpack("<6987f", (ROOT / "ТОК zip/ТОК/IST.DAT").read_bytes())
        actual = [result["field"]["values"][i][j] for j in range(137) for i in range(51)]
        error = max(abs(a - b) / max(abs(b), 1) for a, b in zip(actual, reference))
        self.assertLess(error, 0.0001)
        self.assertAlmostEqual(result["field"]["maximum"], 8397.732421875, delta=0.02)

    def test_plot6_voltage_scaling_changes_density_quadratically(self):
        """Изменение заданных напряжений в 1.2 раза повышает поле в 1.44 раза."""
        from dataclasses import replace
        case = load_case(ROOT / "PLOT6.DAT")
        original = calculate_field(case)
        changed = calculate_field(replace(case, fixed_voltages=[[v * 1.2, phase] for v, phase in case.fixed_voltages]))
        for row_a, row_b in zip(original["field"]["values"], changed["field"]["values"]):
            for a, b in zip(row_a, row_b):
                self.assertAlmostEqual(b, a * 1.44, delta=1e-7)

    def test_plot6_does_not_apply_round_model_to_flat_electrodes(self):
        """Плоская геометрия не получает недостоверную карту по круглой модели."""
        with self.assertRaisesRegex(CalculationError, "круглых"):
            calculate_field(load_case(ROOT / "BOX.DAT"))

    def test_legacy_graphics_roundtrip_and_original_reader(self):
        """Экспорт TOKGR сохраняет порядок столбцов и читается тем же контрактом оригинала."""
        result = calculate(load_case(ROOT / "CIRCLE.DAT"))
        reference = read_tokgr(ROOT / "TOKGR.DAT")
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "TOKGR.DAT"
            write_tokgr(result, path)
            restored = read_tokgr(path)
        for rows in (restored["currents"], reference["currents"]):
            for actual, expected in zip(rows, result["currents"]):
                for a, b in zip(actual, expected):
                    self.assertAlmostEqual(a, b, delta=0.002)

    def test_plot6_export_preserves_binary_grid_order(self):
        """IST экспортируется столбцами как в FORTRAN, а CSV сохраняет координаты."""
        result = calculate_field(load_case(ROOT / "PLOT6.DAT"))
        with tempfile.TemporaryDirectory() as directory:
            write_field(result, directory)
            raw = (Path(directory) / "IST.DAT").read_bytes()
            self.assertEqual(len(raw), 27948)
            values = struct.unpack("<6987f", raw)
            reopened = read_field(Path(directory) / "IST.DAT", 8.5, 16)
            self.assertEqual(reopened["field"]["shape"], [51, 137])
            self.assertEqual(reopened["currents"], [])
            for i, j in ((1, 0), (25, 1), (50, 136)):
                self.assertAlmostEqual(values[j * 51 + i], result["field"]["values"][i][j], delta=0.001)
                self.assertEqual(reopened["field"]["values"][i][j], values[j * 51 + i])
            self.assertEqual(len((Path(directory) / "field.csv").read_text(encoding="utf-8-sig").splitlines()), 6988)

    def test_xls_formulas_match_thirty_saved_cells(self):
        """Проверяет перенос UDSOPR по 30 значениям двух исходных XLS."""
        report_path = Path(__file__).resolve().parent / "evidence/workbooks.json"
        evidence = json.loads(report_path.read_text(encoding="utf-8"))
        count = 0
        for workbook in evidence:
            rows = workbook["sheets"][0]["values"]
            sodium, potassium = rows[0][1], rows[1][1]
            for row in rows[3:18]:
                self.assertAlmostEqual(glass_resistivity(sodium, potassium, row[1]), row[2], delta=1e-10)
                count += 1
        self.assertEqual(count, 30)


if __name__ == "__main__":
    unittest.main()
