-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 23, 2021 at 04:31 PM
-- Server version: 5.7.32-35-log
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbvggj1zydryd6`
--

-- --------------------------------------------------------

--
-- Table structure for table `deal`
--

CREATE TABLE `deal` (
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` text,
  `description` text,
  `status` enum('inactive','active') NOT NULL DEFAULT 'active',
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal`
--

INSERT INTO `deal` (`deal_id`, `user_id`, `name`, `address`, `description`, `status`, `created_at`) VALUES
(1, 1, 'Trevor Francis', 'Voluptas est numquam', 'Ipsam voluptas odit ', 'active', 1622183071),
(3, 8, 'tushar s patil', 'anmol chs plot no d-33 sec 12 kharghar', 'asd', 'active', 1622722162),
(4, 8, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'test task', 'active', 1622215690),
(5, 8, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'ds', 'active', 1622215817),
(6, 8, 'PHILIP TUSHAR', '5985 Western Run Drive', 'Newest deal testing', 'active', 1623254108),
(9, 8, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'test', 'active', 1622474055),
(10, 30, 'Dorothy Alvarado', 'Est accusamus perfer', 'In voluptatibus sit', 'active', 1622474253),
(12, 1, 'Virginia Anderson', 'Blanditiis facilis i', 'Impedit ex ullam cu', 'active', 1622811185),
(15, 1, 'Sydney Moon', 'Sed modi aut assumen', 'Nobis ab ullam conse', 'active', 1622546032),
(16, 32, 'John Doe', '452 Mount Carmel Rd, Timmonsville, SC 29161', 'Good farm house for sale', 'active', 1622558557),
(17, 8, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', '', 'active', 1622561959),
(18, 8, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', '', 'active', 1623252519),
(19, 33, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'testdata', 'active', 1622634334),
(20, 25, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'test', 'active', 1622635106),
(21, 34, 'New Deal', '345 Main St', 'Details', 'active', 1622638392),
(22, 2, 'Donovan Chamberson', '2031 Clipper Park Rd', '😲Client looking to buy house with a massive pool for massive pool parties? - Exclusively looking at 500-$750k massive houses - Large kitchen necessary  - W dope lounge ', 'active', 1624458997),
(23, 35, 'Phil DiMuro', '123 Main Street, Marlton NJ 08053', 'likes to sniff feet', 'active', 1622642036),
(25, 8, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'sample test data 😍😜 ', 'active', 1623079725),
(27, 39, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'test', 'active', 1622800389),
(28, 1, 'Nolan Shelton', 'Voluptatem nulla se', 'Nihil harum duis dol.👍', 'active', 1623072008),
(30, 1, 'tushar sanjay patil', 'kharghar navi mumbai', '', 'active', 1623817648),
(31, 8, 'Tsu', 'anmol chs plot no d-33 sec 12 kharghar', 'test', 'active', 1623160047),
(34, 19, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', '', 'active', 1623160386),
(35, 19, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'dfgh', 'active', 1623160415),
(36, 19, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'fghj', 'active', 1623160495),
(37, 21, 'John Smith (Job Relocation)', '123 Main Street, Somewhere, NJ 55555', 'Client:  John Smith (doctor).  Wife:  Sally Smith (nurse).  Met via call-in lead.  <br />\r\nJohn likes to be contacted via email only.  Sally likes to talk via text message.  They have a little baby - DO NOT call/contact after 8pm.', 'active', 1623755396),
(39, 47, 'shaoor', 'New York, NY, USA', 'This is my first test deal..😒', 'active', 1623209445),
(40, 47, 'shaoor test', 'test', 'this one is test for ', 'active', 1623239001),
(42, 50, 'New test', 'Baltimore, MD, USA', 'testdata', 'active', 1623251782),
(43, 50, 'New test', 'Baltimore, MD, USA', 'testdata', 'active', 1623251588),
(44, 50, 'testdata', 'Baltimore, MD, USA', 'test', 'active', 1623419539),
(53, 51, 'Kelly Campbell', '345 Saint Paul Street, Baltimore, MD, USA', 'asdf;lkjasdlfkj', 'active', 1623333193),
(54, 52, 'Shaoor Siddique', 'sdasdf', 'sadfasdfsadfasfasdfasdf', 'active', 1623338234),
(58, 9, 'Maverick Campbell', '2031 Clipper Park Rd, Apt 417', '', 'active', 1623428639),
(60, 13, 'New', '29 Miller Drive, Pocono Summit, PA, USA', '', 'active', 1623765563),
(61, 8, '14/06 test', 'Baltimore, MD, USA', '<br />Shs<br />testDSd', 'active', 1624024999),
(62, 1, 'test', 'San Francisco, CA, USA', 'this is test new line is <br />\r\nhere hy ', 'active', 1623743150),
(63, 13, 'New User Test', 'Baltimore', '', 'active', 1623765383),
(66, 5, 'Wilson McDermit (Downsizing)', '123 East Main Street, Marlton, NJ 08053, USA', 'Client is looking for a single storied home that he can enjoy in his retirement. Likes to be kept up to date with the current proceedings and prefers phone calls to any other type of communication. ', 'active', 1623764730),
(67, 13, 'Email', '29 Milton Avenue, Summit, NJ, USA', '', 'active', 1623764948),
(69, 5, 'Jen Mitchell (Relocating)', '726 North Patterson Park Avenue, Baltimore, MD, USA', 'Jen and her wife Clara are moving due to relocation. They do not enjoy all of the hassles of purchasing a home due to a number of fall-throughs on their last purchase. Prefer to stay in the loop and are okay with a quick text but would like to have phone calls for every major event in the process.<br /><br />If unreachable by the before mentioned, please email at jenmitchell@test.com', 'active', 1623768190),
(70, 91, 'ddf', 'DDF Commercial, East Rosedale Street, Fort Worth, TX, USA', 'sdfasfadf', 'active', 1623765788),
(71, 5, 'Ben Harper (Forever Home)', '234 Clark Avenue, Chelsea, MA, USA', 'Ben and his wife are looking to move into their forever home. Currently, they have two small children and are looking forward to living in one of the state’s leading school districts. Ben is taking the lead on communications for the purchase is available anytime before 7 pm. He also would appreciate a follow-up email to any voicemail you may leave him. <br /><br />As a side note the customers email is BHarpman@test.com', 'active', 1623768173),
(73, 91, 'Shaoor Siddique', 'sddd', 'sdfasfa', 'active', 1623765912),
(84, 9, 'Cole Barger', '453 Stillwater Drive, Pocono Summit, PA, USA', 'This is a test for deleting deals after inviting members. Looking for PHP error', 'active', 1623934969),
(85, 8, '17/06 test', '2036 Danforth Avenue, Toronto, ON, Canada', 'ttt😔❤️😍😒😳😜', 'active', 1624023061),
(89, 97, 'asddf', 'DDR Restaurant مطعم لذة المأكل, Anas Ibn Malik Road, Riyadh Saudi Arabia', 'dfafa', 'active', 1624026865),
(90, 122, '21/06 edited invite user task', 'Baltimore, MD, USA', 'test details', 'active', 1624286944),
(92, 123, 'Invited Member created deal', '234 North Franklintown Road, Baltimore, MD, USA', 'Inviting Tushar', 'active', 1624287309),
(93, 8, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'test', 'active', 1624288327),
(95, 8, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', 'test details', 'active', 1624371986),
(99, 124, 'Price Mcdowell', 'Quos quo voluptatibu', '<p>testtest</p><br /><p>test</p><br /><p>test</p>', 'active', 1624426446),
(100, 124, 'Raven Owen', 'Dolore illo error do', '<p>this is&nbsp;</p>\n<p>test</p>\n<p>is&nbsp;</p>\n<p>here</p>', 'active', 1624428232),
(101, 19, 'tushar sanjay patil', 'anmol chs plot no d-33 sec 12 kharghar', '😂asdad', 'active', 1624451433),
(102, 19, '23/06 test', 'Baltimore, MD, USA', '<p>test</p>', 'active', 1624451530),
(103, 9, 'Invite Outside Member Deal Test', '234 Holliday Street, Baltimore, MD, USA', 'Just making a few test on invite memebers.\n\n🤠\n\n🤨 😎', 'active', 1624458576);

-- --------------------------------------------------------

--
-- Table structure for table `deal_activity`
--

CREATE TABLE `deal_activity` (
  `activity_id` int(11) NOT NULL,
  `deal_id` int(11) DEFAULT NULL,
  `deal_activity_user_id` int(11) NOT NULL,
  `activity_description` text NOT NULL,
  `activity_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_activity`
--

INSERT INTO `deal_activity` (`activity_id`, `deal_id`, `deal_activity_user_id`, `activity_description`, `activity_time`) VALUES
(1, 1, 1, 'this is a test activity', 0),
(2, 1, 1, 'this is a test activity', 0);

-- --------------------------------------------------------

--
-- Table structure for table `deal_chat`
--

CREATE TABLE `deal_chat` (
  `chat_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `chat_invited_email` text COLLATE utf8mb4_bin NOT NULL,
  `chat_inviting_by` int(11) NOT NULL,
  `group_name` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `deal_chat`
--

