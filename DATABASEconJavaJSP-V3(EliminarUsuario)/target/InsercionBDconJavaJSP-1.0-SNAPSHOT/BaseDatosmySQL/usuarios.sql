CREATE DATABASE usuarios
    DEFAULT CHARACTER SET utf8;
    
    USE usuarios;

CREATE TABLE usuario(
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(25) UNIQUE,
    password VARCHAR(255),
    PRIMARY KEY (Id)
);

INSERT INTO usuario (nombre, password) VALUES('Jose Enrique', md5('j123123'));
INSERT INTO usuario (nombre, password) VALUES('Maria Fernanda', md5('m123123'));