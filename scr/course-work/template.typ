#import "../utils.typ": unindented, institution, city_and_year
#import "course-work.typ": *

#let project(
  start_label: <start>,
  student_name: none,
  student_name_genitive: none,
  group: none,
  course_num: none,
  city: "Кам’янське",
  department_name: "технолого-економічне",
  commission_name: "Програмного забезпечення та прикладної математики",
  commission_name_short: "ПЗ та ПМ",
  knowledge_branch: "12 Інформаційні технології",
  specialty: "121 “Інженерія програмного забезпечення”",
  discipline: none,
  title: none,
  work_due_to: none,
  task_received_at: none,
  supervisor_name: none,
  supervisor_title: none,
  commission_head_name: none,
  commission_members: none,
  calendar_plan_data: (),
  initial_data: (),
  body
) = {

  // Title Page
  page(numbering: none)[
    #unindented[
      #institution()
        #cycle_commission(commission_name: commission_name)
        #work_title(
          discipline: discipline,
          title: title,
          course_num: course_num,
          group: group,
          knowledge_branch: knowledge_branch,
          specialty: specialty,
          student_name: student_name,
          supervisor_name: supervisor_name,
          supervisor_title: supervisor_title,
          commission_members: commission_members
        )
        #city_and_year(city: city)
    ]
  ]

  // Task Page
  page(numbering: none)[
    #unindented[
      #institution()
      #task_header(
        department_name: department_name,
        commission_name: commission_name,
        commission_short: commission_name_short,
        knowledge_branch: knowledge_branch,
        specialty: specialty,
        commission_head_name: commission_head_name,
      )
      #task_body(
        to_whom: student_name_genitive,
        group: group,
        work_name: title,
        work_due_to: work_due_to,
        initial_data: initial_data
      )
    ]
  ]

  page(numbering: none)[
    #unindented[
      #task_calendar_plan(plan: calendar_plan_data)
      #task_signature(task_received_at: task_received_at)
    ]
  ]

  // Grade Page
  page(numbering: none)[
    #unindented[
      #institution()
      #grade_header(
        student_name: student_name,
        group: group,
      )
      #grade_title(title: title)
      #grades(
        supervisor_name: supervisor_name,
        performance_supervisor_name: commission_head_name
      )
    ]
  ]

    page(numbering: none)[
      #heading(numbering: none)[РЕФЕРАТ]
Пояснювальна записка до курсової роботи: 26 с., 2 рис., 2 додатки,
4 джерел інформації.\

Об’єкт розробки — патерн проєктування Factory Method.\

Мета розробки — створення програми з демонстрацією роботи патерну проектування Factory Method.\

Метод проєктування — мова програмування Python, використання стандартних бібліотек мови для реалізації, стандарт Python 3.x, середовище розробки Visual Studio Code, операційна система Windows.

У ході розробки курсової роботи було створено програмний додаток, який дозволяє ознайомитися з принципом роботи патерну проектування Factory Method.\

Перша частина роботи містить ознайомлення з базовими концепціями патернів проєктування та їх роль в розробці програмного забезпечення, вивчення історії створення та еволюції патерну Factory Method, а також аналіз проблем, які вирішує цей патерн.

Друга частина містить опис компонентів патерну Factory Method. Проведено детальний аналіз класів, інтерфейсів і методів, що беруть участь у реалізації Factory Method.

Третя частина містить інформацію про застосування патерну Factory Method, його переваги та недоліки, а також відносини з іншими патернами проєктування\
\

FACTORY METHOD, VISUAL STUDIO CODE, WINDOWS, ФАБРИЧНИЙ МЕТОД, PYTHON, ПАТЕРН ПРОЕКТУВАННЯ

  ]
  page(numbering: none)[
    #outline(indent: 1.25em)
  ]


  body
}
