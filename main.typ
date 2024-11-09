#import "src/layout/standard.typ": setup_layout
#import "src/course_work/template.typ": project

#show: setup_layout
#show: project.with(
  start_label: <start>,
  student_name: "ШЕНФЕЛЬД Вікторія",
  student_name_genitive: "Шенфельд Вікторії Денисівни",
  group: "ІПЗ-21-9-д",
  course_num: "IV",
  city: "Кам’янське",
  department_name: "Технолого-економічне",
  commission_name: "Програмного забезпечення та прикладної математики",
  commission_name_short: "ПЗ та ПМ",
  knowledge_branch: "12 Інформаційні технології",
  specialty: "121 “Інженерія програмного забезпечення”",
  discipline: "Конструювання програмного забезпечення",
  title: "Практичне застосування патерну проектування Factory method у мові програмування Python",
  work_due_to: "11 листопада 2024",
  task_received_at: "02.09.2024",
  supervisor_name: "КРАВЕЦЬ М.Ю.",
  supervisor_title: "Викладач",
  commission_head_name: "СОБАКЕВИЧ Михайло",
  commission_members: (
    "БАЖАН Станіслав",
    "РОЖЕНЮК Олександр"
  ),
  calendar_plan_data: (
 ("Аналіз проблемної галузі та постановка задачі", "01.10.2024 - 10.10.2024"),
    ("Опис прийнятих проектних рішень", "10.10.2024 - 15.10.2024"),
    ("Розробка програми", "15.10.2024 - 25.10.2024"),
    ("Опис розробленої програми", "25.10.2024 - 05.11.2024"),
    ("Графічна частина (презентація), вступ, висновки, перелік посилань, реферат", "05.11.2024 - 11.11.2024"),
    ("Попередній захист роботи", "25.11.2024"),
    ("Захист роботи", "02.12.2024"),
  ),
  initial_data: [
    Використовуючи програмний продукт Microsoft Visual Studio та об'єктно-орієнтовнy мова програмування Python, для початкового заданого словника значень розробити програмний застосунок з використанням патерну Factory Method, який повинен містити  спроєктовані концептуальну та логічну моделі даних
  ]
)

#heading(numbering: none)[ВСТУП]
У сучасному світі програмного забезпечення, зокрема у сфері розробки веб-додатків та систем управління, часто виникає необхідність у створенні гнучких, масштабованих і легко розширюваних рішень. Для досягнення цих цілей важливо застосовувати принципи об'єктно-орієнтованого програмування (ООП), які дозволяють зменшити залежність між компонентами системи, підвищуючи тим самим її гнучкість. Одним із таких принципів є використання патернів проектування, серед яких патерн Factory Method є одним із найбільш ефективних для вирішення проблеми створення об'єктів.

Патерн Factory Method дозволяє створювати об'єкти без необхідності зазначати конкретний клас, з якого ці об'єкти будуть створені. Це дозволяє зберегти гнучкість у додатку, оскільки можна змінювати типи створюваних об'єктів без необхідності змінювати код, що їх використовує. Патерн надає єдиний інтерфейс для створення об'єктів різних класів, делегуючи відповідальність за вибір конкретного класу підкласам. Таким чином, цей патерн спрощує підтримку та розширення програмних систем, дозволяючи реалізувати функціональність з мінімальними змінами в основному коді.

Ця курсова робота присвячена розробці програмного додатку для управління замовленнями піци, в якому використовується патерн Factory Method. Метою роботи є створення гнучкої системи, де користувач може обирати різні типи піц, а програма автоматично буде створювати відповідні об'єкти та обробляти замовлення. Всі операції зі створенням піц будуть здійснюватися через єдиний інтерфейс фабричного методу, що дозволить легко додавати нові види піц у систему без необхідності змінювати код клієнтської частини.
#pagebreak()

