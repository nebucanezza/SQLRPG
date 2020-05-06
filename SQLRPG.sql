USE Master;
CREATE DATABASE SQLRPG;
GO
USE SQLRPG;
GO
--Erstellen der benötigten Schemas
CREATE SCHEMA Characters;
GO
CREATE SCHEMA [Geography]
GO
CREATE SCHEMA Quests;
GO
CREATE SCHEMA Items;
GO
CREATE SCHEMA [Admin];
GO
CREATE TABLE [Admin].Charaktere (Namen VARCHAR(50) CONSTRAINT PK_Namen PRIMARY KEY);
CREATE TABLE [Admin].Cities (Namen VARCHAR(50) CONSTRAINT PK_Staedtenamen PRIMARY KEY );
--Erstellen der benötigten Tabellen
CREATE TABLE Characters.Spieler(	SpielerID	INT	IDENTITY (1000,10),
									[Name]		VARCHAR(50) NOT NULL,
									RollenBez	VARCHAR(50) NOT NULL,
									OrtName		VARCHAR(50) NOT NULL,
									Kontostand	INT			NOT NULL CONSTRAINT DF_Kontostand_Spieler DEFAULT 25000,
									Energie		TINYINT		NOT NULL CONSTRAINT DF_Energie_Spieler DEFAULT 100,
									CONSTRAINT PK_SpielerID PRIMARY KEY (SpielerId),
									CONSTRAINT CK_Energie_Spieler CHECK (Energie >=0));

CREATE TABLE Characters.NPC(		NPCID		INT	IDENTITY (10000,10),
									[Name]		VARCHAR(50) NOT NULL,
									OrtName		VARCHAR(50) NOT NULL,
									RollenBez	VARCHAR(50) NOT NULL,
									Kontostand	INT NOT NULL CONSTRAINT DF_Kontostand_NPC DEFAULT 10000,
									CONSTRAINT	PK_NPCID PRIMARY KEY (NPCID));

CREATE TABLE Characters.Rolle(		Bezeichnung VARCHAR(50),
									Schwaechen	CHAR(10),
									Staerken	CHAR(10),
									CONSTRAINT PK_Rolle PRIMARY KEY (Bezeichnung));

CREATE Table [Geography].Orte(		[Name] VARCHAR(50) CONSTRAINT PK_Orte PRIMARY KEY);

CREATE TABLE Quests.Quests(			QuestID			INT	IDENTITY (100000,10) CONSTRAINT PK_QuestID PRIMARY KEY,
									[Name]			VARCHAR(50) NOT NULL,
									Belohnung		INT NOT NULL CONSTRAINT DF_Belohnung DEFAULT 100,
									SpielerID		INT,
									NPCID			INT,
									Beschreibung	VARCHAR(MAX) NOT NULL);

CREATE TABLE Items.Gegenstände(		GegenstandID	INT	IDENTITY (1000000, 10) CONSTRAINT PK_Gegenstand PRIMARY KEY,
									Preis			INT NOT NULL CONSTRAINT CK_Preis_Gegenstand CHECK (Preis >0),
									Beschreibung	VARCHAR(MAX) NOT NULL,
									SpielerID		INT,
									NPCID			INT);

GO
--Procedure erstellen zum Erstellen von Orten
CREATE OR ALTER PROCEDURE [Admin].sp_create_places @Anzahl INT
AS
BEGIN
	DECLARE @z INT = 0;
	WHILE @z <= @Anzahl
	BEGIN
		INSERT INTO [Geography].Orte ([Name]) VALUES ( (SELECT TOP 1 Namen FROM Admin.Cities ORDER BY NEWID()) );
		SET @z +=1;
	END --Ende While-Schleife
END
GO

