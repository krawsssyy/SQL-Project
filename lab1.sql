--Creez baza de date pentru acest lab
CREATE DATABASE LAB1;
--Utilizez baza de date creata
USE LAB1;

--Tema proiectului : Campionat de jocuri video

--Tabela ce va tine minte organizatorii evenimentului
CREATE TABLE ORGANISERS
(
idOrg INT PRIMARY KEY IDENTITY,
forename VARCHAR(20),
surname VARCHAR(20),
birthDate DATE
);

--Tabela ce va tine minte sponsorii adusi de organizatorii eventimentului
CREATE TABLE SPONSORS
(
idSpons INT PRIMARY KEY IDENTITY,
businessName VARCHAR(30),
contributionValue INT,
broughtBy INT FOREIGN KEY REFERENCES ORGANISERS(idOrg)
);

--Tabela ce va retine echipele participante
CREATE TABLE TEAMS
(
idTeam INT PRIMARY KEY IDENTITY,
teamName VARCHAR(20),
foundationDate DATE,
noTrophies INT,
manager VARCHAR(30) 
);

--Tabela ce va memora jucatorii ce participa la acest eveniment
CREATE TABLE PLAYERS
(
idPlayer INT PRIMARY KEY IDENTITY,
forename VARCHAR(20), 
surname VARCHAR(20),
ingameName VARCHAR(20),
birthDate DATE,
joinDate DATE,
rating FLOAT,
teamID INT FOREIGN KEY REFERENCES TEAMS(idTeam)
);

--Tabela ce va contine arenele unde se vor juca meciurile
CREATE TABLE ARENAS
(
idArena INT PRIMARY KEY IDENTITY,
arenaName VARCHAR(20),
maxAmountPeople INT,
maxAmountTeams INT,
placement VARCHAR(50) --relative to the entrance to the hall
);


--Tabela de legatura pentru relatia m-n intre echipe si arene,ea va retine echipele care au meciuri si arena in care se va desfasura acel meci
CREATE TABLE GAMES
(
arenaID INT FOREIGN KEY REFERENCES ARENAS(idArena),
team1ID INT FOREIGN KEY REFERENCES TEAMS(idTeam),
team2ID INT FOREIGN KEY REFERENCES TEAMS(idTeam),
gameTime DATETIME,
CONSTRAINT pk_GAMES PRIMARY KEY(arenaID, team1ID, team2ID)
);

--Inserare date : 
INSERT INTO ORGANISERS(forename, surname, birthDate)
VALUES
('Joe', 'Newman', '1979-12-09'),
('Simon', 'Hellberg', '1972-03-24'),
('Henry', 'Gaville', '1980-08-30'),
('Pansy', 'Miller', '1983-11-08');

INSERT INTO SPONSORS(businessName, contributionValue, broughtBy)
VALUES
('RedBull', 150000, 1),
('Monster Energy' , 200000, 1),
('American Army', 100000, 2),
('Intel', 150000, 3),
('AMD', 140000, 3), 
('Nvidia', 200000, 3),
('ESL', 300000, 4);

INSERT INTO TEAMS(teamName, foundationDate, noTrophies, manager)
VALUES
('FaZe Clan', '2010-05-30', 9, 'yNk'),
('Astralis' , '2016-01-18', 16, 'zonic'),
('Natus Vincere', '2009-12-17', 15, 'B1ad3'),
('fnatic', '2004-07-23', 25, 'Samuelsson'),
('Ninjas in Pyjamas' , '2000-06-30', 31, 'THREAT');

