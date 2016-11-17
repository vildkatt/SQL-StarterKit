USE `mydb`;

-- a znajdz pracowników starszych niż X lat
SELECT 
    first_name, surname
FROM
    employee
WHERE
    DOB > '1986-01-01';	

-- a znajdz pracowników starszych niż 30 lat v 2.0
SELECT 
    first_name, surname, DOB
FROM
    employee
WHERE
    TIMESTAMPDIFF(YEAR, DOB, CURDATE()) > 30;
    
-- a.1 znajdz pracowników w których nazwisku występuje fraza 'ski'
SELECT 
    first_name, surname
FROM
    employee
WHERE
    surname LIKE '%ski%';

-- a.2 znajdz pracowników których nazwisko nie zaczyna się od 'ab' (wielkość liter bez  znaczenia)
SELECT 
    first_name, surname
FROM
    employee
WHERE
    surname NOT LIKE 'ab%';

-- a.3 znajdz pracowników tórych nazwisko jest dłuższe niż N znaków
SELECT 
    first_name, surname
FROM
    employee
WHERE
    LENGTH(surname) > 6;

-- a.4 znajdz pracowników w których nazwISku na drugim miejscu wystepuje duza litera F
SELECT 
    first_name, surname
FROM
    employee
WHERE
    surname LIKE BINARY '_F%';

-- b znajdz pracowników w dziale X (HR)
SELECT 
    e.first_name, e.surname
FROM
    employee e
        INNER JOIN
    department d ON e.department_id = d.department_id
WHERE
    d.department_name = 'HR';

-- c znajdz projekty w których zatrudniony był pracownik z peselem X
SELECT 
    project_name
FROM
    (project p
    JOIN employee_projects ep ON p.project_id = ep.project_id
    JOIN employee e ON e.id = ep.employee_id)
WHERE
    pesel = 91010211111
        AND date_of_finish_in_the_project IS NOT NULL;

-- d policz w ilu projektach aktualnie zatrudniony jest pracownik X
SELECT 
    COUNT(project_id)
FROM
    employee_projects
WHERE
    employee_id = 11
        AND date_of_finish_in_the_project IS NULL;

-- e policz w ilu projektach w zeszłym roku zatrudniony był pracownik X na stanowisku PL
SELECT 
    COUNT(*)
FROM
    employee_projects
WHERE
    employee_id = 6 AND role = 'PL'
        AND (date_of_finish_in_the_project <= '2015-01-31'
        AND date_of_start_in_the_project >= '2015-01-01');

-- f wyszukaj zewnętrzne projekty
SELECT 
    *
FROM
    project
WHERE
    location = 'E';
	
-- g znajdz pracowników z działu X którzy pełnili w jakimś projekcie przynajmniej 2 funkcje ???

SELECT 
    surname, COUNT(DISTINCT role) AS distRole
FROM
    (employee e
    JOIN employee_projects ep ON e.id = ep.employee_id
    JOIN department d ON e.department_id = d.department_id)
WHERE
    department_name = 'HR'
GROUP BY surname
HAVING COUNT(role) >= 2;

-- h znajdz pracowników którzy pełnili w jakimś projekcie funkcje TCD i DEV ***
SELECT 
    first_name, surname, pesel
FROM
    (employee_projects ep
    JOIN employee e ON ep.employee_id = e.id
    JOIN project p ON ep.project_id = p.project_id)
WHERE
    project_name = 'timespan'
        AND role LIKE 'DEV'
        OR role LIKE 'TCD'
GROUP BY surname
HAVING COUNT(role) >= 2;
       

-- i wyszukaj projekt w którym pracownik miał najwyższą dniówkę ze wszystkich projektów w systemie ???
SELECT 
    project_name, employee_id, MAX(daily_rate)
FROM
    (employee_projects ep
    JOIN project p ON ep.project_id = p.project_id)
WHERE
    daily_rate = (SELECT MAX(daily_rate));

-- i.1 wyszukaj najlepiej zarabiającego aktualnie pracownika (chodzi o sumaryczną wartość dniówek danego pracownika ze wszystkich projektów, do których jest aktualnie przypISany)
SELECT 
    MAX(total)
FROM
    (SELECT 
        e.first_name, e.surname, SUM(daily_rate) AS total
    FROM
        employee_projects ep
    JOIN employee e ON e.id = ep.employee_id
    WHERE
        date_of_finish_in_the_project IS NULL
    GROUP BY ep.employee_id
    ORDER BY total DESC) AS totSal;

-- j znajdz pracownikow, ktorzy pracowali w projekcie X pomiedzy data Y i Z
SELECT 
    *
FROM
    employee e
        JOIN
    employee_projects ep ON ep.employee_id = e.id
WHERE
    project_id = 1
        AND date_of_start_in_the_project > '2011-01-01'
        AND date_of_finish_in_the_project < '2016-01-01';

-- k znajdz pracownikow nie przypisanych do żadnego z działów
SELECT 
    *
FROM
    employee
WHERE
    department_id IS NULL;

-- l znajdz pracownikow zarabiajacych aktualnie w jednym z projektow (dziennie) wiecej niz X

SELECT 
    e.first_name, e.surname, ep.employee_id
FROM
    employee_projects ep
        JOIN
    employee e ON e.id = ep.employee_id
WHERE
    date_of_finish_in_the_project IS NULL
        AND project_id = 3
        AND daily_rate > 15.00;

-- m znajdz pracownikow zarabiajacych aktualnie (dziennie) wiecej niz X
SELECT 
    e.first_name, e.surname, ep.employee_id
FROM
    employee_projects ep
        JOIN
    employee e ON e.id = ep.employee_id
WHERE
    date_of_finish_in_the_project IS NULL
HAVING SUM(daily_rate) > 15.00;

-- n zaktualizuj nazwisko wybranego pracownika
UPDATE employee 
SET 
    surname = 'Nowak'
WHERE
    surname = 'Adamska'
        AND first_name = 'Ewa'
        AND id = 9;

SELECT 
    *
FROM
    employee
WHERE
    surname = 'Nowak';

-- o rozważ, w jaki sposób najlepiej kasować dane pracownika z systemu. zaproponuj zapytanie kasujące dane wybranego pracownika
-- cascade on delete
DELETE FROM employee , employee_projects USING employee,
    employee_projects 
WHERE
    employee.id = employee_projects.employee_id
    AND employee.first_name = 'Ewa'
    AND employee.surname = 'Kowal';
	
-- o rozważ, w jaki sposób najlepiej kasować dane pracownika z systemu. v 2.0

DELETE employee , employee_projects FROM employee,
    employee_projects 
WHERE
    employee.id = employee_projects.employee_id
    AND employee.first_name = 'Ewa'
    AND employee.surname = 'Kowal';
      
-- zaktualizuj nazwę projektu w systemie
UPDATE project 
SET 
    project_name = 'tiger2'
WHERE
    project_name = 'tiger';

SELECT 
    *
FROM
    project;