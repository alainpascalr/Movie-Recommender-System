SET search_path = "What2Watch"

/*
Creating all the needed tables for the tables.
*/ 
CREATE TABLE Users(
	UserID serial, 
	Password VARCHAR(20),
	FirstName VARCHAR(20),
	LastName VARCHAR(20),
	Email VARCHAR(30) UNIQUE,
	City VARCHAR(20),
	Province VARCHAR(20),
	Country VARCHAR(20),
	PRIMARY KEY (UserID) 
 
);





CREATE TABLE Profile(
	UserID INTEGER,
	AgeRange VARCHAR(10),
	YearBorn INTEGER,
	gender VARCHAR(1) CHECK (gender = 'M' OR gender = 'F'),
	PRIMARY KEY (UserID),
	FOREIGN KEY (UserID) REFERENCES Users
						 ON DELETE CASCADE
						 ON UPDATE CASCADE	
);

CREATE TABLE Topics (
	TopicID serial,
	Description VARCHAR(20), 
	PRIMARY KEY (TopicID)
);

CREATE TABLE Movie (
	MovieID serial,
	Name VARCHAR(40),
	DateReleased DATE,
	Language VARCHAR(20),
	Subtitles VARCHAR(1),
	Country VARCHAR(20),
	PRIMARY KEY (MovieID)

); 

CREATE TABLE Watches (
	UserID INTEGER,
	MovieID INTEGER,
	DateWatched DATE,
	Rating INTEGER CHECK (Rating >= 1 AND Rating <= 10),
	PRIMARY KEY (UserID, MovieID, DateWatched),
	FOREIGN KEY (UserID) REFERENCES Users
						 ON DELETE CASCADE
						 ON UPDATE CASCADE,
	FOREIGN KEY (MovieID) REFERENCES Movie
						  ON DELETE CASCADE
						  ON UPDATE CASCADE					 
); 

CREATE TABLE MovieTopics (
	TopicID INTEGER,
	MovieID INTEGER,
	PRIMARY KEY (TopicID,MovieID),
	FOREIGN KEY (TopicID) REFERENCES Topics 
						 ON DELETE CASCADE
						 ON UPDATE CASCADE,
	FOREIGN KEY (MovieID) REFERENCES Movie
						 ON DELETE CASCADE
						 ON UPDATE CASCADE
); 

CREATE TABLE Actor (
	ActorID serial,
	LastName VARCHAR(20),
	FirstName VARCHAR(20),
	DateofBirth VARCHAR(20),
	PRIMARY KEY (ActorID)
);

CREATE TABLE Role (
	RoleID serial,
	Name VARCHAR(20),
	ActorID INTEGER,
	PRIMARY KEY (RoleID),
	FOREIGN KEY (ActorID) REFERENCES Actor
						 ON DELETE CASCADE
						 ON UPDATE CASCADE
);


CREATE TABLE ActorPlays (
	MovieID INTEGER,
	ActorID INTEGER,
	PRIMARY KEY (MovieID,ActorID),
	FOREIGN KEY (MovieID) REFERENCES Movie
						 ON DELETE CASCADE
						 ON UPDATE CASCADE,
	FOREIGN KEY (ActorID) REFERENCES Actor
						 ON DELETE CASCADE
						 ON UPDATE CASCADE
);

CREATE TABLE Director (
	DirectorID serial,
	LastName VARCHAR(20),
	FirstName VARCHAR(20),
	Country VARCHAR(20),
	PRIMARY KEY (DirectorID)
);

CREATE TABLE Directs (
	DirectorID INTEGER,
	MovieID INTEGER,
	PRIMARY KEY (DirectorID, MovieID),
	FOREIGN KEY (DirectorID) REFERENCES Director
						 ON DELETE CASCADE
						 ON UPDATE CASCADE,
	FOREIGN KEY (MovieID) REFERENCES Movie
						 ON DELETE CASCADE
						 ON UPDATE CASCADE
);

CREATE TABLE Studio (
	StudioID serial,
	Name VARCHAR(50),
	Country VARCHAR(20),
	PRIMARY KEY (StudioID)
);

CREATE TABLE Sponsors (
	StudioID INTEGER,
	MovieID INTEGER,
	PRIMARY KEY (StudioID,MovieID),
	FOREIGN KEY (StudioID) REFERENCES Studio
						 ON DELETE CASCADE
						 ON UPDATE CASCADE,
	FOREIGN KEY (MovieID) REFERENCES Movie
						 ON DELETE CASCADE
						 ON UPDATE CASCADE
);

-- All these tables have been created


-- Insert Data into the tables