--Insert für die Namen
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Adrastea');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Bailyndria');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Cailana');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Daflynthe');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Eawyn');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Faialy');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Galadriel');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Hagzussa');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Ilandrina');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Jadylyn');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Kalinde');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Ladeya');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Magari');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Nariana');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Odelina');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Penulata');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Qualina');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Rathneya');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Sandria');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Tamyr');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Utalia');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Valrineya');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Walfira');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Xelane');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Yadira');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Zelda');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Aaron');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Baldaniel');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Colinax');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Dalarion');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Elgatos');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Falamir');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Gardorath');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Halwadar');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Idian');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Jarduk');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Katlaron');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Lenco');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Mikuyo');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Naelz');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Omantek');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Palatinus');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Qualadras');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Remus');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Sandron');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Thaolon');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Umaniel');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Vaaston');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Waslirus');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Xantier');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Yladrim');
INSERT INTO [Admin].Charaktere (Namen) VALUES ('Zabrim');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Alysia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Belania');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Cailean');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Darween');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Edana');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Feelinthe');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Grelie');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Humlaida');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Ires');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Jaglynia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Kathleya');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Laria');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Melinda');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Narisa');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Ofelia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Perlandya');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Quelandria');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Raylanja');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Sasori');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Tanalie');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Uthelia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Valrysia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Welina');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Xelinde');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Yaleera');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Zentaria');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Aerogon');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Beltanras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Colmantras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Dargoth');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Elross');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Fanras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Golatas');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Hagazzar');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Ilindar');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Jeactcil');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Karak');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Liron');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Mirano');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Namus');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Owalyn');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Paradus');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Quelthras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Riloru');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Silatyr');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Theoclymenus');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Usinqui');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Vayu');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Wulthos');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Xaramas');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Yldur');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Zaldroc');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Amonia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Belfi');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Calibria');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Deldrina');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Elinnya');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Fenira');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Gwala');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Hyazintha');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Isaldrina');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Jewelanam');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Keira');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Lavinaia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Melithraya');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Nelthaki');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Olefinja');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Psilania');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Queltra');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Risha');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Shalaina');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Tarila');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Uva');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Verdania');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Wilnari');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Xiantia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Yldrania');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Zhyla');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Alkatar');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Baratas');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Culentriel');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Darian');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Emalik');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Fenrath');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Golradir');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Heluminthas');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Iltras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Jefarius');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Kelthor');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Llonu');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Mordrag');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Naramtras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Owalquien');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Pertonas');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Quoludrias');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Rituniel');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Sordan');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Theutras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Uthilos');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Viridan');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Wulhynor');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Xavier');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Yslardu');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Zoltaron');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Andira');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Belynia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Cassandra');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Demulina');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Elysia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Feslie');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Gyala');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Hylasia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Isidore');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Jowilana');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Kyeira');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Liridona');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Mflia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Nilanja');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Oughlyn');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Prulina');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Quie');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Ruflina');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Sihias');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Tarsia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Uvarya');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Viridana');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Winifre');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Xisira');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Younha');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Zyfleia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Alron');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Beliar');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Cxirdur');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Dragoner');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Emiras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Funriel');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Grachlaron');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Hundarim');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Iridan');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Jufton');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Krandras');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Lomion');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Myron');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Nefarius');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Ozaba');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Phylo');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Quylur');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Romen');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Sovrin');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Teromaso');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Uzzagar');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Vynzghan');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Wyrn');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Xylaniel');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Yrdatuk');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Zyrano');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Anis');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Ceitlynn');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Durineya');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Eplyrata');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Fia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Istaria');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Lithil');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Siranya');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Titania');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Swana');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Arilia');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Craina');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Aria');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Cytiene');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Avon');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Bryden');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Dryden');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Dungur');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Dymar');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Anaru');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Berucas');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Dranek');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Extron');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Furoriel');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Iwerdas');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Portonas');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Rytoran');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Tiuri');
INSERT INTO [Admin].Charaktere (Namen) VALUES (' Tieth');

--Städte einfügen
INSERT INTO [Admin].Cities (Namen) VALUES ('Izimont');
INSERT INTO [Admin].Cities (Namen) VALUES ('Yhaaham');
INSERT INTO [Admin].Cities (Namen) VALUES ('Phedale');
INSERT INTO [Admin].Cities (Namen) VALUES ('Klakstead');
INSERT INTO [Admin].Cities (Namen) VALUES ('Wrogow');
INSERT INTO [Admin].Cities (Namen) VALUES ('Trence');
INSERT INTO [Admin].Cities (Namen) VALUES ('Lark');
INSERT INTO [Admin].Cities (Namen) VALUES ('Uchard');
INSERT INTO [Admin].Cities (Namen) VALUES ('Isonsey');
INSERT INTO [Admin].Cities (Namen) VALUES ('Ancetin');
INSERT INTO [Admin].Cities (Namen) VALUES ('Yreeling');
INSERT INTO [Admin].Cities (Namen) VALUES ('Meamery');
INSERT INTO [Admin].Cities (Namen) VALUES ('Laephia');
INSERT INTO [Admin].Cities (Namen) VALUES ('Jandiff');
INSERT INTO [Admin].Cities (Namen) VALUES ('Plusmouth');
INSERT INTO [Admin].Cities (Namen) VALUES ('Khirie');
INSERT INTO [Admin].Cities (Namen) VALUES ('Dradena');
INSERT INTO [Admin].Cities (Namen) VALUES ('Xadena');
INSERT INTO [Admin].Cities (Namen) VALUES ('Eimdiff');
INSERT INTO [Admin].Cities (Namen) VALUES ('Anburora');
INSERT INTO [Admin].Cities (Namen) VALUES ('Heving');
INSERT INTO [Admin].Cities (Namen) VALUES ('Hudridge');
INSERT INTO [Admin].Cities (Namen) VALUES ('Qeucgas');
INSERT INTO [Admin].Cities (Namen) VALUES ('Fuhcaster');
INSERT INTO [Admin].Cities (Namen) VALUES ('Prepus');
INSERT INTO [Admin].Cities (Namen) VALUES ('Fodon');
INSERT INTO [Admin].Cities (Namen) VALUES ('Hing');
INSERT INTO [Admin].Cities (Namen) VALUES ('Klork');
INSERT INTO [Admin].Cities (Namen) VALUES ('Oitlas');
INSERT INTO [Admin].Cities (Namen) VALUES ('Aresdence');
INSERT INTO [Admin].Cities (Namen) VALUES ('Ehaernard');
INSERT INTO [Admin].Cities (Namen) VALUES ('Fiystin');
INSERT INTO [Admin].Cities (Namen) VALUES ('Ibuasall');
INSERT INTO [Admin].Cities (Namen) VALUES ('Traasphia');
INSERT INTO [Admin].Cities (Namen) VALUES ('Khicset');
INSERT INTO [Admin].Cities (Namen) VALUES ('Klord');
INSERT INTO [Admin].Cities (Namen) VALUES ('Iveah');
INSERT INTO [Admin].Cities (Namen) VALUES ('Sand');
INSERT INTO [Admin].Cities (Namen) VALUES ('Isonbert');
INSERT INTO [Admin].Cities (Namen) VALUES ('Akading');

EXEC Admin.sp_create_places 15;


