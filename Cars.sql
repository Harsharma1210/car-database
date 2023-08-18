CREATE DATABASE IF NOT EXISTS Cars;
USE Cars;

DROP TABLE IF EXISTS customerRep;
DROP TABLE IF EXISTS motorcycle;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS truck;
DROP TABLE IF EXISTS auction;
DROP TABLE IF EXISTS vehicle;
DROP TABLE IF EXISTS buyer;
DROP TABLE IF EXISTS seller;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;

CREATE TABLE customerRep (
	id int,
    username varchar(50),
    password varchar(50),
    primary key(id)
);

CREATE TABLE buyer (
	buyerid int,
    username varchar(50),
    password varchar(50),
    upperlimit int,
    primary key(buyerid)
);

CREATE TABLE seller (
	sellerid int,
    username varchar(50),
    password varchar(50),
    primary key(sellerid)
);

CREATE TABLE vehicle (
	make varchar(50),
    model varchar(50),
    year int,
    fueltype varchar(3),
    preowned varchar(3),
    cond varchar(20),
    miles int,
    color varchar(20),
    vin varchar(18),
    primary key(vin)
);

CREATE TABLE motorcycle (
	vin varchar(18),
    fullyassembled varchar(3),
    tiltsteering varchar(3),
    PRIMARY KEY(vin),
    FOREIGN KEY(vin) REFERENCES vehicle(vin)
);

CREATE TABLE car (
	vin varchar(18),
    bodyupgrade varchar(3),
    PRIMARY KEY(vin),
    FOREIGN KEY(vin) REFERENCES vehicle(vin)
);

CREATE TABLE truck (
	vin varchar(18),
    storagespace int,
    PRIMARY KEY(vin),
    FOREIGN KEY(vin) REFERENCES vehicle(vin)
);

CREATE TABLE auction (
	vin varchar(18),
    sellerid int,
    sellername varchar(50),
    minimumrate int,
    highestbid int,
    buyerid int,
    isopen varchar(5),
    closedate varchar(15),
    closetime varchar(15),
    PRIMARY KEY(vin, sellerid, buyerid),
    FOREIGN KEY(vin) REFERENCES vehicle(vin),
    FOREIGN KEY(buyerid) REFERENCES buyer(buyerid),
    FOREIGN KEY(sellerid) REFERENCES seller(sellerid)
);

CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    question_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE replies (
    reply_id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    reply_text TEXT NOT NULL,
    reply_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES questions (question_id) ON DELETE CASCADE
);

INSERT INTO customerRep VALUES
(1, "bob", "parr");

INSERT INTO buyer VALUES
(1, "seto", "kaiba", null),
(2, "yugi", "muto", null);

INSERT INTO seller VALUES
(1, "seto", "kaiba"),
(2, "yugi", "muto");

INSERT INTO vehicle VALUES
("Kawasaki", "Ninja", 2015, "gas", "no", "new", 12000, "Blue", 1111);

INSERT INTO motorcycle VALUES
(1111, "yes", "yes");

INSERT INTO auction VALUES
(1111, 1, "seto", 5000, 0, 1, "yes", "2023-08-17", "12:25:00");

SELECT * FROM auction;