INSERT INTO PLAYERS(forename, surname, ingameName, birthDate, joinDate, rating, teamID)
VALUES
('Havard', 'Nygaard' , 'rain', '1990-08-21', '2016-01-20', 8.5, 1),
('Olof Kajbjer', 'Gustaffson' , 'olofmeister', '1994-11-12', '2017-08-20', 9.4, 1),
('Marcelo', 'David', 'coldzera' , '1996-09-15', '2019-09-25', 9.4, 1), 
('Helvjis', 'Saukants' , 'broky', '2000-04-19', '2019-09-26', 9.7, 1),
('Markus', 'Kjaerbye', 'kjaerbye', '1998-06-24', '2020-08-11', 8.8, 1),
('Nicolai Hvilshoj', 'Reedtz', 'dev1ce', '1995-11-17', '2016-01-18', 9.6, 2),
('Peter Rothmann', 'Rasmussen', 'dupreeh', '1994-11-15', '2016-01-18', 9.8, 2),
('Andreas', 'Hojsleth', 'Xyp9x', '1995-05-30', '2016-01-18', 9.4, 2),
('Lukas Egholm', 'Rossander', 'gla1ve', '1999-12-17', '2016-10-24', 9.3, 2),
('Emil Hoffman', 'Reif', 'Magisk', '1992-03-04', '2018-02-08', 9.4, 2),
('Egor', 'Vasiliev', 'flamie', '1997-09-27', '2015-04-10', 9.1, 3),
('Oleksandr', 'Kostyliev', 's1mple', '1999-08-16', '2016-08-04', 9.9, 3),
('Denis', 'Sharpiov' , 'electronic', '1997-11-28', '2017-11-06', 9.6, 3),
('Kirill', 'Mikhailov', 'Boombl4', '1998-01-19', '2019-05-29', 9.3, 3),
('Ilya', 'Zalutskiy', 'Perfecto', '1997-12-08', '2020-01-24', 9.4, 3),
('Freddy', 'Johansson', 'KRIMZ', '1995-11-01', '2016-10-24', 9.1, 4),
('Jesper', 'Wecksell', 'JW', '1996-08-03', '2017-02-04', 9.7, 4),
('Ludvig' , 'Brolin', 'Brollan', '1998-05-02', '2018-10-17', 9.2, 4),
('Robin', 'Ronnquist', 'flusha', '1994-07-30', '2019-09-16', 9.8, 4),
('Maikil', 'Selim', 'Golden', '1999-02-09', '2020-01-17', 9.1, 4),
('Fredrik', 'Starner', 'REZ', '1997-03-29', '2017-06-12', 9.2, 5),
('Nicolas Gonzalez', 'Zamora', 'Plopski', '1999-10-14', '2019-06-19', 9.0, 5),
('Simom', 'Eliasson', 'twist', '1998-10-28', '2019-09-27', 9.5, 5),
('Tim', 'Jonasson', 'nawwk', '1995-07-09', '2020-01-21', 9.1, 5),
('Hampus', 'Poser', 'hampus', '1997-11-03', '2020-05-19', 9.2, 5);

INSERT INTO ARENAS(arenaName, maxAmountPeople, maxAmountTeams, placement)
VALUES
('Einhoven - Groups', 300000, 6, 'from entrance to right'),
('Amsterdam - Groups', 500000, 10, 'from entrance to left'),
('Berlin - Quarters', 600000, 16, 'behind the Amsterdam Arena'),
('Tokyo - Semis' , 800000, 32, 'behind the Einhoven Arena'),
('New York - Finals', 1000000, 2, 'from entrance directly straight'),
('Dallas - Auxiliary', 100000, 4, NULL);

INSERT INTO GAMES(arenaID, team1ID, team2ID, gameTime)
VALUES
(1, 1, 2, '2020-11-19T14:00:00'),
(1, 3, 5, '2020-11-19T14:00:00'),
(2, 2, 4, '2020-11-19T17:00:00'),
(2, 2, 3, '2020-11-20T14:00:00'),
(2, 1, 5, '2020-11-20T14:00:00'),
(1, 2, 5, '2020-11-20T17:00:00'),
(3, 1, 3, '2020-11-20T17:00:00'),
(4, 1, 4, '2020-11-21T14:00:00'),
(4, 3, 4, '2020-11-21T17:00:00'),
(3, 4, 5, '2020-11-22T14:00:00');

--Modificare date : 
UPDATE TEAMS
SET manager = 'RobbaN'
WHERE teamName = 'FaZe Clan' OR manager = 'yNk';

UPDATE PLAYERS
SET rating = 8.8
WHERE ingameName = 'rain' AND teamID = 1;

UPDATE PLAYERS 
SET rating = rating + 0.1
WHERE rating <= 9.8;

UPDATE ARENAS
SET maxAmountTeams = 8
WHERE placement IS NULL;

