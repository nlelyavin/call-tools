from typing import List, Dict

SEPARATOR = ' '


def print_statistic(statistic: Dict[str, list]) -> None:
    """Отображение статистики"""

    for name, work_hours in statistic.items():
        sum_hours = sum(work_hours)
        print(f'{name}: {work_hours}; {sum_hours=}')


def _extract_info_about_employee(employee: str) -> (str, str):
    """Получение статистики о работнике из полученной строки"""

    split_employee = employee.rpartition(SEPARATOR)

    name = split_employee[0]
    work_hours = split_employee[2]

    return name, work_hours


def _validate_employee_stat(name: str, work_hours: str) -> bool:
    """Валидация данных о работнике"""

    return name and work_hours and work_hours.isnumeric()


def get_stat_about_employees(employees: List[str]) -> Dict[str, list]:
    """Получение статистики о работниках


    :return: {'name': [1, 2 ,10]}
    """

    employees_stat = dict()

    for employee in employees:
        name, work_hours = _extract_info_about_employee(employee=employee)

        if not (_validate_employee_stat(name=name, work_hours=work_hours)):
            continue

        work_hours = int(work_hours)
        if name in employees_stat:
            employees_stat[name].append(work_hours)
        else:
            employees_stat[name] = [work_hours]

    return employees_stat


def main(employees: List[str]) -> None:
    """Входная точка в обработку"""
    statistic = get_stat_about_employees(employees=employees)

    print_statistic(statistic=statistic)
    pass


if __name__ == '__main__':
    children_of_elon_musk = [
        'Андрей 9',
        'Василий 11',
        'Роман 7',
        'X Æ A-12 45',
        'Иван Петров 3',
        '..',
        'Андрей 6',
        'Роман 11',
    ]
    main(employees=children_of_elon_musk)
