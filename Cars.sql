CREATE DATABASE IF NOT EXISTS Cars;
USE Cars;

DROP TABLE IF EXISTS buyer;
CREATE TABLE buyer (
	username varchar(50),
    password varchar(50)
);

INSERT INTO buyer
VALUES ('root', 'root');
