CREATE DATABASE db_alunos;
USE db_alunos;
CREATE TABLE alunos (
nome VARCHAR(100),
matricula VARCHAR(10),
email VARCHAR(50)
);
CREATE TABLE telefones (
numero VARCHAR(15)
);
ALTER TABLE telefones
ADD COLUMN ddd VARCHAR(2);

MODIFY COLUMN ddd char(2);