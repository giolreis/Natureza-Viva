-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/12/2024 às 22:57
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `naturezaviva`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_espaco` int(11) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `status` enum('pendente','confirmado','finalizado','cancelado') DEFAULT 'pendente',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agendamentos`
--

INSERT INTO `agendamentos` (`id`, `id_usuario`, `id_espaco`, `data_inicio`, `data_fim`, `status`, `data_criacao`) VALUES
(1, 4, 1, '2024-12-27 19:46:00', '2024-12-28 19:46:00', 'finalizado', '2024-12-06 22:46:16'),
(3, 3, 3, '2024-12-28 18:50:00', '2024-12-29 18:51:00', 'pendente', '2024-12-08 21:51:09'),
(4, 4, 4, '2024-12-27 19:44:00', '2024-12-27 19:44:00', 'pendente', '2024-12-08 22:45:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL,
  `id_agendamento` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `id_agendamento`, `nota`, `comentario`, `data_criacao`) VALUES
(1, 1, 5, 'legal', '2024-12-07 00:23:41'),
(2, 1, 5, 'legal', '2024-12-07 00:24:03'),
(3, 1, 5, 'legal', '2024-12-07 00:24:06'),
(4, 1, 10, 'bom', '2024-12-08 19:17:39'),
(5, 1, 10, 'teste', '2024-12-08 19:23:28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `espacos`
--

CREATE TABLE `espacos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `status` enum('disponivel','indisponivel') DEFAULT 'disponivel',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `espacos`
--

INSERT INTO `espacos` (`id`, `nome`, `descricao`, `capacidade`, `preco`, `status`, `data_criacao`) VALUES
(1, 'Espaço Alpha', 'Sala para eventos corporativos com capacidade para 50 pessoas.', 50, 500.00, 'disponivel', '2024-12-06 22:33:52'),
(2, 'EspaÃ§o Beta', 'Sala de reuniÃµes equipada com projetor e ar-condicionado editado.', 20, 250.00, 'disponivel', '2024-12-06 22:33:52'),
(3, 'EspaÃ§o Gama', 'Ãrea externa para eventos ao ar livre. teste', 100, 1000.00, 'indisponivel', '2024-12-06 22:33:52'),
(4, 'Espaço Delta', 'Auditório com sistema de som e capacidade para 200 pessoas.', 200, 2000.00, 'disponivel', '2024-12-06 22:33:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id` int(11) NOT NULL,
  `id_agendamento` int(11) NOT NULL,
  `descricao` text DEFAULT NULL,
  `status` enum('pendente','resolvido') DEFAULT 'pendente',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `tipo_usuario` enum('admin','usuario') DEFAULT 'usuario',
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `ultimo_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cpf`, `tipo_usuario`, `data_cadastro`, `status`, `ultimo_login`) VALUES
(1, 'Administrador', 'admin@naturezaviva.org', 'e10adc3949ba59abbe56e057f20f883e', '85725356868', 'admin', '2024-11-30 20:07:51', 'ativo', NULL),
(2, 'adm', 'adm@email', '123', '123456', 'admin', '2024-11-30 20:11:07', 'ativo', '2024-11-30 20:11:07'),
(3, 'normal', 'usarionormal@email.com', '123', '123223', 'usuario', '2024-12-06 22:29:53', 'ativo', '2024-12-06 22:29:53'),
(4, 'placeholder', 'placeholder', 'placeholder', 'placeholder', 'usuario', '2024-12-06 22:44:13', 'ativo', '0000-00-00 00:00:00'),
(5, 'teste4', 'teste@cadastro', '1234', '12345', NULL, '2024-12-08 22:28:16', 'ativo', NULL),
(6, 'teste5', 'teste@cadastro5', '123', '78790', 'usuario', '2024-12-08 22:32:22', 'ativo', NULL),
(7, 'adm2', 'adm2@mail', '121122313', '12121', 'admin', '2024-12-10 12:53:42', 'ativo', '2024-12-10 12:53:42');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_espaco` (`id_espaco`);

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_agendamento` (`id_agendamento`);

--
-- Índices de tabela `espacos`
--
ALTER TABLE `espacos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_agendamento` (`id_agendamento`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `espacos`
--
ALTER TABLE `espacos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`id_espaco`) REFERENCES `espacos` (`id`);

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`id_agendamento`) REFERENCES `agendamentos` (`id`);

--
-- Restrições para tabelas `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD CONSTRAINT `ocorrencias_ibfk_1` FOREIGN KEY (`id_agendamento`) REFERENCES `agendamentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
