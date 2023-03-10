	-- ---------------------------------------------
	-- Utworzenie bazy
	-- ---------------------------------------------
	USE master
	GO

	IF DB_ID('Wypozyczalnia') IS NULL
	CREATE DATABASE Wypozyczalnia
	GO

	USE Wypozyczalnia

	-- ------------------------------------------------------
	-- Usuwanie tabel 
	-- ------------------------------------------------------
	IF OBJECT_ID('Wypozyczone','U') IS NOT NULL
	DROP TABLE Wypozyczone

	IF OBJECT_ID('Klienci','U') IS NOT NULL
	DROP TABLE Klienci

	IF OBJECT_ID('Pojazdy','U') IS NOT NULL
	DROP TABLE Pojazdy

	IF OBJECT_ID('Pracownicy','U') IS NOT NULL
	DROP TABLE Pracownicy

	IF OBJECT_ID('Placowki','U') IS NOT NULL
	DROP TABLE Placowki
	GO

	-- --------------------------------
	-- Tworzenie tabel, relacje
	-- --------------------------------


	IF OBJECT_ID('Klienci','U') IS NULL
	CREATE TABLE Klienci (
	ID INT NOT NULL PRIMARY KEY,
	Imie VARCHAR(50) NOT NULL,
	Nazwisko VARCHAR(50) NOT NULL,  
	Pesel BIGINT NOT NULL, 
	Nr_tel BIGINT NOT NULL,
	)

	IF OBJECT_ID('Placowki','U') IS NULL
	CREATE TABLE Placowki (
	Miasto VARCHAR(50) NOT NULL PRIMARY KEY,
	Adres VARCHAR(50) NOT NULL,  
	Zalozenie DATE NOT NULL,
	)

	IF OBJECT_ID('Pojazdy','U') IS NULL
	CREATE TABLE Pojazdy (
	ID INT NOT NULL PRIMARY KEY,
	Marka VARCHAR(50) NOT NULL,
	Model VARCHAR(50) NOT NULL, 
	Rocznik INT NOT NULL,
	Placowka VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Placowki(Miasto),
	)

	IF OBJECT_ID('Pracownicy','U') IS NULL
	CREATE TABLE Pracownicy (
	ID INT NOT NULL PRIMARY KEY,
	Imie VARCHAR(50) NOT NULL,
	Nazwisko VARCHAR(50) NOT NULL,  
	Placowka VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Placowki(Miasto),
	Data_zatrudnienia DATE NOT NULL,
	)

	IF OBJECT_ID('Wypozyczone','U') IS NULL
	CREATE TABLE Wypozyczone (
	Pojazd_id INT NOT NULL,	
	Daty_wyd DATE NOT NULL,
	Daty_zwr DATE NOT NULL,
	Klient_id INT NOT NULL FOREIGN KEY REFERENCES Klienci(ID), 
	Pracownik_id INT NOT NULL FOREIGN KEY REFERENCES Pracownicy(ID), 
	Placowka VARCHAR(50), 
	)

	-- ---------------------------------
	-- Wstawianie warto??ci do tabel
	-- ---------------------------------


	INSERT INTO Klienci (ID, Imie, Nazwisko, Pesel, Nr_tel) 
	VALUES 
	(001, 'Jaros??aw', 'Kami??ski', 81100245331, 590847997),
	(002, 'Albert', 'G??rski', 71120744819, 027346065),
	(003, 'Eryk', 'Lewandowski', 82010843947, 700084769),
	(004, 'Maja', 'Sikorska', 76101575831, 717413396),
	(005, 'Aleksandra', 'Marciniak', 91041583119, 462240251),
	(006, 'Ernest', 'Barciak', 68033091565, 887681321),
	(007, 'Allan', 'Koz??owski', 84043043679, 775729999),
	(008, 'Blanka', 'Szczepaniak', 97021878327, 339793231),
	(009, 'Marian', 'Borkowski', 76091899364, 199511819),
	(010, 'Amanda', 'Lis', 87123096976, 691435998),
	(011, 'Dorota', 'St??pie??', 79101267373, 774812790),
	(012, 'Emanuel', 'B??k', 97071152734, 155390979),
	(013, 'Jan', 'Zi????kowski', 78080752775, 960183356),
	(014, 'Lidia', 'G??rska', 89030639176, 697074219),
	(015, 'Dominik', 'Czarnecki', 90062468221, 415158553),
	(016, 'Zuza', 'Kami??ska', 75092491964, 660035628);


	INSERT INTO Placowki (Miasto, Adres, Zalozenie) 
	VALUES 
	('Pozna??', 'Nowogrodzka 16', '2016-06-12'),
	('Wroc??aw', 'D??uga 3', '2018-03-20'),
	('Gda??sk', 'Portowa 35', '2019-05-10');


	INSERT INTO Pojazdy (ID, Marka, Model, Rocznik, Placowka) 
	VALUES 
	(1, 'Toyota', 'Aygo', 2016, 'Pozna??'),
	(2, 'Toyota', 'Aygo', 2017, 'Wroc??aw'),
	(3, 'Ford', 'Fiesta', 2019, 'Pozna??'),
	(4, 'Ford', 'Focus', 2016, 'Gda??sk'),
	(5, 'Volkswagen', 'Golf', 2016, 'Pozna??'),
	(6, 'Nissan', 'Note', 2017, 'Wroc??aw'),
	(7, 'Nissan', 'Micra', 2020, 'Gda??sk'),
	(8, 'Nissan', 'Micra', 2020, 'Wroc??aw'),
	(9, 'Fiat', '500', 2019, 'Pozna??'),
	(10, 'Fiat', '500', 2020, 'Pozna??'),
	(11, 'Skoda', 'Citigo', 2018, 'Gda??sk'),
	(12, 'Renault', 'Twingo', 2019, 'Pozna??'),
	(13, 'Renault', 'Twingo', 2019, 'Wroc??aw'),
	(14, 'Audi', 'A1', 2020, 'Pozna??'),
	(15, 'Audi', 'A3', 2018, 'Gda??sk'),
	(16, 'Audi', 'A3', 2018, 'Wroc??aw'),
	(17, 'Kia', 'Picanto', 2019, 'Gda??sk'),
	(18, 'Kia', 'Picanto', 2019, 'Wroc??aw' ),
	(19, 'Opel', 'Corsa', 2020, 'Pozna??'),
	(20, 'Opel', 'Corsa', 2020, 'Wroc??aw');


	INSERT INTO  Pracownicy (ID, Imie, Nazwisko, Placowka, Data_zatrudnienia) 
	VALUES 
	(01, 'Aleksander', 'Wo??niak', 'Pozna??', '2016-06-12'),
	(02, 'Daniel', 'Kami??ski', 'Pozna??', '2016-11-20'),
	(03, 'Anna', 'Ostrowska', 'Pozna??', '2017-03-17'),
	(04, 'Olaf', 'Szczepaniak', 'Wroc??aw', '2018-03-20'),
	(05, 'Dawid', 'Kowalczyk', 'Wroc??aw', '2018-07-05'),
	(06, 'Grzegorz', 'Rutkowski', 'Gda??sk', '2019-05-10'),
	(07, '??ukasz', 'Soko??owski', 'Gda??sk', '2019-10-23');


	INSERT INTO Wypozyczone (Pojazd_id, Daty_wyd, Daty_zwr, Klient_id, Pracownik_id, Placowka) 
	VALUES 
	(2, '2020-03-20', '2020-03-22', 013, 04, 'Wroc??aw'),
	(5, '2020-03-23', '2020-03-27', 002, 01, 'Pozna??'),
	(11, '2020-03-29', '2020-03-30', 005, 06, 'Gda??sk'),
	(7, '2020-04-04', '2020-04-09', 016, 06, 'Gda??sk'),
	(20, '2020-04-09', '2020-04-14', 010, 05, 'Wroc??aw'),
	(13, '2020-04-14', '2020-04-16', 014, 04, 'Wroc??aw'),
	(3, '2020-04-20', '2020-04-25', 009, 02, 'Pozna??'),
	(10, '2020-04-23', '2020-04-29', 001, 03, 'Pozna??'),
	(17, '2020-04-24', '2020-05-03', 008, 07, 'Gda??sk'),
	(19, '2020-05-01', '2020-05-06', 002, 03, 'Pozna??'),
	(4, '2020-05-01', '2020-05-05', 016, 07, 'Gda??sk'),
	(20, '2020-05-04', '2020-05-12', 007, 04, 'Wroc??aw'),
	(12, '2020-05-06', '2020-05-10', 015, 01, 'Pozna??'),
	(20, '2020-05-06', '2020-05-13', 010, 05, 'Wroc??aw'),
	(19, '2020-05-07', '2020-05-15', 002, 02, 'Pozna??');

	-- ---------------------------------
	-- Usuwanie i tworzenie widok??w
	-- ---------------------------------

	IF OBJECT_ID('KLIENT','V') IS NOT NULL
	DROP VIEW KLIENT
	GO

	CREATE VIEW KLIENT AS (
	SELECT m.Klient_id AS Klient_ID,
		COUNT(m.Klient_id) AS Ilosc
		FROM Wypozyczone AS m
		JOIN Klienci AS k ON m.Klient_id = k.ID
		GROUP BY m.Klient_id

	)
	GO

	IF OBJECT_ID('PLACOWKA','V') IS NOT NULL
	DROP VIEW PLACOWKA
	GO

	CREATE VIEW PLACOWKA AS (
	SELECT TOP 1 m.Placowka,
		COUNT(m.Placowka) AS Ilosc
		FROM Wypozyczone AS m
		GROUP BY m.Placowka
		ORDER BY Ilosc DESC
			
	)
	GO

	IF OBJECT_ID('DNI','V') IS NOT NULL
	DROP VIEW DNI
	GO

	CREATE VIEW DNI AS (
	SELECT Daty_wyd, Daty_zwr,
		DATEDIFF(day, Daty_wyd, Daty_zwr) AS Ilosc_Dni,
		Placowka
		FROM Wypozyczone 
		

	)
	GO



	-- ---------------------------------
	-- Tworzenie procedur
	-- ---------------------------------
	IF OBJECT_ID('MIESIAC','P') IS NOT NULL
	DROP PROCEDURE MIESIAC
	GO

	CREATE PROCEDURE MIESIAC ( 
	@Miesiac INT
	) AS (
	SELECT @Miesiac AS Miesiac, count(Daty_wyd) AS Ilosc_wypozyczen FROM Wypozyczone WHERE @Miesiac = MONTH(Daty_wyd)
	)
	GO

	IF OBJECT_ID('PRACOWNIK','P') IS NOT NULL
	DROP PROCEDURE PRACOWNIK
	GO

	CREATE PROCEDURE PRACOWNIK ( 
	@Pracownik INT
	) AS (
	SELECT @Pracownik AS Pracownik, count(Pracownik_id) AS Ilosc_wydan FROM Wypozyczone WHERE @Pracownik = Pracownik_id
	)
	GO

	-- ---------------------------------------------
	-- Utworzenie raport??w 
	-- ---------------------------------------------

	PRINT 'Klienci i ich ilo???? wypo??ycze??'
	SELECT * FROM KLIENT

	PRINT 'Plac??wka z najwi??ksz?? ilo??ci?? wypo??ycze??'
	SELECT * FROM PLACOWKA

	PRINT 'Czas trwania wypo??yczenia'
	SELECT * FROM DNI

	PRINT 'Ilo???? wypo??ycze?? w danym miesi??cu(Miesi??c: 3)' 
	EXEC MIESIAC '3';

	PRINT 'Ilo???? wydanych aut przez danego pracownika(Pracownik: 04)'
	EXEC PRACOWNIK 04;


	-- ---------------------------------------------
	-- Usuni??cie bazy
	-- ---------------------------------------------
	USE master
	GO

	IF DB_ID('Wypozyczalnia') IS NOT NULL
	DROP DATABASE Wypozyczalnia
	GO
