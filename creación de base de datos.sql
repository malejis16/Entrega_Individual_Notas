DROP DATABASE IF EXISTS notas;
CREATE DATABASE notas;
USE notas;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL);
  
DROP TABLE IF EXISTS acciones;
CREATE TABLE acciones (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `accion` VARCHAR(45) NOT NULL);
  
DROP TABLE IF EXISTS notas;
CREATE TABLE notas (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`titulo` VARCHAR(100) NOT NULL, 
	`fecha_creacion` DATE NOT NULL,
	`fecha_modificacion` TIMESTAMP DEFAULT NOW() NOT NULL,
    `descripcion` TEXT NOT NULL,
    `eliminar` TINYINT NOT NULL,
    `usuario_id` INT NOT NULL,
    `accion_id` INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	FOREIGN KEY (accion_id) REFERENCES acciones(id)
);
  
DROP TABLE IF EXISTS categorias;
CREATE TABLE categorias (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`categoria` VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS categorias_notas;
CREATE TABLE categoria_notas(
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`nota_id` INT NOT NULL,
    `categoria_id` INT NOT NULL,
    FOREIGN KEY (nota_id) REFERENCES notas(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON UPDATE CASCADE
);

/*   /////////////////////////////////////////INSERT/////////////////////////////////////////////////  */

INSERT INTO usuarios (nombre, email) VALUES 
('Alejandra', 'malejis16@hotmial.com'),
('Maria', 'maria@hotmial.com'),
('Paula', 'paula@hotmial.com'),
('Majo', 'majo@hotmial.com'),
('Oscar', 'oscar@hotmial.com'),
('Jaime', 'jaime@hotmial.com'),
('Andrea', 'andrea@hotmial.com'),
('Angie', 'angie@hotmial.com'),
('Yara', 'yara@hotmial.com'),
('Pablo', 'pablo@hotmial.com');

INSERT INTO acciones VALUES
(NULL, 'Crear'),
(NULL, 'Modificar'),
(NULL, 'Eliminar');

INSERT INTO notas VALUES
(NULL, 'Nota 1', '2020-01-02', DEFAULT, 'Descripcion de la nota numero 1 para mostrar', 1, 1, 1),
(NULL, 'Nota 2', '2021-04-02', DEFAULT, 'Descripcion de la nota numero 2 para mostrar', 1, 2, 1),
(NULL, 'Nota 3', '2022-03-01', DEFAULT, 'Descripcion de la nota numero 3 para mostrar', 1, 2, 3),
(NULL, 'Nota 4', '2023-05-02', DEFAULT, 'Descripcion de la nota numero 4 para mostrar', 1, 4, 1),
(NULL, 'Nota 5', '2014-09-10', DEFAULT, 'Descripcion de la nota numero 5 para mostrar', 1, 3, 2),
(NULL, 'Nota 6', '2017-12-12', DEFAULT, 'Descripcion de la nota numero 6 para mostrar', 0, 5, 2),
(NULL, 'Nota 7', '2018-05-15', DEFAULT, 'Descripcion de la nota numero 7 para mostrar', 0, 7, 2),
(NULL, 'Nota 8', '2019-06-28', DEFAULT, 'Descripcion de la nota numero 8 para mostrar', 0, 2, 1),
(NULL, 'Nota 9', '2020-03-01', DEFAULT, 'Descripcion de la nota numero 9 para mostrar', 0, 8, 3),
(NULL, 'Nota 10', '2021-02-03', DEFAULT, 'Descripcion de la nota numero 10 para mostrar', 1, 6, 1);

INSERT INTO categorias VALUES
(NULL, 'Estudio'),
(NULL, 'Noticias'),
(NULL, 'Entretenimiento'),
(NULL, 'Cuidados'),
(NULL, 'Salud'),
(NULL, 'Deporte'),
(NULL, 'Tecnologia'),
(NULL, 'Ventas'),
(NULL, 'Trabajo'),
(NULL, 'Clases');

INSERT INTO categoria_notas VALUES
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 1),
(NULL, 4, 1),
(NULL, 1, 5),
(NULL, 1, 6),
(NULL, 1, 7),
(NULL, 1, 8),
(NULL, 9, 1),
(NULL, 10, 1);






