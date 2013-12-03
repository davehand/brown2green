-- Join samples

--select names of members of an affiliation 
SELECT person.name, affiliation.name
FROM person, affiliation, member_of
WHERE person.id = member_of.id
AND affiliation.name = member_of.aname
AND affiliation.name = 'TCNJ';

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