=  Аналіз галузі та визначення завдань
#set align(center)
== Основні поняття
#set align(center)
Описати терміни, використовувані в роботі, зі смисловим переходом
#set align(left)
КПЗ (Комп'ютеризовані програмні засоби) — це термін, що використовується для опису програмного забезпечення, розробленого для автоматизації певних процесів або задач у різних сферах

Python — це інтерпретована мова програмування, яка відома своєю простотою і читабельністю коду.Вона має ефективні структури данних високого рівня,ефективний підхід до програмування. Python використовується для розробки веб-додатків, аналізу даних, машинного навчання, автоматизації, розробки ігор і багатьох інших завдань.

Visual Studio — це інтегроване середовище розробки (IDE), розроблене компанією Microsoft, яке підтримує різні мови програмування. Visual Studio широко використовується для створення програмного забезпечення на платформі .NET, а також для розробки веб-додатків, мобільних додатків і ігор.

Патерн проектування — це шаблон або загальноприйняте рішення для вирішення типових задач у розробці програмного забезпечення. Патерни проектування описують оптимальні підходи до створення архітектури програми, допомагають уникати поширених помилок та спрощують розробку і підтримку коду.



Розширюваність - це здатність програмної системи або її компонентів змінюватися, адаптуватися або доповнюватися без необхідності змінювати існуючий код. Це означає, що в майбутньому можна додавати нові функціональності, компоненти або модулі без порушення роботи існуючих частин системи, що особливо важливо для масштабованих і довготривалих проектів.

Зниження залежностей -це принцип, який передбачає зменшення залежності між різними частинами програмної системи. Коли компоненти програми мають мінімальні залежності між собою, це робить систему більш гнучкою, легкою для тестування та обслуговування.

Алгоритм - визначає кроки, які потрібно виконати, щоб досягти поставленої мети, і може бути реалізований як у вигляді програми на комп'ютері, так і у формі інструкцій, що виконуються вручну.
#pagebreak()
#set align(center)
== Огляд аналогічних програм
#set align(left)
Патерн проектування Factory Method використовується для створення 
об'єктів без зазначення їх конкретного класу, що дозволяє змінювати клас об'єктів, які потрібно створити
, не змінюючи клієнтський код. Існує декілька патернів і програмних рішень, що схожі за функціями або цілями, а також забезпечують гнучкість та масштабованість у створенні об'єктів. Ось деякі з них:

1. *Abstract Factory (Абстрактна Фабрика)*\
*Подібність:* як і Factory Method, дозволяє створювати об'єкти без зазначення їх конкретних класів.\
*Відмінність:* надає інтерфейс для створення родин об’єктів, що використовуються разом. Це корисно, коли потрібно створювати об'єкти, які мають бути узгодженими між собою.\
*Приклад застосування:* створення інтерфейсу для одночасного створення взаємопов’язаних об’єктів (наприклад, сімейство кнопок та текстових полів для Windows та MacOS).\
2. *Builder (Будівельник)*\
*Подібність:* забезпечує створення складних об'єктів шляхом поетапної побудови.\
*Відмінність:* не фокусується на поверненні певного типу продукту, як Factory Method, а створює об'єкт поступово, задаючи його різні параметри. Корисний для створення складних об’єктів з багатьма параметрами.\
*Приклад застосування:* побудова об'єкта «Автомобіль» з можливістю встановлення різних деталей (двигун, кузов, колеса).\
3. *Prototype (Прототип)*\
*Подібність:* дозволяє створювати об'єкти за допомогою копіювання інших об'єктів.\
*Відмінність:* замість створення об’єктів з нуля, використовує вже існуючий об’єкт-прототип, який копіюється, щоб отримати новий об’єкт.\
*Приклад застосування:* використовується в програмах, де об’єкти мають значний стан і копіювання економить ресурси.\
4. *Singleton (Одинак)*\
*Подібність:* обмежує кількість створюваних об’єктів, гарантує наявність тільки одного екземпляра.\
*Відмінність:* на відміну від Factory Method, який створює нові екземпляри на запит, Singleton забезпечує існування лише одного екземпляра.\
*Приклад застосування:* клас реєстру налаштувань програми або логер, що має один об’єкт для всього застосунку.\

Переваги та особливості Factory Method у порівнянні з аналогічними рішеннями : гнучкість у створенні об'єктів: дозволяє створювати об’єкти без прив’язки до конкретних класів, зменшуючи залежність і підвищуючи масштабованість.
Легкість у розширенні: підвищує зручність додавання нових типів об'єктів через нові підкласи.
Складність реалізації: у порівнянні з деякими альтернативами, Factory Method є простим у реалізації, не потребує великих змін у структурі коду.
#pagebreak()
#set align(center)
== Формування проблеми та постановка задачі
#set align(left)
 - Аналіз джерел інформації (книги, документи, інтернет тощо)
 Патерн Factory Method дозволяє створювати об'єкти через загальний інтерфейс, делегуючи створення підкласам. Це забезпечує гнучкість, оскільки дає можливість змінювати конкретні алгоритми створення об'єктів без зміни клієнтського коду. Такий підхід зменшує залежності між компонентами та дозволяє легко додавати нові типи об'єктів.\
 
  - Основні компоненти патерна Strategy
*Creator (Створювач)* — клас, який визначає фабричний метод, надаючи загальний інтерфейс для створення об'єктів.\
*ConcreteCreator* (Конкретний Створювач) — підкласи, що реалізують метод створення і визначають, який об'єкт буде створено.\
*Product (Продукт)* — інтерфейс або базовий клас для всіх об'єктів, які можуть створюватися фабричним методом.\
*ConcreteProduct (Конкретний Продукт)* — це класи, які представляють конкретні типи продуктів, що створюються підкласами ConcreteCreator.\
*ConcreteProduct (Конкретний Продукт)* — конкретні класи продуктів, створювані ConcreteCreator.

- Проблеми, які вирішує патерн Factory Method:

*Зниження залежностей:* Клієнтський код працює з абстракціями, а не конкретними класами, що зменшує зв'язність між компонентами.\
*Відокремлення створення від використання:* Створення об'єктів делегується підкласам, що спрощує підтримку та зміну процесу створення.\
*Гнучкість та розширюваність:* Легко додавати нові типи об'єктів без змін в існуючому коді.\
*Підтримуваність:* Абстракції дозволяють змінювати реалізації без зміни основного коду.\
*Обробка варіативності:* Легко змінювати алгоритми створення об'єктів в залежності від контексту.\

- Постановка задачі для патерну Factory Method:

Метою є реалізація патерну Factory Method для створення об'єктів різних типів піц з можливістю вибору користувачем. Система повинна дозволяти користувачу вибирати піцу з кількох варіантів, де кожна піца має свою унікальну ціну. Необхідно реалізувати базовий клас Pizza та підкласи для кожного типу піци, створюючи їх через фабричний метод. Важливо забезпечити обробку помилок при некоректному введенні користувача.
#pagebreak()

#set align(center)
== Середовище розробки
#set align(left)
Програмне середовище Python разом із Visual Studio було обрано через багатогранні можливості для розробки, легкість інтеграції з різноманітними бібліотеками та інструментами, а також кросплатформеність. Python є однією з найпопулярніших мов програмування завдяки своїй простоті, високій швидкості розробки та величезному набору бібліотек, що підтримують різні області застосування: від веб-розробки до наукових обчислень і машинного навчання.
#pagebreak()
#set align(center)
= Опис обраних проектних рішень
== Концептуальна модель проблемної галузі
#set align(left)
Концептуальна модель проблемної галузі для патерну Factory Method описує абстрактну структуру компонентів та їхні взаємодії, що дозволяє створювати об’єкти на основі вибору конкретного типу, залишаючи деталі створення на рівні підкласів. У цій моделі ключовими компонентами є:
- *Клієнтський код (Client)* — інтерфейс, через який користувач обирає тип продукту. Клієнтський код взаємодіє з перерахуванням PizzaType і викликає фабричний метод create_pizza() для створення об’єкта, не знаючи точного типу створюваного об'єкта.\
- *Фабричний метод (Factory Method)* — функція create_pizza(), яка виступає єдиною точкою для створення різних типів об'єктів. Вона приймає тип піци з PizzaType і повертає інстанс конкретного класу піци (PizzaMargarita, PizzaCarbonara, PizzaHunters) на основі вибору користувача.\
- *Базовий клас (Product)* — клас Pizza, що визначає спільні атрибути для кожного продукту, наприклад, ціну. Хоча цей клас не є абстрактним, він містить метод get_price(), доступний для всіх підкласів піци.\
- *Конкретні продукти (Concrete Products)* —класи PizzaMargarita, PizzaCarbonara, PizzaHunters, які успадковують базовий клас Pizza і встановлюють конкретну ціну для кожного типу піци.\
Концептуально, ця модель показує, як Factory Method дозволяє зберегти вибір об’єкта гнучким, залишаючи створення підконтрольним клієнтському коду, але делегуючи вибір типу об'єкта фабриці. Така структура дозволяє легко розширювати програму додаванням нових видів піц, не змінюючи код основної фабрики або клієнтського коду.\
Приклад застосування патерну Factory Method для системи замовлення піци:
- *Клієнтський код (Client)* — код, який дозволяє користувачеві обирати тип піци через введення номера.
- *Фабричний метод (create_pizza)* — функція, що створює об’єкт піци на основі обраного типу.
- *Базовий клас (Pizza)* — клас, який містить метод get_price() і спільні атрибути, як-от ціна.
- *Конкретні продукти* — класи PizzaMargarita, PizzaCarbonara, PizzaHunters, кожен з яких визначає конкретний тип піци з унікальною ціною.

#figure(
  image("Діаграма.png", width: 90%),
  caption: [
    Концептуальна модель 
  ],
)
#pagebreak()
#set align(center)
== Логічна модель проблемної галузі
#set align(left)
Логічно програмний додаток для замовлення піци складається з однієї функції та п'яти класів:\
- Основна функція\
Функція main() (в коді вона позначена як if name == 'main') є точкою входу в програму. У цій функції користувачу пропонується вибрати тип піци за допомогою введення числового значення. Вибір користувача використовується для створення об'єкта піци відповідного типу через фабричний метод create_pizza. Після створення об'єкта піци, функція виводить тип обраної піци та її ціну.
- Клас Pizza\
Клас Pizza є базовим класом, який представляє базовий продукт — піцу. Він має наступні методи:\
Конструктор — ініціалізує ціну піци, яка передається як параметр.\
Метод get_price — повертає ціну піци. Це загальний метод, який доступний для всіх типів піц.\

