-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 27/05/2022 às 16:39
-- Versão do servidor: 5.7.24-0ubuntu0.18.04.1
-- Versão do PHP: 7.3.33-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bankwatch`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `auditoria`
--

CREATE TABLE `auditoria` (
  `cliente` varchar(12) NOT NULL,
  `login_datetime` datetime NOT NULL,
  `logout_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` varchar(12) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dep_inic` int(11) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `corrente`
--

CREATE TABLE `corrente` (
  `id` int(11) NOT NULL,
  `cliente` varchar(12) NOT NULL,
  `saldo` decimal(13,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `poupanca`
--

CREATE TABLE `poupanca` (
  `id` int(11) NOT NULL,
  `cliente` varchar(12) NOT NULL,
  `saldo` decimal(13,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transferencia`
--

CREATE TABLE `transferencia` (
  `id` int(11) NOT NULL,
  `cliente` varchar(12) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descricao` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `auditoria`
--
ALTER TABLE `auditoria`
  ADD KEY `auditoria_cliente_fk` (`cliente`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `corrente`
--
ALTER TABLE `corrente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `corrente_cliente_fk` (`cliente`);

--
-- Índices de tabela `poupanca`
--
ALTER TABLE `poupanca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poupanca_cliente_fk` (`cliente`);

--
-- Índices de tabela `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transferencia_cliente_fk` (`cliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `corrente`
--
ALTER TABLE `corrente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `poupanca`
--
ALTER TABLE `poupanca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `auditoria_cliente_fk` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`);

--
-- Restrições para tabelas `corrente`
--
ALTER TABLE `corrente`
  ADD CONSTRAINT `corrente_cliente_fk` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`);

--
-- Restrições para tabelas `poupanca`
--
ALTER TABLE `poupanca`
  ADD CONSTRAINT `poupanca_cliente_fk` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`);

--
-- Restrições para tabelas `transferencia`
--
ALTER TABLE `transferencia`
  ADD CONSTRAINT `transferencia_cliente_fk` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
