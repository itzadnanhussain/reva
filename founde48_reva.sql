-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2021 at 06:46 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `founde48_reva`
--

-- --------------------------------------------------------

--
-- Table structure for table `1on1_last_update`
--

CREATE TABLE `1on1_last_update` (
  `user_1on1_last_update_id` int(11) NOT NULL,
  `deal_id` varchar(50) NOT NULL,
  `sender_user_id` varchar(50) NOT NULL,
  `receiver_user_id` varchar(50) NOT NULL,
  `last_update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deal`
--

CREATE TABLE `deal` (
  `deal_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('inactive','active') NOT NULL DEFAULT 'active',
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal`
--

INSERT INTO `deal` (`deal_id`, `user_id`, `name`, `address`, `description`, `status`, `created_at`) VALUES
('60df5b174d88ae1a8b62760f53', '60dc9198dff55a501b3c06b48e', 'Deal One ', 'Thorbeckelaan 123, Barneveld, Netherlands', '<p>test</p>', 'active', 1625250583);

-- --------------------------------------------------------

--
-- Table structure for table `deal_1on1_chat_msg`
--

CREATE TABLE `deal_1on1_chat_msg` (
  `deal_1on1_chat_msg_id` int(11) NOT NULL,
  `deal_1on1_chat_msg_object_id` varchar(50) NOT NULL,
  `deal_id` varchar(50) NOT NULL,
  `sender_user_id` varchar(50) NOT NULL,
  `receiver_user_id` varchar(50) NOT NULL,
  `message_content` text NOT NULL,
  `message_type` enum('text','image','pdf','gif','link') NOT NULL DEFAULT 'text',
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deal_activity`
--

CREATE TABLE `deal_activity` (
  `activity_id` int(11) NOT NULL,
  `deal_id` varchar(255) NOT NULL,
  `deal_activity_user_id` varchar(255) NOT NULL,
  `activity_description` text NOT NULL,
  `activity_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_activity`
--

INSERT INTO `deal_activity` (`activity_id`, `deal_id`, `deal_activity_user_id`, `activity_description`, `activity_time`) VALUES
(1, '1', '1', 'this is a test activity', 0),
(2, '1', '1', 'this is a test activity', 0);

-- --------------------------------------------------------

--
-- Table structure for table `deal_chat`
--

CREATE TABLE `deal_chat` (
  `chat_id` int(11) NOT NULL,
  `deal_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `chat_invited_email` text COLLATE utf8mb4_bin NOT NULL,
  `chat_inviting_by` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `group_name` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `deal_chat_participant`
--

CREATE TABLE `deal_chat_participant` (
  `deal_chat_participant_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `deal_chat_room_id` varchar(50) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_chat_participant`
--

INSERT INTO `deal_chat_participant` (`deal_chat_participant_id`, `user_id`, `deal_chat_room_id`, `is_active`, `is_deleted`, `created_date`) VALUES
(1, '60dc9198dff55a501b3c06b48e', '60df5b174d88ae1a8b2d1a90f9', 1, 0, '0000-00-00 00:00:00'),
(2, '60dc916a7b8d031ff610eff4f8', '60df5b174d88ae1a8b2d1a90f9', 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `deal_chat_room`
--

CREATE TABLE `deal_chat_room` (
  `deal_chat_room_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'a unique random string',
  `deal_id` varchar(50) NOT NULL,
  `created_by_user_id` varchar(50) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `public_room` tinyint(4) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_chat_room`
--

INSERT INTO `deal_chat_room` (`deal_chat_room_id`, `deal_id`, `created_by_user_id`, `is_active`, `is_deleted`, `public_room`, `created_date`) VALUES
('60df5b174d88ae1a8b2d1a90f9', '60df5b174d88ae1a8b62760f53', '60dc9198dff55a501b3c06b48e', 1, 0, 1, '2021-07-02 23:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `deal_invite_members`
--

CREATE TABLE `deal_invite_members` (
  `invite_id` int(11) NOT NULL,
  `deal_id` varchar(255) NOT NULL,
  `invited_user_id` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_invite_members`
--

INSERT INTO `deal_invite_members` (`invite_id`, `deal_id`, `invited_user_id`, `created_at`) VALUES
(1, '60df5b174d88ae1a8b62760f53', '60dc9198dff55a501b3c06b48e', 1625250583),
(2, '60df5b174d88ae1a8b62760f53', '60dc916a7b8d031ff610eff4f8', 1625250583);

-- --------------------------------------------------------

--
-- Table structure for table `deal_room_msg`
--

CREATE TABLE `deal_room_msg` (
  `deal_room_msg_id` int(11) NOT NULL,
  `deal_room_msg_object_id` varchar(50) NOT NULL,
  `deal_chat_room_id` varchar(50) NOT NULL,
  `sender_user_id` varchar(50) NOT NULL,
  `message_content` text NOT NULL,
  `message_type` enum('text','image','pdf','gif','link') NOT NULL DEFAULT 'text',
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_room_msg`
--

INSERT INTO `deal_room_msg` (`deal_room_msg_id`, `deal_room_msg_object_id`, `deal_chat_room_id`, `sender_user_id`, `message_content`, `message_type`, `created_date`, `updated_date`) VALUES
(1, '60df5b174d88ae1a8b2d1a85648', '60df5b174d88ae1a8b2d1a90f9', '60dc9198dff55a501b3c06b48e', 'this is test message is here', 'text', '2021-07-05 08:59:29', NULL),
(2, '60df5b174d88ae1a8b2d1a85648', '60df5b174d88ae1a8b2d1a90f9', '60dc916a7b8d031ff610eff4f8', 'this is test message from other is here', 'text', '0000-00-00 00:00:00', '2021-07-02 23:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `deal_timeline_tasks`
--

CREATE TABLE `deal_timeline_tasks` (
  `deal_task_id` int(11) NOT NULL,
  `deal_id` varchar(255) NOT NULL,
  `task_name` text NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal_timeline_tasks`
--

INSERT INTO `deal_timeline_tasks` (`deal_task_id`, `deal_id`, `task_name`, `created_at`) VALUES
(1, '60dc91c4679ac5477540cb73d8', 'Client Begins Process', 1625067972),
(2, '60dc91c4679ac5477540cb73d8', 'Home Tours', 1625067972),
(3, '60dc91c4679ac5477540cb73d8', 'Bank Loan Authorized', 1625067972),
(4, '60dc91c4679ac5477540cb73d8', 'Title Company Chosen', 1625067972),
(5, '60dd2b842b35815c767fb391a7', 'Client Begins Process', 1625107332),
(6, '60dd2b842b35815c767fb391a7', 'Home Tours', 1625107332),
(7, '60dd2b842b35815c767fb391a7', 'Bank Loan Authorized', 1625107332),
(8, '60dd2b842b35815c767fb391a7', 'Title Company Chosen', 1625107332),
(9, '60dd2d13e3a71b15443a891374', 'Client Begins Process', 1625107731),
(10, '60dd2d13e3a71b15443a891374', 'Home Tours', 1625107731),
(11, '60dd2d13e3a71b15443a891374', 'Bank Loan Authorized', 1625107731),
(12, '60dd2d13e3a71b15443a891374', 'Title Company Chosen', 1625107731),
(13, '60dd2d1ed64def1524343d5cf0', 'Client Begins Process', 1625107743),
(14, '60dd2d1ed64def1524343d5cf0', 'Home Tours', 1625107743),
(15, '60dd2d1ed64def1524343d5cf0', 'Bank Loan Authorized', 1625107743),
(16, '60dd2d1ed64def1524343d5cf0', 'Title Company Chosen', 1625107743),
(17, '60dd2dc3b3e1f3626040c32017', 'Client Begins Process', 1625107907),
(18, '60dd2dc3b3e1f3626040c32017', 'Home Tours', 1625107907),
(19, '60dd2dc3b3e1f3626040c32017', 'Bank Loan Authorized', 1625107907),
(20, '60dd2dc3b3e1f3626040c32017', 'Title Company Chosen', 1625107907),
(21, '60dd33cc64b5560def13475391', 'Client Begins Process', 1625109452),
(22, '60dd33cc64b5560def13475391', 'Home Tours', 1625109452),
(23, '60dd33cc64b5560def13475391', 'Bank Loan Authorized', 1625109452),
(24, '60dd33cc64b5560def13475391', 'Title Company Chosen', 1625109452),
(25, '60dd33f80752dd06585bc03bed', 'Client Begins Process', 1625109496),
(26, '60dd33f80752dd06585bc03bed', 'Home Tours', 1625109497),
(27, '60dd33f80752dd06585bc03bed', 'Bank Loan Authorized', 1625109497),
(28, '60dd33f80752dd06585bc03bed', 'Title Company Chosen', 1625109497),
(29, '60dd349c641832481aa8d2034', 'Client Begins Process', 1625109660),
(30, '60dd349c641832481aa8d2034', 'Home Tours', 1625109660),
(31, '60dd349c641832481aa8d2034', 'Bank Loan Authorized', 1625109660),
(32, '60dd349c641832481aa8d2034', 'Title Company Chosen', 1625109661),
(33, '60dd36234072794a64459df415', 'Client Begins Process', 1625110051),
(34, '60dd36234072794a64459df415', 'Home Tours', 1625110051),
(35, '60dd36234072794a64459df415', 'Bank Loan Authorized', 1625110051),
(36, '60dd36234072794a64459df415', 'Title Company Chosen', 1625110051),
(37, '60dd365d55aff4529d7b760dd0', 'Client Begins Process', 1625110109),
(38, '60dd365d55aff4529d7b760dd0', 'Home Tours', 1625110109),
(39, '60dd365d55aff4529d7b760dd0', 'Bank Loan Authorized', 1625110109),
(40, '60dd365d55aff4529d7b760dd0', 'Title Company Chosen', 1625110109),
(41, '60dd36ff0bbfef59b643151f53', 'Client Begins Process', 1625110271),
(42, '60dd36ff0bbfef59b643151f53', 'Home Tours', 1625110271),
(43, '60dd36ff0bbfef59b643151f53', 'Bank Loan Authorized', 1625110271),
(44, '60dd36ff0bbfef59b643151f53', 'Title Company Chosen', 1625110271),
(101, '60dd37c07620de5cb434969182', 'Client Begins Process', 1625114264),
(102, '60dd37c07620de5cb434969182', 'Home Tours', 1625114264),
(103, '60dd37c07620de5cb434969182', 'Bank Loan Authorized', 1625114264),
(104, '60dd37c07620de5cb434969182', 'Title Company Chosen', 1625114264),
(117, '60dd46dacb6a6b1da04fd3c26d', 'Client Begins Process', 1625114507),
(118, '60dd46dacb6a6b1da04fd3c26d', 'Home Tours', 1625114507),
(119, '60dd46dacb6a6b1da04fd3c26d', 'Bank Loan Authorized', 1625114507),
(120, '60dd46dacb6a6b1da04fd3c26d', 'Title Company Chosen', 1625114507),
(121, '60dd57d0eda93d3d9a7717d056', 'Client Begins Process', 1625118673),
(122, '60dd57d0eda93d3d9a7717d056', 'Home Tours', 1625118673),
(123, '60dd57d0eda93d3d9a7717d056', 'Bank Loan Authorized', 1625118673),
(124, '60dd57d0eda93d3d9a7717d056', 'Title Company Chosen', 1625118673),
(125, '60dd6086cdb22d0f7e1be378a3', 'Client Begins Process', 1625120902),
(126, '60dd6086cdb22d0f7e1be378a3', 'Home Tours', 1625120902),
(127, '60dd6086cdb22d0f7e1be378a3', 'Bank Loan Authorized', 1625120902),
(128, '60dd6086cdb22d0f7e1be378a3', 'Title Company Chosen', 1625120902),
(129, '60dd608f6ff7b64db14edf60e7', 'Client Begins Process', 1625120911),
(130, '60dd608f6ff7b64db14edf60e7', 'Home Tours', 1625120912),
(131, '60dd608f6ff7b64db14edf60e7', 'Bank Loan Authorized', 1625120912),
(132, '60dd608f6ff7b64db14edf60e7', 'Title Company Chosen', 1625120912),
(133, '60dd60dc78c09956bc1abe4c32', 'Client Begins Process', 1625120988),
(134, '60dd60dc78c09956bc1abe4c32', 'Home Tours', 1625120988),
(135, '60dd60dc78c09956bc1abe4c32', 'Bank Loan Authorized', 1625120988),
(136, '60dd60dc78c09956bc1abe4c32', 'Title Company Chosen', 1625120988),
(137, '60dd6374ba05a006541176a07', 'Client Begins Process', 1625121652),
(138, '60dd6374ba05a006541176a07', 'Home Tours', 1625121652),
(139, '60dd6374ba05a006541176a07', 'Bank Loan Authorized', 1625121652),
(140, '60dd6374ba05a006541176a07', 'Title Company Chosen', 1625121652),
(141, '60dd637c1f154f467f6ca9d981', 'Client Begins Process', 1625121660),
(142, '60dd637c1f154f467f6ca9d981', 'Home Tours', 1625121660),
(143, '60dd637c1f154f467f6ca9d981', 'Bank Loan Authorized', 1625121660),
(144, '60dd637c1f154f467f6ca9d981', 'Title Company Chosen', 1625121660),
(145, '60dd638d22fe602a4f338923ad', 'Client Begins Process', 1625121677),
(146, '60dd638d22fe602a4f338923ad', 'Home Tours', 1625121677),
(147, '60dd638d22fe602a4f338923ad', 'Bank Loan Authorized', 1625121677),
(148, '60dd638d22fe602a4f338923ad', 'Title Company Chosen', 1625121677),
(169, '60dd642ade3c2726be2479436a', 'Client Begins Process', 1625124285),
(170, '60dd642ade3c2726be2479436a', 'Home Tours', 1625124285),
(171, '60dd642ade3c2726be2479436a', 'Bank Loan Authorized', 1625124286),
(172, '60dd642ade3c2726be2479436a', 'Title Company Chosen', 1625124286),
(173, '60df5b174d88ae1a8b62760f53', 'Client Begins Process', 1625250583),
(174, '60df5b174d88ae1a8b62760f53', 'Home Tours', 1625250583),
(175, '60df5b174d88ae1a8b62760f53', 'Bank Loan Authorized', 1625250583),
(176, '60df5b174d88ae1a8b62760f53', 'Title Company Chosen', 1625250583);

-- --------------------------------------------------------

--
-- Table structure for table `general_tasks`
--

CREATE TABLE `general_tasks` (
  `task_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `task_name` text NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `general_tasks`
--

INSERT INTO `general_tasks` (`task_id`, `user_id`, `task_name`, `created_at`) VALUES
(1, '1', 'Client Begins Process', 0),
(2, '1', 'Home Tours', 0),
(3, '1', 'Bank Loan Authorized', 0),
(4, '1', 'Title Company Chosen', 0);

-- --------------------------------------------------------

--
-- Table structure for table `socket_logs`
--

CREATE TABLE `socket_logs` (
  `socket_logs_id` int(11) NOT NULL,
  `user_data` text DEFAULT NULL,
  `event_type` text DEFAULT NULL,
  `request_object` text DEFAULT NULL,
  `response_object` text DEFAULT NULL,
  `rooms` text DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `socket_logs`
--

INSERT INTO `socket_logs` (`socket_logs_id`, `user_data`, `event_type`, `request_object`, `response_object`, `rooms`, `created_date`) VALUES
(1, '{\"socket_id\":\"wVzBPnXL6cgkVyUkAAAJ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_43828be5-cba3-4802-bd71-58894fa92b75\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:45:26'),
(2, '{\"socket_id\":\"GcrD3VepxCqNM2WuAAAK\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_4ec16398-3f7d-44a5-a147-06887f5d6474\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:45:53'),
(3, '{\"socket_id\":\"GcrD3VepxCqNM2WuAAAK\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_4ec16398-3f7d-44a5-a147-06887f5d6474\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:45:57'),
(4, '{\"socket_id\":\"Il12upq5x6ldwotZAAAL\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_40b06bf3-19f6-4865-abe1-9d611efd5bf5\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:47:22'),
(5, '{\"socket_id\":\"Il12upq5x6ldwotZAAAL\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_40b06bf3-19f6-4865-abe1-9d611efd5bf5\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:48:02'),
(6, '{\"socket_id\":\"LMulawSge_0XNIqtAAAM\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0ffcc493-3060-4b53-b3bd-a6dcf77264ad\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:48:03'),
(7, '{\"socket_id\":\"LMulawSge_0XNIqtAAAM\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0ffcc493-3060-4b53-b3bd-a6dcf77264ad\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:48:06'),
(8, '{\"socket_id\":\"URY5gOvwH55soLKuAAAN\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d5e55e91-a59c-4c14-99ea-30df3a113630\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:48:16'),
(9, '{\"socket_id\":\"URY5gOvwH55soLKuAAAN\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d5e55e91-a59c-4c14-99ea-30df3a113630\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:48:46'),
(10, '{\"socket_id\":\"5vekCPJQL7TiUGwaAAAO\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_72deda36-3ba6-4b12-abaa-ee9075e72ff0\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:55:14'),
(11, '{\"socket_id\":\"5vekCPJQL7TiUGwaAAAO\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_72deda36-3ba6-4b12-abaa-ee9075e72ff0\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:55:31'),
(12, '{\"socket_id\":\"OzA-ljxx_KxD9l8MAAAP\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_cc11f570-7713-49b2-850e-dc6f55ce60bf\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:56:03'),
(13, '{\"socket_id\":\"OzA-ljxx_KxD9l8MAAAP\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_cc11f570-7713-49b2-850e-dc6f55ce60bf\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:57:07'),
(14, '{\"socket_id\":\"3Ct9eGJteG3amT7eAAAQ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_fdf60cc5-c949-4782-89a2-f7cb13e6ae4f\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:57:14'),
(15, '{\"socket_id\":\"rL3ptmKs99nMg4tAAAAR\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_000b7da5-a0ac-445b-a7be-d04cae34197a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:57:22'),
(16, '{\"socket_id\":\"rL3ptmKs99nMg4tAAAAR\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_000b7da5-a0ac-445b-a7be-d04cae34197a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:57:44'),
(17, '{\"socket_id\":\"rL3ptmKs99nMg4tAAAAR\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_000b7da5-a0ac-445b-a7be-d04cae34197a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:58:04'),
(18, '{\"socket_id\":\"VgMxC91xpnGniJEkAAAS\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_608ad63b-9d0f-47fe-b5a9-5969c0aed1e2\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 13:58:05'),
(19, '{\"socket_id\":\"VgMxC91xpnGniJEkAAAS\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_608ad63b-9d0f-47fe-b5a9-5969c0aed1e2\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 13:59:31'),
(20, '{\"socket_id\":\"vK53Imd2m8Ej1eqzAAAT\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_2ad148a1-a775-4853-8307-8b28ffc8ea81\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:01:30'),
(21, '{\"socket_id\":\"GBwtpgYzLIfLVG4IAAAU\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_17af3200-d2de-40ca-ae24-e4bf56c73483\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:01:32'),
(22, '{\"socket_id\":\"GBwtpgYzLIfLVG4IAAAU\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_17af3200-d2de-40ca-ae24-e4bf56c73483\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:01:35'),
(23, '{\"socket_id\":\"GBwtpgYzLIfLVG4IAAAU\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_17af3200-d2de-40ca-ae24-e4bf56c73483\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:02:00'),
(24, '{\"socket_id\":\"aaC4p_P8yyd5zYdPAAAV\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d0a20f24-40ff-4cd9-bdd6-2ae0441792ac\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:20:52'),
(25, '{\"socket_id\":\"aaC4p_P8yyd5zYdPAAAV\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d0a20f24-40ff-4cd9-bdd6-2ae0441792ac\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:23:12'),
(26, '{\"socket_id\":\"eDfO37NIeQvOcVMmAAAW\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_e92ad3eb-0af6-4f1b-b08e-728892e37f06\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:23:13'),
(27, '{\"socket_id\":\"eDfO37NIeQvOcVMmAAAW\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_e92ad3eb-0af6-4f1b-b08e-728892e37f06\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:23:18'),
(28, '{\"socket_id\":\"ui6uzcqvz1NbMwUnAAAX\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_90c8d90a-af5b-4f68-aa3b-9dc3df288302\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:24:15'),
(29, '{\"socket_id\":\"ui6uzcqvz1NbMwUnAAAX\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_90c8d90a-af5b-4f68-aa3b-9dc3df288302\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:24:17'),
(30, '{\"socket_id\":\"ArCiFwMmFKHtwe7HAAAY\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_38e03b63-9618-4607-9935-ac2907f024a0\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:24:22'),
(31, '{\"socket_id\":\"ArCiFwMmFKHtwe7HAAAY\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_38e03b63-9618-4607-9935-ac2907f024a0\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:24:52'),
(32, '{\"socket_id\":\"Q7ggPzzANnJcmHyiAAAZ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_e8cb8986-4101-4f4c-b17d-29d182f48427\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:39:38'),
(33, '{\"socket_id\":\"Q7ggPzzANnJcmHyiAAAZ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_e8cb8986-4101-4f4c-b17d-29d182f48427\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:39:42'),
(34, '{\"socket_id\":\"zHVr5BQRhjTUJWkSAAAa\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_2d8bad2e-7127-4e91-93a3-16285df55633\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:46:51'),
(35, '{\"socket_id\":\"zHVr5BQRhjTUJWkSAAAa\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_2d8bad2e-7127-4e91-93a3-16285df55633\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:48:58'),
(36, '{\"socket_id\":\"ofiaoSgoFmopnA-VAAAb\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_02b23396-40e0-409c-a4ba-dc4f33402b30\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:49:02'),
(37, '{\"socket_id\":\"ofiaoSgoFmopnA-VAAAb\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_02b23396-40e0-409c-a4ba-dc4f33402b30\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 14:51:16'),
(38, '{\"socket_id\":\"seBZlet3Sb5tALcrAAAc\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_e2017635-414d-4736-8f20-d7b13646c7a3\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 14:51:23'),
(39, '{\"socket_id\":\"seBZlet3Sb5tALcrAAAc\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_e2017635-414d-4736-8f20-d7b13646c7a3\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 15:37:04'),
(40, '{\"socket_id\":\"u1d-WwOdi23HQ1-5AAAd\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_be656676-84b8-4b0e-8b84-d061edc41c5c\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 15:39:44'),
(41, '{\"socket_id\":\"u1d-WwOdi23HQ1-5AAAd\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_be656676-84b8-4b0e-8b84-d061edc41c5c\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 15:39:50'),
(42, '{\"socket_id\":\"g7QzrWzKaOLab5nUAAAe\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3b3c2ac1-6f3d-4c2e-bcc0-8747f9a44492\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 15:58:59'),
(43, '{\"socket_id\":\"63G-_2GWiz7t_qP3AAAf\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3147d8e1-abbb-42e0-9ad2-151c1ba6212c\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 15:59:22'),
(44, '{\"socket_id\":\"63G-_2GWiz7t_qP3AAAf\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3147d8e1-abbb-42e0-9ad2-151c1ba6212c\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 15:59:27'),
(45, '{\"socket_id\":\"kfcFk7zOs8G3ke9gAAAg\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_074c01d2-6900-48ba-a54d-85da2fcc7613\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 15:59:37'),
(46, '{\"socket_id\":\"kfcFk7zOs8G3ke9gAAAg\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_074c01d2-6900-48ba-a54d-85da2fcc7613\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:01:10'),
(47, '{\"socket_id\":\"Rd-7bQAViCF5MgbJAAAh\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_561c4e9f-2dbf-40b7-88ed-0a38d114f0ad\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:03:13'),
(48, '{\"socket_id\":\"Rd-7bQAViCF5MgbJAAAh\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_561c4e9f-2dbf-40b7-88ed-0a38d114f0ad\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:05:13'),
(49, '{\"socket_id\":\"HB7FPfQo1Mz-9AB7AAAi\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_1042c48d-a643-44cf-84ce-3ee594ffd63a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:05:13'),
(50, '{\"socket_id\":\"HB7FPfQo1Mz-9AB7AAAi\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_1042c48d-a643-44cf-84ce-3ee594ffd63a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:05:23'),
(51, '{\"socket_id\":\"_ONtbmIEHtNC8oeLAAAj\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_252789b7-474b-44bc-aa3e-f1cc6e6eb6a0\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:05:37'),
(52, '{\"socket_id\":\"_ONtbmIEHtNC8oeLAAAj\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_252789b7-474b-44bc-aa3e-f1cc6e6eb6a0\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:06:05'),
(53, '{\"socket_id\":\"ey7cN3zEK7OOJbeOAAAk\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9b1783f3-9418-425b-b39c-6c185012cc04\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:06:05'),
(54, '{\"socket_id\":\"ey7cN3zEK7OOJbeOAAAk\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9b1783f3-9418-425b-b39c-6c185012cc04\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:06:08'),
(55, '{\"socket_id\":\"JKo8HOzYS8b96Xq5AAAl\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_da3a9183-c0ad-45cf-bbb3-9c7a26385b95\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:06:14'),
(56, '{\"socket_id\":\"JKo8HOzYS8b96Xq5AAAl\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_da3a9183-c0ad-45cf-bbb3-9c7a26385b95\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:06:16'),
(57, '{\"socket_id\":\"0-s3geUKOJynQLL5AAAm\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_bd465df7-71e6-4a0b-a8b0-a6dc5560efa2\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:06:41'),
(58, '{\"socket_id\":\"0-s3geUKOJynQLL5AAAm\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_bd465df7-71e6-4a0b-a8b0-a6dc5560efa2\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:06:43'),
(59, '{\"socket_id\":\"8dX1NaePZrYt8LYxAAAn\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_a0904c78-4b57-4e93-9710-d7535ad93b69\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:07:21'),
(60, '{\"socket_id\":\"8dX1NaePZrYt8LYxAAAn\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_a0904c78-4b57-4e93-9710-d7535ad93b69\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:10:39'),
(61, '{\"socket_id\":\"eIIVol6-2Q30E3yIAAAo\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9812bd88-beff-4484-a0fe-87beb1e6702e\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:11:06'),
(62, '{\"socket_id\":\"eIIVol6-2Q30E3yIAAAo\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9812bd88-beff-4484-a0fe-87beb1e6702e\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:11:08'),
(63, '{\"socket_id\":\"2jpOrgfA0t6U2zHAAAAp\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_481ee67e-b4da-4a4b-8680-acf78ce3ba0a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-29 16:12:36'),
(64, '{\"socket_id\":\"2jpOrgfA0t6U2zHAAAAp\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_481ee67e-b4da-4a4b-8680-acf78ce3ba0a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:12:52'),
(65, '{\"socket_id\":\"2jpOrgfA0t6U2zHAAAAp\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_481ee67e-b4da-4a4b-8680-acf78ce3ba0a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-29 16:46:09'),
(66, '{\"socket_id\":\"GsGktU100UMa8NFZAAAA\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_5ead8a30-f873-46ff-9201-6bfdfbefcf3a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 07:47:05'),
(67, '{\"socket_id\":\"GsGktU100UMa8NFZAAAA\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_5ead8a30-f873-46ff-9201-6bfdfbefcf3a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 07:47:05'),
(68, '{\"socket_id\":\"GsGktU100UMa8NFZAAAA\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_5ead8a30-f873-46ff-9201-6bfdfbefcf3a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 07:50:08'),
(69, '{\"socket_id\":\"X5CXvdkZwAZC93nwAAAB\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_f2809f9c-8948-49d5-8fc2-adb8d971eff4\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 07:56:43'),
(70, '{\"socket_id\":\"X5CXvdkZwAZC93nwAAAB\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_f2809f9c-8948-49d5-8fc2-adb8d971eff4\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 07:56:44'),
(71, '{\"socket_id\":\"X5CXvdkZwAZC93nwAAAB\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_f2809f9c-8948-49d5-8fc2-adb8d971eff4\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 07:57:06'),
(72, '{\"socket_id\":\"lIpHnu4aV29oxE84AAAC\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_1503cc14-0169-40ea-804b-5ba631c4957b\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 07:57:21'),
(73, '{\"socket_id\":\"lIpHnu4aV29oxE84AAAC\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_1503cc14-0169-40ea-804b-5ba631c4957b\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 07:57:21'),
(74, '{\"socket_id\":\"lIpHnu4aV29oxE84AAAC\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_1503cc14-0169-40ea-804b-5ba631c4957b\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 07:57:25'),
(75, '{\"socket_id\":\"AT6xEeSHlNu9BLjvAAAD\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_44d19209-c153-410c-beae-f383baf1f704\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 07:57:37'),
(76, '{\"socket_id\":\"AT6xEeSHlNu9BLjvAAAD\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_44d19209-c153-410c-beae-f383baf1f704\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 07:57:37'),
(77, '{\"socket_id\":\"TNGvKgP-UsHkHOFJAAAA\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_ecdfea93-3813-479e-86ac-c6617d1f19a0\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 08:00:56'),
(78, '{\"socket_id\":\"BS3-OeGFJPX9Qe4TAAAA\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_b9c7f072-218c-4c08-b526-c8078dad6b8a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 08:01:03'),
(79, '{\"socket_id\":\"DH4MDMgWrjfVQSaYAAAB\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_4567474a-d569-45d6-bd9e-77ffc754a856\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 08:01:05'),
(80, '{\"socket_id\":\"DH4MDMgWrjfVQSaYAAAB\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_4567474a-d569-45d6-bd9e-77ffc754a856\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 08:01:11'),
(81, '{\"socket_id\":\"d-7GzFLZ-fWzVcIFAAAC\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_84dd4f46-0ad7-4fa8-a509-1c00e824b32e\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 08:01:12'),
(82, '{\"socket_id\":\"R8UN4eXYXJA3XyupAAAA\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6b250d8a-3124-4bf6-bc1b-4a8942aaab7c\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 08:01:50'),
(83, '{\"socket_id\":\"-qzLvEbAumxCga4ZAAAB\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_c4d214d1-be34-4707-9b0c-63e3dd43ffd6\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 08:01:50'),
(84, '{\"socket_id\":\"-qzLvEbAumxCga4ZAAAB\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_c4d214d1-be34-4707-9b0c-63e3dd43ffd6\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 08:06:11'),
(85, '{\"socket_id\":\"6s58Z8HLrs6oQeRsAAAC\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0c1cc15a-2bba-4833-9aea-53f2cd9ca05d\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 08:06:11'),
(86, '{\"socket_id\":\"6s58Z8HLrs6oQeRsAAAC\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0c1cc15a-2bba-4833-9aea-53f2cd9ca05d\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 08:06:12'),
(87, '{\"socket_id\":\"6s58Z8HLrs6oQeRsAAAC\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0c1cc15a-2bba-4833-9aea-53f2cd9ca05d\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 08:15:32'),
(88, '{\"socket_id\":\"6s58Z8HLrs6oQeRsAAAC\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0c1cc15a-2bba-4833-9aea-53f2cd9ca05d\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 08:32:36'),
(89, '{\"socket_id\":\"rnWuYAydtPaJu6y-AAAD\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_2784a239-03ad-47d2-8f4f-811ccdd324b9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 09:49:04'),
(90, '{\"socket_id\":\"rnWuYAydtPaJu6y-AAAD\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_2784a239-03ad-47d2-8f4f-811ccdd324b9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 09:49:11'),
(91, '{\"socket_id\":\"WBSswUFD0EuVwD2CAAAE\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_385a6e27-74e7-4c7d-ac44-31bbdc0d2f66\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 09:51:54'),
(92, '{\"socket_id\":\"WBSswUFD0EuVwD2CAAAE\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_385a6e27-74e7-4c7d-ac44-31bbdc0d2f66\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 09:52:24'),
(93, '{\"socket_id\":\"iRYrtOtAOAIu2GkBAAAF\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_7a371301-32e0-41cc-94ab-f1673413b64a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 09:52:28'),
(94, '{\"socket_id\":\"iRYrtOtAOAIu2GkBAAAF\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_7a371301-32e0-41cc-94ab-f1673413b64a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 09:52:29'),
(95, '{\"socket_id\":\"F1ZQj5IppepQZPJ5AAAG\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3a61cb5f-03d2-48d0-9aa5-885ddc69ad42\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:06:50'),
(96, '{\"socket_id\":\"F1ZQj5IppepQZPJ5AAAG\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3a61cb5f-03d2-48d0-9aa5-885ddc69ad42\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:09:25'),
(97, '{\"socket_id\":\"QPpyudqWM3V7q471AAAH\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_f2bb15ba-7ff7-473f-bb17-538c31491526\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:09:27'),
(98, '{\"socket_id\":\"QPpyudqWM3V7q471AAAH\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_f2bb15ba-7ff7-473f-bb17-538c31491526\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:09:38'),
(99, '{\"socket_id\":\"kIBmABCsx2Mwew83AAAI\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_822baee9-438d-46e0-957f-21a32356cffb\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:39:27'),
(100, '{\"socket_id\":\"kIBmABCsx2Mwew83AAAI\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_822baee9-438d-46e0-957f-21a32356cffb\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:41:45'),
(101, '{\"socket_id\":\"PZTxohHdcKcffrbyAAAJ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9b23eeea-822b-440e-9c23-7f005740dc49\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:41:49'),
(102, '{\"socket_id\":\"PZTxohHdcKcffrbyAAAJ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9b23eeea-822b-440e-9c23-7f005740dc49\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 10:41:49'),
(103, '{\"socket_id\":\"PZTxohHdcKcffrbyAAAJ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9b23eeea-822b-440e-9c23-7f005740dc49\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:43:40'),
(104, '{\"socket_id\":\"4NforNqcHU2rcAaAAAAK\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_681459c2-4ca2-47b3-98ba-5117c7b5a171\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:47:34'),
(105, '{\"socket_id\":\"4NforNqcHU2rcAaAAAAK\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_681459c2-4ca2-47b3-98ba-5117c7b5a171\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 10:47:34'),
(106, '{\"socket_id\":\"4NforNqcHU2rcAaAAAAK\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_681459c2-4ca2-47b3-98ba-5117c7b5a171\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:48:06'),
(107, '{\"socket_id\":\"wLj0JkXX687fbX7wAAAL\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d66389dd-56c1-4bce-8014-681067ff6c9a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:48:48'),
(108, '{\"socket_id\":\"wLj0JkXX687fbX7wAAAL\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d66389dd-56c1-4bce-8014-681067ff6c9a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 10:48:49'),
(109, '{\"socket_id\":\"wLj0JkXX687fbX7wAAAL\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d66389dd-56c1-4bce-8014-681067ff6c9a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:55:38'),
(110, '{\"socket_id\":\"V9aUBR2xwjU32nIUAAAM\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_8c280705-a96b-4a45-bd35-288410e6d8d1\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:55:39'),
(111, '{\"socket_id\":\"V9aUBR2xwjU32nIUAAAM\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_8c280705-a96b-4a45-bd35-288410e6d8d1\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 10:55:40'),
(112, '{\"socket_id\":\"V9aUBR2xwjU32nIUAAAM\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_8c280705-a96b-4a45-bd35-288410e6d8d1\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:57:17'),
(113, '{\"socket_id\":\"-FUzQ9qDiIOh21fTAAAN\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_00a35860-8320-4259-90b9-c49e2a0f6279\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:57:18');
INSERT INTO `socket_logs` (`socket_logs_id`, `user_data`, `event_type`, `request_object`, `response_object`, `rooms`, `created_date`) VALUES
(114, '{\"socket_id\":\"-FUzQ9qDiIOh21fTAAAN\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_00a35860-8320-4259-90b9-c49e2a0f6279\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 10:57:18'),
(115, '{\"socket_id\":\"-FUzQ9qDiIOh21fTAAAN\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_00a35860-8320-4259-90b9-c49e2a0f6279\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:58:11'),
(116, '{\"socket_id\":\"GNdrYm1KLpWJnRnPAAAO\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_80fb45bd-84bc-4538-b2d1-db9c85d2c50b\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 10:58:12'),
(117, '{\"socket_id\":\"GNdrYm1KLpWJnRnPAAAO\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_80fb45bd-84bc-4538-b2d1-db9c85d2c50b\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 10:58:12'),
(118, '{\"socket_id\":\"GNdrYm1KLpWJnRnPAAAO\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_80fb45bd-84bc-4538-b2d1-db9c85d2c50b\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 10:58:43'),
(119, '{\"socket_id\":\"7dDjUQTPre0hGfCDAAAP\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_f8d35d15-13fd-437f-8c21-3af3f6f11c41\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:02:13'),
(120, '{\"socket_id\":\"7dDjUQTPre0hGfCDAAAP\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_f8d35d15-13fd-437f-8c21-3af3f6f11c41\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 11:02:13'),
(121, '{\"socket_id\":\"7dDjUQTPre0hGfCDAAAP\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_f8d35d15-13fd-437f-8c21-3af3f6f11c41\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:03:22'),
(122, '{\"socket_id\":\"sdy5S2uBjWD6w0PdAAAQ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_933caf39-9cec-476f-b932-a3825742fe19\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:03:22'),
(123, '{\"socket_id\":\"sdy5S2uBjWD6w0PdAAAQ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_933caf39-9cec-476f-b932-a3825742fe19\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 11:03:23'),
(124, '{\"socket_id\":\"sdy5S2uBjWD6w0PdAAAQ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_933caf39-9cec-476f-b932-a3825742fe19\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:07:55'),
(125, '{\"socket_id\":\"mC0bNnBudhtEiBTmAAAR\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_711f335e-15eb-49d2-ba76-6a8623e1cbbd\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:07:57'),
(126, '{\"socket_id\":\"mC0bNnBudhtEiBTmAAAR\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_711f335e-15eb-49d2-ba76-6a8623e1cbbd\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 11:07:57'),
(127, '{\"socket_id\":\"f2_GgafmrUkGC9gUAAAS\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_edc86131-481e-45e2-8736-ce9b3803f642\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:12:29'),
(128, '{\"socket_id\":\"f2_GgafmrUkGC9gUAAAS\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_edc86131-481e-45e2-8736-ce9b3803f642\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 11:12:29'),
(129, '{\"socket_id\":\"f2_GgafmrUkGC9gUAAAS\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_edc86131-481e-45e2-8736-ce9b3803f642\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:12:30'),
(130, '{\"socket_id\":\"f2_GgafmrUkGC9gUAAAS\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_edc86131-481e-45e2-8736-ce9b3803f642\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:12:31'),
(131, '{\"socket_id\":\"MaeMjlKcCYmjZ_8EAAAT\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_5bc8c0af-a2d6-4982-b085-b8d4c3a93075\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:12:32'),
(132, '{\"socket_id\":\"MaeMjlKcCYmjZ_8EAAAT\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_5bc8c0af-a2d6-4982-b085-b8d4c3a93075\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:13:53'),
(133, '{\"socket_id\":\"ykQGFGPJEEBWa_4uAAAU\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_c7fdabd1-ad65-437b-910e-97f648338c4d\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:14:41'),
(134, '{\"socket_id\":\"ykQGFGPJEEBWa_4uAAAU\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_c7fdabd1-ad65-437b-910e-97f648338c4d\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'send_group_message', '{}', '{\"status\":0,\"data\":{\"instance\":{},\"schema\":{\"id\":\"/send_group_message\",\"type\":\"object\",\"properties\":{\"socket_access_token\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"deal_id\":{\"type\":\"string\"},\"room\":{\"type\":\"string\"},\"message_content\":{\"type\":\"string\"},\"message_type\":{\"type\":\"string\"}},\"required\":[\"socket_access_token\",\"type\",\"deal_id\",\"room\",\"message_content\",\"message_type\"]},\"options\":{},\"path\":[],\"propertyPath\":\"instance\",\"errors\":[{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"socket_access_token\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"socket_access_token\",\"stack\":\"instance requires property \\\"socket_access_token\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"type\",\"stack\":\"instance requires property \\\"type\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"deal_id\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"deal_id\",\"stack\":\"instance requires property \\\"deal_id\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"room\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"room\",\"stack\":\"instance requires property \\\"room\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_content\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_content\",\"stack\":\"instance requires property \\\"message_content\\\"\"},{\"path\":[],\"property\":\"instance\",\"message\":\"requires property \\\"message_type\\\"\",\"schema\":\"/send_group_message\",\"instance\":{},\"name\":\"required\",\"argument\":\"message_type\",\"stack\":\"instance requires property \\\"message_type\\\"\"}],\"disableFormat\":false},\"msg\":\"Validation error!\"}', NULL, '2021-06-30 11:14:42'),
(135, '{\"socket_id\":\"0FkaOSCkPEZltt7BAAAV\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6e05bf3b-924d-4a6d-af8b-e8b485f52526\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:20:43'),
(136, '{\"socket_id\":\"0FkaOSCkPEZltt7BAAAV\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6e05bf3b-924d-4a6d-af8b-e8b485f52526\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'on_edit_msg', '{\"channel_type\":\"1on1\",\"receiver_user_id\":\"1\",\"deal_id\":\"53\",\"deal_chat_room_id\":\"blank\",\"message_object_id\":\"e4f09fef-8151-4fdc-92d3-6aec97130611\",\"socket_access_token\":\"access_token_24ea8b3b-9767-464a-bb85-22bf29f8b28e\",\"message_content\":\"Hey There1111112222111!\",\"message_type\":\"text\"}', '{\"status\":0,\"msg\":\"Invalid socket_access_token.\"}', NULL, '2021-06-30 11:20:44'),
(137, '{\"socket_id\":\"q-blC29M18nzDsM7AAAW\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_a5a95333-d7d7-4aa1-bb55-2ad04bdaa693\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:21:51'),
(138, '{\"socket_id\":\"xDFJvvbn7-SGug4VAAAX\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_669ad798-8810-421c-a6d5-a1d351d7c655\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:21:56'),
(139, '{\"socket_id\":\"xDFJvvbn7-SGug4VAAAX\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_669ad798-8810-421c-a6d5-a1d351d7c655\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:22:06'),
(140, '{\"socket_id\":\"xDFJvvbn7-SGug4VAAAX\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_669ad798-8810-421c-a6d5-a1d351d7c655\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:23:20'),
(141, '{\"socket_id\":\"xDFJvvbn7-SGug4VAAAX\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_669ad798-8810-421c-a6d5-a1d351d7c655\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:32:24'),
(142, '{\"socket_id\":\"xDFJvvbn7-SGug4VAAAX\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_669ad798-8810-421c-a6d5-a1d351d7c655\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:32:40'),
(143, '{\"socket_id\":\"gZO_wyWfbCoBN5MIAAAY\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_c7d04d5b-fdb1-48e5-9147-2d9a47ebaad6\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:44:55'),
(144, '{\"socket_id\":\"4JwO0ZK2lCJYx9dqAAAZ\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9bb850d8-229a-417e-a332-0b1c07531d9c\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:44:58'),
(145, '{\"socket_id\":\"0Jf2-4xK8Eh_s6s1AAAa\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_4b9d8a94-db59-48a2-bc5e-7ac1c5225d13\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:00'),
(146, '{\"socket_id\":\"avgHj6ETQMUDtvoLAAAb\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0a629645-8d3d-451b-a918-ba960ac989a6\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:05'),
(147, '{\"socket_id\":\"Ki_JhWEN-wEk32luAAAc\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0d642cef-9cc4-46bb-ad62-bf1806e7f059\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:12'),
(148, '{\"socket_id\":\"Q_PHFshW_2BCWw6zAAAd\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_edae5afa-f39e-4a93-b7c4-246b3f84db94\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:19'),
(149, '{\"socket_id\":\"aXtPzstqCCxX0JbGAAAe\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9d319a27-406e-4ffa-81cf-12e7a36a4af5\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:25'),
(150, '{\"socket_id\":\"aXtPzstqCCxX0JbGAAAe\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9d319a27-406e-4ffa-81cf-12e7a36a4af5\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:45:25'),
(151, '{\"socket_id\":\"aXtPzstqCCxX0JbGAAAe\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9d319a27-406e-4ffa-81cf-12e7a36a4af5\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:45:28'),
(152, '{\"socket_id\":\"aXtPzstqCCxX0JbGAAAe\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9d319a27-406e-4ffa-81cf-12e7a36a4af5\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:45:30'),
(153, '{\"socket_id\":\"HjC_DPBis_tV-KO3AAAf\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6ea52686-7136-4835-8247-48fdb4f4db8d\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:32'),
(154, '{\"socket_id\":\"HjC_DPBis_tV-KO3AAAf\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6ea52686-7136-4835-8247-48fdb4f4db8d\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:45:35'),
(155, '{\"socket_id\":\"GOG9wRn1xObKqL5cAAAg\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_096baec3-298e-4c6a-a87d-00be0f36dc55\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:39'),
(156, '{\"socket_id\":\"GOG9wRn1xObKqL5cAAAg\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_096baec3-298e-4c6a-a87d-00be0f36dc55\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:45:42'),
(157, '{\"socket_id\":\"Sl8S7dp_PDCSxwUOAAAh\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_decff4fb-5e7f-47dd-8069-3b08d1373259\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:45'),
(158, '{\"socket_id\":\"Sl8S7dp_PDCSxwUOAAAh\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_decff4fb-5e7f-47dd-8069-3b08d1373259\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:45:49'),
(159, '{\"socket_id\":\"3twu4PscxVoFdyuHAAAi\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0cf80689-d94a-4005-ba26-604ca49bbcb2\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:52'),
(160, '{\"socket_id\":\"3twu4PscxVoFdyuHAAAi\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_0cf80689-d94a-4005-ba26-604ca49bbcb2\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:45:55'),
(161, '{\"socket_id\":\"ezIRVUXj6c6vVzEyAAAj\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_cff13ef7-4ad1-4c5b-a7f4-db84f81f7913\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:45:59'),
(162, '{\"socket_id\":\"ezIRVUXj6c6vVzEyAAAj\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_cff13ef7-4ad1-4c5b-a7f4-db84f81f7913\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:02'),
(163, '{\"socket_id\":\"l7dg9fyMD-r7IghPAAAk\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_714c0708-18fb-4fc1-acde-0b2ee31179fc\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:05'),
(164, '{\"socket_id\":\"l7dg9fyMD-r7IghPAAAk\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_714c0708-18fb-4fc1-acde-0b2ee31179fc\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:09'),
(165, '{\"socket_id\":\"wIhZJWdZx7-EpRWYAAAl\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_a9c66487-0924-4938-addc-838e10e83186\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:12'),
(166, '{\"socket_id\":\"wIhZJWdZx7-EpRWYAAAl\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_a9c66487-0924-4938-addc-838e10e83186\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:15'),
(167, '{\"socket_id\":\"qq7naMqrPTiYa5n3AAAm\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_55c450f9-b0a9-4809-9f6c-3ce9728b04f2\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:19'),
(168, '{\"socket_id\":\"qq7naMqrPTiYa5n3AAAm\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_55c450f9-b0a9-4809-9f6c-3ce9728b04f2\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:22'),
(169, '{\"socket_id\":\"h67vsewrKFX_uhMiAAAn\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_96e4971e-7f71-40ef-9cab-32a9b00ccee3\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:25'),
(170, '{\"socket_id\":\"h67vsewrKFX_uhMiAAAn\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_96e4971e-7f71-40ef-9cab-32a9b00ccee3\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:29'),
(171, '{\"socket_id\":\"O8p4qc3S1sk5hkmjAAAo\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_8499634a-5117-4f50-8a55-a92551ec8a2f\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:31'),
(172, '{\"socket_id\":\"O8p4qc3S1sk5hkmjAAAo\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_8499634a-5117-4f50-8a55-a92551ec8a2f\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:35'),
(173, '{\"socket_id\":\"n_M8eBIfu3Z9GLJGAAAp\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_a39f7fbd-2702-4bc8-840f-4d8fa337cdcf\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:38'),
(174, '{\"socket_id\":\"n_M8eBIfu3Z9GLJGAAAp\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_a39f7fbd-2702-4bc8-840f-4d8fa337cdcf\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:42'),
(175, '{\"socket_id\":\"iQMuwsz0beqlH35BAAAq\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9f00d9a4-e3b0-41b5-b3a4-e035e6644702\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:44'),
(176, '{\"socket_id\":\"iQMuwsz0beqlH35BAAAq\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_9f00d9a4-e3b0-41b5-b3a4-e035e6644702\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:49'),
(177, '{\"socket_id\":\"wqk5Q9W8QQ0cIIo4AAAr\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_926093ff-4dbe-4458-ad8a-456cf051c1cd\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:51'),
(178, '{\"socket_id\":\"wqk5Q9W8QQ0cIIo4AAAr\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_926093ff-4dbe-4458-ad8a-456cf051c1cd\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:46:55'),
(179, '{\"socket_id\":\"pseFmVR-hjUrOJz5AAAs\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3a7bb53e-4ad0-485b-ab54-2b61f58c9ecb\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:46:58'),
(180, '{\"socket_id\":\"pseFmVR-hjUrOJz5AAAs\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3a7bb53e-4ad0-485b-ab54-2b61f58c9ecb\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:01'),
(181, '{\"socket_id\":\"bMVadEM23gRC4zB6AAAt\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d75a7995-df56-40b8-be00-251855547676\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:47:04'),
(182, '{\"socket_id\":\"bMVadEM23gRC4zB6AAAt\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_d75a7995-df56-40b8-be00-251855547676\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:08'),
(183, '{\"socket_id\":\"1W2SkwP_2JNxGipGAAAu\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_8914919a-d393-4e1d-a389-ed5ff36542cf\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:47:10'),
(184, '{\"socket_id\":\"1W2SkwP_2JNxGipGAAAu\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_8914919a-d393-4e1d-a389-ed5ff36542cf\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:14'),
(185, '{\"socket_id\":\"d01nGvRoUM8hTAEMAAAv\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3b8c65df-a4e7-4989-b564-8d9e5d46aa54\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:47:16'),
(186, '{\"socket_id\":\"d01nGvRoUM8hTAEMAAAv\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_3b8c65df-a4e7-4989-b564-8d9e5d46aa54\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:21'),
(187, '{\"socket_id\":\"WAJXfK6kRZVNoFmCAAAw\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_038ec933-35da-4ee8-b840-548dc847a6bc\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:47:22'),
(188, '{\"socket_id\":\"WAJXfK6kRZVNoFmCAAAw\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_038ec933-35da-4ee8-b840-548dc847a6bc\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:28'),
(189, '{\"socket_id\":\"Uzg0r_4LbTgOrJXOAAAx\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_80326d5d-b003-44ec-a07e-a398aef7d329\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:47:28'),
(190, '{\"socket_id\":\"Uzg0r_4LbTgOrJXOAAAx\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_80326d5d-b003-44ec-a07e-a398aef7d329\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:34'),
(191, '{\"socket_id\":\"RVStGYXwKEUhkTwfAAAy\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_2220414d-d41c-4207-b2b2-13df4863687a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:47:34'),
(192, '{\"socket_id\":\"RVStGYXwKEUhkTwfAAAy\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_2220414d-d41c-4207-b2b2-13df4863687a\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:40'),
(193, '{\"socket_id\":\"vpmQane6f6n6tCGsAAAz\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6570d0d3-0438-4c33-835d-883b47841fc9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 11:47:40'),
(194, '{\"socket_id\":\"vpmQane6f6n6tCGsAAAz\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6570d0d3-0438-4c33-835d-883b47841fc9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:46'),
(195, '{\"socket_id\":\"vpmQane6f6n6tCGsAAAz\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6570d0d3-0438-4c33-835d-883b47841fc9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:52'),
(196, '{\"socket_id\":\"vpmQane6f6n6tCGsAAAz\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6570d0d3-0438-4c33-835d-883b47841fc9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:47:58'),
(197, '{\"socket_id\":\"vpmQane6f6n6tCGsAAAz\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6570d0d3-0438-4c33-835d-883b47841fc9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:48:04'),
(198, '{\"socket_id\":\"vpmQane6f6n6tCGsAAAz\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_6570d0d3-0438-4c33-835d-883b47841fc9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 11:48:10'),
(199, '{\"socket_id\":\"qAhRCSd2E2mVIW6cAAA0\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_c9b5d7b5-35b5-4195-b4ca-e107326e8bb9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 12:29:15'),
(200, '{\"socket_id\":\"qAhRCSd2E2mVIW6cAAA0\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_c9b5d7b5-35b5-4195-b4ca-e107326e8bb9\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 12:29:28'),
(201, '{\"socket_id\":\"1QwZP3wsqd0aSShhAAA1\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_401689f9-baa7-46a1-80ac-5b5e5b6efb08\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 13:02:03'),
(202, '{\"socket_id\":\"1QwZP3wsqd0aSShhAAA1\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_401689f9-baa7-46a1-80ac-5b5e5b6efb08\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 13:02:06'),
(203, '{\"socket_id\":\"c7VWsLt7YxnSBsntAAA2\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_ef81a68c-ff71-4e89-a6c8-8dc72c36604f\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'connect', '{}', '{}', NULL, '2021-06-30 13:02:34'),
(204, '{\"socket_id\":\"c7VWsLt7YxnSBsntAAA2\",\"user_id\":\"60d606db048fa164572bed1dcd\",\"access_token\":\"access_token_ef81a68c-ff71-4e89-a6c8-8dc72c36604f\",\"user_name\":\"Suser\",\"email\":\"usertwo@gmail.com\"}', 'disconnect', '{}', '{}', NULL, '2021-06-30 13:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
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
  `remember_token` text NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `name`, `email`, `contact`, `profile`, `company`, `email_encrypt`, `salt_email`, `password`, `salt_pass`, `user_status`, `remember_token`, `created_at`) VALUES
('60dc916a7b8d031ff610eff4f8', 1, 'Suser', 'usertwo@gmail.com', '(031) 245 - 6789', 'No Profile', 'Foundersapproach', 'aGswYWxicDNXY0JnYzBkdVVBdVUrVHZxcjA4b1RMcFRBVTN4b1FIVnltMD0=', '4849118436747108', 'ZUZnL25CaE9OT0MwRDROWDlPSlJoQT09', '87473171111449', 'active', '', 1625067883),
('60dc9198dff55a501b3c06b48e', 2, 'Fuser', 'userone@gmail.com', '(031) 245 - 6789', 'No Profile', 'Foundersapproach', 'WGkyMGRVVVBVeHJpL0VtVFdxTnZQRXR2eXhYdlM4aVRib0NBVzIvWUxXND0=', '1741214885012522', 'WmtFejRUOFB2Wm9sZTIvVXM3TFN3dz09', '1176234717512882', 'active', '1881152148', 1625067928),
('60dd6d9f2f5abf0a9167243379', 7, 'Caldwell Maldonado', 'joha@mailinator.com', '(', 'No Profile', 'Allen Pruitt Plc', 'dlJxYlhWS3VpNEoyRmlPeGswWVNqaTQySUUrekZtMElOQThWVCtjRDVvRT0=', '194805511650522', 'czZQQzh0ZUhtTTUrTlJybWMwNXFYQT09', '6480213758031490', 'active', '', 1625124255);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_last_update`
--

CREATE TABLE `user_group_last_update` (
  `user_deal_last_update_id` int(11) NOT NULL,
  `deal_chat_room_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `last_update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `role_title` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
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
-- Indexes for table `1on1_last_update`
--
ALTER TABLE `1on1_last_update`
  ADD PRIMARY KEY (`user_1on1_last_update_id`),
  ADD UNIQUE KEY `user_id1_user_id2_deal_id` (`sender_user_id`,`receiver_user_id`,`deal_id`);

--
-- Indexes for table `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`deal_id`);

--
-- Indexes for table `deal_1on1_chat_msg`
--
ALTER TABLE `deal_1on1_chat_msg`
  ADD PRIMARY KEY (`deal_1on1_chat_msg_id`);

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
-- Indexes for table `deal_chat_participant`
--
ALTER TABLE `deal_chat_participant`
  ADD PRIMARY KEY (`deal_chat_participant_id`),
  ADD KEY `deal_chat_room_id` (`deal_chat_room_id`);

--
-- Indexes for table `deal_chat_room`
--
ALTER TABLE `deal_chat_room`
  ADD PRIMARY KEY (`deal_chat_room_id`);

--
-- Indexes for table `deal_invite_members`
--
ALTER TABLE `deal_invite_members`
  ADD PRIMARY KEY (`invite_id`);

--
-- Indexes for table `deal_room_msg`
--
ALTER TABLE `deal_room_msg`
  ADD PRIMARY KEY (`deal_room_msg_id`);

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
-- Indexes for table `socket_logs`
--
ALTER TABLE `socket_logs`
  ADD PRIMARY KEY (`socket_logs_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_group_last_update`
--
ALTER TABLE `user_group_last_update`
  ADD PRIMARY KEY (`user_deal_last_update_id`),
  ADD UNIQUE KEY `abc_ndx` (`deal_chat_room_id`,`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `1on1_last_update`
--
ALTER TABLE `1on1_last_update`
  MODIFY `user_1on1_last_update_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_1on1_chat_msg`
--
ALTER TABLE `deal_1on1_chat_msg`
  MODIFY `deal_1on1_chat_msg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_activity`
--
ALTER TABLE `deal_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deal_chat`
--
ALTER TABLE `deal_chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_chat_participant`
--
ALTER TABLE `deal_chat_participant`
  MODIFY `deal_chat_participant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deal_invite_members`
--
ALTER TABLE `deal_invite_members`
  MODIFY `invite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deal_room_msg`
--
ALTER TABLE `deal_room_msg`
  MODIFY `deal_room_msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deal_timeline_tasks`
--
ALTER TABLE `deal_timeline_tasks`
  MODIFY `deal_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `general_tasks`
--
ALTER TABLE `general_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `socket_logs`
--
ALTER TABLE `socket_logs`
  MODIFY `socket_logs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `user_group_last_update`
--
ALTER TABLE `user_group_last_update`
  MODIFY `user_deal_last_update_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