- Перелічення PizzaType\
PizzaType — це перелічення, що визначає типи піц, доступних для замовлення. У ньому оголошені наступні константи:\
+ MARGARITA\
+ CARBONARA\
+ HUNTERS\
Це перелічення використовується для вибору типу піци, яку потрібно створити.\
#pagebreak()
- Фабричний метод create_pizza\

create_pizza — це фабричний метод, який відповідає за створення екземплярів конкретних класів піц на основі вибору користувача. Він використовує словник (factory_dict) для зв'язування типу піци зі специфічним класом піци, і повертає об'єкт обраного типу. Це дозволяє клієнтському коду працювати з абстрактним класом Pizza, не знаючи точного типу створюваного об'єкта.\

- Класи конкретних продуктів
Кожен конкретний клас піци успадковує базовий клас Pizza і визначає унікальну ціну для свого типу піци:

+ PizzaMargarita — клас для піци "Маргарита" з ціною 166 грн.\
+ PizzaCarbonara — клас для піци "Карбонара" з ціною 187 грн.\
+ PizzaHunters — клас для піци "Мисливська" з ціною 199 грн\

- Загальна логіка роботи
Ця модель показує застосування патерну Factory Method. Клієнтський код (в даному випадку main() ) взаємодіє з фабричним методом для створення об'єктів піц, що дозволяє зберігати гнучкість вибору та легко розширювати додаток. Наприклад, для додавання нового типу піци необхідно лише створити новий клас, що успадковує Pizza, і додати його в перелік factory_dict у функції create_pizza.
#figure(
  image("Діаграма2.png", width: 90%),
  caption: [
    Логічна модель 
  ],
)
#pagebreak()
#set align(center)
= Застосування, переваги, недоліки та взаємозв’язок з іншими патернами
== Застосування патерну Factroy method
#set align(left)
Типові ситуації, коли потрібно застосувати патерн проектування Factory Method з поясненням:

