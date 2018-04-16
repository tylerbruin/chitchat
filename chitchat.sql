-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 07, 2018 at 04:25 AM
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
CREATE DATABASE IF NOT EXISTS `chitchat` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `chitchat`;


CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  UNIQUE (username),
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `messages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `users` (`username`, `password`, `fname`, `lname`, `email`, `status`) VALUES
('tiddles', 'tyler1', 'Tyler', 'Bruin', 'tylerbruin@hotmail.com', 'offline');
INSERT INTO `users` (`username`, `password`, `fname`, `lname`, `email`, `status`) VALUES
('rosco', 'rosco1', 'Ross', 'Taylor', 'rosstaylor@gmail.com', 'offline');

INSERT INTO `messages` ( `content`, `username`) VALUES
('Why did the chicken cross the road? huh?', 'tiddles');
INSERT INTO `messages` ( `content`, `username`) VALUES
('Whats for dinner?', 'tiddles');
INSERT INTO `messages` ( `content`, `username`) VALUES
('Lets get KFC! :-D', 'tiddles');

INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('its the 22nd! lets get pizza!', 'tiddles', '2018-03-22 00:12:18');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('nah man, KFC!', 'Cory', '2018-03-22 00:12:19');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('Nah screw that!', 'tiddles', '2018-03-22 00:12:20');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('Im keen for whatever!', 'Haydz', '2018-03-22 00:12:25');


INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('How is the weather today?', 'Cory', '2018-03-21 00:17:18');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('its the 21st of March, its great!', 'tiddles', '2018-03-21 00:17:18');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('Awesome, see you later!', 'Cory', '2018-03-21 00:18:18');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('Ok!', 'tiddles', '2018-03-21 00:20:18');

INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('What is there to do in town on the 20th?', 'Haydz', '2018-03-20 00:06:18');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('KFC?', 'tiddles', '2018-03-20 00:06:19');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('Yeah, sounds good!', 'Haydz', '2018-03-20 00:06:19');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('See you guys there!', 'Cory', '2018-03-20 00:06:20');

INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('Hey team, what day is it?', 'Haydz', '2018-03-19 00:09:17');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('nvm, its the 19th, ha ha', 'Haydz', '2018-03-19 00:09:17');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('Is anyone else here?', 'Haydz', '2018-03-19 00:09:17');
INSERT INTO `messages` ( `content`, `username`, `datetime`) VALUES
('Hello??', 'Haydz', '2018-03-19 00:09:18');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
