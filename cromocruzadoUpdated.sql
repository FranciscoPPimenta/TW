-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2024 at 06:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cromocruzado`
--
CREATE DATABASE IF NOT EXISTS `cromocruzado` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cromocruzado`;

-- --------------------------------------------------------

--
-- Table structure for table `history`
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
-- Table structure for table `stickers`
--

DROP TABLE IF EXISTS `stickers`;
CREATE TABLE IF NOT EXISTS `stickers` (
  `id_sticker` int(11) NOT NULL AUTO_INCREMENT,
  `sticker_num` int(11) NOT NULL,
  `sticker_name` varchar(50) NOT NULL,
  `sticker_price` decimal(11,0) NOT NULL,
  `sticker_pic` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`id_sticker`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stickers`
--

INSERT INTO `stickers` (`id_sticker`, `sticker_num`, `sticker_name`, `sticker_price`, `sticker_pic`, `descricao`) VALUES
(1, 1, 'Cristiano Ronaldo', 25, 'cristiano_ronaldo.png', 'Cristiano Ronaldo é um jogador de futebol português renomado pelas suas habilidades e conquistas,amplamente reconhecido pelo seu talento, dedicação e impacto global no futebol.<br><br>Idade: 39 anos<br><br>Clube atual: Al Nassr (Arábia Saudita)'),
(2, 2, 'Bruno Fernandes', 5, 'bruno_fernandes.png', 'Bruno Fernandes é um jogador de futebol português destacado, reconhecido pela sua habilidades de passe, visão de jogo e capacidade de marcar golo.\n<br><br>\nIdade: 29 anos (nascido em 8 de setembro de 1994)<br><br>\nClube atual: Manchester United (Inglaterra)<br><br>\nFernandes é uma peça fundamental tanto no seu clube quanto na seleção portuguesa, conhecido pela sua liderança em campo e precisão nas cobranças de penalti e faltas.'),
(3, 3, 'Bernardo Silva', 5, 'bernardo_silva.png', 'Bernardo Silva é um talentoso jogador de futebol português conhecido por sua habilidade técnica e versatilidade em campo, e é admirado por sua visão de jogo, controle de bola e capacidade de atuar em várias posições no meio-campo e no ataque.<br><br>Idade: 29 anos (nascido em 10 de agosto de 1994)<br><br>Clube atual: Manchester City (Inglaterra)'),
(4, 4, 'João Félix', 4, 'joao_felix.png', 'João Félix é um jogador de futebol português promissor , conhecido pela sua criatividade, velocidade e habilidade de drible.\n<br><br>\nIdade: 24 anos (nascido em 10 de novembro de 1999)<br>\nClube atual: Barcelona (Espanha), emprestado pelo Atlético de Madrid (Espanha)<br><br>\nFélix é elogiado pelo seu talento natural e potencial para se tornar um dos melhores atacantes do futebol mundial.'),
(5, 5, 'Rúben Dias', 5, 'ruben_dias.png', NULL),
(6, 6, 'Diogo Jota', 4, 'diogo_jota.png', NULL),
(7, 7, 'João Cancelo', 5, 'joao_cancelo.png', NULL),
(8, 8, 'Rui Patrício', 4, 'rui_patricio.png', NULL),
(9, 9, 'Pepe', 4, 'pepe.png', NULL),
(10, 10, 'Francisco Conceição', 4, 'francisco_conceicao.png', NULL),
(11, 11, 'João Neves', 4, 'joao_neves.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `user_type`, `name`, `email`, `phone_number`, `profile_pic`, `description`, `password`) VALUES
(1, 0, 'Marco Fernandes', 'marco.fernandes@ipvc.pt', NULL, '', NULL, '$2y$10$oDXDYZuB1qTxKc7q9V433.2ML14g7fYDyErK1i5UsCW'),
(7, 0, 'teste teste', 'teste@gmail.com', NULL, NULL, NULL, '$2y$10$W7YaYrTUi29UIP3mO59XmOH7zVCqIyRKldrge4a6Kc'),
(9, 2, 'Marco Fernandes', 'marco@ipvc.pt', 30566, 'profile_marco.jpeg', 'Licenciatura de ECGM', '$2y$10$1TdKAsWJiwpnds9Yzdn0juTb6qwp6lKIgDJQUaO6nA3assMJTTWYS'),
(11, 0, 'Francisco Pimenta', 'franciscopimenta@ipvc.pt', NULL, NULL, NULL, '$2y$10$NdI3IpW95PbjJ4dUbYbeJe.nn5RupAiMHMd8NrBpuv/msn.ctzuay'),
(12, 0, 'DunJun', 'kikitopimenta123@gmail.com', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLKM9C0ln', NULL, '$2y$10$/iLBAuJY/RlVXdcQuntKbO9MEJJC/t6AInp3t8jZaOW4rkSd7sIPu'),
(14, 0, 'Trove', 'troveonpcdunny@gmail.com', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJXSsKzFg', NULL, '$2y$10$4L4dQw/McADNNvTEkqPw0./xmy7JRoNOY8Y9f2G2vXBImmLo5Mt7S');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
CREATE TABLE IF NOT EXISTS `user_types` (
  `id_type` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id_type`, `type`) VALUES
(0, 'Normal'),
(1, 'Moderador'),
(2, 'Fundador');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_StickerHistory` FOREIGN KEY (`id_sticker`) REFERENCES `stickers` (`id_sticker`),
  ADD CONSTRAINT `FK_UserFromHistory` FOREIGN KEY (`id_userFrom`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `FK_UserToHistory` FOREIGN KEY (`id_userTo`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_TypeUser` FOREIGN KEY (`user_type`) REFERENCES `user_types` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
