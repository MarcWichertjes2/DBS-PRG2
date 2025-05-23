-- SQL TESTBASE
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    voornaam VARCHAR(100),
    achternaam VARCHAR(100),
    nummer VARCHAR(50)
);

-- Stap 2: Maak de user_log-tabel voor triggers
CREATE TABLE user_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    actie VARCHAR(255),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Testentrys
INSERT INTO users (voornaam, achternaam, nummer) VALUES
('Jan', 'de Vries', 'NL123456789'),
('Anna', 'Jansen', 'NL987654321'),
('Pieter', 'Bakker', 'NL112233445'),
('Sophie', 'van Dijk', 'NL556677889'),
('Mohamed', 'El Amrani', 'NL998877665');

--TRIGGER on delete

DELIMITER //

CREATE TRIGGER log_user_delete
AFTER DELETE ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, actie)
    VALUES (OLD.id, CONCAT('Gebruiker verwijderd: ', OLD.voornaam, ' ', OLD.achternaam));
END;

//
DELIMITER ;

























---- updatelog test tabel
CREATE TABLE user_update_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    voornaam VARCHAR(100) NOT NULL,
    achternaam VARCHAR(100) NOT NULL,
    old_nummer VARCHAR(50) NOT NULL,
    new_nummer VARCHAR(50) NOT NULL,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);



--- trigggeeeeeeeerrrrrr
DELIMITER //

CREATE TRIGGER after_user_update_number
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.nummer <> NEW.nummer THEN
        INSERT INTO user_update_logs (user_id, voornaam, achternaam, old_nummer, new_nummer)
        VALUES (NEW.id, NEW.voornaam, NEW.achternaam, OLD.nummer, NEW.nummer);
    END IF;
END;
//

DELIMITER ;
