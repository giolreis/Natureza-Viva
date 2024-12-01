-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS `NaturezaViva`;

-- Seleção do banco de dados
USE `NaturezaViva`;

-- Criação da tabela de usuários
CREATE TABLE `usuarios` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) UNIQUE NOT NULL,
    `senha` VARCHAR(255) NOT NULL,
    `cpf` 	VARCHAR(11) NOT NULL,
    `tipo_usuario` ENUM('admin', 'usuario') DEFAULT 'usuario',
    `data_cadastro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `status` ENUM('ativo', 'inativo') DEFAULT 'ativo',
    `ultimo_login` TIMESTAMP NULL
);

-- Criação da tabela de espaços (salão de festas, auditório, etc.)
CREATE TABLE `espacos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(255) NOT NULL,
    `descricao` TEXT,
    `capacidade` INT,
    `preco` DECIMAL(10, 2),
    `status` ENUM('disponivel', 'indisponivel') DEFAULT 'disponivel',
    `data_criacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de agendamentos
CREATE TABLE `agendamentos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL,
    `id_espaco` INT NOT NULL,
    `data_inicio` DATETIME NOT NULL,
    `data_fim` DATETIME NOT NULL,
    `status` ENUM('pendente', 'confirmado', 'finalizado', 'cancelado') DEFAULT 'pendente',
    `data_criacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`),
    FOREIGN KEY (`id_espaco`) REFERENCES `espacos`(`id`)
);

-- Criação da tabela de avaliações
CREATE TABLE `avaliacoes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_agendamento` INT NOT NULL,
    `nota` INT NOT NULL,
    `comentario` TEXT,
    `data_criacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_agendamento`) REFERENCES `agendamentos`(`id`)
);

-- Criação da tabela de ocorrências
CREATE TABLE `ocorrencias` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_agendamento` INT NOT NULL,
    `descricao` TEXT,
    `status` ENUM('pendente', 'resolvido') DEFAULT 'pendente',
    `data_criacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_agendamento`) REFERENCES `agendamentos`(`id`)
);

-- Dados iniciais (administrador padrão)
INSERT INTO `usuarios` (`nome`, `email`, `senha`,`CPF`, `tipo_usuario`)
VALUES 
    ('Administrador', 'admin@naturezaviva.org', MD5('123456'),'85725356868','admin');
