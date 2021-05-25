--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-queries.sql

--Student ID:
--Student Name:
--Tutorial No:

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
ht_nbr,
e.emp_nbr,
e.emp_lname,
e.emp_fname,
end_last_annual_review as review_date
    
FROM
    MH.employee e 
    JOIN MH.endorsement s ON e.emp_nbr = s.emp_nbr
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
charter_nbr,
c.client_nbr,
c.client_lname,
c.client_fname,
charter_special_reqs

FROM
MH.client c
JOIN MH.charter r ON c.client_nbr = r.client_nbr
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
client_fname|| ' ' || client_lname AS fullname,
c.charter_nbr,
charter_cost_per_hour
FROM
MH.charter_leg l
JOIN MH.charter c ON l.charter_nbr = c.charter_nbr
JOIN MH.client t ON c.client_nbr = t.client_nbr
WHERE
location_nbr_origin LIKE 'Mount Doom' OR location_nbr_destination LIKE 'Mount Doom' OR charter_cost_per_hour < 1000 OR  charter_special_reqs is null
ORDER BY
fullname DESC;

/*
    Q4

*/
SELECT
COUNT(ht.ht_nbr),
ht.ht_nbr,
ht.ht_name
FROM
MH.helicopter h
JOIN MH.helicopter_type ht ON ht.ht_nbr = h.ht_nbr group by  ht.ht_nbr, ht.ht_name
HAVING COUNT(ht.ht_nbr) >=2

ORDER BY
COUNT(ht.ht_nbr) DESC;

-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q5
*/
SELECT
COUNT(cl.location_nbr_origin),
l.location_nbr, 
location_name
FROM
MH.charter_leg cl
JOIN MH.location l ON cl.location_nbr_origin = l.location_nbr GROUP BY location_nbr,
location_name
HAVING COUNT (cl.location_nbr_origin) > 1
ORDER BY
COUNT (cl.location_nbr_origin) ASC;

-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q6
*/

-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
ht.ht_nbr,
ht.ht_name,
SUM(heli_hrs_flown)

FROM
MH.helicopter_type ht
JOIN MH.helicopter h ON ht.ht_nbr = h.ht_nbr

GROUP BY ht.ht_nbr, ht.ht_name
ORDER BY ht.ht_nbr;

/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT


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


/*
    Q10
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

