-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 12, 2024 at 06:36 PM
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `address` varchar(100) NOT NULL,
  `category` varchar(60) NOT NULL,
  `specialRequirments` varchar(500) DEFAULT NULL,
  `preferredInterval` varchar(150) DEFAULT NULL,
  `preferredDays` varchar(150) DEFAULT NULL,
  `payCash` tinyint(1) DEFAULT NULL,
  `payCard` tinyint(1) DEFAULT NULL,
  `price` int NOT NULL,
  `isNegotiable` tinyint(1) NOT NULL,
  `image` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isDone` tinyint(1) NOT NULL,
  `userID` int NOT NULL,
  `serviceProviderID` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `address`, `category`, `specialRequirments`, `preferredInterval`, `preferredDays`, `payCash`, `payCard`, `price`, `isNegotiable`, `image`, `isDone`, `userID`, `serviceProviderID`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(32, 'To move the electricity meters', 'A mistake occurred when the electricity meters were installed, the door problem was not calculated at that time and now the situation is less happy, if it can be solved I would be very grateful to an electrician.\n\nThank you very much !', 'Arad, str.Sagului nr.34', 'Electrical', 'Nothing special, just to know what\'s he is doing', '14-16', 'Wednesday', 1, 0, 200, 0, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fsignal-2024-02-02-175231_002.jpeg?alt=media&token=9f8293e8-397d-4349-b7f7-cedf9d79e038', 0, 22, 0, '2024-02-02 18:07:33', '2024-02-02 18:07:33', NULL),
(33, 'To fix this pipe issue', 'So I\'ve just moved in here and I\'m no expert but I think this is less than ideal, I need somebody to remake this pipework.', 'Oradea, Nufarului 97', 'Pluming', 'I need the pipe downtime to be as small as possible', '14-16', 'Week days', 1, 0, 150, 1, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fsignal-2024-02-02-175231_003.jpeg?alt=media&token=fe5b456f-785b-4113-a186-ac0ec7cf0e0a', 0, 1, 0, '2024-02-02 18:11:58', '2024-02-02 18:11:58', NULL),
(34, 'I think this outlet should be elsewhere', 'So it\'s kind of confusing for me, do i need an electrician or a plumber ?\nEither way if somebody can fix it, please contract the job, because now I\'m afraid to use either of them, the sink and the outlet', 'Timisoara, Calea Lipovei nr.217', 'Electrical', 'Electrician with plumber skills or vice versa :D', '10-12', 'Tuesday', 1, 0, 80, 0, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fsignal-2024-02-02-175231_004.jpeg?alt=media&token=e4590c0e-50c0-49b9-8485-cfbe85438b4d', 0, 1, 0, '2024-02-02 18:26:11', '2024-02-02 18:26:11', NULL),
(35, 'Misaligned window', 'You leave the workers alone for 2 hours and when you come back you see this, now, any normal people will fix it for no extra charge, not if they were drunk....\nAnyway what\'s done is done, can some one fix it ?', 'Oradea, Str.Nojoridului 318', 'Doors', 'Just get it done and get done with it', '16-18', 'Week days', 0, 1, 200, 0, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fsignal-2024-02-02-175231_005.jpeg?alt=media&token=b16baed4-0edd-4831-b8be-22ad3ddd92f6', 0, 2, 0, '2024-02-02 18:34:52', '2024-02-02 18:34:52', NULL),
(36, 'Need to move fix the hand rails', 'This will definitely fail the fire verifications and I have to fix it by the next inspection, witch I don\'t know when it\'s going to be.', 'Oradea, str.Clujului nr. 08A', 'Other', '', 'All day', 'Week days', 1, 0, 250, 0, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fsignal-2024-02-02-175231_007.jpeg?alt=media&token=1dea7baf-35dd-4672-97b8-a0b3eed0d0c2', 0, 5, 0, '2024-02-02 23:19:10', '2024-02-02 23:19:10', NULL),
(37, 'Need to move the toilet', 'This is embarrassing more than anything....so it has to be changed as quickly as possible', 'Oradea, str. Traian Goga, nr. 45', 'Pluming', 'Just don\'t ask anything', 'All day', 'Wednesday', 1, 1, 170, 0, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fsignal-2024-02-02-175231_009.jpeg?alt=media&token=f4129347-e5a0-49af-b3e3-7d0e95586c34', 0, 6, 0, '2024-02-02 23:22:07', '2024-02-02 23:22:07', NULL),
(38, 'Need this pipe fixed', 'The pipe need to have an elbow to allow the water to go trough, i guess, don\'t know that\'s why I\'m here, please contact me to solve this problem.\n\nThanks', 'Oradea, str. Morii, nr. 28', 'Pluming', 'More professional then the last one', '14-16', 'Week days', 0, 1, 80, 1, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Ffunny-construction-fails-pics-167-6463949eae0c1__700.jpg?alt=media&token=d40f94cc-b233-44a6-93ee-3cce76b20a4d', 0, 14, 0, '2024-02-28 17:37:09', '2024-02-28 17:37:09', NULL),
(40, 'proba', 'proba', 'undeva', 'Doors', '', '14-16', 'Wednesday', 1, 0, 120, 0, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fraspuns-anvelope.jpg?alt=media&token=d9abe27a-df59-4216-acbe-7bf412c4a767', 0, 22, 0, '2024-03-04 16:31:08', '2024-03-06 08:04:32', NULL),
(42, 'sa tricat o usa', 'ceva', 'Oradea', 'Doors', 'ceva', '14-16', 'Tuesday', 1, 0, 100, 1, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fraspuns-anvelope.jpg?alt=media&token=2bbb17d4-6d2b-43f2-92b0-89ca5b0dbce7', 0, 22, 0, '2024-03-07 08:39:20', '2024-03-07 08:39:41', '2024-03-07 08:39:41'),
(43, 'sa tricat o usa', 'ceva', 'Oradea', 'Doors', 'ceva', '14-16', 'Tuesday', 1, 0, 100, 1, 'https://firebasestorage.googleapis.com/v0/b/licienta-d14e7.appspot.com/o/images%2Fraspuns-anvelope.jpg?alt=media&token=2bbb17d4-6d2b-43f2-92b0-89ca5b0dbce7', 0, 22, 0, '2024-03-07 08:39:22', '2024-03-07 08:39:37', '2024-03-07 08:39:37');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