*Якщо клас не може передбачити, який тип об'єктів йому потрібно створювати заздалегідь.*\

У випадках, коли програма повинна працювати з різними видами об'єктів, а конкретні типи можуть змінюватися під час виконання, Factory Method забезпечує механізм створення об'єктів без необхідності знати точний клас, який потрібно інстанціювати. Наприклад, система замовлення піци, яка дозволяє вибирати різні типи піц, може використовувати Factory Method для створення обраного типу піци без прямої прив'язки до конкретних класів піц.\

*Якщо клас хоче делегувати створення об'єктів своїм підкласам.*

Factory Method надає можливість підкласам контролювати створення об'єктів. Це корисно, коли основний клас не повинен залежати від конкретних реалізацій, але різні підкласи повинні створювати різні типи об'єктів. Наприклад, базовий клас PizzaStore може мати підкласи, що спеціалізуються на різних регіональних типах піц — і кожен підклас реалізує Factory Method для створення певного типу піци.\

*Якщо потрібно створювати об'єкти, які мають спільний інтерфейс або базовий клас, але різні реалізації.*

Коли об'єкти мають спільний інтерфейс, але їх поведінка різниться, Factory Method дозволяє визначити інтерфейс для створення об'єктів, але дозволяє підкласам вирішувати, який конкретний клас інстанціювати. Наприклад, різні класи піц, такі як PizzaMargarita чи PizzaCarbonara, мають один інтерфейс (базовий клас Pizza), але різні реалізації. Factory Method дозволяє створювати потрібну піцу, незалежно від конкретного типу.\

