CREATE DATABASE IF NOT EXISTS Cars;
USE Cars;

DROP TABLE IF EXISTS customerRep;
CREATE TABLE customerRep (
	id int primary key,
    username varchar(50),
    password varchar(50)
);

DROP TABLE IF EXISTS buyerSeller;
CREATE TABLE buyerSeller (
	buyerid int primary key,
    username varchar(50),
    password varchar(50)
);

INSERT INTO customerRep VALUES
(1, "bob", "parr");

INSERT INTO buyerSeller VALUES
(1, "seto", "kaiba");

show tables;