--Stergere date : 
DELETE FROM GAMES WHERE gameTime < '2020-11-19T16:00:00';
DELETE FROM SPONSORS WHERE contributionValue < 100000 OR broughtBy = 2;
DELETE FROM ARENAS WHERE placement is NULL;


--Interogare cu UNION/INTERSECT/EXCEPT
SELECT forename FROM ORGANISERS
UNION 
SELECT businessName FROM SPONSORS; -- Afiseaza toti organizatorii si sponsorii prezenti

--2 Interogari cu INNER JOIN + 1 LEFT/RIGHT/FULL JOIN
SELECT forename, surname , SPONSORS.businessName FROM ORGANISERS
INNER JOIN SPONSORS
ON ORGANISERS.idOrg = SPONSORS.broughtBy; -- afiseaza toti organizatorii care au adus sponsori si sponsorii adusi

SELECT DISTINCT gameTime, arenaName from ((GAMES
INNER JOIN TEAMS
ON GAMES.team1ID = TEAMS.idTeam)
INNER JOIN ARENAS
ON GAMES.arenaID = ARENAS.idArena); -- afiseaza data si arena meciurilor echipei cu idul 2(se poate modif
--pt a obtine meciurile oricarei echipe)

SELECT forename, surname FROM PLAYERS 
RIGHT JOIN TEAMS 
ON TEAMS.idTeam = PLAYERS.teamID
WHERE rating > 8.5 AND joinDate > '01-01-2018'; -- afiseaza toti jucatorii care au echipa, un rating mai mare de 8.5
--si s-au alaturat echipei dupa inceputul anului 2018


--3 Interogari cu GROUP BY (1 cu HAVING)  + fct de agregare

SELECT COUNT(teamID) AS NumberOfPlayers, teamID FROM PLAYERS
GROUP BY teamID; -- afiseaza numarul de jucatori al fiecarei echipe

SELECT COUNT(gameTime) AS NumberOfMatches, team1ID from (GAMES
LEFT JOIN TEAMS
ON TEAMS.idTeam = team1ID)
GROUP BY team1ID; -- afiseaza cate meciuri are fiecare echipa care teoretic joaca "acasa"

SELECT MAX(noTrophies) AS MaxTrophies, idTeam from TEAMS
GROUP BY foundationDate, idTeam
HAVING foundationDate > '01-01-2010'; -- afiseaza maximul de trofee al echipelor ce au fost fondate dupa inceputul
--lui 2010

SELECT MIN(contributionValue) As MinContribution, idSpons from SPONSORS
GROUP BY idSpons; --afiseaza fiecare sponsor si valoarea minima a contributiei adusa

---Functii de verificare :
CREATE FUNCTION sfCheckJoinDate(@date date)
RETURNS BIT AS 
BEGIN
DECLARE @ret AS BIT;
SET @ret = 0;
IF @date > '01-01-2000' AND @date < GETDATE()
	 SET @ret = 1;
RETURN @ret;
END;


CREATE FUNCTION sfCheckManager(@manager VARCHAR(30))
RETURNS BIT AS
BEGIN
DECLARE @ret AS BIT;
SET @ret = 0;
IF LOWER(@manager) LIKE '%[a-z]%'
	SET @ret = 1;
RETURN @ret;
END;


CREATE FUNCTION sfCheckArena(@amountPpl INT, @amountTeams INT)
RETURNS BIT AS
BEGIN
DECLARE @ret AS BIT;
SET @ret = 0;
IF @amountPpl > 0 AND @amountTeams > 0
	SET @ret = 1;
RETURN @ret;
END;

---Proceduri pt adaugarea datelor
CREATE PROCEDURE uspAddTeam(@teamName VARCHAR(20), @foundationDate DATE, @noTrophies INT, @manager VARCHAR(30))
AS
BEGIN
DECLARE @retDate AS BIT;
SET @retDate = dbo.sfCheckJoinDate(@foundationDate);
DECLARE @retManager AS BIT;
SET @retManager = dbo.sfCheckManager(@manager);
IF @retDate = 1 AND @retManager = 1
	INSERT INTO TEAMS(teamName, foundationDate, noTrophies, manager) VALUES
	(@teamName, @foundationDate, @noTrophies, @manager)
