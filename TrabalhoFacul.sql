CREATE DATABASE universidade_bd
CHARSET  = utf8
COLLATE = utf8_general_ci;

USE universidade_bd;

CREATE TABLE alunos(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_aluno VARCHAR(50) NOT NULL,
nascimento DATE,
sexo ENUM ('F', 'M'),
endereço VARCHAR(50)
);

INSERT INTO alunos VALUES
	(DEFAULT, 'Ana','1995-12-2', 'F','Rua A'),
	(DEFAULT, 'Pedro','2000-07-15', 'M', 'Rua B'),
	(DEFAULT, 'Maria','1999-05-30', 'F', 'Rua C'),
    (DEFAULT, 'João','2000-12-02', 'M', 'Rua D'),
    (DEFAULT, 'Mateus','1989-05-03', 'M', 'Rua E');   

CREATE TABLE professores(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_professor VARCHAR(50) NOT NULL,
	carga_horaria INT
);
INSERT INTO professores VALUES
	(DEFAULT, 'Adriana', '8'),
	(DEFAULT, 'Gilberto', '8'),
	(DEFAULT, 'Vanessa', '8');
    
CREATE TABLE cursos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_curso VARCHAR(30) NOT NULL UNIQUE,    
	carga_horaria INT UNSIGNED,
    professor INT,
    FOREIGN KEY (professor) REFERENCES professores(id)
);

INSERT INTO cursos VALUES
	(DEFAULT, 'Banco de Dados', '70', '2') ,
	(DEFAULT, 'Algoritmos', '70', '3'),
	(DEFAULT, 'Redes', '70', '2'),
	(DEFAULT, 'Logica Computacional', '70', '1');	

CREATE TABLE matricula(
	id_matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    aluno INT,
    curso INT,
	FOREIGN KEY (aluno) REFERENCES alunos(id),
	FOREIGN KEY (curso) REFERENCES cursos(id)   
);

INSERT INTO matricula VALUES
	(DEFAULT, '1','2'),
    (DEFAULT, '2','1'),
    (DEFAULT, '3','2'),
    (DEFAULT, '4','3'),
    (DEFAULT, '5','4');
    
SELECT matricula.id_matricula, alunos.nome_aluno, cursos.nome_curso, 
cursos.carga_horaria, professores.nome_professor FROM matricula
JOIN alunos ON alunos.id = matricula.aluno
JOIN cursos ON cursos.id = matricula.curso
JOIN professores ON professores.id = cursos.professor
ORDER BY alunos.nome_aluno;
