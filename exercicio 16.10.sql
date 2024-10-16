CREATE DATABASE exercicio;
USE exercicio;

CREATE TABLE formas_geometricas(
 
 tipo VARCHAR(50)
 
 );
 
 INSERT INTO formas_geometricas VALUES
("X"),
("X"), 
("X"),
("X"),
("O"),
("O"),
("O"),
("Q"),
("Q"),
("Q"),
("Q");

SELECT tipo,COUNT (tipo)
FROM formas_geometricas
WHERE tipo LIKE 'X' OR tipo LIKE 'O'
GROUP BY tipo
HAVING COUNT(tipo) > 4;