-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 22, 2018 at 12:16 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chitchat`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `ID` int(11) NOT NULL,
  `content` varchar(150) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`ID`, `content`, `datetime`, `username`) VALUES
(1, 'Why did the chicken cross the road? huh?', '2018-03-22 11:12:18', 'Catman'),
(2, 'Whats for dinner?', '2018-03-22 11:12:18', 'Catman'),
(3, 'Lets get KFC! :-D', '2018-03-22 11:12:18', 'Catman'),
(38, 'Why did the chicken cross the road? huh?', '2018-03-22 11:12:18', 'Catman'),
(39, 'Whats for dinner?', '2018-03-22 11:12:18', 'Catman'),
(40, 'Lets get KFC! :-D', '2018-03-22 11:12:18', 'Catman'),
(82, 'g', '2018-03-22 11:28:33', 'fuck'),
(83, 'hey', '2018-03-22 11:14:55', 'Tyler'),
(84, 'g', '2018-03-22 11:14:55', 'Tyler'),
(85, 'hey', '2018-03-22 11:14:55', 'Tyler'),
(86, 'Hey!', '2018-03-22 11:14:55', 'Tyler'),
(87, '', '2018-03-22 11:14:55', 'Tyler'),
(88, 'k', '2018-03-22 11:14:55', 'Tyler'),
(89, 'k', '2018-03-22 11:14:55', 'Tyler'),
(90, 'k', '2018-03-22 11:14:55', 'Tyler'),
(91, 'k', '2018-03-22 11:14:55', 'Tyler'),
(92, 'k', '2018-03-22 11:14:55', 'Tyler'),
(93, 'k', '2018-03-22 11:14:55', 'Tyler'),
(94, 'l', '2018-03-22 11:14:55', 'Tyler'),
(95, ';', '2018-03-22 11:14:55', 'Tyler'),
(96, 'k', '2018-03-22 11:14:55', 'Tyler'),
(97, 'ki', '2018-03-22 11:14:55', 'Tyler'),
(98, 'f', '2018-03-22 11:14:55', 'Tyler'),
(99, 'ff', '2018-03-22 11:28:33', 'fuck'),
(100, 'Hey guys!', '2018-03-22 11:12:18', 'Catman'),
(101, 'How are you?', '2018-03-22 11:12:18', 'Catman'),
(102, 'Hey', '2018-03-22 11:11:45', 'Rossyboii'),
(103, 'Hey guys!', '2018-03-22 11:13:06', 'BigDix'),
(104, 'hey', '2018-03-22 11:14:55', 'Tyler'),
(105, 'Hey Team', '2018-03-22 11:15:34', 'Ross Taylor'),
(106, 'Yo yo yo!', '2018-03-22 11:15:42', 'Ross Taylor'),
(107, 'hey', '2018-03-22 11:46:55', 'Apples'),
(108, 'Whats up team!', '2018-03-22 11:46:55', 'Apples'),
(109, 'Yooo!!!', '2018-03-22 11:46:55', 'Apples'),
(110, 'Hi Apples!', '2018-03-22 11:18:42', 'Bella'),
(111, 'Hello again Apples!', '2018-03-22 11:47:48', 'Bella'),
(112, 'Suck shit faggot', '2018-03-22 11:47:55', 'Apples'),
(113, 'Hi guys!', '2018-03-22 11:49:39', 'Strawberry'),
(114, 'Lets get KFC! :-D 22', '2018-03-21 11:12:18', 'tiddles'),
(115, 'Lets get KFC! :-D 21', '2018-03-20 11:12:18', 'tiddles'),
(116, 'Lets get KFC! :-D 20', '2018-03-19 11:12:18', 'tiddles'),
(117, 'Lets get KFC! :-D 19', '2018-03-21 11:12:17', 'tiddles');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `fname`, `lname`, `email`, `status`) VALUES
('Apples', 'a', 'a', 'a', 'a', 'online'),
('Bella', 'a', 'a', 'a', 'a', 'offline'),
('Catman', 'tyler1', 'Tyler', 'Bruin', 'tylerbruin@hotmail.com', 'offline'),
('fuck', 'a', 'a', 'a', 'a', 'offline'),
('o', 'o', 'o', 'o', 'o', 'offline'),
('r', 'r', 'r', 'r', 'r', 'offline'),
('Ross Taylor', 'rosco1', 'Ross', 'Taylor', 'rosstaylor@gmail.com', 'offline'),
('Strawberry', 'a', 'a', 'a', 'a', 'online'),
('Tyler', 'a', 'a', 'a', 'a', 'offline');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
