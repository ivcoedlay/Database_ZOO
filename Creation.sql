/*
Drop table Hospital; --
Drop table Sellers; --
Drop table Aviaries; --
Drop table Employees; --
Drop table Offspring; --
Drop table Feed; --
Drop table Animal_Card;--
Drop table Animal; --
Drop table Animal_Employees; 
Drop table Animal_Menu;

select * from Sellers;
select * from Aviaries;
select * from Employees;
select * from Offspring;
select * from Hospital;
select * from Feed;
select * from Animal_Card;
select * from Animal;
select * from Animal_Employees;
select * from Animal_Menu;
*/

Create table Aviaries
(id_avivary integer not null primary key,
number integer not null,
heating tinyint not null default 0);

Create table Sellers
(id_seller integer not null primary key,
seller_name char(30) not null default 'Zoo',
kind_of_feed char(20) not null,
type_of_feed char(50) not null);

Create table Employees
(id_employee integer not null primary key,
lastname char(40) not null,
firstname char(30) not null,
patronymic char(40) not null,
post char(50) not null,
access_to_aviaries tinyint not null default 0);

Create table Offspring
(id_offspring integer not null primary key,
id_parent1 integer,
id_parent2 integer,
offspring_info text,
will_leave_the_zoo tinyint not null default 1);

Create table Hospital
(id_ward integer not null primary key,
ward_number integer);

Create table Feed
(id_feed integer not null,
kind_of_feed char(20) not null,
type_of_feed char(50) not null,
animal char(25) not null,
primary key(id_feed),
foreign key (id_feed) references Sellers (id_seller));
-------------------
--ALTER TABLE Feed
--ADD seller CHAR(30) DEFAULT 'Zoo';
--UPDATE Feed
--SET seller = (SELECT seller_name FROM Sellers where Feed.id_feed = Seller.id_seller);

Create table Animal_Card
(id_card integer not null primary key,
animal_weight integer not null,
animal_height integer not null,
animal_age integer not null,
animal_sex char(10) not null,
sickness tinyint not null default 0,
medical_info text,
rabies tinyint default 0,
carnivore_plague tinyint default 0,
parvovirus_enteritis tinyint default 0,
coronavirus_enteritis tinyint default 0,
infectious_adenovirus tinyint default 0,
infectious_hepatitis tinyint default 0,
leptospirosis tinyint default 0,
ringworm tinyint default 0,
parainfluenza tinyint default 0,
foreign key (id_card) references Hospital (id_ward));

Create table Animal
(id_animal integer not null primary key,
animal_kind char(25) not null,
climate_zone char(10) not null,
is_predator tinyint not null);
-------------------
ALTER TABLE Animal ADD id_card INT not null
	REFERENCES Animal_Card(id_card);
ALTER TABLE Animal ADD id_avivary INT not null
	REFERENCES Aviaries(id_avivary);
-------------------
--ALTER TABLE Animal
--ADD feed_kind char(20) not null;
--UPDATE Animal
--SET feed_kind = (SELECT kind_of_feed FROM Feed);
-------------------
ALTER TABLE Animal ADD offspring_card INT
	REFERENCES Offspring(id_offspring); 

Create table Animal_Employees
(id_animal_eployee integer not null primary key, --id связи животное_работник
id_employee integer not null, --id работника
post char(50), --должность работника
id_animal integer not null, --id животного, которое закреплено за работником
animal_kind char(25), --вид животного, закреплённого за работником
foreign key (id_animal) references Animal (id_animal),
foreign key (id_employee) references Employees(id_employee));

Create table Animal_Menu
(id_animal integer not null primary key,
animal_kind char(25),
kind_of_feed char(20),
foreign key (id_animal) references Animal (id_animal));
-------------------