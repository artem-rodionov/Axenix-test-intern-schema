INSERT INTO departments (name) VALUES
('Разработка'),
('Маркетинг'),
('Продажи'),
('HR');

INSERT INTO roles (name) VALUES
('Backend-разработчик'),
('Frontend-разработчик'),
('QA-инженер'),
('Менеджер проектов'),
('Маркетолог'),
('Менеджер по продажам'),
('HR-специалист');

INSERT INTO documents_type (type) VALUES
('Паспорт РФ'),
('ИНН'),
('СНИЛС');

INSERT INTO employees (email, name, surname, patronymic, birthday, role_id) VALUES
('ivanov@company.com', 'Иван', 'Иванов', 'Иванович', '1990-05-15', (SELECT id FROM roles WHERE name = 'Менеджер проектов')),
('petrova@company.com', 'Анна', 'Петрова', 'Сергеевна', '1995-08-20', (SELECT id FROM roles WHERE name = 'Backend-разработчик')),
('sidorov@company.com', 'Петр', 'Сидоров', 'Алексеевич', '1988-02-10', (SELECT id FROM roles WHERE name = 'Frontend-разработчик')),
('smirnov@company.com', 'Алексей', 'Смирнов', 'Дмитриевич', '1992-11-30', (SELECT id FROM roles WHERE name = 'Backend-разработчик')),
('kuznetsova@company.com', 'Елена', 'Кузнецова', 'Игоревна', '1997-04-05', (SELECT id FROM roles WHERE name = 'QA-инженер')),
('popov@company.com', 'Дмитрий', 'Попов', 'Владимирович', '1991-07-12', (SELECT id FROM roles WHERE name = 'Backend-разработчик')),
('vasilieva@company.com', 'Ольга', 'Васильева', 'Андреевна', '1994-09-25', (SELECT id FROM roles WHERE name = 'Frontend-разработчик')),
('sokolov@company.com', 'Сергей', 'Соколов', 'Михайлович', '1985-12-01', (SELECT id FROM roles WHERE name = 'Backend-разработчик')),
('mikhailova@company.com', 'Татьяна', 'Михайлова', 'Николаевна', '1993-03-18', (SELECT id FROM roles WHERE name = 'QA-инженер')),
('novikov@company.com', 'Андрей', 'Новиков', 'Сергеевич', '1989-06-22', (SELECT id FROM roles WHERE name = 'Backend-разработчик')),
('fedorova@company.com', 'Мария', 'Федорова', 'Павловна', '1996-10-14', (SELECT id FROM roles WHERE name = 'Frontend-разработчик')),
('morozova@company.com', 'Светлана', 'Морозова', 'Викторовна', '1998-01-30', (SELECT id FROM roles WHERE name = 'Маркетолог')),
('volkov@company.com', 'Николай', 'Волков', 'Андреевич', '1987-05-05', (SELECT id FROM roles WHERE name = 'Менеджер по продажам')),
('alekseeva@company.com', 'Ирина', 'Алексеева', 'Дмитриевна', '1999-08-08', (SELECT id FROM roles WHERE name = 'Менеджер по продажам')),
('lebeev@company.com', 'Максим', 'Лебедев', 'Олегович', '1990-12-12', (SELECT id FROM roles WHERE name = 'Менеджер по продажам')),
('nikitina@company.com', 'Екатерина', 'Никитина', 'Александровна', '1995-02-28', (SELECT id FROM roles WHERE name = 'HR-специалист')),
('orlov@company.com', 'Александр', 'Орлов', 'Игоревич', '1986-09-09', (SELECT id FROM roles WHERE name = 'HR-специалист'));

INSERT INTO documents (issue_date, organization, number, type_id, employee_id) VALUES
('2021-03-10', 'ГУ МВД России по г. Москве', '4510 123456', (SELECT id FROM documents_type WHERE type = 'Паспорт РФ'), (SELECT id FROM employees WHERE email = 'ivanov@company.com')),
('2023-05-20', 'ФНС России', '770123456789', (SELECT id FROM documents_type WHERE type = 'ИНН'), (SELECT id FROM employees WHERE email = 'ivanov@company.com')),
('2024-01-15', 'ГУ МВД России по г. Москве', '4515 654321', (SELECT id FROM documents_type WHERE type = 'Паспорт РФ'), (SELECT id FROM employees WHERE email = 'petrova@company.com')),
('2023-11-05', 'СФР', '123-456-789 00', (SELECT id FROM documents_type WHERE type = 'СНИЛС'), (SELECT id FROM employees WHERE email = 'petrova@company.com')),
('2022-08-12', 'ФНС России', '780987654321', (SELECT id FROM documents_type WHERE type = 'ИНН'), (SELECT id FROM employees WHERE email = 'sidorov@company.com')),
('2023-03-01', 'ГУ МВД России по г. Москве', '4520 111222', (SELECT id FROM documents_type WHERE type = 'Паспорт РФ'), (SELECT id FROM employees WHERE email = 'smirnov@company.com')),
('2024-02-18', 'СФР', '987-654-321 00', (SELECT id FROM documents_type WHERE type = 'СНИЛС'), (SELECT id FROM employees WHERE email = 'kuznetsova@company.com')),
('2023-07-22', 'ФНС России', '770555444333', (SELECT id FROM documents_type WHERE type = 'ИНН'), (SELECT id FROM employees WHERE email = 'popov@company.com')),
('2021-11-30', 'ГУ МВД России по г. Москве', '4530 333444', (SELECT id FROM documents_type WHERE type = 'Паспорт РФ'), (SELECT id FROM employees WHERE email = 'morozova@company.com')),
('2023-09-14', 'СФР', '111-222-333 00', (SELECT id FROM documents_type WHERE type = 'СНИЛС'), (SELECT id FROM employees WHERE email = 'morozova@company.com'));

INSERT INTO employees_departments (employee_id, department_id) VALUES
((SELECT id FROM employees WHERE email = 'ivanov@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'ivanov@company.com'), (SELECT id FROM departments WHERE name = 'Маркетинг')),
((SELECT id FROM employees WHERE email = 'petrova@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'sidorov@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'smirnov@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'kuznetsova@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'popov@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'vasilieva@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'sokolov@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'mikhailova@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'novikov@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'fedorova@company.com'), (SELECT id FROM departments WHERE name = 'Разработка')),
((SELECT id FROM employees WHERE email = 'morozova@company.com'), (SELECT id FROM departments WHERE name = 'Маркетинг')),
((SELECT id FROM employees WHERE email = 'volkov@company.com'), (SELECT id FROM departments WHERE name = 'Продажи')),
((SELECT id FROM employees WHERE email = 'alekseeva@company.com'), (SELECT id FROM departments WHERE name = 'Продажи')),
((SELECT id FROM employees WHERE email = 'lebeev@company.com'), (SELECT id FROM departments WHERE name = 'Продажи')),
((SELECT id FROM employees WHERE email = 'nikitina@company.com'), (SELECT id FROM departments WHERE name = 'HR')),
((SELECT id FROM employees WHERE email = 'orlov@company.com'), (SELECT id FROM departments WHERE name = 'HR'));