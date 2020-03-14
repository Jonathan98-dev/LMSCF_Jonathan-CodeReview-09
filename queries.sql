--Costumers with f_name=FirstName1 -> 3

SELECT COUNT(customer.f_name)
FROM customer
WHERE f_name= "FirstName1";


--Packages deposited on 13.03.2020 -> 2

SELECT COUNT(customer_id)
FROM package
WHERE dep_date = "2020-03-13";


--How many Employees -> 3

SELECT COUNT(id)
FROM employee;


--Adresses of the Drop Locations where zip has 23 -> DropStreet1 % DropStreet3

SELECT adresse
FROM droplocation
WHERE zip
LIKE "%23%";


-->-->-->-->-->-->-->

-- 2 Join QUERIES


--Package id, Costumer first name, Recipient first name and deposit date

SELECT package.id, customer.f_name , recipient.f_name, package.dep_date
FROM package
INNER JOIN customer
ON customer.f_name = customer.f_name
INNER JOIN recipient
ON recipient.f_name = recipient.f_name;



--Package id and Employee first name

SELECT 
processing_action.package_id, employee.f_name 
FROM
processing_action
INNER JOIN employee
ON employee.f_name = employee.f_name  