INSERT INTO `deal_chat` (`chat_id`, `deal_id`, `chat_invited_email`, `chat_inviting_by`, `group_name`) VALUES
(7, 62, 'phil@foundersapproach.com', 1, 'Default'),
(8, 62, 'dave@foundersapproach.com', 1, 'Default'),
(9, 62, 'cole@foundersapproach.com', 1, 'Default'),
(10, 62, 'pynevivaza@mailinator.com', 1, 'Default'),
(11, 62, 'muhammadshaoor1707276@gmail.com', 1, 'Default'),
(12, 89, 'admin@reva.com', 97, 'Default'),
(13, 89, 'dave@foundersapproach.com', 97, 'Default'),
(14, 97, 'peba@mailinator.com|admin@reva.com', 124, 'Default'),
(15, 93, 'tushar@foundersapproach.com|patil.tushar2313@gmail.com', 8, 'Default'),
(16, 93, 'tushar@foundersapproach.com', 8, 'Default'),
(17, 22, 'cole@xeromedia.com', 2, 'Default'),
(18, 22, 'phil@looplemobile.com', 2, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `deal_invite_members`
--

CREATE TABLE `deal_invite_members` (
  `invite_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `invited_user_id` int(11) NOT NULL,
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_invite_members`
--

INSERT INTO `deal_invite_members` (`invite_id`, `deal_id`, `invited_user_id`, `created_at`) VALUES
(1, 1, 1, 1622183071),
(3, 4, 19, 1622215690),
(4, 5, 19, 1622215817),
(6, 8, 2, 1622234275),
(7, 8, 9, 1622234275),
(8, 9, 19, 1622474055),
(15, 16, 9, 1622558557),
(16, 16, 32, 1622558557),
(21, 7, 2, 1622575465),
(22, 7, 32, 1622575465),
(23, 7, 9, 1622575465),
(30, 21, 34, 1622638392),
(50, 3, 19, 1622722162),
(58, 27, 19, 1622800389),
(59, 27, 8, 1622800389),
(102, 25, 19, 1623079725),
(104, 25, 8, 1623079725),
(123, 31, 19, 1623160047),
(124, 31, 25, 1623160047),
(125, 31, 33, 1623160047),
(126, 31, 8, 1623160047),
(129, 31, 8, 1623160047),
(145, 34, 19, 1623160386),
(146, 34, 19, 1623160386),
(169, 29, 1, 1623169838),
(180, 38, 5, 1623206307),
(182, 39, 47, 1623209445),
(183, 39, 1, 1623209445),
(210, 40, 47, 1623239001),
(211, 40, 1, 1623239001),
(215, 40, 4, 1623239001),
(216, 40, 3, 1623239001),
(217, 40, 6, 1623239001),
(273, 13, 50, 1623251226),
(274, 13, 2, 1623251226),
(275, 13, 12, 1623251226),
(276, 13, 8, 1623251226),
(287, 18, 8, 1623252477),
(288, 18, 39, 1623252477),
(296, 6, 8, 1623254108),
(312, 45, 9, 1623257266),
(313, 45, 51, 1623257266),
(314, 48, 47, 1623299251),
(315, 48, 1, 1623299251),
(316, 48, 3, 1623299251),
(317, 49, 47, 1623299909),
(331, 50, 8, 1623328024),
(332, 50, 50, 1623328024),
(333, 51, 5, 1623332400),
(335, 51, 9, 1623332400),
(336, 52, 9, 1623332853),
(338, 52, 5, 1623332853),
(342, 53, 51, 1623333191),
(345, 54, 52, 1623338234),
(347, 55, 1, 1623408902),
(349, 56, 1, 1623415201),
(350, 56, 57, 1623415201),
(351, 57, 1, 1623416243),
(352, 57, 60, 1623416243),
(353, 44, 50, 1623419539),
(355, 44, 19, 1623419539),
(356, 44, 39, 1623419539),
(362, 58, 9, 1623428639),
(370, 11, 13, 1623677318),
(371, 11, 21, 1623677318),
(372, 11, 2, 1623677318),
(373, 59, 13, 1623678020),
(409, 37, 21, 1623755396),
(410, 37, 5, 1623755396),
(411, 37, 2, 1623755396),
(412, 37, 35, 1623755396),
(413, 37, 12, 1623755396),
(426, 14, 8, 1623763897),
(427, 14, 2, 1623763897),
(428, 64, 91, 1623764328),
(432, 65, 91, 1623764515),
(440, 66, 5, 1623764730),
(441, 66, 21, 1623764730),
(442, 66, 35, 1623764730),
(445, 67, 13, 1623764948),
(446, 67, 92, 1623764948),
(447, 67, 93, 1623764948),
(448, 63, 13, 1623765383),
(449, 63, 84, 1623765383),
(451, 60, 13, 1623765563),
(452, 68, 5, 1623765603),
(453, 68, 21, 1623765603),
(454, 68, 35, 1623765603),
(467, 73, 91, 1623765912),
(471, 71, 5, 1623768173),
(472, 71, 21, 1623768173),
(473, 71, 35, 1623768173),
(474, 71, 94, 1623768173),
(475, 69, 5, 1623768190),
(476, 69, 21, 1623768190),
(477, 69, 35, 1623768190),
(478, 69, 95, 1623768190),
(479, 74, 1, 1623814876),
(480, 74, 96, 1623814876),
(481, 75, 97, 1623816041),
(482, 76, 97, 1623817174),
(484, 30, 1, 1623817648),
(485, 30, 9, 1623817648),
(486, 30, 2, 1623817648),
(487, 30, 24, 1623817648),
(488, 30, 3, 1623817648),
(489, 30, 39, 1623817648),
(491, 30, 65, 1623817648),
(492, 30, 14, 1623817648),
(493, 30, 31, 1623817648),
(494, 30, 26, 1623817648),
(495, 78, 97, 1623826677),
(496, 78, 2, 1623826677),
(497, 79, 2, 1623839340),
(522, 81, 2, 1623842812),
(523, 81, 98, 1623842812),
(524, 81, 13, 1623842812),
(525, 81, 99, 1623842812),
(526, 81, 100, 1623842812),
(527, 81, 101, 1623842812),
(528, 81, 102, 1623842812),
(552, 82, 7, 1623846624),
(565, 24, 2, 1623847495),
(567, 24, 36, 1623847495),
(568, 24, 38, 1623847495),
(569, 24, 7, 1623847495),
(570, 24, 5, 1623847495),
(571, 83, 97, 1623908705),
(574, 84, 9, 1623934969),
(591, 85, 8, 1624023061),
(592, 85, 19, 1624023061),
(593, 85, 5, 1624023061),
(594, 85, 11, 1624023061),
(595, 61, 8, 1624024999),
(596, 61, 19, 1624024999),
(597, 89, 97, 1624026865),
(598, 89, 121, 1624026865),
(601, 90, 122, 1624286944),
(605, 92, 123, 1624287309),
(606, 92, 19, 1624287309),
(608, 93, 8, 1624288327),
(609, 93, 19, 1624288327),
(618, 95, 8, 1624371986),
(619, 95, 19, 1624371986),
(629, 99, 124, 1624426446),
(630, 100, 124, 1624428232),
(632, 101, 19, 1624451433),
(633, 101, 8, 1624451433),
(634, 102, 19, 1624451530),
(646, 103, 9, 1624458576),
(656, 22, 2, 1624458997),
(657, 22, 113, 1624458997),
(658, 22, 21, 1624458997);

-- --------------------------------------------------------

--
-- Table structure for table `deal_timeline_tasks`
--

CREATE TABLE `deal_timeline_tasks` (
  `deal_task_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `task_name` text NOT NULL,
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_timeline_tasks`
--

INSERT INTO `deal_timeline_tasks` (`deal_task_id`, `deal_id`, `task_name`, `created_at`) VALUES
(1, 1, 'Client Begins Process', 1622183071),
(2, 1, 'Home Tours', 1622183071),
(3, 1, 'Bank Loan Authorized', 1622183071),
(4, 1, 'Title Company Chosen', 1622183071),
(14, 4, 'Client Begins Process', 1622215690),
(15, 4, 'Home Tours', 1622215690),
(16, 4, 'Bank Loan Authorized', 1622215690),
(17, 4, 'Title Company Chosen', 1622215690),
(18, 5, 'Client Begins Process', 1622215817),
(19, 5, 'Home Tours', 1622215817),
(20, 5, 'Bank Loan Authorized', 1622215817),
(21, 5, 'Title Company Chosen', 1622215817),
(30, 8, 'Client Begins Process', 1622234275),
(31, 8, 'Home Tours', 1622234275),
(32, 8, 'Bank Loan Authorized', 1622234275),
(33, 8, 'Title Company Chosen', 1622234275),
(34, 9, 'Client Begins Process', 1622474055),
(35, 9, 'Home Tours', 1622474055),
(36, 9, 'Bank Loan Authorized', 1622474055),
(37, 9, 'Title Company Chosen', 1622474055),
(38, 9, 'test', 1622474055),
(39, 10, 'Client Begins Process', 1622474253),
(40, 10, 'Home Tours', 1622474253),
(41, 10, 'Bank Loan Authorized', 1622474253),
(42, 10, 'Title Company Chosen', 1622474253),
(59, 15, 'Client Begins Process', 1622546032),
(60, 15, 'Home Tours', 1622546032),
(61, 15, 'Bank Loan Authorized', 1622546032),
(62, 15, 'Title Company Chosen', 1622546032),
(63, 16, 'Client Begins Process', 1622558557),
(64, 16, 'Home Tours', 1622558557),
(65, 16, 'Bank Loan Authorized', 1622558557),
(66, 16, 'Title Company Chosen', 1622558557),
(67, 17, 'Client Begins Process', 1622561959),
(68, 17, 'Home Tours', 1622561959),
(69, 17, 'Bank Loan Authorized', 1622561959),
(70, 17, 'Title Company Chosen', 1622561959),
(87, 7, 'Client Begins Process', 1622575465),
(88, 7, 'Home Tours', 1622575465),
(89, 7, 'Bank Loan Authorized', 1622575465),
(90, 7, 'Title Company Chosen', 1622575465),
(96, 19, 'Client Begins Process', 1622634334),
(97, 19, 'Home Tours', 1622634334),
(98, 19, 'Bank Loan Authorized', 1622634334),
(99, 19, 'Title Company Chosen', 1622634334),
(100, 20, 'Client Begins Process', 1622635106),
(101, 20, 'Home Tours', 1622635106),
(102, 20, 'Bank Loan Authorized', 1622635106),
(103, 20, 'Title Company Chosen', 1622635106),
(108, 2, 'Client Begins Process', 1622637715),
(109, 2, 'Home Tours', 1622637715),
(110, 2, 'Bank Loan Authorized', 1622637715),
(111, 2, 'Title Company Chosen', 1622637715),
(120, 21, 'Client Begins Process', 1622638392),
(121, 21, 'Home Tours', 1622638392),
(122, 21, 'Bank Loan Authorized', 1622638392),
(123, 21, 'Title Company Chosen', 1622638392),
(140, 23, 'Client Begins Process', 1622642036),
(141, 23, 'Home Tours', 1622642036),
(142, 23, 'Bank Loan Authorized', 1622642036),
(143, 23, 'Title Company Chosen', 1622642036),
(152, 3, 'Client Begins Process', 1622722162),
(153, 3, 'Home Tours', 1622722162),
(154, 3, 'Bank Loan Authorized', 1622722162),
(155, 3, 'Title Company Chosen', 1622722162),
(185, 27, 'Client Begins Process', 1622800389),
(186, 27, 'Home Tours', 1622800389),
(187, 27, 'Bank Loan Authorized', 1622800389),
(188, 27, 'Title Company Chosen', 1622800389),
(189, 12, 'Client Begins Process', 1622811185),
(190, 12, 'Home Tours', 1622811185),
(191, 12, 'Bank Loan Authorized', 1622811185),
(192, 12, 'Title Company Chosen', 1622811185),
(234, 26, 'Client Begins Process', 1622831776),
(235, 26, 'Home Tours', 1622831776),
(236, 26, 'Bank Loan Authorized', 1622831776),
(237, 26, 'Title Company Chosen', 1622831776),
(242, 28, 'Client Begins Process', 1623072008),
(243, 28, 'Home Tours', 1623072008),
(244, 28, 'Bank Loan Authorized', 1623072008),
(245, 28, 'Title Company Chosen', 1623072008),
(266, 25, 'Client Begins Process', 1623079725),
(267, 25, 'Home Tours', 1623079725),
(268, 25, 'Bank Loan Authorized', 1623079725),
(269, 25, 'Title Company Chosen', 1623079725),
(294, 31, 'Client Begins Process', 1623160047),
(295, 31, 'Home Tours', 1623160047),
(296, 31, 'Bank Loan Authorized', 1623160047),
(297, 31, 'Title Company Chosen', 1623160047),
(298, 31, 'test', 1623160047),
(304, 32, 'Client Begins Process', 1623160145),
(305, 32, 'Home Tours', 1623160145),
(306, 32, 'Bank Loan Authorized', 1623160145),
(307, 32, 'Title Company Chosen', 1623160145),
(316, 34, 'Client Begins Process', 1623160386),
(317, 34, 'Home Tours', 1623160386),
(318, 34, 'Bank Loan Authorized', 1623160386),
(319, 34, 'Title Company Chosen', 1623160386),
(320, 35, 'Client Begins Process', 1623160415),
(321, 35, 'Home Tours', 1623160415),
(322, 35, 'Bank Loan Authorized', 1623160415),
(323, 35, 'Title Company Chosen', 1623160415),
(324, 35, 'dfgh', 1623160415),
(325, 36, 'Client Begins Process', 1623160495),
(326, 36, 'Home Tours', 1623160495),
(327, 36, 'Bank Loan Authorized', 1623160495),
(328, 36, 'Title Company Chosen', 1623160495),
(345, 29, 'Client Begins Process', 1623169838),
(346, 29, 'Home Tours', 1623169838),
(347, 29, 'Bank Loan Authorized', 1623169838),
(348, 29, 'Title Company Chosen', 1623169838),
(357, 38, 'Client Begins Process', 1623206307),
(358, 38, 'Home Tours', 1623206307),
(359, 38, 'Bank Loan Authorized', 1623206307),
(360, 38, 'Title Company Chosen', 1623206307),
(361, 39, 'Client Begins Process', 1623209445),
(362, 39, 'Home Tours', 1623209445),
(363, 39, 'Bank Loan Authorized', 1623209445),
(364, 39, 'Title Company Chosen', 1623209445),
(381, 40, 'Client Begins Process', 1623239001),
(382, 40, 'Home Tours', 1623239001),
(383, 40, 'Bank Loan Authorized', 1623239001),
(384, 40, 'Title Company Chosen', 1623239001),
(433, 13, 'Client Begins Process', 1623251226),
(434, 13, 'Home Tours', 1623251226),
(435, 13, 'Bank Loan Authorized', 1623251226),
(436, 13, 'Title Company Chosen', 1623251226),
(446, 43, 'Client Begins Process', 1623251588),
(447, 43, 'Home Tours', 1623251588),
(448, 43, 'Bank Loan Authorized', 1623251588),
(449, 43, 'Title Company Chosen', 1623251588),
(450, 43, 'testdata', 1623251588),
(451, 42, 'Client Begins Process', 1623251782),
(452, 42, 'Home Tours', 1623251782),
(453, 42, 'Bank Loan Authorized', 1623251782),
(454, 42, 'Title Company Chosen', 1623251782),
(459, 18, 'Client Begins Process', 1623252519),
(460, 18, 'Home Tours', 1623252519),
(461, 18, 'Bank Loan Authorized', 1623252519),
(462, 18, 'Title Company Chosen', 1623252519),
(491, 6, 'Client Begins Process', 1623254108),
(492, 6, 'Home Tours', 1623254108),
(493, 6, 'Bank Loan Authorized', 1623254108),
(494, 6, 'Title Company Chosen', 1623254108),
(511, 45, 'Client Begins Process', 1623257266),
(512, 45, 'Home Tours', 1623257266),
(513, 45, 'Bank Loan Authorized', 1623257266),
(514, 45, 'Title Company Chosen', 1623257266),
(515, 46, 'Client Begins Process', 1623260592),
(516, 46, 'Home Tours', 1623260592),
(517, 46, 'Bank Loan Authorized', 1623260592),
(518, 46, 'Title Company Chosen', 1623260592),
(519, 47, 'Client Begins Process', 1623260594),
(520, 47, 'Home Tours', 1623260594),
(521, 47, 'Bank Loan Authorized', 1623260594),
(522, 47, 'Title Company Chosen', 1623260594),
(523, 48, 'Client Begins Process', 1623299251),
(524, 48, 'Home Tours', 1623299251),
(525, 48, 'Bank Loan Authorized', 1623299251),
(526, 48, 'Title Company Chosen', 1623299251),
(527, 49, 'Client Begins Process', 1623299909),
(528, 49, 'Home Tours', 1623299909),
(529, 49, 'Bank Loan Authorized', 1623299909),
(530, 49, 'Title Company Chosen', 1623299909),
(544, 50, 'Client Begins Process', 1623328024),
(545, 50, 'Home Tours', 1623328024),
(546, 50, 'Bank Loan Authorized', 1623328024),
(547, 50, 'Title Company Chosen', 1623328024),
(548, 51, 'Client Begins Process', 1623332400),
(549, 51, 'Home Tours', 1623332400),
(550, 51, 'Bank Loan Authorized', 1623332400),
(551, 51, 'Title Company Chosen', 1623332400),
(552, 52, 'Client Begins Process', 1623332853),
(553, 52, 'Home Tours', 1623332853),
(554, 52, 'Bank Loan Authorized', 1623332853),
(555, 52, 'Title Company Chosen', 1623332853),
(564, 53, 'Client Begins Process', 1623333193),
(565, 53, 'Home Tours', 1623333193),
(566, 53, 'Bank Loan Authorized', 1623333193),
(567, 53, 'Title Company Chosen', 1623333193),
(568, 54, 'Client Begins Process', 1623338234),
(569, 54, 'Home Tours', 1623338234),
(570, 54, 'Bank Loan Authorized', 1623338234),
(571, 54, 'Title Company Chosen', 1623338234),
(572, 55, 'Client Begins Process', 1623408902),
(573, 55, 'Home Tours', 1623408902),
(574, 55, 'Bank Loan Authorized', 1623408902),
(575, 55, 'Title Company Chosen', 1623408902),
(576, 56, 'Client Begins Process', 1623415201),
(577, 56, 'Home Tours', 1623415201),
(578, 56, 'Bank Loan Authorized', 1623415201),
(579, 56, 'Title Company Chosen', 1623415201),
(580, 57, 'Client Begins Process', 1623416243),
(581, 57, 'Home Tours', 1623416243),
(582, 57, 'Bank Loan Authorized', 1623416243),
(583, 57, 'Title Company Chosen', 1623416243),
(584, 44, 'Client Begins Process', 1623419539),
(585, 44, 'Home Tours', 1623419539),
(586, 44, 'Bank Loan Authorized', 1623419539),
(587, 44, 'Title Company Chosen', 1623419539),
(596, 58, 'Client Begins Process', 1623428639),
(597, 58, 'Home Tours', 1623428639),
(598, 58, 'Bank Loan Authorized', 1623428639),
(599, 58, 'Title Company Chosen', 1623428639),
(616, 11, 'Client Begins Process', 1623677318),
(617, 11, 'Home Tours', 1623677318),
(618, 11, 'Bank Loan Authorized', 1623677318),
(619, 11, 'Title Company Chosen', 1623677318),
(620, 59, 'Client Begins Process', 1623678020),
(621, 59, 'Home Tours', 1623678020),
(622, 59, 'Bank Loan Authorized', 1623678020),
(623, 59, 'Title Company Chosen', 1623678020),
(657, 62, 'Client Begins Process', 1623743150),
(658, 62, 'Home Tours', 1623743150),
(659, 62, 'Bank Loan Authorized', 1623743150),
(660, 62, 'Title Company Chosen', 1623743150),
(681, 37, 'Client Begins Process', 1623755396),
(682, 37, 'Home Tours', 1623755396),
(683, 37, 'Bank Loan Authorized', 1623755396),
(684, 37, 'Title Company Chosen', 1623755396),
(689, 33, 'Client Begins Process', 1623763798),
(690, 33, 'Home Tours', 1623763798),
(691, 33, 'Bank Loan Authorized', 1623763798),
(692, 33, 'Title Company Chosen', 1623763798),
(693, 14, 'Client Begins Process', 1623763897),
(694, 14, 'Home Tours', 1623763897),
(695, 14, 'Bank Loan Authorized', 1623763897),
(696, 14, 'Title Company Chosen', 1623763897),
(697, 64, 'Client Begins Process', 1623764328),
(698, 64, 'Home Tours', 1623764328),
(699, 64, 'Bank Loan Authorized', 1623764328),
(700, 64, 'Title Company Chosen', 1623764328),
(705, 65, 'Client Begins Process', 1623764515),
(706, 65, 'Home Tours', 1623764515),
(707, 65, 'Bank Loan Authorized', 1623764515),
(708, 65, 'Title Company Chosen', 1623764515),
(717, 66, 'Client Begins Process', 1623764730),
(718, 66, 'Home Tours', 1623764730),
(719, 66, 'Bank Loan Authorized', 1623764730),
(720, 66, 'Title Company Chosen', 1623764730),
(725, 67, 'Client Begins Process', 1623764948),
(726, 67, 'Home Tours', 1623764948),
(727, 67, 'Bank Loan Authorized', 1623764948),
(728, 67, 'Title Company Chosen', 1623764948),
(729, 63, 'Client Begins Process', 1623765383),
(730, 63, 'Home Tours', 1623765383),
(731, 63, 'Bank Loan Authorized', 1623765383),
(732, 63, 'Title Company Chosen', 1623765383),
(733, 60, 'Client Begins Process', 1623765563),
(734, 60, 'Home Tours', 1623765563),
(735, 60, 'Bank Loan Authorized', 1623765563),
(736, 60, 'Title Company Chosen', 1623765563),
(737, 68, 'Client Begins Process', 1623765603),
(738, 68, 'Home Tours', 1623765603),
(739, 68, 'Bank Loan Authorized', 1623765603),
(740, 68, 'Title Company Chosen', 1623765603),
(745, 70, 'Client Begins Process', 1623765788),
(746, 70, 'Home Tours', 1623765788),
(747, 70, 'Bank Loan Authorized', 1623765788),
(748, 70, 'Title Company Chosen', 1623765788),
(757, 72, 'Client Begins Process', 1623765910),
(758, 72, 'Home Tours', 1623765910),
(759, 72, 'Bank Loan Authorized', 1623765910),
(760, 72, 'Title Company Chosen', 1623765910),
(761, 73, 'Client Begins Process', 1623765912),
(762, 73, 'Home Tours', 1623765912),
(763, 73, 'Bank Loan Authorized', 1623765912),
(764, 73, 'Title Company Chosen', 1623765912),
(769, 71, 'Client Begins Process', 1623768173),
(770, 71, 'Home Tours', 1623768173),
(771, 71, 'Bank Loan Authorized', 1623768173),
(772, 71, 'Title Company Chosen', 1623768173),
(773, 69, 'Client Begins Process', 1623768190),
(774, 69, 'Home Tours', 1623768190),
(775, 69, 'Bank Loan Authorized', 1623768190),
(776, 69, 'Title Company Chosen', 1623768190),
(777, 74, 'Client Begins Process', 1623814876),
(778, 74, 'Home Tours', 1623814876),
(779, 74, 'Bank Loan Authorized', 1623814876),
(780, 74, 'Title Company Chosen', 1623814876),
(781, 75, 'Client Begins Process', 1623816041),
(782, 75, 'Home Tours', 1623816041),
(783, 75, 'Bank Loan Authorized', 1623816041),
(784, 75, 'Title Company Chosen', 1623816041),
(785, 76, 'Client Begins Process', 1623817174),
(786, 76, 'Home Tours', 1623817174),
(787, 76, 'Bank Loan Authorized', 1623817174),
(788, 76, 'Title Company Chosen', 1623817174),
(789, 30, 'Client Begins Process', 1623817648),
(790, 30, 'Home Tours', 1623817648),
(791, 30, 'Bank Loan Authorized', 1623817648),
(792, 30, 'Title Company Chosen', 1623817648),
(793, 77, 'Client Begins Process', 1623818447),
(794, 77, 'Home Tours', 1623818447),
(795, 77, 'Bank Loan Authorized', 1623818447),
(796, 77, 'Title Company Chosen', 1623818447),
(797, 78, 'Client Begins Process', 1623826677),
(798, 78, 'Home Tours', 1623826677),
(799, 78, 'Bank Loan Authorized', 1623826677),
(800, 78, 'Title Company Chosen', 1623826677),
(801, 79, 'Client Begins Process', 1623839340),
(802, 79, 'Home Tours', 1623839340),
(803, 79, 'Bank Loan Authorized', 1623839340),
(804, 79, 'Title Company Chosen', 1623839340),
(809, 80, 'Client Begins Process', 1623839427),
(810, 80, 'Home Tours', 1623839427),
(811, 80, 'Bank Loan Authorized', 1623839427),
(812, 80, 'Title Company Chosen', 1623839427),
(833, 81, 'Client Begins Process', 1623842812),
(834, 81, 'Home Tours', 1623842812),
(835, 81, 'Bank Loan Authorized', 1623842812),
(836, 81, 'Title Company Chosen', 1623842812),
(861, 82, 'Client Begins Process', 1623846624),
(862, 82, 'Home Tours', 1623846624),
(863, 82, 'Bank Loan Authorized', 1623846624),
(864, 82, 'Title Company Chosen', 1623846624),
(881, 24, 'Client Begins Process', 1623847495),
(882, 24, 'Home Tours', 1623847495),
(883, 24, 'Bank Loan Authorized', 1623847495),
(884, 24, 'Title Company Chosen', 1623847495),
(885, 83, 'Client Begins Process', 1623908705),
(886, 83, 'Home Tours', 1623908705),
(887, 83, 'Bank Loan Authorized', 1623908705),
(888, 83, 'Title Company Chosen', 1623908705),
(893, 84, 'Client Begins Process', 1623934969),
(894, 84, 'Home Tours', 1623934969),
(895, 84, 'Bank Loan Authorized', 1623934969),
(896, 84, 'Title Company Chosen', 1623934969),
(897, 41, 'Client Begins Process', 1623937835),
(898, 41, 'Home Tours', 1623937835),
(899, 41, 'Bank Loan Authorized', 1623937835),
(900, 41, 'Title Company Chosen', 1623937835),
(917, 86, 'Client Begins Process', 1624017533),
(918, 86, 'Home Tours', 1624017533),
(919, 86, 'Bank Loan Authorized', 1624017533),
(920, 86, 'Title Company Chosen', 1624017533),
(925, 87, 'Client Begins Process', 1624019483),
(926, 87, 'Home Tours', 1624019483),
(927, 87, 'Bank Loan Authorized', 1624019483),
(928, 87, 'Title Company Chosen', 1624019483),
(929, 88, 'Client Begins Process', 1624019916),
(930, 88, 'Home Tours', 1624019916),
(931, 88, 'Bank Loan Authorized', 1624019916),
(932, 88, 'Title Company Chosen', 1624019916),
(933, 85, 'Client Begins Process', 1624023061),
(934, 85, 'Home Tours', 1624023061),
(935, 85, 'Bank Loan Authorized', 1624023061),
(936, 85, 'Title Company Chosen', 1624023061),
(937, 61, 'Client Begins Process', 1624024999),
(938, 61, 'Home Tours', 1624024999),
(939, 61, 'Bank Loan Authorizedgdf', 1624024999),
(940, 61, 'jgyy', 1624024999),
(941, 61, 'i.uhu', 1624024999),
(942, 89, 'Client Begins Process', 1624026865),
(943, 89, 'Home Tours', 1624026865),
(944, 89, 'Bank Loan Authorized', 1624026865),
(945, 89, 'Title Company Chosen', 1624026865),
(951, 90, 'Client Begins Process', 1624286944),
(952, 90, 'Home Tours', 1624286944),
(953, 90, 'Bank Loan Authorized', 1624286944),
(954, 90, 'Title Company Chosen', 1624286944),
(955, 91, 'Client Begins Process', 1624287144),
(956, 91, 'Home Tours', 1624287144),
(957, 91, 'Bank Loan Authorized', 1624287144),
(958, 91, 'Title Company Chosen', 1624287144),
(959, 91, 'test', 1624287144),
(960, 92, 'Client Begins Process', 1624287309),
(961, 92, 'Home Tours', 1624287309),
(962, 92, 'Bank Loan Authorized', 1624287309),
(963, 92, 'Title Company Chosen', 1624287309),
(968, 93, 'Client Begins Process', 1624288327),
(969, 93, 'Home Tours', 1624288327),
(970, 93, 'Bank Loan Authorized', 1624288327),
(971, 93, 'Title Company Chosen', 1624288327),
(977, 94, 'Client Begins Process', 1624371333),
(978, 94, 'Home Tours', 1624371333),
(979, 94, 'Bank Loan Authorized', 1624371333),
(980, 94, 'Title Company Chosen', 1624371333),
(985, 96, 'Client Begins Process', 1624371859),
(986, 96, 'Home Tours', 1624371859),
(987, 96, 'Bank Loan Authorized', 1624371859),
(988, 96, 'Title Company Chosen', 1624371859),
(989, 95, 'Client Begins Process', 1624371986),
(990, 95, 'Home Tours', 1624371986),
(991, 95, 'Bank Loan Authorized', 1624371986),
(992, 95, 'Title Company Chosen', 1624371986),
(1001, 98, 'Client Begins Process', 1624424601),
(1002, 98, 'Home Tours', 1624424601),
(1003, 98, 'Bank Loan Authorized', 1624424601),
(1004, 98, 'Title Company Chosen', 1624424601),
(1009, 97, 'Client Begins Process', 1624426400),
(1010, 97, 'Home Tours', 1624426400),
(1011, 97, 'Bank Loan Authorized', 1624426400),
(1012, 97, 'Title Company Chosen', 1624426400),
(1013, 99, 'Client Begins Process', 1624426446),
(1014, 99, 'Home Tours', 1624426446),
(1015, 99, 'Bank Loan Authorized', 1624426446),
(1016, 99, 'Title Company Chosen', 1624426446),
(1017, 100, 'Client Begins Process', 1624428232),
(1018, 100, 'Home Tours', 1624428232),
(1019, 100, 'Bank Loan Authorized', 1624428232),
(1020, 100, 'Title Company Chosen', 1624428232),
(1026, 101, 'Client Begins Process', 1624451433),
(1027, 101, 'Home Tours', 1624451433),
(1028, 101, 'Bank Loan Authorized', 1624451433),
(1029, 101, 'Title Company Chosen', 1624451433),
(1030, 102, 'Client Begins Process', 1624451530),
(1031, 102, 'Home Tours', 1624451530),
(1032, 102, 'Bank Loan Authorized', 1624451530),
(1033, 102, 'Title Company Chosen', 1624451530),
(1034, 102, 'test', 1624451530),
(1051, 103, 'Client Begins Process', 1624458576),
(1052, 103, 'Home Tours', 1624458576),
(1053, 103, 'Bank Loan Authorized', 1624458576),
(1054, 103, 'Title Company Chosen', 1624458576),
(1063, 22, 'Client Begins Process', 1624458997),
(1064, 22, 'Home Tours', 1624458997),
(1065, 22, 'Bank Loan Authorized', 1624458997),
(1066, 22, 'Title Company Chosen', 1624458997);

-- --------------------------------------------------------

--
-- Table structure for table `general_tasks`
--

CREATE TABLE `general_tasks` (
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_name` text NOT NULL,
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `general_tasks`
--

INSERT INTO `general_tasks` (`task_id`, `user_id`, `task_name`, `created_at`) VALUES
(1, 1, 'Client Begins Process', 0),
(2, 1, 'Home Tours', 0),
(3, 1, 'Bank Loan Authorized', 0),
(4, 1, 'Title Company Chosen', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(60) DEFAULT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'No Profile',
  `company` varchar(200) NOT NULL DEFAULT 'No Company',
  `email_encrypt` text NOT NULL,
  `salt_email` text NOT NULL,
  `password` text NOT NULL,
  `salt_pass` text NOT NULL,
  `user_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `name`, `email`, `contact`, `profile`, `company`, `email_encrypt`, `salt_email`, `password`, `salt_pass`, `user_status`, `created_at`) VALUES
(1, 1, 'admin reva', 'admin@reva.com', '(123) 456 - 8789', 'assets/profiles/1/bastien-nvs-qMenUAPuq-A-unsplash.jpg', '', 'dmRxTGE1SE10REl0S3FWbWtadXE0dz09', '5476511019083864', 'a0E3TE5haHh5ZkF5MDUrdGgya0hrZz09', '4157329371165522', 'active', 1624011418),
(2, 2, 'Phil', 'phil@foundersapproach.com', '(031) 217 - 0012', 'assets/profiles/2/10540922_10203374452356142_7514814473571667748_n.jpg', '', 'MVVrV0NzUDRFQlM1aW9Ub2hHNDBhZ25KUFVqWHIvQ0pQTXNPRWRZNmJHZz0=', '684158343105603', 'TVpNblZWMkdybXlRWVZwYmtjUkVOZz09', '763032587044646', 'active', 1624459133),
(3, 5, 'Dave', 'dave@foundersapproach.com', '(397)865-2156', 'No Profile', 'No Company', 'TUpTcWNON2RmSHNncEJ1OWNuVFB5Z01kcXpkdzlaVzNPcE12Nkd4ZGlwST0=', '6161475702358480', 'VTJqVlIwWlpvendsWWtISG9LTTl2Zz09', '0186782360284383', 'active', 1620802118),
(4, 8, 'Cole', 'cole@foundersapproach.com', '(589)645-8712', 'No Profile', 'No Company', 'UmtvcWF4Tm91VkV4ZExLMVIyTTRpOFF6TGRHMzkxVm9NYndLMmtwc2kyND0=', '955632418314092', 'VFByN3dJMWZJUVVuNFFOQjV6MnU0dz09', '950042018191615', 'active', 1620802161),
(5, 5, 'Hunter FA', 'hunter@foundersapproach.com', '(397)865-2156', 'No Profile', 'No Company', 'dFJLVEF6U3RybmxvcFJmNk5SWFRzRjJycUdCTzkyZmM2TlVnRVUzMCtYaz0=', '115156911742500', 'bHl5Q0wrTk9nemNqWU05bUowV2ZtZz09', '112070714675680', 'active', 1623257105),
(6, 9, 'Kate', 'kat@foundersapproach.com', '(397)865-2156', 'No Profile', 'No Company', 'cE1KTURjT09aOFY1ekJ3UGlCSkpWOHpUS0FpUDdPbjlkLzVxamxac2lEWT0=', '0136630594390061', 'WHdFRlBYTkZya204SEkzZGZsL3ViZz09', '608063595604073', 'active', 1620802230),
(7, 6, 'Hunter R Campbell', 'hunter1@foundersapproach.com', '(029)840-9283', 'No Profile', 'No Company', 'OWduMGREa2ZNSkFmdFBFUjQxb1ZGdGw5R2Y0amZ0SmJxMUs0K3RhWno0ND0=', '384746347214561', 'WjBxemFzdDIvTzFwaFNSNTdsbTZLZz09', '753632064174439', 'active', 1623847004),
(8, 7, 'tusharpatil', 'tushar@foundersapproach.com', '', 'assets/profiles/8/CA13D0BF-342D-42C0-A256-8948C7A5372E.jpeg', '', 'Mm9pZCtSRnJEdEVhd1BadUhhM1B1d3g3cGxlTThIa3NCcHpYWStqNEtqbz0=', '8411285115345710', 'K0R2aDJ4NHkrUlozZUMvSlVQcktMQT09', '6312739422059263', 'active', 1623252224),
(9, 3, 'Campbehr', 'campbehr2009@gmail.com', '(234)234-2341', 'assets/profiles/9/isis-franca-4uZXCWaseNE-unsplash.jpg', 'No Company 1', 'WGZsVXVVa0ZXSWptdnB1Z2JnWVBuZGZOc25OYnFQTnJtQXVXTUVWeGRiND0=', '0227081138844626', 'ZEdWYmtVakEyUDJJY2RZMUQxQzFhdz09', '3714537915343261', 'active', 1623257067),
(11, 2, 'John Doe', 'hunter12@foundersapproach.com', '(123)123-1231', 'No Profile', 'No Company', 'NjkxTS9RWUlFbHRwMlFuWCtmRW00b3lqT2szeWhWdkw2WXpuL3BJZVJOQT0=', '8964016116881518', 'TG1mZ3hFd083RDk2SkVycG9OL3lEQT09', '0562481160701112', 'active', 1621354246),
(12, 2, 'PHILIP DIMURO', 'Philip.a.dimuro@gmail.com', '(484)941-4821', 'No Profile', 'No Company', 'cDhEdjM1ZEdKYysrOHZVUWc3SEliMDNRblhsMDM4SUN0Z0dlcUdDRFNVQT0=', '611511518913198', 'ODdlY1I5ckEwU2ZJUDBRbFpMYWVqZz09', '1811741911614756', 'active', 1621354271),
(13, 2, 'Philip DiMuro', 'phil1@foundersapproach.com', '(443)961-4624', 'assets/profiles/13/10540922_10203374452356142_7514814473571667748_n.jpg', 'No Company', 'YmF5bVlXR1dmZWh2RXo2aE8rSjRBSEdtaEFGeVRMU1pZL1lheTZuRTlaRT0=', '131101615126200', 'N3Zoc3daaHFaZlcxS2tDM2RPS1MyQT09', '267813220909691', 'active', 1623169871),
(14, 2, 'Idona Jones', 'piryluse@mailinator.com', '(031)245-6789', 'No Profile', 'No Company', 'dU44aG50M1l2eTdDVlo0clZEQnFNTEhZUk9Mc0t2MmRhRE1ZVTh2SlgvST0=', '1973620303808035', 'L1QvVHNodUpVWkFXT0FtZ0d3Z2M3QT09', '6080036928106455', 'active', 1621405808),
(15, 1, 'Cassandra Summers', 'ralib@mailinator.com', '(031)245-6789', 'No Profile', 'No Company', 'Zit1Y1dRVTR1VEdHcmxUSk9JdkV2c3JsV1hvcmR6ZVBXdWJuU3FaYkRsdz0=', '1808449188961017', 'ZDhmeVZPRWN4bnpaTlJCVnRJOVRwQT09', '4113409088980184', 'active', 1621412088),
(16, 9, 'Chet Ubetcha', 'Chet@ubetcha.com', '(092)834-0928', 'No Profile', 'No Company', 'dUtpMDVHSXBwWDN6UkZUOU1GQ1kydjFINTFacm5QSlBoaU5TY3RMQklRND0=', '5045621153914351', 'THlmZ2FoUnpzSFhxV3pRUlpzVHl6Zz09', '5280751135261543', 'active', 1621428955),
(17, 3, 'Ian Wiggins', 'mykisyt@mailinator.com', '(031)245-6789', 'assets/profiles/17/image_2.png', 'No Company', 'anpuYUt2ZVVCRmhBYzFUeHU5MW1NMWN4b2FXbUowQ0p4cjNvNGRzY0Nrcz0=', '4018109408047760', 'OWpuVkFYelgvczZTemhCVFV5Zm1mUT09', '3716029482119049', 'active', 1622011219),
(18, 8, 'Hunter Test Email', 'huntertestemail@email.com', '(234)234-2342', 'assets/profiles/18/cory-rogers-6l4CBNleEBE-unsplash.jpg', 'No Company', 'dE13V1JBUnUwTmp2MlBYc2cyRW83dW5JUkpudWsrVkhHeFhZS1Q2TTdxST0=', '770524504412841', 'QUtXWnFZWjNWWllVYVBMendMRXZpZz09', '681465078196429', 'active', 1622038847),
(19, 2, 'Tushar', 'patil.tushar2313@gmail.com', '(123)456-7891', 'assets/profiles/19/tush.JPG', 'No Company', 'eDdYTFdtOGZmbkhhUFhiRTE0TXo3bHpib3A0bkVldkNvRDdjemdBcXY3OD0=', '314305534371064', 'R3BkNkE5NW9RRWlxWnlhWW9WZWNiZz09', '454261283142255', 'active', 1622040893),
(20, 1, 'Hunter Testing Again', 'huntertestagain@test.com', '(234)234-2342', 'assets/profiles/20/cory-rogers-6l4CBNleEBE-unsplash.jpg', 'No Company', 'aDhaS21NRVoveFFZMDhVdnRrTUpLeTZ3WEY1bW02eHM4dTh0Z2xoa0NCdz0=', '1120138590320572', 'c0R5TWgrTGU0V0pBNmcrejJyRmlzUT09', '210303271143921', 'active', 1622067810),
(21, 8, 'Phil Seller', 'phil@looplemobile.com', '(484)941-4821', 'assets/profiles/21/Cosmic_1.jpg', 'No Company', 'NUhycDFaOERsMzN5RERXWU1zTWNpeVcrK0RRY3Vsa3B2MzNDbmVnd0FjZz0=', '6690710063312700', 'UTZiVWVTV1phaVIzSlMxVXpoSytKdz09', '465236022536478', 'active', 1623169809),
(22, 8, 'Sandra Knapp', 'celasifup@mailinator.com', '(031)245-6789', 'assets/profiles/22/image_3.png', 'No Company', 'a0NubGVMelF3Z25rWHViTjdOUVVrMTRwRkpyK3V0bmVWOGVVemdRTkQrND0=', '600596244963199', 'WHNiOE1mM2ZwQWx6QnNPbFNvVlV3UT09', '806606361036764', 'active', 1622097973),
(23, 3, 'teamtest', 'teamtest@test.com', '(234)234-2342', 'No Profile', 'FA', 'RGhiU1RlWmFjdytSREJEcXRQMmJPalNtenVUOGZzbUxNSVZVeTdJT1Uycz0=', '3300793354778711', 'M2dSSU83WUdVeXEyMVBEM0h4UWIrUT09', '1347413152356425', 'active', 1622126137),
(24, 3, 'Lance Murphy', 'nebej@mailinator.com', '', 'No Profile', '', 'TTNudjl6MFRCZEN5dFFWdzVoN1FlZ2FQK1hWVGVjN09KbFZLRlgzdTBYOD0=', '7063301815147937', 'SGRSUGpGUDV3S0ZTcGJlZ3h6MTZLdz09', '613817837473106', 'active', 1622173651),
(25, 2, 'Tushar', 'mepatil4241@gmail.com', '(767)800-4241', 'No Profile', 'spy', 'eGcreTlxdXVlL0lIVU53M1ZES3FBMlp3c1d3Rjk0a295bG9TRndNNGdZWT0=', '111381944567457', 'd1p0eTZOejZlUkRsZ3lUTFgyOFdrZz09', '1160441659754831', 'active', 1622217374),
(26, 3, 'Mark', 'mark@gmail.com', '(484)941-4821', 'No Profile', 'MARK LLC', 'OFk4eE5vWUVvUXByV3JZUjZNejUvQT09', '035061064912001', 'eUM1R2k3VDROYnpIUmljZjR5bTg2QT09', '302726088305816', 'active', 1622232016),
(27, 4, 'Virginia Forbes', 'gecejed@mailinator.com', '(031)245-6789', 'No Profile', 'Henry and Perkins LLC', 'T2dtckFNT1AwS25pa01HTWVCOW1xWkM4aTdaOWNtdGhwYm81OGd6aTRwTT0=', '982621167244191', 'emMybCtwdjE1bWQrT3dJejRpMjhDQT09', '614276711293193', 'active', 1622461576),
(28, 1, 'wirginia Franklin', 'kipilywab@mailinator.com', '(031)245-6789', 'No Profile', 'Calhoun Velez LLC', 'Zld6OHZPS2tvaWtHOFdUZUc0TWJHVjVENkRnc0JVa2xpRVdJK21qU2R4bz0=', '312950034115079', 'c2ovb1I4OUJoN0V6ak1tcmlEeWk4dz09', '111363071310417', 'active', 1622461623),
(29, 8, 'Lois Solis', 'samarac@mailinator.com', '(031)245-6789', 'No Profile', 'Merrill and Conner Traders', 'dDdaenkzQ056S0FoV29ZSjFKV2pRWjRPQS9RYnZzYzg2YldER0VPeHBLcz0=', '536116561172664', 'Q2NuUHY3VVNFbVFVV3ZRYzAzc0ttQT09', '8951712151396134', 'active', 1622462031),
(30, 1, 'tareth Walters', 'pynevivaza@mailinator.com', '(031)245-6789', 'No Profile', 'Mccarty and Fischer Associates', 'U3hQaDlLVGI5LzRKc3BIZWU2bE9abjg0aWN0SlFleFZpWTJwSWlhUnFoVT0=', '7011051732268617', 'MnRNekNSWlg1a3BWNUhGa2E1bVRRZz09', '1525049152177226', 'active', 1622474222),
(31, 7, 'Ingrid Odonnell', 'gyxakybo@mailinator.com', '(031)245-6789', 'assets/profiles/31/bg1.png', 'Carver Reyes Plc', 'YzgzZFE1elI4M1lmcTFCNzBrR2hhYitwYURrNjRXZXFFeXYyNDhXamdrVT0=', '5130721105130564', 'QlBkU25qMGFMUXVJeUpGWDFFZVpCdz09', '0035555311562021', 'active', 1622527553),
(32, 0, 'Benedict Cumberbatch', 'benedictcumberbatch@bc.com', '(949)485-8498', 'assets/profiles/32/ibrahim-rifath-OApHds2yEGQ-unsplash.jpg', '', 'NHY5d3I1UkErSU9hdjVUVWxIYlFYT0hjazlyMkk4TnhTSWFtOCt1WG55TT0=', '6318512218333241', 'bHUzRDdCLzYzN3RDc2lacDFBR1U2QT09', '645133154483150', 'active', 1622557995),
(33, 3, 'Tushar', 'mipatil4241@gmail.com', '(767)800-4241', 'assets/profiles/33/tush.JPG', 'india', 'enhXeVpuKzJQV2tWWUh5OGNxYlNuK2MzOU0xcUIxM3VmSXVNN09IaWVqQT0=', '642741401033323', 'czdMUXNMMzJvd1NUUVRHL2txaVB1dz09', '132444817522140', 'active', 1622634272),
(34, 0, 'Hunter Test', 'huntertest@test.com', '', 'No Profile', '', 'WS91UHVHRnpPM0VBM1pVdE9CL3k1Qk9JSFRjU2xtaWFnOEMzVCt6dUdCQT0=', '3295101221359364', 'bzU1QTQ3bE82V3RqNEdTczlXKzNSdz09', '6817201415410097', 'active', 1622638269),
(35, 5, 'Brian McGroarty', 'reva.alpha@gmail.com', '(856)366-8097', 'assets/profiles/35/brian_headshot.jpg', 'CoreTitle', 'STBGQm5LTWlNUnEwUVBhR3V1QWNXUWtSNkp2cXd0NXdQaG4vTHRaMWlyTT0=', '8111953596343531', 'czgzMzVPUjF4YjFqQ1hTdlZsYm9odz09', '1928399461143147', 'active', 1622641918),
(36, 1, 'John Smith', 'johnsmith@test.com', '(123)456-7890', 'assets/profiles/36/marco-w-397245-unsplash.jpg', '', 'U3BvajNKTUtKbkF4ZUVQMVJIWEQvOEZvTHdHcXFFZWNpOUREUmp1bjBDdz0=', '2206176561221423', 'YjRaSy85bUdhN2phaXZDT1k4MkJ1dz09', '174453161605294', 'active', 1622654056),
(37, 1, 'Sarah Smith', 'sarahsmith@test.com', '(123)234-3456', 'assets/profiles/37/joe-gardner-74378-unsplash.jpg', 'n/a', 'OUMwVnFRUnJ1ZmRTai9ta1A2U3ZiWWJwT0MzbjlhNk1YRUxvS0hqMTZlZz0=', '177541107167944', 'QVJYbmlzRG1jSEU4QTNsbkRyZkR1Zz09', '576080645521118', 'active', 1622654177),
(38, 1, 'Sally Smith', 'sallysmith@test.com', '(098)435-0982', 'assets/profiles/38/joe-gardner-74378-unsplash.jpg', '', 'L3d1Q05paTNCS25GRkhIbmlVUkpZc3NnUFpHTkpmQlZmNVJqVjNoQ0dyZz0=', '074226104882982', 'aytmVFJFQ2piUzEraE9ETnl5VWVUdz09', '081066302181251', 'active', 1622664492),
(39, 3, 'Tushar', 'tusharpatil@gmail.com', '(767)800-4241', 'assets/profiles/39/me.JPG', 'Spy', 'UDFQaUNpSEJ1RStteG9BR1BpZkdMRkZLTFNjR21BbDhhQys2Mlc3WnNsRT0=', '2229140937598014', 'eE4zdWtPSjFyMWhUalh2ai9xbzh1QT09', '9405060315153189', 'active', 1622799663),
(40, 1, 'Beth Arnold', 'betharnold@test.com', '(092)384-0820', 'No Profile', '', 'LzZML3NyUFpIL1k4dWxhd1NIRW56dzhsZkgyK0RUSE96dVVGUDg0NWhYTT0=', '520811385272765', 'RHFHSVRrcTJVVnViNDB2OFVsNmVjQT09', '4057600026157668', 'active', 1622819278),
(41, 6, 'Whitney Washington', 'hocofyjon@mailinator.com', '(031)245-6789', 'assets/profiles/41/xps-Qrjx2nTBHVo-unsplash.jpg', 'Rivers Schroeder Co', 'VkF0VGVqMHBWZlBpYkozVndpZlJtWHVhOEx5Y3dEQ3gyL21EcHlPb0h1ND0=', '2327299771779411', 'WVBUL2NIYWFwSWpCZ0VnK04za2pjZz09', '879222217334351', 'active', 1623073767),
(42, 3, 'Tushar', 'tus@gmail.com', '(767)800-4241', 'assets/profiles/42/ICONA-Vulcano-Interior-4K-UHD-Wallpaper.jpg', 'test', 'TnBEK0FxdVhJN3hDamRNcDVsaEVuUT09', '5131376851950209', 'cm5aVDdJTFEzZVVNQW9KanlYdkVsUT09', '1305710050113075', 'active', 1623078231),
(43, 5, 'test', 'test@foundersapproach.com', '(767)004-2414', 'No Profile', 'test', 'MGw0dzhvRnF4RlFVNHZyK0IvVkcxNjRIRUN6U2kySEJFc3BtZ01jaEtOdz0=', '44781615806165', 'dVc5TXhhZmdVV1dvL1B0ZGlYaUFJQT09', '139499021188159', 'active', 1623078700),
(45, 2, 'tushar', 'tus1@gmail.com', '(767)004-2412', 'No Profile', 'spy', 'RHFmeWhucEdjZFRReWZEbDJOb3JnQT09', '8281242999139243', 'MG5MRmFjSWRjNXViaGVaQTNrcmZGQT09', '4932524911010291', 'active', 1623156569),
(46, 2, 'Katie Lynn', 'katieandphilemail@gmail.com', '(444)888-9999', 'assets/profiles/46/image-f2989494-4d6c-4c2b-b803-c9a47111e652.jpg', '', 'c3QxOUVHYVNIWWJDazB0VFBhbGhtWjgwR0x0dXhaWml2MHpjdG1LcTFtcz0=', '2813135053513867', 'THZETlZaS242cFYzTjNEWUNwdFNUQT09', '5292483113276103', 'active', 1623195358),
(48, 5, 'Nick ', 'ndimuro42@gmail.com', '(111)999-2222', 'assets/profiles/48/Chiragpubg.png', '', 'Z2NDYkF3clR0STZrRWVreHhlV2w5QTFQT0p0WVlvVFpYVDBnUlorWkpqbz0=', '1014580318822382', 'c0szM1pKeWJ3VVhzWHNMWFplUGhVdz09', '631898158235818', 'active', 1623244708),
(49, 3, 'tushar', 'tus@foundersapproach.com', '(767)800-4241', 'No Profile', '87', 'b1BTVkZHZmZCZmtNZkJuSkNBVmNEejMwaS9Ba3RzT0Q1OGs4NVpoMFhNVT0=', '964490425541103', 'eHF5bWdSZFZ5eWExd1lLWk1oT2wrZz09', '8241106656090155', 'active', 1623248162),
(50, 3, 'tush', 'tushar@gmail.com', '(767)800-42415455465', 'No Profile', 'spy', 'VkJvcld6MldCeFowY2hVMm9raW45eWNIVm1UdmF1a0hFSUVObWRGVmFRUT0=', '1539511504129043', 'NGU2KzhBeDV1aFhsQlhTaEhiNXJxUT09', '449740981501495', 'active', 1623419481),
(51, 6, 'Hunter Campbell', 'hunter.campbell843@gmail.com', '(098)098-0980', 'assets/profiles/51/Screen_Shot_2021-05-10_at_9_37_29_AM.png', '', 'S3dKdlJ0NC8yVThGQUZmR2JsQVNlMVh0ck9jKzdGS2ZsQ1gyNGdJZmUvVT0=', '9686351414244693', 'NmxZRkYvNTFZcFFXOCszTGliQWZmUT09', '1145791378010395', 'active', 1623257149),
(53, 2, 'parth', 'parth@foundersapproach.com', '(123)456-7890', 'assets/profiles/53/Screenshot_2021-06-10_at_12_47_52_PM.png', 'FA', 'MHd1bWVHMEk4SWhnWHJsRVJjaCtJV3hpMHZrQ1RpS3hzWHdkT0tKaUZwYz0=', '516116960061251', 'YU50TGMvWXNJMjBMbzR6cGg5WmRuQT09', '2146254631300102', 'active', 1623340826),
(61, 5, 'Fleur Keller', 'ciguguhori@mailinator.com', '(031)245-6789', 'No Profile', 'Nieves Serrano LLC', 'ZTRUbVRrMkkyNHhtMmpnSkJXM1orZGNTakZHV0J2bEFmUHlvTmdleTkxRT0=', '070104444577640', 'UnAxR01Bb3VldUtVTTFmNlBBem5PQT09', '1307584744180109', 'active', 1623654884),
(62, 1, 'Nicholas Manning', 'guwykeg@mailinator.com', '(031)245-6789', 'No Profile', 'Becker Gilbert LLC', 'T3VHOUxxZk05OXo0VE41VXdlcUZHWWdWM29QSzV5YzYwd0U3K3lmVlZJTT0=', '0087610238758138', 'MnQzSVAvd3lsZ0M3dkQ5QWZQWjNQZz09', '681001784178177', 'active', 1623655088),
(63, 9, 'Mariam Atkinson', 'haqas@mailinator.com', '(031)245-6789', 'No Profile', 'Doyle and Weber Inc', 'Zm5uRTFEK0RnMVVRdkxubm5SRXNJeG1aV2hrZGt2SkY1RGsxb2Q5VnRRTT0=', '870897926353034', 'b1pQQ2hzZ241ZHdEeTd4MklXR0U4QT09', '3033030948657525', 'active', 1623656630),
(64, 3, 'Fake', 'user@gmafkfdsajl.com', '(444)444-4444', 'No Profile', '', 'eDlxcC9Hd0gxVDJxRm56UU5jSGlpQzRkcmhQd2JzaWpFMTZUaXhPQUVkRT0=', '3101730271095111', 'WFVUMjJ0Rm96NEpFS3locGVrRWh2Zz09', '0374501189012310', 'active', 1623675917),
(65, 0, 'admin@te', 'admin@test.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623677915),
(66, 0, 'ihzkchyl', 'ihzkchylmwwuxvitdx@wqcefp.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623678152),
(67, 1, 'tush', 'tush@gmail.com', '(767)800-4241', 'No Profile', 'test', 'MUFLVGN0eEJJR1Y4V0pDUU9pcXpRdz09', '529504803071315', 'WkhiVy9Oanp3Vm5RcEV0U2VnYWdMQT09', '6047259140119509', 'active', 1623685510),
(82, 0, 'observed', 'observedeep0@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623741209),
(84, 6, 'Test', 'qbtzbkmapqgsjsecbl@upived.com', '(111)111-1111', 'No Profile', 'MAJR', 'aE8zbFRvZk9vcU9aNGttTXlwK2cyVDhCWk03cDMyNDV2ZUFPb3BVQ3RPVT0=', '4681338384431083', 'bWU4Y25JU0J0ZU5yTHlUbUNXWjltUT09', '60749191765322', 'active', 1623753883),
(90, 0, 'testmail', 'testmail@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623763267),
(91, 1, 'sdfs', 'shaoor@foundersapproach.com', '(042)154-5454', 'No Profile', 'FA', 'OXZONFNMOTBzRHVjZmd6aG5rOEV3QU1jY0xCclJUcmtEaGtyenVINi92QT0=', '27665823202719', 'aUl5S1JWanlJbmcyalRlSUQvQldUdz09', '713181344228321', 'active', 1623765446),
(92, 0, 'dyqbqnqw', 'dyqbqnqwrjtnnhfzui@twzhhq.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623764818),
(93, 1, 'Dave Phelan', 'info@foundersapproach.com', '(610)348-6162', 'No Profile', '', 'WHlSZFZuMkpnaWdXd2NQY2ZtYUZvUTB0aE9mamxYYytMZUlXSVFpTUhkYz0=', '5311884605500132', 'OWZPMHpLaUdIeUdjaGYzWGtVd0R2QT09', '807054513525700', 'active', 1623765500),
(94, 1, 'Ben Harper', 'bharpman@test.com', '(094)882-9340', 'No Profile', '', 'OVZxbG15VGxad2tZZHNKOXI4YktybGNwbm9wZHBzREdwZ2I2TEgxL0pGND0=', '7342417531484522', 'b1dlRld3b3FWd1dMaFNFVWFqVDRTdz09', '15854024324684', 'active', 1623767323),
(95, 1, 'Jen Mitchell', 'jenmitchell@test.com', '(239)472-3849', 'No Profile', '', 'bk05MEw5YnE5ZE0wOGk0bENlNDJYL0xjQ3dQT0tkbDB5cVIwd3dLYXowcz0=', '6974710410511208', 'WW92ZFlKbVRSTFgzRitqaVNobjlPQT09', '7216525141442121', 'active', 1623768136),
(96, 0, 'testmail', 'testmail123@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623814870),
(98, 0, 'lgghnzsw', 'lgghnzswhaemeqxoan@miucce.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623840837),
(99, 0, 'ayldgaxd', 'ayldgaxdqhizyboulh@twzhhq.online', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623842185),
(100, 0, 'philipdi', 'philipdimuro@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623842219),
(101, 6, 'Ken Williams', 'support@foundersapproach.com', '(444)999-4444', 'assets/profiles/101/adam.jpg', '', 'YTNONzcwN0VPMlNCWm5mRURaam1YWmFyTGpab1RtWStacjU2Wjl5K0RGTT0=', '191540290034873', 'Y2syakh2S0FZbGhIdnBxSVVWUHRUdz09', '786231712212786', 'active', 1623842643),
(102, 4, 'Ellen Asire', 'eilam.asire@finemail.org', '(444)444-4444', 'No Profile', '', 'aXl0NVVzQXJZS0tPbUpqZCtxdXZmV01Qd0xKZHhQdENyWWlZdHROT1FEMD0=', '710111129585326', 'Q2Q3V09DNmNyaWhzZkR0TFNQRlEydz09', '7011824652158171', 'active', 1623842890),
(103, 0, '3@gmail.com', 'testmail43@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623843041),
(104, 0, 'test1', 'test11@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623843194),
(105, 0, 'test120', 'test120@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623843261),
(106, 0, 'test1234567', 'test1234567@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623843282),
(108, 0, 'muhammadshaoor1707276', 'muhammadshaoor1707276@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623844306),
(109, 0, 'poowzlswiirupljgtx', 'poowzlswiirupljgtx@wqcefp.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623844442),
(110, 0, 'vimayo3736', 'vimayo3736@greenkic.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623845112),
(112, 0, 'sebixe1207', 'sebixe1207@greenkic.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623846522),
(113, 1, 'Cole Barger', 'cole@xeromedia.com', '(301)639-6923', 'assets/profiles/113/COLE_HEADSHOT.jpg', 'Bikemeets', 'eDRSZTNra3NGTGhxbGhCUmdBMjdhOUpIZ2V4T1ErSXRGNjh2cGUrOE9Bbz0=', '318633042150874', 'TTVFMVdtSG1VSTQ4bzZtWm5CSHI0dz09', '6113407807214347', 'active', 1623846943),
(114, 0, 'ditor72050', 'ditor72050@moxkid.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623846707),
(115, 0, 'mike72050', 'mike72050@moxkid.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623846857),
(116, 0, 'john70', 'john70@moxkid.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623846879),
(117, 0, 'davemiller', 'davemiller@gmail.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623846898),
(118, 0, 'butller45678', 'butller45678@gmail.org', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1623846945),
(119, 1, 'hunter', 'email@test.com', '456789045678456789', 'No Profile', '', 'dXk2RitnTWt3TzFHaVBnYy9yRzR0UT09', '36602575988531', 'WkdRZ2RveStva0Rrc2lYdjRRZnJiZz09', '513267231812151', 'active', 1623936309),
(120, 3, 'Michael Smith', 'michael.smith@gco.co.uk', '(111) 222 - 3333', 'assets/profiles/120/AstralHatGood.jpg', '', 'YmhSWEo1NGhVbThyR09OVEJrTGYyTFh4bFBRYVlVUlcrc3U1MTQ2dm1yZz0=', '1186349192357178', 'RlBDZHRWTWk3VGNsRXVWTjMzYjVRQT09', '3783851172653112', 'active', 1623935893),
(121, 0, 'phil', 'phil@xeromedia.com', NULL, 'No Profile', 'No Company', '', '', '', '', 'inactive', 1624026852),
(122, 2, 'Yopmail User', 'jittoulossahau-1680@yopmail.com', '(234) 234 - 2342', 'assets/profiles/122/Screen_Shot_2021-05-10_at_9_37_29_AM.png', '', 'SUVEakx5YVVUeUZ3S253UGRwY0VLbDlKNVVpNVppMm5aM01hbHgreG16dz0=', '4927654811214674', 'eDBuOVQzWE1iVEE4eUllektqWTV3UT09', '5091745184745511', 'active', 1624286895),
(123, 3, 'YOpmail User 2', 'sissiquayatau-4496@yopmail.com', '(234) 234 - 2342', 'assets/profiles/123/Screen_Shot_2021-05-10_at_9_37_29_AM.png', '', 'TzFLZzBKcHdQejN5NFAwQ1V5RnZ3Y0h0Y0hWb2JjV2JncDJtNWUyRXlrOD0=', '1146003215665415', 'czNJRjR4Sk4ycEp2SWRXZk1KczVQQT09', '761475197288545', 'active', 1624287166),
(124, 5, 'Ursula Meyer', 'peba@mailinator.com', '(031) 245 - 6789', 'No Profile', 'Deleon and Boyd Trading', 'NDVxYjloR2dCMWhLL2hwampsOUxueUxtTktUa0lIbjFROUlITmFtdEhDMD0=', '7857581718745613', 'RXduVVkyUWxRNjB1SVFBb1cwZndFUT09', '116659691321544', 'active', 1624380934),
(125, 4, 'Lougrautrammiza', 'pougrautrammiza-6641@yopmail.com', '(234) 234 - 2342', 'No Profile', '', 'ZzdNYktTVVhMM0RGVWNqNVQ1eFF6dGZrSlprSE1BRkVUdEZEd3hjd0lBOHVvN2VSVFFlK0tLTGpWR0VGYnBmQQ==', '7320854136147641', 'OUJSVlNrV0h6bEEydFZuRWRITnBaQT09', '6861434129010005', 'active', 1624458304);

-- --------------------------------------------------------

--
-- Table structure for table `users_old`
--

CREATE TABLE `users_old` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(60) DEFAULT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_old`
--

INSERT INTO `users_old` (`user_id`, `name`, `email`, `contact`, `password`, `salt`, `created_at`) VALUES
(3, 'admin', 'admin@reva.com', '(031)245-6789', 'M0xyWnZaNDBOa01ZbEJhaElaSW5QQT09', '0985833771010619', 1619584745),
(4, 'Donovan Chambers', 'muhammadshaoor1707276@gmail.com', '(031)245-6789', 'clozMndicFdEK0xGU0NxOXFvajhrUT09', '539416725112830', 1619610563),
(8, 'phil', 'phil@foundersapproach.com', '(031)245-6789', 'TzRHNXAwSHF3TjdCeWlGKzJPRGRxZz09', '2141160014262421', 1619584745),
(9, 'dave', 'dave@foundersapproach.com', '(031)245-6789', 'M0xyWnZaNDBOa01ZbEJhaElaSW5QQT09', '0985833771010619', 1619584745),
(10, 'cole', 'cole@foundersapproach.com', '(031)245-6789', 'M0xyWnZaNDBOa01ZbEJhaElaSW5QQT09', '0985833771010619', 1619584745),
(11, 'hunter', 'hunter@foundersapproach.com', '(031)245-6789', 'M0xyWnZaNDBOa01ZbEJhaElaSW5QQT09', '0985833771010619', 1619584745),
(12, 'kate', 'kat@foundersapproach.com', '(031)245-6789', 'M0xyWnZaNDBOa01ZbEJhaElaSW5QQT09', '0985833771010619', 1619584745),
(13, 'testuser', 'admin@test.com', '(123)456-7894', 'UklkQ3BsT2M1cTBITzJsRXZnUkxMUT09', '731584564406231', 1619718242),
(14, 'Phil', 'phil1@foundersapproach.com', '(484)941-4821', 'a3lHOVVMelB3UjRvMlVML2pyYjcvdz09', '8315801406436115', 1619800858),
(15, 'tushar sanjay patil', 'tushar@foundersapproach.com', '(767)800-4241', 'TVkzQlhZb3BKQWRoRlQydVNDaWNvUT09', '3335936048617126', 1620059314),
(16, 'Hunter R Campbell', 'hunter@foundersappproach.com', '(843)472-2009', 'Mk5vYUVrYm83M1l6SDRhZk9HNk9KZz09', '917179395462704', 1620409069),
(17, 'Phil 2', 'philip.a.dimuro@gmail.com', '(484)941-4821', 'VHROOHFFU3hFQVd2SWNMT0FpdVdkdz09', '1261636144191378', 1620750731);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `role_title` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `role_title`, `time`) VALUES
(1, 'Buyer', '2021-05-19 07:28:27'),
(2, 'Seller', '2021-05-19 07:28:27'),
(3, 'Buyer Agent', '2021-05-19 07:29:04'),
(4, ' Seller Agent', '2021-05-19 07:29:04'),
(5, 'Title Company', '2021-05-19 07:30:26'),
(6, 'Lender / Bank', '2021-05-19 07:30:26'),
(7, 'Buyer Attorney', '2021-05-19 07:31:15'),
(8, 'Seller Attorney', '2021-05-19 07:31:15'),
(9, 'Other', '2021-05-19 07:31:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`deal_id`);

--
-- Indexes for table `deal_activity`
--
ALTER TABLE `deal_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `deal_chat`
--
ALTER TABLE `deal_chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `deal_invite_members`
--
ALTER TABLE `deal_invite_members`
  ADD PRIMARY KEY (`invite_id`);

--
-- Indexes for table `deal_timeline_tasks`
--
ALTER TABLE `deal_timeline_tasks`
  ADD PRIMARY KEY (`deal_task_id`);

--
-- Indexes for table `general_tasks`
--
ALTER TABLE `general_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_old`
--
ALTER TABLE `users_old`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deal`
--
ALTER TABLE `deal`
  MODIFY `deal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `deal_activity`
--
ALTER TABLE `deal_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deal_chat`
--
ALTER TABLE `deal_chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `deal_invite_members`
--
ALTER TABLE `deal_invite_members`
  MODIFY `invite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=659;

--
-- AUTO_INCREMENT for table `deal_timeline_tasks`
--
ALTER TABLE `deal_timeline_tasks`
  MODIFY `deal_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1067;

--
-- AUTO_INCREMENT for table `general_tasks`
--
ALTER TABLE `general_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `users_old`
--
ALTER TABLE `users_old`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
