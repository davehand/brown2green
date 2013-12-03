--selecting a person from the database
SELECT *
FROM person
WHERE name = 'John T Burklow';

--selecting legislators based on party
SELECT *
FROM legislator
WHERE party = 'democrat';

--selecting legislators based on district number
SELECT *
FROM legislator
WHERE district_num = 27;

--selecting legislators based on a state
SELECT *
FROM legislator
WHERE sname = 'New Jersey';

--selecting experts based on an area of expertise
SELECT *
FROM expert
WHERE area_of_expertise = 'Public Health' OR area_of_expertise = 'Clean Water';

--selecting experts based on title
SELECT *
FROM expert
WHERE title = 'Legal Expert';

--selecting people and their photos
SELECT name, photo 
FROM person;

--organize people by name in ascending order
SELECT * 
FROM person
ORDER By name ASC;

--organize people by name in descending order
SELECT * 
FROM person
ORDER BY name DESC;

--list all affiliations
SELECT name
FROM affiliation;

--select names of members of an affiliation 
SELECT person.name, affiliation.name
FROM person, affiliation, member_of
WHERE person.id = member_of.id
AND affiliation.name = member_of.aname
AND affiliation.name = 'TCNJ';

--list the contact info for each person
SELECT name, email, phone
FROM person;

--list professors at TCNJ who are knowledgable about environmental science
SELECT *
FROM expert as e, person as p, affiliation as a, member_of as m
WHERE p.id = m.id
AND a.name = m.aname
AND a.name = 'TCNJ'
AND e.id = p.id
AND (e.area_of_expertise ='Green Chemistry' OR e.area_of_expertise = 'Environmental Sociology');

--list outside professors with knowledge in environmental science or toxic chemicals
SELECT *
FROM expert as e, person as p, affiliation as a, member_of as m
WHERE p.id=m.id
AND a.name=m.aname
AND a.name<>'TCNJ'
AND e.id = p.id
AND e.area_of_expertise = 'Biological Waste Treatment';

--list employees of NJDEP
SELECT name
FROM person AS p, member_of AS m
WHERE p.id = m.id
AND m.aname = 'NJDEP';

--list everyone connected to environmental health
SELECT name
FROM person AS p, member_of AS m, expert AS e
WHERE p.id = m.id
AND m.id = e.id
AND m.aname LIKE '%Environment%';

--list all experts and sort by state
SELECT p.name, a.state
FROM person p, member_of m, affiliation a
WHERE p.id = m.id
AND m.aname = a.name
ORDER BY state;

--list all experts and sort by area of expertise
SELECT name, area_of_expertise
FROM (member_of NATURAL JOIN (person NATURAL JOIN expert)) nat
ORDER BY area_of_expertise;

--list all legislators for a certain zip code
SELECT name
FROM legislator NATURAL INNER JOIN
(member_of JOIN affiliation ON member_of.aname = affiliation.name)
WHERE zipcode = '30333';

--list all people for a certain zip code
SELECT nat.name
FROM affiliation a, (person NATURAL JOIN member_of) nat
WHERE a.name = nat.aname
AND a.zipcode = '30333';

--list all affiliations for a certain zip code
SELECT name
FROM affiliation a
WHERE a.zipcode = '30333';

--list all affiliations and members for a certain zip code
SELECT m.aname, p.name
FROM affiliation a, person p, member_of m
WHERE a.name = m.aname
AND a.zipcode = '30333';
