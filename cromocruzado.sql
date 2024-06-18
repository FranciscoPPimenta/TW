-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Jun-2024 às 15:52
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cromocruzado`
--
CREATE DATABASE IF NOT EXISTS `cromocruzado` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cromocruzado`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id_userFrom` int(11) NOT NULL,
  `id_userTo` int(11) NOT NULL,
  `id_sticker` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `dateTrade` date DEFAULT NULL,
  KEY `FK_StickerHistory` (`id_sticker`),
  KEY `FK_UserToHistory` (`id_userTo`),
  KEY `FK_UserFromHistory` (`id_userFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `stickers`
--

DROP TABLE IF EXISTS `stickers`;
CREATE TABLE IF NOT EXISTS `stickers` (
  `id_sticker` int(11) NOT NULL,
  `sticker_num` int(11) NOT NULL,
  `sticker_name` varchar(50) NOT NULL,
  `sticker_price` int(11) NOT NULL,
  `sticker_pic` varchar(50) NOT NULL,
  PRIMARY KEY (`id_sticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `profile_pic` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `FK_TypeUser` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id_user`, `user_type`, `name`, `email`, `phone_number`, `profile_pic`, `description`, `password`) VALUES
(1, 0, 'Marco Fernandes', 'marco.fernandes@ipvc.pt', NULL, '', NULL, '$2y$10$oDXDYZuB1qTxKc7q9V433.2ML14g7fYDyErK1i5UsCW'),
(7, 0, 'teste teste', 'teste@gmail.com', NULL, NULL, NULL, '$2y$10$W7YaYrTUi29UIP3mO59XmOH7zVCqIyRKldrge4a6Kc'),
(9, 2, 'Marco Fernandes', 'marco@ipvc.pt', 30566, 'profile_marco.jpeg', 'Licenciatura de ECGM', '$2y$10$1TdKAsWJiwpnds9Yzdn0juTb6qwp6lKIgDJQUaO6nA3assMJTTWYS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_types`
--

DROP TABLE IF EXISTS `user_types`;
CREATE TABLE IF NOT EXISTS `user_types` (
  `id_type` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `user_types`
--

INSERT INTO `user_types` (`id_type`, `type`) VALUES
(0, 'Normal'),
(1, 'Moderador'),
(2, 'Fundador');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_StickerHistory` FOREIGN KEY (`id_sticker`) REFERENCES `stickers` (`id_sticker`),
  ADD CONSTRAINT `FK_UserFromHistory` FOREIGN KEY (`id_userFrom`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `FK_UserToHistory` FOREIGN KEY (`id_userTo`) REFERENCES `users` (`id_user`);

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_TypeUser` FOREIGN KEY (`user_type`) REFERENCES `user_types` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