*Якщо потрібно уникнути жорсткої прив'язки до конкретних класів і зберегти гнучкість у додаванні нових типів об'єктів.*

Factory Method дозволяє додавати нові типи об'єктів без зміни існуючого коду, оскільки конкретні типи об'єктів визначаються підкласами або клієнтським кодом. Наприклад, для системи замовлення піци можна легко додати новий клас PizzaDiablo, реалізуючи його як підклас Pizza, і Factory Method зможе створювати новий тип без змін у основній логіці.\

*Якщо потрібно мінімізувати кількість умовних операторів, що відповідають за створення об'єктів у коді.*

У ситуаціях, коли в коді з’являються складні умовні оператори, які визначають, який об'єкт створювати, Factory Method дозволяє позбутися таких умовних операторів. Замість цього кожен тип об'єкта отримує свій метод фабрики, що спрощує розширення та підтримку коду. Наприклад, замість умовного оператора для вибору піци if-else, можна використовувати Factory Method, який повертає відповідний клас піци, і програма не потребуватиме змін із додаванням нових типів піц.

Factory Method забезпечує гнучкість у створенні об'єктів, дозволяючи додавати нові типи об'єктів без змін у основному коді, делегуючи підкласам або клієнтському коду право визначати, який саме клас потрібно створити.
#pagebreak()
#set align(center)
== Переваги та недоліки
#set align(left)
Патерн проектування Factory Method має свої переваги та недоліки. Розглянемо їх детальніше.

- *Переваги*\

+ Гнучкість та розширюваність
+ Полегшує розширення системи.
+ Зменшення умовних операторів.
+ Забезпечує більш гнучку архітектуру.
+ Спрощення тестування.\

- *Недоліки*
+ Збільшення кількості класів.
+ Ускладнення структури коду.
+ Надмірність для простих задач.
+ Важкість налаштування ієрархії класів.
+ Менш прозорий процес створення об'єктів:.
#pagebreak()
#set align(center)
== Відносини з іншими патернами
#set align(left)
Патерн Factory Method має зв’язки з іншими патернами, які часто використовуються разом для побудови гнучкої та розширюваної архітектури. Ось як Factory Method співвідноситься з деякими іншими патернами:\
*1. Factory Method і Abstract Factory*\
- Abstract Factory створює сімейства взаємопов’язаних об'єктів без прив'язки до їх конкретних класів. Він використовує Factory Method для створення кожного типу продукту у своїй "сім'ї".

