SET foreign_key_checks = 0;
DROP TABLE IF EXISTS hello;
CREATE table hello (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
url VARCHAR(255) NOT NULL,
comment VARCHAR(255) NULL,
PRIMARY KEY (id)
);
INSERT INTO hello (id, url, comment)
VALUE
(1, 'github.com/NikitaMasalov/mysql_hw', 'mission completed');
SET foreign_key_checks = 1;