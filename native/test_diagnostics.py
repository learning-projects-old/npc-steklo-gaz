"""Проверяет понятные ошибки DAT без ограничения корректных переносов строк."""
from pathlib import Path
import unittest
from tok_core import CalculationError, calculate, geometry_problems, parse_dat


class DiagnosticsTests(unittest.TestCase):
    """Воспроизводит лишнюю пару со снимка и незавершённый ввод."""

    def setUp(self):
        """Читает оригинальный CIRCLE, который пользователь редактирует в DAT."""
        self.text = (Path(__file__).resolve().parent.parent / 'ТОК1/CIRCLE.DAT').read_text(encoding='cp866')

    def test_extra_pair(self):
        """Ошибка называет лишние номера и строку вместо ложной ошибки силовых групп."""
        with self.assertRaises(CalculationError) as caught:
            parse_dat(self.text.replace('1 2 2 3', '1 2 2 3 4 5'))
        message = str(caught.exception)
        for expected in ('строка 6', 'указано 2 пар', 'записано 3', '4, 5', 'Удалите'):
            self.assertIn(expected, message)

    def test_whitespace_is_not_structure(self):
        """Разделы после заголовка по-прежнему разрешено записывать одной строкой."""
        lines = self.text.splitlines()
        self.assertEqual(parse_dat(self.text), parse_dat(lines[0] + '\n' + ' '.join(lines[1:])))

    def test_invalid_number_location(self):
        """Нечисловое значение сопровождается номером строки и примером исправления."""
        with self.assertRaisesRegex(CalculationError, 'строка 2.*не является числом'):
            parse_dat(self.text.replace('-6.0', 'ошибка'))

    def test_truncated_coordinates(self):
        """Обрыв файла называет конкретный раздел координат."""
        with self.assertRaisesRegex(CalculationError, 'координаты № 1'):
            parse_dat(self.text.splitlines()[0] + '\n-6')

    def test_shortened_furnace(self):
        """Сценарий 52→19 сообщает о каждом электроде вне ванны и запрещает расчёт."""
        case = parse_dat(self.text)
        case.height = 19
        self.assertEqual(len(geometry_problems(case)), 3)
        with self.assertRaisesRegex(CalculationError, 'Y = 37.25, допустимо от 0.00 до 19.00'):
            calculate(case)

    def test_corrected_coordinates(self):
        """После явного исправления координат укороченная печь рассчитывается."""
        case = parse_dat(self.text)
        case.height = 19
        case.coordinates = [[-6, 15], [0, 10], [6, 15]]
        self.assertEqual(geometry_problems(case), [])
        self.assertEqual(len(calculate(case)['currents']), 3)
