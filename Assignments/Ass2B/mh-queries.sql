--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-queries.sql

--Student ID: 29796776
--Student Name: Bassel Abdelkader
--Tutorial No: 01

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
endorsement.ht_nbr,
employee.emp_nbr,
employee.emp_lname,
employee.emp_fname,
TO_CHAR(end_last_annual_review,'Dy DD Mon YYYY') AS review_date
FROM
 MH.endorsement 
JOIN MH.employee  ON endorsement.emp_nbr = employee.emp_nbr
WHERE
end_last_annual_review > TO_DATE('31/03/2020', 'dd/mm/yyyy')
ORDER BY
review_date ASC;

/*
    Q2
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
t.client_fname,
t.client_lname,
charter_nbr,
t.client_nbr,
charter_special_reqs
FROM
MH.charter r
JOIN MH.client t  ON r.client_nbr = t.client_nbr
WHERE
charter_special_reqs is not null
ORDER BY
 charter_nbr ASC;

/*
    Q3
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
c.charter_nbr,
TRIM(client_fname|| ' ' || client_lname) AS fullname,
charter_cost_per_hour
FROM
 MH.charter c
JOIN MH.charter_leg cl ON cl.charter_nbr = c.charter_nbr
JOIN MH.client t ON c.client_nbr = t.client_nbr
WHERE
(charter_cost_per_hour < 1000 OR charter_special_reqs is null) and location_nbr_destination like 
(select location_nbr from mh.location where location_name like 'Mount Doom') 

ORDER BY
fullname DESC;

/*
    Q4

*/

-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
ht.ht_name,
ht.ht_nbr,
COUNT(ht.ht_nbr) as num_of_heli_owned
FROM
MH.helicopter_type ht
JOIN MH.helicopter h  ON ht.ht_nbr = h.ht_nbr group by  ht.ht_name,  ht.ht_nbr
HAVING COUNT(ht.ht_nbr) >=2
ORDER BY
num_of_heli_owned DESC;


/*
    Q5
*/


-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer



/*
    Q6
*/

-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
ht.ht_name,
ht.ht_nbr,
NVL(SUM(heli_hrs_flown),0) AS total_nbr_hrs_flown
FROM
MH.helicopter_type ht
LEFT JOIN MH.helicopter h  ON ht.ht_nbr = h.ht_nbr
GROUP BY  ht.ht_name,ht.ht_nbr
ORDER BY total_nbr_hrs_flown ASC;

/*
    Q7
*/

---
SELECT
charter.charter_nbr,
TO_CHAR (charter_leg.cl_atd, 'dd/mm/yyyy hh:mi:ss PM') as cl_atd

FROM
mh.employee JOIN mh.charter ON charter.emp_nbr = employee.emp_nbr
JOIN mh.charter_leg on  charter_leg.charter_nbr =  charter.charter_nbr
WHERE
employee.emp_fname = 'Frodo' and employee.emp_lname= 'Baggins' and charter_leg.cl_atd is not null and charter_leg.cl_ata is not null

order by
charter_leg.cl_atd desc;

/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

select 
charter.charter_nbr, 
trim(employee.emp_fname || ' ' || employee.emp_lname) as pilot_name, 
trim(client.client_fname || ' ' || client.client_lname) as client_name
from
(((mh.charter_leg join mh.charter on charter_leg.charter_nbr = charter.charter_nbr) 
join mh.client on charter.client_nbr = client.client_nbr) 
join mh.employee on charter.emp_nbr = employee.emp_nbr)
where
to_char(charter_leg.cl_etd, 'dd/mon/yyyy hh:mi:sspm') = to_char(charter_leg.cl_atd, 'dd/mon/yyyy hh:mi:sspm')
order by
charter.charter_nbr;

/*
    Q10
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

