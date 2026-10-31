"""Регрессии синхронизации редакторов и многопроцессорного PLOT6."""
import os
from pathlib import Path
import time
import tkinter as tk
import unittest

from plot_core import calculate_field
from tok_core import CalculationError, load_case, parse_dat
from tok_form import CaseForm

ROOT = Path(__file__).resolve().parent.parent / 'ТОК1'


class SynchronizationTests(unittest.TestCase):
    """Проверяет реальные Tk-поля без показа вспомогательного окна."""

    def setUp(self):
        """Создаёт скрытую форму с исходным CIRCLE для каждого сценария."""
        self.root = tk.Tk()
        self.root.withdraw()
        self.form = CaseForm(self.root)
        self.text = (ROOT / 'CIRCLE.DAT').read_text(encoding='cp866')
        self.form.load(load_case(ROOT / 'CIRCLE.DAT'), raw_text=self.text)

    def tearDown(self):
        """Освобождает Tk после проверки, включая таймер синхронизации."""
        for timer in self.root.tk.call('after', 'info'):
            self.form.after_cancel(timer)
        self.root.destroy()

    def test_form_to_dat_and_back(self):
        """Размер 18→19 отражается в DAT, затем редактирование DAT обновляет поле."""
        self.form.fields['length'].set('19')
        self.form.synchronize()
        text = self.form.raw.get('1.0', 'end-1c')
        self.assertEqual(parse_dat(text).length, 19)
        self.assertEqual(text.split()[1:], self.text.split()[1:])
        self.form.raw.delete('1.0', '1.2')
        self.form.raw.insert('1.0', '20')
        self.assertEqual(self.form.read()[0].length, 20)
        self.assertEqual(self.form.fields['length'].get(), '20')

    def test_invalid_raw_blocks_calculation(self):
        """Незавершённый DAT не заменяется старой формой и запрещает расчёт."""
        self.form.raw.delete('1.0', 'end')
        self.form.raw.insert('1.0', '18 incomplete')
        with self.assertRaises(CalculationError):
            self.form.read()
        self.assertEqual(self.form.raw.get('1.0', 'end-1c'), '18 incomplete')

    def test_table_and_individual_sizes(self):
        """Изменения таблицы попадают в DAT; индивидуальный радиус не теряется."""
        item = self.form.electrodes.tree.get_children()[0]
        self.form.electrodes.tree.item(item, values=[1, -5, 37.25, .3, 5])
        self.form.synchronize()
        self.assertEqual(parse_dat(self.form.raw.get('1.0', 'end-1c')).coordinates[0][0], -5)
        self.form.raw.insert('end', '\n')
        self.form.synchronize()
        self.assertEqual(self.form.read()[1]['radii'][0], .3)

    def test_size_change_requires_coordinate_review(self):
        """Уменьшение H синхронизирует DAT, предупреждает и снимает старый результат."""
        changed = []
        self.form.on_change = lambda: changed.append(True)
        self.form.fields['height'].set('19')
        self.form.synchronize()
        self.assertIn('Нужно изменить координаты', self.form.notice.get())
        self.assertIn('37.25', self.form.notice.get())
        self.assertEqual(changed, [True])
        self.assertEqual(parse_dat(self.form.raw.get('1.0', 'end-1c')).height, 19)
        self.form.synchronize()
        self.assertEqual(changed, [True])


class ParallelTests(unittest.TestCase):
    """Сравнивает все узлы и измеряет холодный и повторный расчёты."""

    def test_all_processors(self):
        """Многопроцессорная сетка должна точно совпасть с последовательной."""
        case = load_case(ROOT / 'PLOT6.DAT')
        started = time.perf_counter()
        reference = calculate_field(case)
        serial = time.perf_counter() - started
        workers = os.cpu_count() or 1
        started = time.perf_counter()
        parallel = calculate_field(case, workers=workers)
        cold = time.perf_counter() - started
        times = []
        for _ in range(10):
            started = time.perf_counter()
            repeated = calculate_field(case, workers=workers)
            times.append(time.perf_counter() - started)
        warm = sorted(times)[len(times) // 2]
        self.assertEqual(reference, parallel)
        self.assertEqual(reference, repeated)
        print(f'PLOT6 workers={workers}: serial={serial:.4f}s cold={cold:.4f}s warm={warm:.4f}s')


if __name__ == '__main__':
    import multiprocessing
    multiprocessing.freeze_support()
    unittest.main()