ELSE
	PRINT 'Nu s-a putut adauga din cauza datelor invalide';
END;

CREATE PROCEDURE uspAddArena(@arenaName VARCHAR(20), @maxAmountPeople INT, @maxAmountTeams INT, @placement VARCHAR(50))
AS
BEGIN
DECLARE @retCheck AS BIT;
SET @retCheck = dbo.sfCheckArena(@maxAmountPeople, @maxAmountTeams);
IF @retCheck = 1
	INSERT INTO ARENAS(arenaName, maxAmountPeople, maxAmountTeams, placement) VALUES
	(@arenaName, @maxAmountPeople, @maxAmountTeams, @placement)
ELSE
	PRINT 'Nu s-a putut adauga din cauza datelor invalide';
END;


ALTER PROCEDURE uspAddGame(@team1Name VARCHAR(20), @foundationDate1 DATE, @noTrophies1 INT, @manager1 VARCHAR(30),
@team2Name VARCHAR(20), @foundationDate2 DATE, @noTrophies2 INT, @manager2 VARCHAR(30), @arenaName VARCHAR(20),
@maxAmountPeople INT, @maxAmountTeams INT, @placement VARCHAR(50), @gameTime DATETIME)
AS
BEGIN
EXEC dbo.uspAddTeam @team1Name, @foundationDate1, @noTrophies1, @manager1;
EXEC dbo.uspAddTeam @team2Name, @foundationDate2, @noTrophies2, @manager2;
DECLARE @idTeam1 AS INT;
SELECT @idTeam1 = idTeam from TEAMS WHERE teamName = @team1Name;
DECLARE @idTeam2 AS INT;
SELECT @idTeam2 = idTeam from TEAMS WHERE teamName = @team2Name;
EXEC dbo.uspAddArena @arenaName, @maxAmountPeople, @maxAmountTeams, @placement;
DECLARE @idArena AS INT;
SELECT @idArena = idArena FROM ARENAS WHERE arenaName = @arenaName;
INSERT INTO GAMES(arenaID, team1ID, team2ID, gameTime) VALUES
(@idArena, @idTeam1, @idTeam2, @gameTime);
END;


EXEC dbo.uspAddGame 'Echipa1', '01-04-2009', 13, 'alex', 'Echipa2', '03-05-2011', 14, 'andrei', 'Amsterdammm', 150000, 8, 'behind the main one', '2020-09-11T17:00:00';

--Creare view
GO;
CREATE VIEW vw_jucatori AS
SELECT T.teamName AS echipa, P.forename, P.surname, P.ingameName
FROM PLAYERS AS P
INNER JOIN TEAMS AS T
ON P.teamID = T.idTeam;

SELECT * from vw_jucatori;

--Creare triggere

CREATE TRIGGER [dbo].[inserare_jucator]
ON [dbo].[PLAYERS]
FOR INSERT 
AS
BEGIN
PRINT 'Tipul operatiei : INSERT';
PRINT 'Realizata la data : ';PRINT GETDATE();
PRINT 'In tabela PLAYERS';
END;


CREATE TRIGGER [dbo].[stergere_jucator]
ON [dbo].[PLAYERS]
FOR DELETE 
AS
BEGIN
PRINT 'Tipul operatiei : DELETE	';
PRINT 'Realizata la data : ';PRINT GETDATE();
PRINT 'In tabela PLAYERS';
END;

--Declansare triggere
INSERT INTO PLAYERS(forename, surname, ingameName, birthDate, joinDate, rating, teamID)
VALUES('Andreas' , 'Bombi', 'Xypex', '1997-02-19', '2020-11-17', 9.4, 1);

DELETE FROM PLAYERS
WHERE ingameName = 'Xypex';

--Curatare : 

--Stergem tabelele create
--DROP TABLE GAMES;
--DROP TABLE ARENAS;
--DROP TABLE PLAYERS;
--DROP TABLE TEAMS;
--DROP TABLE SPONSORS;
--DROP TABLE ORGANISERS;

--Ne mutam pe baza de date master pentru a putea sterge baza de date creata
--USE master;

--Stergem baza de date creata
--DROP DATABASE LAB1;


