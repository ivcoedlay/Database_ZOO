--1. 
SELECT * FROM Employees;
SELECT COUNT(*) FROM Employees;

--2. 
SELECT * FROM Employees WHERE id_employee IN (SELECT id_employee FROM Animal_Employees WHERE animal_kind = 'Siamese cobra');
SELECT COUNT(*) FROM Employees WHERE id_employee IN (SELECT id_employee FROM Animal_Employees WHERE animal_kind = 'Siamese cobra');

--3. 
SELECT * FROM Employees WHERE access_to_aviaries = 1 AND id_employee IN (SELECT id_employee FROM Animal_Employees WHERE animal_kind = 'Siamese cobra');
SELECT COUNT(*) FROM Employees WHERE access_to_aviaries = 1 AND id_employee IN (SELECT id_employee FROM Animal_Employees WHERE animal_kind = 'Siamese cobra');

--4. 
SELECT * FROM Animal WHERE id_avivary IN (SELECT id_avivary FROM Aviaries WHERE number = 16);
SELECT COUNT(*) FROM Animal WHERE id_avivary IN (SELECT id_avivary FROM Aviaries WHERE number = 16);

--5. 
SELECT * FROM Animal WHERE animal_kind = 'Red parrot' AND id_avivary IN (SELECT id_avivary FROM Aviaries WHERE heating = 1);
SELECT COUNT(*) FROM Animal WHERE animal_kind = 'Red parrot' AND id_avivary IN (SELECT id_avivary FROM Aviaries WHERE heating = 1);

--6. 
SELECT * FROM Animal_Card WHERE rabies = 1 OR carnivore_plague = 1 OR parvovirus_enteritis = 1 OR coronavirus_enteritis = 1 OR infectious_adenovirus = 1 OR infectious_hepatitis = 1 OR leptospirosis = 1 OR ringworm = 1 OR parainfluenza = 1;
SELECT COUNT(*) FROM Animal_Card WHERE rabies = 1 OR carnivore_plague = 1 OR parvovirus_enteritis = 1 OR coronavirus_enteritis = 1 OR infectious_adenovirus = 1 OR infectious_hepatitis = 1 OR leptospirosis = 1 OR ringworm = 1 OR parainfluenza = 1;

--7. 
SELECT * FROM Animal WHERE climate_zone = 'Hot' OR climate_zone = 'Wet';
SELECT COUNT(*) FROM Animal WHERE climate_zone = 'Hot' OR climate_zone = 'Wet';

--8. 
SELECT * FROM Sellers;
SELECT COUNT(*) FROM Sellers;

--9. 
SELECT * FROM Sellers WHERE seller_name = 'Zoo';
SELECT COUNT(*) FROM Sellers WHERE seller_name = 'Zoo';

--10. 
SELECT * FROM Animal;
SELECT COUNT(*) FROM Animal;

--11. 
SELECT * FROM Animal WHERE id_avivary IN (SELECT id_avivary FROM Aviaries WHERE number = 2);
SELECT COUNT(*) FROM Animal WHERE id_avivary IN (SELECT id_avivary FROM Aviaries WHERE number = 2);

--12.
SELECT animal_kind FROM Animal GROUP BY animal_kind HAVING COUNT(*) >= 2;
SELECT COUNT(DISTINCT animal_kind) FROM Animal GROUP BY animal_kind HAVING COUNT(*) >= 2;

--13.
SELECT id_offspring FROM Offspring WHERE will_leave_the_zoo = 1;
SELECT COUNT(*) FROM Offspring WHERE will_leave_the_zoo = 1;