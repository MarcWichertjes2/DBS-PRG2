CREATE USER 'coach'@'localhost' IDENTIFIED BY 'welkom123';
GRANT SELECT, INSERT, DELETE, UPDATE ON game.* TO 'coach'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'medewerker'@'localhost' IDENTIFIED BY 'welkom123';
GRANT SELECT ON game.* TO 'medewerker'@'localhost';
FLUSH PRIVILEGES;

