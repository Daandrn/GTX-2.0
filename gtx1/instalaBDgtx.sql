/*
Neste arquivo contém querys responsáveis pela criação do banco de dados, tabelas e registros essenciais para funcionamento da versao 1.0 da aplicação.
O arquivo 'conexao.php' é utilizado para conexao ao BD, sendo que nele contém os dados correspondentes aos que serão criados com este SQL.

O sql abaixo deve ser utilizado após criar o servidor e a base de dados com as configurações abaixo:
- ATENÇÃO: caso crie o BD com configurações diferentes, basta adequar o arquivo 'conexao.php'.
*/

-- configurações da base de dados
CREATE DATABASE "GTX"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


/*
Executar o sql no ADM do BD para criar as tabelas do app
*/
-- Cria as tabelas
CREATE TABLE statusmembro (
    status_solicit INT PRIMARY KEY UNIQUE,
    descricao TEXT
);
CREATE TABLE pessoa (
    id INT PRIMARY KEY UNIQUE,
    nome VARCHAR(30) NOT NULL,
    nick VARCHAR(20) UNIQUE NOT NULL,
    plataforma TEXT,
    status_solicit INT NOT NULL,
    senha TEXT,
    FOREIGN KEY (status_solicit) REFERENCES statusmembro(status_solicit)
);
CREATE TABLE plataformastream (
    id INT PRIMARY KEY UNIQUE,
    descricao TEXT
);
CREATE TABLE canalstream (
    id INT UNIQUE NOT NULL,
    plataforma INT,
    link_canal VARCHAR(50),
    nickstream VARCHAR(20),
    FOREIGN KEY (id) REFERENCES pessoa(id),
    FOREIGN KEY (plataforma) REFERENCES plataformastream(id)
);
CREATE TABLE statussenha(
    solicit_senha INT PRIMARY KEY NOT NULL,
    descricao TEXT
);
CREATE TABLE recuperasenha(
    id INT NOT NULL,
    nick VARCHAR(20) NOT NULL,
    novasenha TEXT NOT NULL,
    solicit_senha INT,
    data_solicit DATE,
    FOREIGN KEY (solicit_senha) REFERENCES statussenha(solicit_senha)
);
CREATE TABLE versao (
    id INT PRIMARY KEY,
    descricao text
);

-- Insere os dados constantes da aplicação
INSERT INTO statusmembro (status_solicit, descricao) VALUES 
(0, 'Pendente'),
(1, 'Membro'),
(2, 'Rejeitado'),
(3, 'Expulso'),
(4, 'Administrador');

INSERT INTO statussenha (solicit_senha, descricao) VALUES
(0, 'Aprovado'),
(1, 'Solicitado');

INSERT INTO plataformastream (id, descricao) VALUES
(1, 'Youtube'),
(2, 'Twitch'),
(3, 'TikTok'),
(4, 'Facebook'),
(5, 'Kwai');

-- cria um usuário administrador com senha '456' (que deve ser alterado posteriormente)
INSERT INTO pessoa (id, nome, nick, plataforma, status_solicit, senha) VALUES 
(1, 'Administrador', 'adm', 'PC', 4, '456');

INSERT INTO canalstream (id, plataforma, link_canal, nickstream) VALUES
(1, NULL, NULL, NULL);