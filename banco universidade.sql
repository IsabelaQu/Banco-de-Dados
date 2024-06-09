CREATE DATABASE universidade;
USE universidade;


CREATE TABLE Cursos (
  id_curso INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  area VARCHAR(80) NOT NULL
);

CREATE TABLE Alunos (
  id_aluno INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  sobrenome VARCHAR(150) NOT NULL,
  email VARCHAR(200) UNIQUE NOT NULL,
  fk_curso INT,
  FOREIGN KEY (fk_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Matriculas (
  idMatricula INT PRIMARY KEY AUTO_INCREMENT,
  idAluno INT,
  idCurso INT,
  dataMatricula DATE NOT NULL,
  FOREIGN KEY (idAluno) REFERENCES Alunos(id_aluno),
  FOREIGN KEY (idCurso) REFERENCES Cursos(id_curso),
  UNIQUE (idAluno, idCurso)
);

-- Procedures para inserção e obtenção de cursos
DELIMITER //
CREATE PROCEDURE InserirCurso (
    IN nomeCurso VARCHAR(100),
    IN nomeArea VARCHAR(100)
)
BEGIN
    -- Insere o curso
    INSERT INTO Cursos (nome, area) VALUES (nomeCurso, nomeArea);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ObterIdCurso (
    IN nomeCurso VARCHAR(100),
    IN nomeArea VARCHAR(100),
    OUT cursoId INT
)
BEGIN
    -- Obtem o id do curso
    SELECT id_curso INTO cursoId
    FROM Cursos
    WHERE nome = nomeCurso AND area = nomeArea;
END //
DELIMITER ;

-- Procedure para inserção de alunos
DELIMITER //
CREATE PROCEDURE InserirAluno (
    IN nomeAluno VARCHAR(100),
    IN sobrenomeAluno VARCHAR(100),
    IN fk_curso INT
)
BEGIN
    DECLARE emailAluno VARCHAR(200);
    SET emailAluno = CONCAT(LOWER(nomeAluno), '.', LOWER(sobrenomeAluno), '@dominio.com');
    INSERT INTO Alunos (nome, sobrenome, email) VALUES (nomeAluno, sobrenomeAluno, emailAluno);
END //
DELIMITER ;

-- Procedure para matricular alunos
DELIMITER //
CREATE PROCEDURE MatricularAluno (
    IN nomeAluno VARCHAR(100),
    IN sobrenomeAluno VARCHAR(100),
    IN nomeCurso VARCHAR(100),
    IN nomeArea VARCHAR(100)
)
BEGIN
    DECLARE alunoId INT;
    DECLARE cursoId INT;
    DECLARE emailAluno VARCHAR(200);

    -- Cria o email do aluno
    SET emailAluno = CONCAT(LOWER(nomeAluno), '.', LOWER(sobrenomeAluno), '@dominio.com');

    -- Verifica se o aluno já existe
    SELECT id_aluno INTO alunoId FROM Alunos WHERE email = emailAluno;

    -- Se o aluno não existe, insere o novo aluno
    IF alunoId IS NULL THEN
        CALL InserirAluno(nomeAluno, sobrenomeAluno);
        SELECT id_aluno INTO alunoId FROM Alunos WHERE email = emailAluno;
    END IF;

    -- Obtem o id do curso
    CALL ObterIdCurso(nomeCurso, nomeArea, cursoId);

    -- Verifica se o aluno já está matriculado no curso
    IF NOT EXISTS (SELECT 1 FROM Matriculas WHERE idAluno = alunoId AND idCurso = cursoId) THEN
        UPDATE Alunos SET fk_curso = cursoId WHERE id_aluno = alunoId;
        INSERT INTO Matriculas (idAluno, idCurso, dataMatricula) VALUES (alunoId, cursoId, CURDATE());
    END IF;
END //
DELIMITER ;

-- Inserção dos cursos
CALL InserirCurso('Análise e Desenvolvimento de Sistemas', 'Tecnologia');
CALL InserirCurso('Ciência da Computação', 'Tecnologia');
CALL InserirCurso('Engenharia da Computação', 'Tecnologia');
CALL InserirCurso('Engenharia Mecatrônica', 'Tecnologia');
CALL InserirCurso('Engenharia Mecânica', 'Tecnologia');
CALL InserirCurso('Engenharia de Controle e Automação', 'Tecnologia');
CALL InserirCurso('Engenharia de Software', 'Tecnologia');
CALL InserirCurso('Jogos Digitais', 'Tecnologia');
CALL InserirCurso('Sistemas de Informação', 'Tecnologia');
CALL InserirCurso('Sistemas para Internet', 'Tecnologia');
CALL InserirCurso('Gestão da Tecnologia da Informação', 'Tecnologia');
CALL InserirCurso('Engenharia de Telecomunicações', 'Tecnologia');
CALL InserirCurso('Rede de Computadores', 'Tecnologia');
CALL InserirCurso('Banco de Dados', 'Tecnologia');
CALL InserirCurso('Ciência de Dados', 'Tecnologia');
CALL InserirCurso('Computação Gráfica', 'Tecnologia');
CALL InserirCurso('Ciência de Dados e Big Data Analytics', 'Pós-Graduação');
CALL InserirCurso('Administração de Banco de Dados', 'Pós-Graduação');
CALL InserirCurso('Engenharia de Software', 'Pós-Graduação');
CALL InserirCurso('Segurança de Redes de Computadores', 'Pós-Graduação');
CALL InserirCurso('Gestão Estratégica da Tecnologia da Informação', 'Pós-Graduação');
CALL InserirCurso('Desenvolvimento de Jogos Digitais', 'Pós-Graduação');
CALL InserirCurso('Desenvolvimento Mobile', 'Pós-Graduação');
CALL InserirCurso('Segurança da Informação', 'Pós-Graduação');


-- Inserção dos 200 alunos usando a procedure InserirAluno
CALL InserirAluno('Luke', 'Skywalker', 1);
CALL InserirAluno('Leia', 'Organa', 2);
CALL InserirAluno('Han', 'Solo', 3);
CALL InserirAluno('Frodo', 'Baggins', 4);
CALL InserirAluno('Samwise', 'Gamgee', 5);
CALL InserirAluno('Aragorn', 'Elessar', 6);
CALL InserirAluno('Gandalf', 'Grey', 7);
CALL InserirAluno('Bilbo', 'Baggins', 8);
CALL InserirAluno('Legolas', 'Greenleaf', 9);
CALL InserirAluno('Gimli', 'SonofGloin', 10);
CALL InserirAluno('Leonardo', 'daVinci', 11);
CALL InserirAluno('Michelangelo', 'Buonarroti', 12);
CALL InserirAluno('Donatello', 'diNiccolò', 13);
CALL InserirAluno('Raphael', 'Sanzio', 14);
CALL InserirAluno('Goku', 'Son', 15);
CALL InserirAluno('Vegeta', 'Prince', 16);
CALL InserirAluno('Bulma', 'Briefs', 17);
CALL InserirAluno('Krillin', 'K', 18);
CALL InserirAluno('Piccolo', 'Jr', 19);
CALL InserirAluno('Yamcha', 'Y', 20);
CALL InserirAluno('Tony', 'Stark', 21);
CALL InserirAluno('Bruce', 'Banner', 22);
CALL InserirAluno('Natasha', 'Romanoff', 23);
CALL InserirAluno('Steve', 'Rogers', 24);
CALL InserirAluno('Clint', 'Barton', 25);
CALL InserirAluno('Peter', 'Parker', 26);
CALL InserirAluno('Stephen', 'Strange', 27);
CALL InserirAluno('TChalla', '', 28);
CALL InserirAluno('Thor', 'Odinson', 29);
CALL InserirAluno('Loki', 'Laufeyson', 30);
CALL InserirAluno('Wanda', 'Maximoff', 31);
CALL InserirAluno('Vision', '', 32);
CALL InserirAluno('Scott', 'Lang', 33);
CALL InserirAluno('Hope', 'vanDyne', 34);
CALL InserirAluno('Bruce', 'Wayne', 35);
CALL InserirAluno('Clark', 'Kent', 36);
CALL InserirAluno('Diana', 'Prince', 37);
CALL InserirAluno('Barry', 'Allen', 38);
CALL InserirAluno('Arthur', 'Curry', 39);
CALL InserirAluno('Hal', 'Jordan', 40);
CALL InserirAluno('Oliver', 'Queen', 41);
CALL InserirAluno('Victor', 'Stone', 42);
CALL InserirAluno('Billy', 'Batson', 43);
CALL InserirAluno('John', 'Constantine', 44);
CALL InserirAluno('Kara', 'Zor-El', 45);
CALL InserirAluno('Lex', 'Luthor', 46);
CALL InserirAluno('Selina', 'Kyle', 47);
CALL InserirAluno('James', 'Gordon', 48);
CALL InserirAluno('Alfred', 'Pennyworth', 49);
CALL InserirAluno('Eobard', 'Thawne', 50);
CALL InserirAluno('Harley', 'Quinn', 51);
CALL InserirAluno('Pamela', 'Isley', 52);
CALL InserirAluno('Victor', 'Fries', 53);
CALL InserirAluno('Edward', 'Nigma', 54);
CALL InserirAluno('Oswald', 'Cobblepot', 55);
CALL InserirAluno('Ra\'s', 'alGhul', 56);
CALL InserirAluno('Damian', 'Wayne', 57);
CALL InserirAluno('Jason', 'Todd', 58);
CALL InserirAluno('Tim', 'Drake', 59);
CALL InserirAluno('Dick', 'Grayson', 60);
CALL InserirAluno('Barbara', 'Gordon', 61);
CALL InserirAluno('Kate', 'Kane', 62);
CALL InserirAluno('Lucius', 'Fox', 63);
CALL InserirAluno('Rene', 'Montoya', 64);
CALL InserirAluno('Helena', 'Bertinelli', 65);
CALL InserirAluno('Stephanie', 'Brown', 66);
CALL InserirAluno('Cass', 'Cain', 67);
CALL InserirAluno('Terry', 'McGinnis', 68);
CALL InserirAluno('April', 'Neil', 69);
CALL InserirAluno('Casey', 'Jones', 70);
CALL InserirAluno('Splinter', '', 71);
CALL InserirAluno('Shredder', '', 72);
CALL InserirAluno('Bebop', '', 73);
CALL InserirAluno('Rocksteady', '', 74);
CALL InserirAluno('Krang', '', 75);
CALL InserirAluno('Leonardo', '', 76);
CALL InserirAluno('Michelangelo', '', 77);
CALL InserirAluno('Donatello', '', 78);
CALL InserirAluno('Raphael', '', 79);
CALL InserirAluno('Naruto', 'Uzumaki', 80);
CALL InserirAluno('Sasuke', 'Uchiha', 81);
CALL InserirAluno('Sakura', 'Haruno', 82); -- parei aqui ------------------
CALL InserirAluno('Kakashi', 'Hatake', 83);
CALL InserirAluno('Itachi', 'Uchiha', 84);
CALL InserirAluno('Hinata', 'Hyuga', 85);
CALL InserirAluno('Gaara', '', 86);
CALL InserirAluno('Rock', 'Lee', 87);
CALL InserirAluno('Shikamaru', 'Nara', 88);
CALL InserirAluno('Choji', 'Akimichi', 89);
CALL InserirAluno('Ino', 'Yamanaka', 90);
CALL InserirAluno('Neji', 'Hyuga', 91);
CALL InserirAluno('Tenten', '', 92);
CALL InserirAluno('Might', 'Guy', 93);
CALL InserirAluno('Kurenai', 'Yuhi', 94);
CALL InserirAluno('Asuma', 'Sarutobi', 95);
CALL InserirAluno('Jiraiya', '', 96);
CALL InserirAluno('Tsunade', '', 97);
CALL InserirAluno('Orochimaru', '', 98);
CALL InserirAluno('Pain', '', 99);
CALL InserirAluno('Konan', '', 100);
CALL InserirAluno('Madara', 'Uchiha', 101);
CALL InserirAluno('Obito', 'Uchiha', 102);
CALL InserirAluno('Killer', 'Bee', 103);
CALL InserirAluno('Minato', 'Namikaze', 104);
CALL InserirAluno('Kushina', 'Uzumaki', 105);
CALL InserirAluno('Boruto', 'Uzumaki', 106);
CALL InserirAluno('Sarada', 'Uchiha', 107);
CALL InserirAluno('Mitsuki', '', 108);
CALL InserirAluno('Kawaki', '', 109);
CALL InserirAluno('Shino', 'Aburame', 110);
CALL InserirAluno('Kiba', 'Inuzuka', 111);
CALL InserirAluno('Akamaru', '', 112);
CALL InserirAluno('Tamaki', '', 113);
CALL InserirAluno('Karui', '', 114);
CALL InserirAluno('Omoi', '', 115);
CALL InserirAluno('Samui', '', 116);
CALL InserirAluno('Darui', '', 117);
CALL InserirAluno('C', '', 118);
CALL InserirAluno('Kurotsuchi', '', 119);
CALL InserirAluno('Akatsuchi', '', 120);
CALL InserirAluno('Yamato', '', 121);
CALL InserirAluno('Sai', '', 122);
CALL InserirAluno('Anko', 'Mitarashi', 123);
CALL InserirAluno('Iruka', 'Umino', 124);
CALL InserirAluno('Shizune', '', 125);
CALL InserirAluno('Kabuto', 'Yakushi', 126);
CALL InserirAluno('Hiruzen', 'Sarutobi', 127);

select * from Alunos;

select * from Cursos;