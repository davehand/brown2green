SELECT *
FROM person
WHERE name = 'John T Burklow';

SELECT *
FROM legislator
WHERE party = 'democrat';

SELECT *
FROM legislator
WHERE district_num = 27;

SELECT *
FROM legislator
WHERE sname = 'New Jersey';

SELECT *
FROM expert
WHERE area_of_expertise = 'Public Health' OR area_of_expertise = 'Clean Water';

SELECT *
FROM expert
WHERE title = 'Legal Expert';

SELECT name, photo 
FROM person;

SELECT * 
FROM person
ORDER By name ASC;

SELECT * 
FROM person
ORDER BY name DESC;

SELECT name
FROM affiliation;

SELECT person.name, affiliation.name
FROM person, affiliation, member_of
WHERE person.id = member_of.id
AND affiliation.name = member_of.aname
AND affiliation.name = 'TCNJ';

SELECT name, email, phone
FROM person;

SELECT *
FROM expert as e, person as p, affiliation as a, member_of as m
WHERE p.id = m.id
AND a.name = m.aname
AND a.name = 'TCNJ'
AND e.id = p.id
AND (e.area_of_expertise ='Green Chemistry' OR e.area_of_expertise = 'Environmental Sociology');

SELECT *
FROM expert as e, person as p, affiliation as a, member_of as m
WHERE p.id=m.id
AND a.name=m.aname
AND a.name<>'TCNJ'
AND e.id = p.id
AND e.area_of_expertise = 'Biological Waste Treatment';

SELECT name
FROM person AS p, member_of AS m
WHERE p.id = m.id
AND m.aname = 'NJDEP';

SELECT name
FROM person AS p, member_of AS m, expert AS e
WHERE p.id = m.id
AND m.id = e.id
AND m.aname LIKE '%Environment%';

SELECT p.name, a.state
FROM person p, member_of m, affiliation a
WHERE p.id = m.id
AND m.aname = a.name
ORDER BY state;

SELECT name, area_of_expertise
FROM (member_of NATURAL JOIN (person NATURAL JOIN expert)) nat
ORDER BY area_of_expertise;

SELECT name
FROM legislator NATURAL INNER JOIN
(member_of JOIN affiliation ON member_of.aname = affiliation.name)
WHERE zipcode = '30333';

SELECT nat.name
FROM affiliation a, (person NATURAL JOIN member_of) nat
WHERE a.name = nat.aname
AND a.zipcode = '30333';

SELECT name
FROM affiliation a
WHERE a.zipcode = '30333';

SELECT m.aname, p.name
FROM affiliation a, person p, member_of m
WHERE a.name = m.aname
AND a.zipcode = '30333';