INSERT INTO Users (UserID, Password, FirstName, LastName, Email, City, Province, Country)
VALUES 
('1', 'houssam123', 'Houssam', 'Bedja', 'houssam.b@hotmail.com', 'Ottawa', 'Ontario', 'Canada'),
('2', 'hamid123', 'Hamid', 'Habib', 'hamidhabib001@gmail.com', 'Ottawa', 'Ontario', 'Canada'),
('3', 'pascal123', 'Alain Pascal', 'Romela', 'arome074@uottawa.ca', 'Ottawa', 'Ontario', 'Canada'),
('4', 'oussama123', 'Oussama', 'Rahmi', 'oussr001@uottawa.ca', 'Ottawa', 'Ontario', 'Canada'),
('5', 'younes123', 'Younes', 'Miftah Idriss', 'younesm@gmail.com', 'Ottawa', 'Ontario', 'Canada'),
('6', 'tia123', 'Tia', 'Tom Erdimi', 'tiatom@gmail.com', 'Ottawa', 'Ontario', 'Canada'),
('7', 'cristiano123' , 'Cristiano' , 'Ronaldo', 'imthebest@gmail.com', 'Madrid', 'Madrid', 'Spain'),
('8', 'soumaya123', 'Soumaya', 'Benali', 'sousoub@gmail.com', 'Ottawa', 'Ontario', 'Canada'),
('9', 'houda123', 'Houda', 'Halwani', 'hhalw009@uottawa.ca', 'Barrie', 'Ontario', 'Canada'),
('10', 'Shadman123', 'Shadman', 'Rashid', 'shadman001@uottawa.ca', 'Ottawa', 'Ontario', 'Canada'),
('11', 'lionel123', 'Lionel', 'Messi', 'leomessi@gmail.com', 'Barcelona', 'Catalonia', 'Spain'),
('12', 'Jessie123', 'Jessie', 'Castro', 'jessie024@uottawa.ca', 'Montreal', 'Quebec', 'Canada'),
('13', 'sherley123', 'Sherley', 'Ann', 'sherleyann@gmail.com', 'New York', 'New York', 'USA'),
('14', 'zein123', 'Zein', 'Ahmed', 'zahme082@uottawa.ca', 'Ottawa', 'Ontario', 'Canada'),
('15', 'diego123', 'Diego', 'Costa', 'diegocosta@gmail.com', 'London', 'London', 'England'),
('16', 'Afi123', 'Afi', 'Ahmed', 'afiahmed@gmail.com', 'Ottawa', 'Ontario', 'Canada'),
('17', 'Amine123', 'Amine', 'Miftah', 'amift002@uottawa.ca', 'Ottawa', 'Ontario', 'Canada'),
('18', 'sarah123', 'Sarah', 'Zankar', 'sarah007@uottawa.ca', 'Barrie', 'Ontario', 'Canada'),
('19', 'paul123', 'Paul', 'Pogba', 'paulpogba@hotmail.com', 'Turin', 'Piedmont', 'Italy'),
('20', 'joseph123', 'Joseph', 'Mauvais', 'jojo@gmail.com', 'Lauderhill', 'California', 'USA');




INSERT INTO Profile (UserID, AgeRange, YearBorn, gender)
VALUES
('1', '20s', '1994', 'M'),
('2', '40s', '1976', 'M'),
('3', '10s', '1998', 'M'),
('4', '30s', '1983', 'M'),
('5', '20s', '1994', 'M'),
('6', '20s', '1994', 'F'),
('7', '30s', '1985', 'M'),
('8', '10s', '1996', 'F'),
('9', '20s', '1995', 'F'),
('10', '20s', '1993', 'M'),
('11', '30s', '1986', 'M'),
('12', '20s', '1992', 'F'),
('13', '30s', '1984', 'F'),
('14', '20s', '1995', 'F'),
('15', '30s', '1986', 'M'),
('16', '10s', '1997', 'M'),
('17', '20s', '1993', 'M'),
('18', '20s', '1996', 'F'),
('19', '20s', '1991', 'M'),
('20', '40s', '1975', 'M');



INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('1','Batman V Superman: Dawn of Justice','2016-03-25','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('2','Deadpool','2016-02-10','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('3','London has fallen','2016-03-03','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('4','The Notebook','2004-06-25','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('5','Brooklyn','2015-11-06','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('6','The Dark Knight','2008-07-24','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('7','The Dark Knight Rises','2012-07-20','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('8','The Intouchables','2012-09-21','French','Y','France');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('9','The Conjuring','2013-08-02','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('10','Think Like A Man','2012-06-22','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('11','Kill Bill: vol. 1','2013-10-17','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('12','Hitman: Agent47','2015-08-27','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('13','Titanic','1998-01-23','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('14','Mission Impossible: Rogue Nation','2015-07-30','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('15','Alvin and the chipmunks','2007-12-21','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('16','Piranha','2010-08-20','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('17','The Perfect Guy','2015-11-12','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('18','Captain America: Civil War','2016-04-29','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('19','Easy A','2010-10-22','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('20','Transformers: Extinction','2014-07-05','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('21','Gladiator','2000-05-20','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('22','Creed','2016-01-15','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('23','The Revenant','2016-01-15','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('24','The amazing spiderman','2012-07-03','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('25','Sicario','2015-10-08','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('26','Inception','2010-07-16','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('27','The Godfather','2972-08-24','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('28','The matrix','1999-06-11','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('29','Instastellar','2014-11-07','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('30','Terminator 2: Judgment Day','1991-08-16','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('31','Taxi','2015-08-20','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('32','The Prestige','2006-11-10','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('33','The Lion King','1994-10-07','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('34','Toy Story 3','2010-07-19','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('35','The passion','2016-03-16','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('36','Fury ','2014-10-22','English','N','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('37','Now More Than Ever: The History Of Chicago','2016-02-20','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('38','Zootopia ','2016-03-25','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('39','The third man ','1949-08-31','English','Y','US');
INSERT INTO Movie (MovieID,Name,DateReleased,Language,Subtitles,Country) VALUES ('40','Avatar ','2009-12-17','English','N','US');






INSERT INTO Topics (TopicID,Description) VALUES ('1','Action');
INSERT INTO Topics (TopicID,Description) VALUES ('2','Adventure');
INSERT INTO Topics (TopicID,Description) VALUES ('3','Comedy');
INSERT INTO Topics (TopicID,Description) VALUES ('4','Fantasy');
INSERT INTO Topics (TopicID,Description) VALUES ('5','Action');
INSERT INTO Topics (TopicID,Description) VALUES ('6','Drama');
INSERT INTO Topics (TopicID,Description) VALUES ('7','Romance');
INSERT INTO Topics (TopicID,Description) VALUES ('8','Crime');
INSERT INTO Topics (TopicID,Description) VALUES ('9','Thriller');
INSERT INTO Topics (TopicID,Description) VALUES ('10','Horror');
INSERT INTO Topics (TopicID,Description) VALUES ('11','Animation');
INSERT INTO Topics (TopicID,Description) VALUES ('12','Sci-Fi');
INSERT INTO Topics (TopicID,Description) VALUES ('13','Sport');
INSERT INTO Topics (TopicID,Description) VALUES ('14','Western');
INSERT INTO Topics (TopicID,Description) VALUES ('15','Mystery');
INSERT INTO Topics (TopicID,Description) VALUES ('16','Musical');
INSERT INTO Topics (TopicID,Description) VALUES ('17','War');
INSERT INTO Topics (TopicID,Description) VALUES ('18','Documentary');
INSERT INTO Topics (TopicID,Description) VALUES ('19','History');
INSERT INTO Topics (TopicID,Description) VALUES ('20','Family');
INSERT INTO Topics (TopicID,Description) VALUES ('21','Film-Noir');
INSERT INTO Topics (TopicID,Description) VALUES ('22','Biography');




INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('1','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('1','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('1','4');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('2','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('2','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('2','3');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('3','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('3','8');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('3','9');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('4','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('4','7');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('5','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('5','7');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('6','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('6','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('6','8');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('7','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('7','9');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('8','22');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('8','3');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('8','7');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('9','10');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('10','3');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('10','7');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('11','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('12','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('12','8');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('12','9');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('13','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('13','7');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('14','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('14','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('14','9');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('15','3');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('15','11');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('15','20');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('16','3');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('16','10');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('17','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('17','9');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('18','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('18','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('18','12');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('19','3');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('19','7');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('20','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('20','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('20','12');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('21','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('21','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('22','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('22','13');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('23','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('23','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('23','9');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('23','14');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('24','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('24','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('24','4');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('25','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('25','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('25','8');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('26','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('26','12');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('26','15');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('27','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('27','8');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('28','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('28','12');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('29','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('29','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('29','12');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('30','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('30','12');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('31','3');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('31','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('31','7');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('32','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('32','12');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('32','15');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('33','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('33','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('33','11');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('34','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('34','11');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('34','3');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('35','16');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('36','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('36','6');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('36','17');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('37','18');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('37','19');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('37','22');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('38','20');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('38','11');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('38','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('39','21');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('39','15');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('39','9');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('40','1');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('40','2');
INSERT INTO MovieTopics (MovieID,TopicID) VALUES ('40','4');





INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('1','Ben ','Afflek ','1972-08-15');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('2','Henry ','Cvill','1983-05-05');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('3','Amy ','Adams','1974-08-20');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('4','Jesse','Eisenberg','1983-10-05');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('5','Ryan','Reynolds','1976-10-23');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('6','Karan','Soni','1984-02-23');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('7','Ed','Skrein','1983-03-29');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('8','Michael','Benyaer','1970-05-25');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('9','Stefan','Kapicic','1978-12-01');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('10','Alon','Aboutboul','1965-05-28');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('11','Waleed ','Zuaiter','1970-06-01');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('12','Gerard ','Butler ','1969-11-13');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('13','Tim ','Ivery','1975-03-05');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('14','Gena','Rowlands','1930-06-19');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('15','Ryan','Gosling','1982-11-12');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('16','Saoirse','Ronan ','1994-04-12');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('17','Hugh ','Gormley','1955-09-28');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('18','Maeve','McGrath','1976-01-11');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('19','Christian ','Bale ','1974-01-30');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('20','Heath','Ledger','1979-04-04');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('21','Aaron','Eckhart','1968-03-12');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('22','Marion ','Cotillard','1975-09-30');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('23','Morgan ','Freeman','1937-06-01');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('24','Francois ','Cluzet','1955-09-21');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('25','Omar','Sy','1978-01-20');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('26','Vera','Farmiga','1973-08-06');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('27','Patrick','Wilson','1973-07-03');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('28','Hayley ','McFarland','1991-03-29');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('29','Kevin ','Hart ','1979-07-06');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('30','Michael  ','Ealy','1973-08-03');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('31','Meagan ','Good','1981-08-08');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('32','Uma','Thurman','1970-04-29');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('33','Lucy ','Liu','1968-12-02');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('34','Michael  ','Madsen','1958-09-25');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('35','Dan','Bakkedahl','1969-11-18');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('36','Michaela ','Caspar ','1960-04-06');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('37','Rupert ','Friend','1981-10-01');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('38','Leonardo','DiCaprio','1974-11-11');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('39','Kate','Winslet','1975-10-05');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('40','Billy ','Zane ','1966-02-24');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('41','Tom','Cruise','1962-07-03');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('42','Jeremy ','Renner','1971-01-07');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('43','Sean ','Harris ','1966-04-13');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('44','Jason ','Lee ','1970-04-25');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('45','David ','Cross ','1964-04-04');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('46','Cameron ','Richardson ','1979-09-11');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('47','Richard ','Dreyfuss ','1947-10-29');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('48','Ving ','Rhames ','1959-05-12');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('49','Elisabeth ','Shue ','1963-10-06');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('50','Sanaa ','Lathan ','1971-09-19');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('51','Morris ','Chestnut ','1969-01-01');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('52','Tom ','Holland ','1996-06-01');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('53','Elizabeth ','Olsen ','1989-02-16');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('54','Scarlett ','Johansson ','1984-11-22');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('55','Chris ','Evans ','1981-06-13');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('56','Emma','Stone','1988-11-06');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('57','Penn ','Badgley','1986-11-01');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('58','Amanda ','Bynes','1986-04-03');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('59','Mark ','Wahlberg','1971-05-05');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('60','Stanley','Tucci','1960-11-11');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('61','Nicola ','Peltz','1995-01-09');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('62','Russel ','Crowe ','1964-04-07');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('63','Joaquin ','Phoenix ','1974-10-28');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('64','Connie ','Nielsen ','1965-07-03');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('65','Michael  B.','Jordan ','1987-02-09');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('66','Sylvester ','Stallone ','1946-07-06');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('67','Tessa ','Thompson ','1983-10-03');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('68','Tom ','Hardy ','1977-09-15');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('69','Domhnall ','Gleeson ','1983-05-12');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('70','Andrew ','Garfield ','1983-08-20');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('71','Rhys ','Ifans ','1967-07-22');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('72','Emily ','Blunt ','1983-02-23');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('73','Benicio ','Del Toro ','1967-02-19');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('74','Josh ','Brolin ','1968-02-12');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('75','Joseph ','Gordon-Levitt','1981-02-17');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('76','Ellen  ','Page ','1987-02-21');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('77','Marlon ','Brando ','1924-04-03');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('78','Al ','Pacino ','1940-04-25');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('79','James ','Caan ','1940-03-26');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('80','Keanu ','Beeves ','1964-09-02');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('81','Laurence ','Fishburne ','1961-07-30');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('82','Carrie-Anne ','Moss ','1967-08-21');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('83','Elen ','Burstyn ','1932-12-07');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('84','Matthew','McConaughey ','1969-11-04');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('85','Mackenzie ','Foy ','2000-11-10');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('86','Arnold ','Schwarzenegger','1947-07-30');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('87','Linda ','Hamilton','1956-09-26');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('88','Edward ','Furlong ','1977-08-02');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('89','Rosalie ','Thomass ','1987-08-14');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('90','Peter  ','Dinklage','1969-06-11');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('91','Leonardo ','Arivelo ','1985-04-01');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('92','Hugh ','Jackman ','1968-10-12');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('93','Christian ',' Bale ','1974-01-30');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('94','Micheal ','Cain ','1933-03-14');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('95','Matthew ','Broderick','1962-03-21');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('96','Jonathan ','Taylor Thomas ','1981-09-08');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('97','James Earl ','Jones ','1931-01-17');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('98','Tom ','Hanks ','1956-07-09');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('99','Tim ','Allen ','1953-06-13');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('100','Joan ','Cusack ','1962-10-11');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('101','Jencarlos ','Canela ','1988-04-21');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('102','Tyler ','Perry ','1969-09-14');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('103','Shane ','Harper ','1993-02-14');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('104','Brad ','Pitt ','1963-12-18');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('105','Shia ','LaBeouf','1986-06-11');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('106','Logan ','Lerman ','1992-01-19');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('107','Robert ','Lamm','1944-10-13');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('108','Terry ','Kath ','1946-01-31');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('109','Ginnifer ','Goodwin ','1978-05-22');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('110','Jason ','Bateman','1969-01-14');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('111','Idris','Elba','1972-09-06');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('112','Sam ','Worthington ','1976-08-02');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('113','Zoe ','Saldana ','1978-06-19');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('114','Michelle','Rodriguez','1979-10-08');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('115','Joseph','Coten ','1912-04-29');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('116','Alida ','Valli ','1933-02-10');
INSERT INTO Actor (ActorID,FirstName,LastName,DateofBirth) VALUES ('117','Orson','Howard','1920-09-11');






INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','1','2016-05-01','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','1','2016-02-03','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','2','2016-12-02','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','34','2016-05-11','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','32','2016-03-19','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','33','2016-10-25','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','6','2016-01-06','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','40','2016-02-17','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','21','2016-06-02','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','33','2016-07-19','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','51','2016-09-16','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','22','2016-08-21','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','1','2016-02-19','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','23','2016-12-02','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','22','2016-09-29','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','7','2016-08-20','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','26','2016-05-07','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','7','2016-02-08','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','24','2016-04-28','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','27','2016-12-02','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','11','2016-05-18','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','31','2016-07-17','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','13','2016-04-02','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','26','2016-08-09','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','12','2016-11-23','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','31','2016-06-26','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','8','2016-07-26','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','30','2016-02-25','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','28','2016-03-31','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','31','2016-11-14','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','6','2016-01-16','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','34','2016-06-09','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','10','2016-12-14','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','2','2016-12-06','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','13','2016-07-31','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','17','2016-04-24','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','7','2016-07-13','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','26','2016-08-29','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','18','2016-03-16','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','31','2016-09-20','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','9','2016-05-08','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','17','2016-11-01','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','35','2016-12-09','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','3','2016-02-20','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','6','2016-08-08','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','14','2016-01-25','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','26','2016-08-01','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','16','2016-04-16','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','8','2016-11-23','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','34','2016-10-26','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','16','2016-12-01','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','4','2016-06-19','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','16','2016-11-05','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','40','2016-12-06','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','40','2016-04-12','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','5','2016-07-31','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','11','2016-04-13','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','37','2016-09-14','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','29','2016-07-10','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','39','2016-05-26','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','15','2016-04-22','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','9','2016-04-06','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','24','2016-08-20','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','14','2016-03-31','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','15','2016-11-03','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','30','2016-03-06','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','26','2016-09-09','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('10','13','2016-04-22','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','20','2016-06-08','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','39','2016-08-08','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','34','2016-06-28','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','22','2016-05-16','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','34','2016-04-09','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','31','2016-11-23','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','7','2016-03-18','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','26','2016-01-20','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','25','2016-12-14','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','16','2016-01-07','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','35','2016-09-21','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','30','2016-09-19','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','20','2016-01-11','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','5','2016-11-25','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('10','35','2016-01-11','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','15','2016-09-26','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','20','2016-01-17','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','5','2016-04-11','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','22','2016-02-19','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','13','2016-02-12','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','7','2016-08-29','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','21','2016-07-25','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','9','2016-02-22','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','15','2016-03-15','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','16','2016-01-04','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','40','2016-08-01','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','14','2016-02-17','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','24','2016-08-19','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','37','2016-06-17','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','36','2016-03-28','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','13','2016-06-25','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','17','2016-01-19','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','30','2016-07-29','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','25','2016-04-02','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','40','2016-11-22','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','30','2016-02-27','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','31','2016-07-30','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','5','2016-01-03','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','7','2016-04-23','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','24','2016-03-29','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','15','2016-06-20','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('10','3','2016-07-05','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','32','2016-09-09','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','40','2016-05-17','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','23','2016-07-07','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','38','2016-06-21','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','24','2016-08-24','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','13','2016-11-21','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','12','2016-03-30','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','37','2016-12-09','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','2','2016-06-26','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','16','2016-10-12','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','29','2016-04-04','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','1','2016-07-08','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','10','2016-04-14','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','30','2016-02-07','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','11','2016-04-30','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','14','2016-08-19','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','35','2016-03-02','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','1','2016-06-17','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','2','2016-11-24','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','28','2016-11-06','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','28','2016-03-07','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','29','2016-12-02','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','28','2016-09-10','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','40','2016-08-22','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','19','2016-10-27','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','9','2016-10-29','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','38','2016-03-06','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','30','2016-01-13','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','14','2016-09-20','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','9','2016-05-08','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','6','2016-08-13','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','7','2016-07-21','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','12','2016-04-09','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','7','2016-01-11','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','40','2016-06-29','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','37','2016-12-04','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','20','2016-07-22','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','37','2016-08-05','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','12','2016-07-05','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','6','2016-04-02','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','25','2016-06-20','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','27','2016-06-22','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','7','2016-09-26','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','35','2016-08-26','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','35','2016-09-09','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','10','2016-06-12','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','13','2016-10-17','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','28','2016-09-27','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','4','2016-04-24','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','30','2016-11-25','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','36','2016-02-25','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','38','2016-11-04','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','15','2016-08-03','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','26','2016-09-28','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','39','2016-08-03','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','27','2016-01-08','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','6','2016-10-07','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','2','2016-05-29','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','7','2016-01-03','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','5','2016-09-30','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','13','2016-03-02','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','7','2016-08-09','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','23','2016-03-06','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','39','2016-05-03','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','39','2016-12-07','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','12','2016-06-05','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','35','2016-09-30','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','25','2016-03-04','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','32','2016-04-18','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','33','2016-09-11','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','34','2016-09-25','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','31','2016-06-21','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','7','2016-11-23','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','3','2016-01-09','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','17','2016-04-04','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','33','2016-11-16','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','29','2016-05-06','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','18','2016-01-31','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('10','36','2016-08-08','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','8','2016-08-12','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','33','2015-01-05','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','35','2016-05-30','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','9','2016-05-28','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','38','2015-11-17','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','12','2016-01-17','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','29','2016-04-12','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','2','2016-11-07','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','16','2016-03-13','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','23','2016-08-06','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','10','2016-07-28','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','37','2016-05-26','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','12','2016-06-16','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','34','2016-07-27','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','23','2016-01-16','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('9','24','2016-06-23','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','6','2016-01-04','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','29','2016-05-12','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','20','2015-08-14','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','1','2016-03-09','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','2','2016-11-08','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','7','2015-03-23','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','40','2016-01-21','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','27','2016-09-10','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','5','2016-04-01','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','16','2016-04-05','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','25','2016-10-02','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','17','2015-05-01','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','4','2016-08-17','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','39','2016-09-21','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','21','2016-04-06','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','9','2016-08-03','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','11','2015-11-17','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','14','2016-10-08','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','18','2016-09-13','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','3','2016-11-18','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('16','12','2015-06-23','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','18','2016-02-08','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','19','2016-08-30','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','36','2016-11-05','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','25','2016-06-06','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','15','2016-03-06','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','11','2016-08-14','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','23','2016-12-11','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','24','2016-04-28','7');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','24','2016-03-24','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','21','2016-05-25','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','12','2016-07-02','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','38','2016-04-08','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','14','2016-01-30','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','11','2016-05-13','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','20','2016-11-28','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','23','2015-01-07','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','20','2016-10-11','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','28','2016-05-27','6');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','16','2016-10-06','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','36','2016-04-09','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('14','24','2016-10-16','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','6','2016-03-23','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('20','22','2015-02-11','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','11','2016-04-28','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('10','15','2016-08-01','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('19','34','2016-07-29','4');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('17','14','2016-07-19','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('13','37','2016-04-06','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('7','34','2015-03-30','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('11','16','2016-12-12','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','6','2016-04-02','3');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('1','5','2016-09-08','8');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','30','2016-03-24','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('15','25','2016-10-10','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('18','26','2016-12-05','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('3','27','2016-09-26','2');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('5','33','2016-07-06','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('8','11','2016-09-07','5');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','30','2016-02-13','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('12','10','2016-04-21','10');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('2','39','2016-09-07','9');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('6','33','2016-06-13','1');
INSERT INTO Watches (UserID,MovieID,DateWatched,Rating) VALUES ('4','19','2016-10-09','9');







INSERT INTO Role (RoleID,Name,ActorID) VALUES ('1','Bruce Wayne / Batman','1');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('2','Clark Kent / Superman','2');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('3','Lois','3');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('4','Lex Luthor','4');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('5','Deadpool','5');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('6','Dopinder','6');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('7','Ajax','7');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('8','Warlord','8');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('9','Colossus','9');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('10','Aamir Barkawi','10');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('11','Kamran Barkawi','11');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('12','Mike Banning','12');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('13','Rower','13');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('14','Allie Calhoun','14');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('15','Noah','15');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('16','Eilis','16');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('17','The Priest','17');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('18','Mary','18');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('19','Bruce Wayne / Batman','19');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('20','Joker','20');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('21','Harvey Dent','21');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('22','Miranda','22');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('23','Fox','23');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('24','Philippe','24');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('25','Driss','25');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('26','Larraine Warren','26');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('27','Ed Warren','27');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('28','Nancy','28');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('29','Cedric','29');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('30','Dominic','30');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('31','Mya','31');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('32','The Bribe','32');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('33','O-Ren Ishii','33');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('34','Budd','34');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('35','Sanders','35');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('36','Hall of Records Clerk','36');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('37','Agent 47','37');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('38','Jack Dawson','38');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('39','Rose Dewitt Bukater','39');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('40','Caledon Hockley','40');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('41','Ethan Hunt ','41');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('42','William Brandt','42');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('43','Lane ','43');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('44','Dave','44');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('45','Ian ','45');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('46','Claire ','46');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('47','Matt Boyd ','47');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('48','Deputy Fallon ','48');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('49','Julie Forester ','49');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('50','Leah ','50');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('51','Carter','30');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('52','Carter','51');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('53','Peter Parker ','52');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('54','Wanda Maximoff','53');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('55','Natasha Romanoff ','54');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('56','Steve Rogers ','55');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('57','Olive','56');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('58','Woodchuck Todd','57');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('59','Marianne ','58');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('60','Cade Yeager','59');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('61','Joshua Joyce','60');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('62','Tessa Yeager','61');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('63','Maximus ','62');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('64','Commodus','63');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('65','Lucilla ','64');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('66','Adonis Johnson ','65');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('67','Rocky Balboa','66');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('68','Bianca','67');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('69','Hugh Glass','38');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('70','John Fitzgerald ','68');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('71','Captain Andrew Henry','69');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('72','Spider-Man','70');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('73','Gwen Stacy','56');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('74','The Lizard','71');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('75','Kate Macer ','72');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('76','Alejandro ','73');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('77','Matt Graver ','74');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('78','Cobb','38');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('79','Arthur ','75');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('80','Ariadane ','76');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('81','Don Vito Corleone ','77');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('82','Michael Corleone ','78');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('83','Sonny Corleone ','79');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('84','Neo ','80');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('85','Morpheus ','81');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('86','Trinity ','82');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('87','Murph (older)','83');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('88','Cooper ','84');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('89','Murph (10 yrs)','85');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('90','The Terminator ','86');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('91','Sarah Connor ','87');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('92','John Connor ','88');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('93','Alex Herwig ','89');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('94','Marc ','90');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('95','Iwan','91');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('96','Robert Angier ','92');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('97','Alfred Borden ','93');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('98','Cutter ','94');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('99','Adult Simba ','95');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('100','Young Simba ','96');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('101','Mufasa','97');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('102','Woody ','98');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('103','Buzz Lightyear ','99');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('104','Jessie ','100');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('105','Jesus Christ ','101');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('106','Narrator ','102');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('107','Disciple ','103');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('108','Don Collier','104');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('109','Boyd Swan','105');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('110','Norman Ellison ','106');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('111','Himself','107');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('112','Himself','108');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('113','Judy Hopp','109');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('114','Nick Wild','110');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('115','Chief Bogo ','111');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('116','Jake Sully','112');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('117','Neytiri','113');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('118','Trudy Chacon ','114');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('119','Holly Martins','115');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('120','Anna Schmidt','116');
INSERT INTO Role (RoleID,Name,ActorID) VALUES ('130','Harry Lime','117');





INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('1','Zack','Snyder','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('2','Tim','Miller','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('3','Babak','Najafi','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('4','Nick','Cassavetes','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('5','John','Crowley','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('6','Christopher ','Nolan','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('7','Olivier ','Nakache','France');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('8','James','Wan','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('9','Tim','Story','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('10','Quentin','Tarantino','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('11','Aleksander','Bach','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('12','James','Cameron','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('13','Christopher ','McQuarrie','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('14','Tim','Hill','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('15','Alexandre','Aja','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('16','David ','Rosenthal','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('17','Anthony ','Russo','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('18','Joe ','Russo ','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('19','Will','Gluck','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('20','Michael ','Bay ','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('21','Ridley','Scott','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('22','Ryan ','Coogler','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('23','Alejandro','Gonzalez ','Columbia');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('24','Marc ','Webb','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('25','Denis','Villeneuve','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('26','Christopher ','Nolan ','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('27','Francis ','Coppala ','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('28','Lana ','Wachowski ','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('29','Kerstin','Ahlichs','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('30','Roger ','Allers','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('31','Rob','Minkoff','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('32','Lee','Unkrich','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('33','David ','Grifhorst','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('34','David ','Ayer ','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('35','Peter ','Pardini ','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('36','Byron','Howard','US');
INSERT INTO Director (DIrectorID,FirstName,LastName,Country) VALUES ('37','Carol','Reed','US');


INSERT INTO Directs (DIrectorID,MovieID) VALUES ('1','1');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('2','2');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('3','3');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('4','4');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('5','5');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('6','6');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('6','7');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('7','8');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('8','9');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('9','10');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('10','11');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('11','12');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('12','13');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('13','14');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('14','15');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('15','16');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('16','17');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('17','18');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('18','18');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('19','19');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('20','20');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('21','21');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('22','22');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('23','23');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('24','24');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('25','25');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('26','26');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('27','27');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('28','28');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('6','29');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('12','30');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('29','31');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('6','32');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('30','33');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('31','33');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('32','34');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('33','35');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('34','36');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('35','37');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('36','38');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('37','39');
INSERT INTO Directs (DIrectorID,MovieID) VALUES ('12','40');




INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('1','1');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('2','1');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('3','1');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('4','1');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('5','2');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('6','2');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('7','2');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('8','2');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('9','2');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('10','3');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('11','3');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('12','3');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('13','4');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('14','4');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('15','4');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('16','5');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('17','5');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('18','5');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('19','6');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('20','6');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('21','6');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('22','7');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('23','6');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('19','7');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('23','7');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('24','8');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('25','8');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('26','9');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('27','9');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('28','9');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('29','10');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('30','10');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('31','10');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('32','11');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('33','11');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('34','11');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('35','12');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('36','12');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('37','12');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('38','13');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('39','13');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('40','13');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('41','14');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('42','14');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('43','14');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('44','15');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('45','15');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('46','15');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('47','16');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('48','16');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('49','16');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('50','17');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('30','17');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('51','17');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('52','18');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('53','18');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('54','18');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('55','18');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('56','19');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('57','19');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('58','19');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('59','20');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('60','20');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('61','20');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('62','21');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('63','21');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('64','21');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('65','22');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('66','22');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('67','22');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('38','23');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('68','23');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('69','23');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('70','24');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('56','24');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('71','24');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('72','25');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('73','25');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('74','25');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('38','26');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('75','26');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('76','26');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('77','27');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('78','27');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('79','27');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('80','28');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('81','28');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('82','28');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('83','29');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('84','29');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('85','29');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('86','30');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('87','30');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('88','30');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('89','31');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('90','31');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('91','31');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('92','32');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('93','32');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('94','32');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('95','33');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('96','33');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('97','33');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('98','34');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('99','34');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('100','34');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('101','35');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('102','35');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('103','35');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('104','36');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('105','36');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('106','36');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('107','37');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('108','37');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('109','38');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('110','38');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('111','38');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('112','40');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('113','40');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('114','40');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('115','39');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('116','39');
INSERT INTO ActorPlays (ActorID,MovieID) VALUES ('117','39');







INSERT INTO Studio (StudioID,Name,Country) VALUES ('1','Warner Bros','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('2','Atlas Entertainment','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('3','DC Comics ','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('4','Milleniom Films','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('5','New Line Cinema','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('6','Gran Via','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('7','Legendary Pictures','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('8','Quad Productions','France');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('9','Canal+','France');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('10','Safran Company','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('11','Screen Gems','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('12','Rainforest Films','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('13','Miramax','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('14','A Band Apart','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('15','20th Century Fox','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('16','Paramount Pictures','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('17','Sky Dance Prod.','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('18','Regency Enterprise','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('19','Dimension Films ','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('20','Rocklin/Faust','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('21','Marvel Entertainment ','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('22','Marvel Studios','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('23','Olive Bridge Ent.','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('24','Hasbro','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('25','DreamWorks SKG ','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('26','Universal Pictures','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('27','MGM','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('28','Anonymous Content','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('29','Appian Way','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('30','Columbia Pictures','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('31','Black Label Media ','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('32','Lionsgate','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('33','Alfran Productions','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('34','Carolco Pictures','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('35','Pacifi Western ','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('36','B&T Film ','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('37','Newmarket Productions','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('38','Walt Disney Pictures','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('39','Andres Media','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('40','Eye2eye Media','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('41','QED International ','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('42','Chicago Records II','US');
INSERT INTO Studio (StudioID,Name,Country) VALUES ('43','Dune Entertainment','US');






INSERT INTO Sponsors (MovieID,StudioID) VALUES ('1','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('1','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('2','15');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('2','21');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('3','4');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('4','5');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('4','6');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('5','7');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('6','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('6','7');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('7','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('7','7');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('7','3');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('8','8');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('8','9');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('9','5');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('9','10');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('10','11');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('10','12');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('11','13');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('11','14');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('12','15');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('13','15');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('13','16');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('14','16');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('14','17');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('15','18');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('16','19');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('17','20');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('17','11');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('18','21');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('18','22');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('19','11');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('19','23');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('20','24');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('20','16');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('21','25');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('21','26');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('22','27');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('22','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('22','5');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('23','18');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('24','30');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('24','21');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('25','31');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('25','32');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('26','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('26','7');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('27','33');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('27','16');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('28','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('29','16');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('29','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('29','7');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('30','34');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('31','35');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('31','36');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('32','1');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('33','38');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('34','38');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('35','39');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('35','40');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('36','30');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('36','41');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('37','42');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('38','38');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('39','34');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('40','43');
INSERT INTO Sponsors (MovieID,StudioID) VALUES ('40','15');



























