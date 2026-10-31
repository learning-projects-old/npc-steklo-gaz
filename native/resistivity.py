"""Расчёт удельного сопротивления по восстановленным формулам UDSOPR.XLS."""

import math

from tok_core import CalculationError


def glass_resistivity(sodium, potassium, temperature):
    """Повторяет BIFF-формулы C4:C18 обоих UDSOPR XLS, без Excel.

    Вызывается калькулятором GUI и проверяется по сохранённым значениям XLS.
    Содержание оксидов — проценты исходной формулы, температура — °C;
    константа 273 сохранена для точного соответствия (не заменена на 273.15).
    Единицы результата — как в таблице; автоматическая подстановка в PTOK
    не выполняется, поскольку размерности геометрии архива не установлены.
    """
    if not all(math.isfinite(v) for v in (sodium, potassium, temperature)):
        raise CalculationError("Состав и температура должны быть конечными числами.")
    if min(sodium, potassium) < 0 or sodium + potassium > 100:
        raise CalculationError("Содержание оксидов должно быть неотрицательным, сумма — не больше 100%.")
    if temperature <= -273:
        raise CalculationError("Температура должна быть выше −273 °C.")
    alkali = sodium + potassium / 2
    try:
        result = 10 ** (-1.508 + 0.0204 * alkali + (4836 - 128 * alkali) / (temperature + 273))
    except OverflowError as error:
        raise CalculationError("Формула переполняется при такой температуре.") from error
    if not math.isfinite(result) or result <= 0:
        raise CalculationError("Формула дала недопустимое сопротивление.")
    return result
