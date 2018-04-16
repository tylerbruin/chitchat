-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: mysql.cms.waikato.ac.nz
-- Generation Time: Mar 23, 2018 at 01:18 PM
-- Server version: 5.5.56-MariaDB
-- PHP Version: 7.0.25-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tdb11`
--

-- --------------------------------------------------------

--
-- Table structure for table `labtest`
--

CREATE TABLE `labtest` (
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labtest`
--

INSERT INTO `labtest` (`firstname`, `lastname`) VALUES
('Tyler', 'Bruin'),
('Tyler', 'Bruin'),
('Logan', 'Jack'),
('Liam', 'Poodle'),
('Ben', 'Lett'),
('Cory', 'Bruin');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `ID` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`ID`, `content`, `datetime`, `username`) VALUES
(1, 'Why did the chicken cross the road? huh?', '2018-03-22 22:13:59', 'tiddles'),
(2, 'Whats for dinner?', '2018-03-22 22:13:59', 'tiddles'),
(3, 'Lets get KFC! :-D', '2018-03-22 22:13:59', 'tiddles'),
(17, 'its the 22nd! lets get pizza!', '2018-03-21 11:12:18', 'tiddles'),
(18, 'nah man, KFC!', '2018-03-21 11:12:19', 'Cory'),
(19, 'Nah screw that!', '2018-03-21 11:12:20', 'tiddles'),
(20, 'Im keen for whatever!', '2018-03-21 11:12:25', 'Haydz'),
(21, 'How is the weather today?', '2018-03-20 11:17:18', 'Cory'),
(22, 'its the 21st of March, its great!', '2018-03-20 11:17:18', 'tiddles'),
(23, 'Awesome, see you later!', '2018-03-20 11:18:18', 'Cory'),
(24, 'Ok!', '2018-03-20 11:20:18', 'tiddles'),
(25, 'What is there to do in town on the 20th?', '2018-03-19 11:06:18', 'Haydz'),
(26, 'KFC?', '2018-03-19 11:06:19', 'tiddles'),
(27, 'Yeah, sounds good!', '2018-03-19 11:06:19', 'Haydz'),
(28, 'See you guys there!', '2018-03-19 11:06:20', 'Cory'),
(29, 'Hey team, what day is it?', '2018-03-18 11:09:17', 'Haydz'),
(30, 'nvm, its the 19th, ha ha', '2018-03-18 11:09:17', 'Haydz'),
(31, 'Is anyone else here?', '2018-03-18 11:09:17', 'Haydz'),
(32, 'Hello??', '2018-03-18 11:09:18', 'Haydz'),
(34, 'hey!', '2018-03-23 00:12:02', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `playerinfo`
--

CREATE TABLE `playerinfo` (
  `ID` int(11) NOT NULL,
  `imagelocation` varchar(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `shirtnumber` int(11) NOT NULL,
  `info` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playerinfo`
--

INSERT INTO `playerinfo` (`ID`, `imagelocation`, `firstname`, `lastname`, `shirtnumber`, `info`, `rating`) VALUES
(4, 'thfc_4', 'Hugo', 'Lloris', 1, 'Hugo is regarded as one of the best goalkeepers in the world.', 5),
(3, 'thfc_3', 'Harry', 'Kane', 10, 'Harry Kane is a striker. He has scored more than 100 goals in his club career.', 5),
(2, 'thfc_2', 'Danny', 'Rose', 3, 'Danny Rose is an attacking defender. He joined the club in 2007.', 3),
(5, 'thfc_5', 'Heung-Min', 'Son', 7, 'Heung-Min Son is a forward. He has previously played for Hamburg and Bayer Leverkusen.', 4),
(6, 'thfc_6', 'Toby', 'Alderweireld', 4, 'Toby is a defender. He plays internationally for Belgium.', 5),
(1, 'thfc_1', 'Dele', 'Alli', 6, 'Dele Alli is a midfielder. He joined the club from MKDons in 2015.', 5);

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
('Cory', 'a', 'a', 'a', 'a', 'offline'),
('Haydz', 'a', 'a', 'a', 'a', 'offline'),
('test', 'test', 'test', 'test', 'test@test.com', 'offline'),
('tiddles', 'tyler1', 'Tyler', 'Bruin', 'tylerbruin@hotmail.com', 'offline');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
