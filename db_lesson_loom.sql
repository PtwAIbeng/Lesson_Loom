-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2024 at 12:54 AM
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
-- Database: `db_lesson_loom`
--

-- --------------------------------------------------------

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` int(11) NOT NULL,
  `resources_id` int(11) DEFAULT NULL,
  `resources_type` enum('profile','certificate','government_ids') DEFAULT NULL,
  `filename` text DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `teacher_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_uploads`
--

INSERT INTO `file_uploads` (`id`, `resources_id`, `resources_type`, `filename`, `created`, `teacher_id`, `school_id`) VALUES
(1, 4, 'certificate', 'uploads/certificates/674ef03c77318_Manuscript_Gantuangco_2024_for_OD_1.pdf', '2024-12-03 19:49:16', NULL, NULL),
(2, 5, 'certificate', 'uploads/certificates/674ef176cf756_Manuscript_Gantuangco_2024_for_OD_1.pdf', '2024-12-03 19:54:30', NULL, NULL),
(3, 6, 'certificate', 'uploads/certificates/674ef51ea045c_DINOY__EXPERIENTIAL_ANALYSIS.pdf', '2024-12-03 20:10:06', NULL, NULL),
(4, 8, 'certificate', 'uploads/certificates/674f38b95a56a_Screenshot_2024_04_08_141443.png', '2024-12-04 00:58:33', NULL, NULL),
(9, 1, 'profile', '675079dc0910b_1733327324.jpg', '2024-12-04 23:40:30', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_plans`
--

CREATE TABLE `lesson_plans` (
  `id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `objectives` text NOT NULL,
  `content` text NOT NULL,
  `preliminary_activities` text NOT NULL,
  `teachers_activities` text NOT NULL,
  `students_activities` text NOT NULL,
  `developing_activities` text NOT NULL,
  `activity` text NOT NULL,
  `analysis` text NOT NULL,
  `abstraction` text NOT NULL,
  `application` text NOT NULL,
  `assignment` text NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `sch_id` varchar(50) DEFAULT NULL,
  `sch_acro` varchar(50) DEFAULT NULL,
  `sch_name` varchar(50) DEFAULT NULL,
  `sch_address` varchar(50) DEFAULT NULL,
  `sch_contact` varchar(11) DEFAULT NULL,
  `sch_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0: inactive 1:active',
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `sch_id`, `sch_acro`, `sch_name`, `sch_address`, `sch_contact`, `sch_status`, `created`) VALUES
(1, '0001', 'CPC', 'Cordova, Public, College', 'Gabi, Cordova, Cebu 6017', '234-1117', 1, '2024-12-01 02:48:11'),
(2, '0002', 'CCES', 'Cordova  Central Elementary School', 'Cordova Cebu', '9273742667', 1, '2024-12-03 19:11:15'),
(7, '0003', 'CNHS', 'Cordova National High School ', 'Day-as, Cordova Cebu', '9273742667', 1, '2024-12-03 19:49:16'),
(8, '0004', 'CCCS', 'Cordova  Catholic  Cooperative School', 'Poblacion, Cordova Cebu', '9273742667', 1, '2024-12-03 19:54:30'),
(9, '0004', 'UC', 'University Of Cebu', 'Cebu City', '9273742667', 1, '2024-12-03 20:10:06'),
(10, '0006', 'MNHS', 'Marigondon National High School', 'Marigondon, Lapu-Lapu  City', '9273742667', 1, '2024-12-04 00:58:33');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `contact` varchar(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active',
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `school_id`, `fname`, `lname`, `gender`, `birthdate`, `contact`, `address`, `status`, `created`) VALUES
(1, 1, 'John', 'Doe', 'Male', '1999-01-01', '09123456789', 'Address Sample', 1, '2024-12-01 03:00:00'),
(2, 2, 'Arbel', 'Casquejo', 'Male', '2003-01-01', '09273742667', 'Ibabao, Cordova Cebu', 1, '2024-12-03 22:13:50'),
(3, 2, 'Lady', 'Dinoy', NULL, NULL, NULL, NULL, 1, '2024-12-04 07:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_role` tinyint(4) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `contact` varchar(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `last_active_date` datetime DEFAULT NULL,
  `is_online_flg` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: offline 1:online',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1:active',
  `created` datetime DEFAULT current_timestamp(),
  `confirm_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_role`, `school_id`, `teacher_id`, `email`, `password`, `fname`, `lname`, `gender`, `birthdate`, `contact`, `address`, `last_active_date`, `is_online_flg`, `status`, `created`, `confirm_password`) VALUES
(1, 1, NULL, NULL, 'admin@gmail.com', 'YWRtaW4=', 'Lesson', 'Loom', NULL, NULL, NULL, NULL, '2024-12-03 21:48:38', 0, 1, '2024-12-01 00:45:54', NULL),
(2, 2, 1, 1, 'renz@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a8', 'Renz', 'Escabase', NULL, NULL, NULL, NULL, '2024-12-03 19:53:25', 0, 1, '2024-12-01 01:51:57', NULL),
(3, 2, 2, NULL, 'cces@gmail.com', '$2y$10$K/Qb61PNj3bFU9ojsxPkEORYo4KoIIi/a3r7dyOkTzD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-03 19:11:15', NULL),
(4, 2, 7, NULL, 'cnhs@gmail.com', '$2y$10$CDLDAzZ5DOkUyf.9o7RR4ez0vbCtrd2HbDit0gBu7ll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-03 19:49:16', NULL),
(5, 2, 8, NULL, 'cccs@gmail.com', '$2y$10$tIVBHPv7cKmhFWMmtWc.8.SxI7D5JRx1PV8/Cu6VOQR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-03 19:54:30', NULL),
(6, 2, 9, NULL, 'uc@gmail.com', '$2y$10$8JATiDhv7ooPnChYqy.Gsu81kcfAXakJho/hmWWYBz3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-03 20:10:06', NULL),
(7, 3, NULL, 2, 'casquejo.gamer0199@gmail.com', '$2y$10$//qlZxQ8W1I3e3yOReBLzu/kFR8mHwiVV2tTLSJbSZr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-03 22:13:50', NULL),
(8, 2, 10, NULL, 'mnhs@gmail.com', '$2y$10$5wQfSmAw0x3KXiOQsnDxGeBCYY.3OuN4GaFG8SAavhp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-04 00:58:33', NULL),
(9, 3, NULL, 3, 'lady@gmail.com', '$2y$10$WsOVw7Um1Z8UBzZ7lLdsieUKb1usDNF0dT649GAEf.q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-04 07:26:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'school'),
(3, 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacher_id` (`teacher_id`),
  ADD KEY `fk_school_id` (`school_id`);

--
-- Indexes for table `lesson_plans`
--
ALTER TABLE `lesson_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lesson_plans`
--
ALTER TABLE `lesson_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD CONSTRAINT `fk_school_id` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