- В Abstract Factory кожен конкретний підклас фабрики реалізує кілька Factory Method для створення різних видів продуктів. Таким чином, Factory Method стає "будівельним блоком" для Abstract Factory, забезпечуючи створення окремих об'єктів у межах загальної концепції "сімейства".

*2. Factory Method і Singleton*\
- Singleton гарантує, що клас має тільки один екземпляр, і надає глобальну точку доступу до нього.\
- У деяких випадках Factory Method може бути використаний для створення єдиного екземпляра об'єкта, дотримуючись принципів Singleton. Замість того щоб завжди створювати новий об’єкт, Factory Method може повернути існуючий екземпляр. Це може бути корисним, коли потрібно створювати єдині об’єкти, але потрібно мати гнучкість у підкласифікації та зміні поведінки.\

*3. Factory Method і Strategy*\
- Strategy дозволяє динамічно змінювати поведінку об’єкта, використовуючи різні алгоритми або стратегії.\
- Factory Method може створювати екземпляри об'єктів-стратегій на основі умов, що дозволяє змінювати стратегію в реальному часі. Наприклад, контекст, який використовує стратегію, може запитувати Factory Method для створення стратегії відповідно до вимог програми.\
- Таким чином, Factory Method може працювати як механізм вибору стратегії для контексту, дозволяючи динамічно змінювати поведінку об’єкта.

*4. Factory Method і Builder*\
- Builder допомагає створювати складні об'єкти шляхом поетапного складання.\
- Factory Method можна використовувати для створення окремих компонентів складного об'єкта, який потім буде зібраний за допомогою Builder. Кожен компонент може створюватися окремим Factory Method, що дозволяє легко налаштовувати і збирати складний об'єкт.
- Поєднання цих патернів дозволяє досягти високої гнучкості у створенні об'єктів та полегшує масштабування процесу створення складних структур.

#pagebreak()
#heading(numbering: none)[ВИСНОВОК]
У ході цього проєкту було детально розглянуто патерн проєктування Factory Method, який є важливим інструментом для гнучкого управління створенням об’єктів у сучасній розробці програмного забезпечення.

Основні переваги патерну Factory Method включають можливість делегувати створення об’єктів спеціалізованим класам, що підвищує гнучкість та знижує залежність від конкретних реалізацій. За рахунок цього патерн дозволяє дотримуватися принципу відкритості/закритості та спрощує розширення системи.

У проєкті ми розглянули концептуальну модель цього патерну, що включає класи для представлення об'єктів, а також фабричні методи для створення їхніх конкретних реалізацій. Практичну реалізацію патерну було проілюстровано на прикладі програми для створення різних типів піци на мові Python, що демонструє його універсальність і здатність до адаптації.

Висновки з цієї роботи підкреслюють важливість патерну Factory Method для розробки програмних систем, які потребують легкої адаптації та мінімізації зв’язків між класами. Патерн сприяє організованій структурі коду, що є зрозумілим, легким для підтримки та розширення. Застосування Factory Method відкриває нові можливості для розширення проєктів і є корисним рішенням для управління створенням об’єктів, що потребують різних варіацій і гнучкої структури.
#pagebreak()
#heading(numbering: none)[ПЕРЕЛІК ПОСИЛАНЬ]
1.Паттерн Factory Method на Python - Ютуб\
https://www.youtube.com/watch?v=Ni26lYMVM6k\
2.Паттерн Factory Method на Python - Сайт\
https://refactoring.guru/design-patterns/factory-method/python/example\
3.Factory Method Design \
https://sourcemaking.com/design_patterns/factory_method\
4.Factroy Method шаблон\
https://proglib.io/p/factory-method-python
#pagebreak()
#heading(numbering: none)[ДОДАТОК А]
#image("image.png", width: 110%),
#pagebreak()
#heading(numbering: none)[ДОДАТОК Б]
тут буде презентація 