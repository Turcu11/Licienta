-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 12, 2024 at 06:37 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `licientadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `isServiceProvider` tinyint(1) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `password`, `email`, `isServiceProvider`, `rating`, `address`, `phone`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'John Doe', 'password1', 'john.doe@email.com', 0, 4, '123 Main St', '555-1234', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(2, 'Jane Smith', 'password2', 'jane.smith@email.com', 1, 5, '456 Oak St', '555-5678', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(3, 'Alice Johnson', 'password3', 'alice.johnson@email.com', 0, NULL, NULL, NULL, '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(4, 'Bob Williams', 'password4', 'bob.williams@email.com', 1, NULL, NULL, NULL, '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(5, 'Eva Davis', 'password5', 'eva.davis@email.com', 0, 3, '789 Elm St', '555-9012', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(6, 'Michael Brown', 'password6', 'michael.brown@email.com', 1, 4, '101 Pine St', '555-3456', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(7, 'Olivia Lee', 'password7', 'olivia.lee@email.com', 0, NULL, NULL, NULL, '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(8, 'Daniel Miller', 'password8', 'daniel.miller@email.com', 1, 5, '202 Maple St', '555-7890', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(9, 'Sophia Wilson', 'password9', 'sophia.wilson@email.com', 0, 4, '303 Cedar St', '555-2345', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(10, 'David Taylor', 'password10', 'david.taylor@email.com', 1, NULL, NULL, NULL, '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(11, 'Emma Anderson', 'password11', 'emma.anderson@email.com', 0, 5, '404 Birch St', '555-6789', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(12, 'James White', 'password12', 'james.white@email.com', 1, 4, '505 Walnut St', '555-1234', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(13, 'Mia Harris', 'password13', 'mia.harris@email.com', 0, 3, '606 Oak St', '555-5678', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(14, 'William Martin', 'password14', 'william.martin@email.com', 1, 5, '707 Pine St', '555-9012', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(15, 'Ava Garcia', 'password15', 'ava.garcia@email.com', 0, NULL, NULL, NULL, '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(16, 'Liam Martinez', 'password16', 'liam.martinez@email.com', 1, 4, '808 Cedar St', '555-3456', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(17, 'Emily Moore', 'password17', 'emily.moore@email.com', 0, 5, '909 Maple St', '555-7890', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(18, 'Benjamin Johnson', 'password18', 'benjamin.johnson@email.com', 1, 3, '1010 Elm St', '555-2345', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(19, 'Abigail Davis', 'password19', 'abigail.davis@email.com', 0, NULL, NULL, NULL, '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(20, 'Logan Brown', 'password20', 'logan.brown@email.com', 1, 4, '1111 Pine St', '555-6789', '2024-01-16 23:45:36', '2024-01-16 23:45:36', NULL),
(22, 'turcu iosif', '123', 'turcu@gmail.com', NULL, NULL, NULL, '0745 754 637', '2024-01-27 01:34:32', '2024-01-27 01:34:32', NULL),
(23, 'Turcu Iosif', 'password', 'turcu.iosif@email.com', NULL, NULL, NULL, NULL, '2024-02-09 11:24:56', '2024-02-09 11:24:56', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
