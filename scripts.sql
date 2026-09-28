---Запрос №1---
---Описание: Соединяем employees с documents (по employee_id) и documents_type (по type_id).
-- Фильтруем по дате выдачи (>= 2023-01-01). Сортируем по фамилии (возр.) и дате (убыв.).
   
  SELECT e.name, 
  		 e.surname, 
  		 e.patronymic, 
  		 dt."type" AS document_type, 
  		 d."number", 
  		 d.issue_date 
    FROM employees e
    JOIN documents d
      ON e.id = d.employee_id
    JOIN documents_type dt 
      ON d.type_id = dt.id
   WHERE d.issue_date >= '2023-01-01'
ORDER BY e.surname, d.issue_date DESC 

---Запрос №2---

   SELECT d."name" AS department_name, 
   		  r."name" AS role_name, 
   		  COUNT(*) AS employee_count
     FROM employees_departments ed
     JOIN employees e 
       ON e.id = ed.employee_id 
     JOIN departments d 
       ON d.id = ed.department_id 
     JOIN roles r 
       ON r.id = e.role_id
 GROUP BY d."name", r."name"
 ORDER BY d."name", COUNT(*) desc
 
 
 ---Запрос №3---
 
   SELECT d."name" AS department_name,
          ROUND(AVG(EXTRACT(YEAR FROM age(e.birthday)))) AS avg_age, 
          COUNT(DISTINCT e.role_id) AS unique_roles_count
     FROM employees_departments ed
     JOIN employees e 
       ON e.id = ed.employee_id 
     JOIN departments d 
       ON d.id = ed.department_id 
 GROUP BY d.id
   HAVING COUNT(*) > 10 OR COUNT(*) = 1 
 ORDER BY COUNT(*) DESC, d."name"