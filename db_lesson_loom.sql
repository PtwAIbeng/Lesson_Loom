-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 08, 2024 at 07:56 AM
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
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `school_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `event_type` enum('class','exam','holiday','other') DEFAULT 'other',
  `background_color` varchar(20) DEFAULT '#3788d8',
  `status` enum('active','deleted') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calendar_events`
--

INSERT INTO `calendar_events` (`id`, `title`, `description`, `start_date`, `end_date`, `school_id`, `teacher_id`, `class_id`, `event_type`, `background_color`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', '2024-12-08 03:27:47', '2024-12-31 10:27:47', 1, 11, 14, 'class', '#3788d8', 'active', '2024-12-08 02:28:26', '2024-12-08 02:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `parent_message_id` int(11) DEFAULT NULL,
  `status` enum('active','deleted') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `grade_level` varchar(50) NOT NULL,
  `start_sy` date NOT NULL,
  `end_sy` date NOT NULL,
  `school_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `status` enum('active','archived') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_archived` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `subject`, `grade_level`, `start_sy`, `end_sy`, `school_id`, `teacher_id`, `status`, `created_at`, `updated_at`, `is_archived`) VALUES
(4, 'test', 'test', '2024-12-07', '2024-12-31', 1, 1, 'active', '2024-12-06 17:59:45', '2024-12-07 15:22:57', 1),
(8, 'Mother Tongue', 'Grade 3', '2024-06-01', '2025-03-01', 1, NULL, 'active', '2024-12-07 14:46:11', '2024-12-07 14:46:11', 0),
(11, 'test', 'Grade 1', '2024-01-01', '2024-12-01', 1, NULL, 'active', '2024-12-07 15:14:00', '2024-12-07 15:14:00', 0),
(12, 'English', 'Grade 3', '2024-01-01', '2024-12-01', 1, NULL, 'active', '2024-12-07 15:20:50', '2024-12-07 15:20:50', 0),
(13, 'Science', 'Grade 6', '2024-01-01', '2024-12-01', 1, NULL, 'active', '2024-12-07 15:25:55', '2024-12-07 15:25:55', 0),
(14, 'Araling Panlipunan', 'Grade 5', '2024-01-01', '2024-12-01', 1, NULL, 'active', '2024-12-07 15:28:35', '2024-12-07 15:37:50', 0),
(15, 'test', 'Grade 2', '2024-01-01', '2024-12-01', 1, NULL, 'active', '2024-12-07 17:05:23', '2024-12-07 17:05:30', 1),
(16, 'test', 'Grade 1', '2024-12-08', '2024-12-31', 1, 2, 'active', '2024-12-07 18:35:22', '2024-12-07 18:35:22', 0),
(17, 'test', 'Grade 1', '2024-12-08', '2024-12-31', 1, 2, 'active', '2024-12-07 18:35:24', '2024-12-08 03:08:32', 1),
(18, 'English', 'Grade 2', '2024-01-01', '2024-12-01', 1, NULL, 'active', '2024-12-08 02:37:51', '2024-12-08 02:37:51', 0),
(19, 'Mathematics', 'Grade 6', '2024-11-01', '2025-12-01', 1, NULL, 'active', '2024-12-08 03:07:57', '2024-12-08 03:08:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `class_students`
--

CREATE TABLE `class_students` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_work`
--

CREATE TABLE `class_work` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','deleted') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_work`
--

INSERT INTO `class_work` (`id`, `class_id`, `school_id`, `teacher_id`, `title`, `description`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(3, 14, 1, 1, 'test', 'test', '2024-12-10', '2024-12-22', 'active', '2024-12-08 03:43:48', '2024-12-08 03:43:48'),
(4, 14, 1, 1, 'test', 'test', '2024-12-10', '2024-12-22', 'active', '2024-12-08 03:43:48', '2024-12-08 03:43:48'),
(5, 14, 1, 4, 'test', 'test', '2024-12-09', '2024-12-10', 'active', '2024-12-08 03:45:18', '2024-12-08 03:45:18'),
(6, 14, 1, 1, 'Banga', 'Banga', '2024-12-09', '2024-12-10', 'active', '2024-12-08 03:45:43', '2024-12-08 03:45:43'),
(7, 14, 1, 4, 'Banga', 'Banga', '2024-12-10', '2024-12-11', 'active', '2024-12-08 03:46:12', '2024-12-08 03:46:12'),
(8, 16, 1, 1, 'test', 'test', '2024-12-09', '2024-12-31', 'active', '2024-12-08 04:10:19', '2024-12-08 04:10:19');

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
(9, 1, 'profile', '675079dc0910b_1733327324.jpg', '2024-12-04 23:40:30', 1, NULL),
(10, 10, 'certificate', 'uploads/certificates/6752e152e0020_Lesson_Plan_Template.docx', '2024-12-06 19:34:42', NULL, NULL),
(11, 11, 'certificate', 'uploads/certificates/6752e2efc3831_Lesson_Plan_Template.docx', '2024-12-06 19:41:35', NULL, NULL),
(12, 12, 'certificate', 'uploads/certificates/6752e41c0c6bf_Lesson_Plan_Template.docx', '2024-12-06 19:46:36', NULL, NULL),
(13, 13, 'certificate', 'uploads/certificates/6752ed604ada5_Lesson_Plan_Template.docx', '2024-12-06 20:26:08', NULL, NULL),
(14, 14, 'certificate', 'uploads/certificates/6752f0756ce1d_Lesson_Plan_Template.docx', '2024-12-06 20:39:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_plan`
--

CREATE TABLE `lesson_plan` (
  `id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `objectives` text NOT NULL,
  `content` text NOT NULL,
  `preliminary_activities` text NOT NULL,
  `preliminary_teachers_activities` text NOT NULL,
  `preliminary_students_activities` text NOT NULL,
  `teacher_developing_activities` text NOT NULL,
  `student_developing_activities` text NOT NULL,
  `teacher_activity` text NOT NULL,
  `student_activity` text NOT NULL,
  `teacher_analysis` text NOT NULL,
  `student_analysis` text NOT NULL,
  `teacher_abstraction` text NOT NULL,
  `student_abstraction` text NOT NULL,
  `teacher_application` text NOT NULL,
  `student_application` text NOT NULL,
  `assignment` text NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lesson_plan`
--

INSERT INTO `lesson_plan` (`id`, `topic`, `objectives`, `content`, `preliminary_activities`, `preliminary_teachers_activities`, `preliminary_students_activities`, `teacher_developing_activities`, `student_developing_activities`, `teacher_activity`, `student_activity`, `teacher_analysis`, `student_analysis`, `teacher_abstraction`, `student_abstraction`, `teacher_application`, `student_application`, `assignment`, `teacher`, `created_at`, `updated_at`) VALUES
(0, 'TOPIC:  DIFFERENT TYPES OF WEATHER ( EARTH AND SPACE)', 'A.	The student should know about the different types of weather.\r\nB.	The students can recognize and appreciate about the weather\r\nC.	The instructor will give task or activities about the lesson which is the different types of weather.\r\nAt the end of the lesson the students should able to…\r\n1.	 Tell the weather.\r\n2.	 Help understand the types of weather which is the (sunny, rainy, snowy, windy, stormy, etc.)\r\n3.	Know the different types of weather and enhance their understanding of weather phenomena.\r\n', 'A.	LEARNING RESOURCES\r\nhttps://youtu.be/NbZl3-VvUnc?si=z8gCZ64Bxxun1ZCa\r\n\r\n\r\nB.	OTHER RESOURCES\r\nPower point, books, pictures and videos, blackboard, chalk.\r\n', '●	Prayer\r\n\r\n●	Greetings\r\n\r\n\r\n\r\n\r\n\r\n\r\n●	Checking the Attendance\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n●	Review\r\n', '-	Kieffer can you lead the prayer?\r\n\r\n-	Good morning class!\r\n-	How are you today?\r\n\r\n\r\n\r\n\r\n-	Let’s check the attendance first, say present if your name is called… Espiel? Imbong? Suganob?\r\n\r\n\r\n\r\n\r\n\r\n\r\n-	Teacher will recall the last topic of the lesson they discuss\r\n', '(One student will lead the prayer)\r\n-	Okay teacher\r\n\r\n-	Good morning teacher\r\n-	Were good teacher\r\n\r\n-	Present teacher!\r\n-	Present teacher!\r\n-	Present teacher!\r\n', '-	Before the teacher will show some pictures, teacher and students will sing a song that related to the topic.\r\n\r\n-	After that the teacher will show some images or videos depicting various types of weather (sunny, rainy, snowy, windy, stormy, etc.) to engage students and prompt discussion.\r\n\r\n-	Present a brief lecture or interactive presentation on different types of weather, explaining each type\'s characteristics, causes, and effects.\r\n\r\n-	After the quick presentation the teacher will divide the students into small groups and assign each group a specific type of weather (e.g., sunny, rainy, snowy, stormy).\r\n\r\n-	The teacher will allow 15 minutes to brainstorm about the topic.\r\n', '-	Students singing\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n-	Students will be able to determine and identified the differences types of weather.\r\n', 'DIRECTION: Identify what weather is in the picture.\r\n\r\n\r\na.	Rainy\r\nb.	Sunny\r\nc.	Windy\r\nd.	Stormy\r\ne.	Cloudy\r\n', 'TEST', 'DIRECTION: Identify what weather is in the picture.\r\n\r\n\r\na.	Rainy\r\nb.	Sunny\r\nc.	Windy\r\nd.	Stormy\r\ne.	Cloudy\r\n', '\r\n\r\n\r\n\r\n\r\n\r\n●	( one pupil answer)\r\n●	(one pupil answer)\r\n●	Rainy days!\r\n\r\n●	Sunny days!\r\n\r\n●	Cloudy weather refers to a condition where the sky is covered with clouds, blocking the direct sunlight while Wind is caused by the movement of air masses due to differences in temperature and pressure.\r\n', '\r\n\r\n\r\n\r\n\r\n\r\n●	( one pupil answer)\r\n●	(one pupil answer)\r\n●	Rainy days!\r\n\r\n●	Sunny days!\r\n\r\n●	Cloudy weather refers to a condition where the sky is covered with clouds, blocking the direct sunlight while Wind is caused by the movement of air masses due to differences in temperature and pressure.\r\n', 'TEST', 'DIRECTION:CONNECT THE PICTURE TO ITS NAME', 'TEST', 'DIRECTION:CONNECT THE PICTURE TO ITS NAME', 'PACALDO STEPHANIE MARIE L.', '2024-12-05 22:16:57', '2024-12-05 14:16:57'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2024-12-05 22:25:19', '2024-12-05 14:25:19'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2024-12-05 22:30:49', '2024-12-05 14:30:49'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2024-12-05 22:36:12', '2024-12-05 14:36:12'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '0000-00-00 00:00:00', '2024-12-05 14:46:58'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2024-12-05 22:50:16', '2024-12-05 14:50:16'),
(0, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', '2024-12-05 22:57:29', '2024-12-05 14:57:29'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2024-12-05 23:05:16', '2024-12-05 15:05:16'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2024-12-05 23:07:03', '2024-12-05 15:07:03'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2024-12-05 23:12:21', '2024-12-05 15:12:21'),
(0, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2024-12-05 23:23:14', '2024-12-05 15:23:14'),
(0, 'DIFFERENT TYPES OF WEATHER ( EARTH AND SPACE)', 'A.	The student should know about the different types of weather.\r\nB.	The students can recognize and appreciate about the weather\r\nC.	The instructor will give task or activities about the lesson which is the different types of weather.\r\nAt the end of the lesson the students should able to…\r\n1.	 Tell the weather.\r\n2.	 Help understand the types of weather which is the (sunny, rainy, snowy, windy, stormy, etc.)\r\n3.	Know the different types of weather and enhance their understanding of weather phenomena.\r\n', 'A.	LEARNING RESOURCES\r\nhttps://youtu.be/NbZl3-VvUnc?si=z8gCZ64Bxxun1ZCa\r\n\r\n\r\nB.	OTHER RESOURCES\r\nPower point, books, pictures and videos, blackboard, chalk.\r\n', 'A.	LEARNING RESOURCES\r\nhttps://youtu.be/NbZl3-VvUnc?si=z8gCZ64Bxxun1ZCa\r\n\r\n\r\nB.	OTHER RESOURCES\r\nPower point, books, pictures and videos, blackboard, chalk.\r\n', '-	Kieffer can you lead the prayer?\r\n\r\n-	Good morning class!\r\n-	How are you today?\r\n\r\n\r\n\r\n\r\n-	Let’s check the attendance first, say present if your name is called… Espiel? Imbong? Suganob?\r\n\r\n\r\n\r\n\r\n\r\n\r\n-	Teacher will recall the last topic of the lesson they discuss\r\n', '-	Kieffer can you lead the prayer?\r\n\r\n-	Good morning class!\r\n-	How are you today?\r\n\r\n\r\n\r\n\r\n-	Let’s check the attendance first, say present if your name is called… Espiel? Imbong? Suganob?\r\n\r\n\r\n\r\n\r\n\r\n\r\n-	Teacher will recall the last topic of the lesson they discuss\r\n', '-	Kieffer can you lead the prayer?\r\n\r\n-	Good morning class!\r\n-	How are you today?\r\n\r\n\r\n\r\n\r\n-	Let’s check the attendance first, say present if your name is called… Espiel? Imbong? Suganob?\r\n\r\n\r\n\r\n\r\n\r\n\r\n-	Teacher will recall the last topic of the lesson they discuss\r\n-	Present a brief lecture or interactive presentation on different types of weather, explaining each type\'s characteristics, causes, and effects.\r\n\r\n-	After the quick presentation the teacher will divide the students into small groups and assign each group a specific type of weather (e.g., sunny, rainy, snowy, stormy).\r\n\r\n-	The teacher will allow 15 minutes to brainstorm about the topic.\r\n\r\n', '-	Students singing\r\n-	Students will be able to determine and identified the differences types of weather.', 'a.	Rainy\r\nb.	Sunny\r\nc.	Windy\r\nd.	Stormy\r\ne.	Cloudy\r\n\r\n', 'test', 'After the exercise activity, the teacher will allow the students to brainstorm in any ideas they may have for the lesson or topic.\r\n\r\nAfter 10 minutes the teacher will ask question in every group.\r\n\r\n●	What\'s your favorite kind of weather?\r\n●	What’s your least favorite kind of weather?\r\n●	It is the day that we listen to the sound of raindrops?\r\n●	It is the day that we usually play on ground even its heat outside?\r\n●	What is the difference of cloudy and windy? \r\n', '●	( one pupil answer)\r\n●	(one pupil answer)\r\n●	Rainy days!\r\n\r\n●	Sunny days!\r\n\r\n●	Cloudy weather refers to a condition where the sky is covered with clouds, blocking the direct sunlight while Wind is caused by the movement of air masses due to differences in temperature and pressure.\r\n', '●	( one pupil answer)\r\n●	(one pupil answer)\r\n●	Rainy days!\r\n\r\n●	Sunny days!\r\n\r\n●	Cloudy weather refers to a condition where the sky is covered with clouds, blocking the direct sunlight while Wind is caused by the movement of air masses due to differences in temperature and pressure.\r\n', 'test', '\r\nDIRECTION:CONNECT THE PICTURE TO ITS NAME\r\n\r\n\r\n  \r\n\r\nConnect The Picture to its Name\r\n', 'test', 'For your assignment copy this to your notebook', 'PACALDO STEPHANIE MARIE L.', '2024-12-05 23:36:17', '2024-12-05 15:36:17'),
(0, 'Topic', 'Objectives', 'Content', 'Preliminary Activities', 'Preliminary Teacher\'s Activities', 'Preliminary Students\' Activities', 'Teacher Developing Activities', 'Student Developing Activities', 'Teacher Activity', 'Student Activity', 'Teacher Analysis', 'Student Analysis', 'Teacher Abstraction', 'Student Abstraction', 'Teacher Application', 'Student Application', 'Assignment', 'Arbel A. Casquejo', '2024-12-05 23:40:21', '2024-12-05 15:40:21'),
(0, 'DIFFERENT TYPES OF WEATHER ( EARTH AND SPACE)', 'A.	The student should know about the different types of weather.\r\nB.	The students can recognize and appreciate about the weather\r\nC.	The instructor will give task or activities about the lesson which is the different types of weather.\r\n', 'A.	LEARNING RESOURCES\r\nhttps://youtu.be/NbZl3-VvUnc?si=z8gCZ64Bxxun1ZCa\r\n', 'A.	LEARNING RESOURCES\r\nhttps://youtu.be/NbZl3-VvUnc?si=z8gCZ64Bxxun1ZCa\r\n', '-	Kieffer can you lead the prayer?\r\n\r\n-	Good morning class!\r\n-	How are you today?\r\n\r\n\r\n\r\n\r\n-	Let’s check the attendance first, say present if your name is called… Espiel? Imbong? Suganob?\r\n\r\n', '(One student will lead the prayer)\r\n-	Okay teacher\r\n\r\n-	Good morning teacher\r\n-	Were good teacher\r\n\r\n-	Present teacher!\r\n-	Present teacher!\r\n-	Present teacher!\r\n', '-	Before the teacher will show some pictures, teacher and students will sing a song that related to the topic.', '-	Students singing', 'a.	Rainy\r\nb.	Sunny\r\nc.	Windy\r\nd.	Stormy\r\ne.	Cloudy\r\n', 'Student Activity', 'After 10 minutes the teacher will ask question in every group.', '●	(one pupil answer)\r\n●	Rainy days!\r\n', 'There are various types of weather conditions that occur around the world. Here are some common types of weather:', 'Student Abstraction', 'Teacher Application', 'Student Application', 'Assignment', 'Arbel A. Casquejo', '2024-12-06 00:08:24', '2024-12-05 16:08:24'),
(0, 'DIFFERENT TYPES OF WEATHER ( EARTH AND SPACE)', 'A.	The student should know about the different types of weather.\r\nB.	The students can recognize and appreciate about the weather\r\nC.	The instructor will give task or activities about the lesson which is the different types of weather.\r\n', 'A.	LEARNING RESOURCES\r\nhttps://youtu.be/NbZl3-VvUnc?si=z8gCZ64Bxxun1ZCa\r\n', '●	Prayer\r\n\r\n●	Greetings\r\n\r\n\r\n\r\n\r\n\r\n\r\n●	Checking the Attendance\r\n', '-	Kieffer can you lead the prayer?\r\n\r\n-	Good morning class!\r\n-	How are you today?\r\n\r\n\r\n\r\n\r\n-	Let’s check the attendance first, say present if your name is called… Espiel? Imbong? Suganob?\r\n\r\n', '(One student will lead the prayer)\r\n-	Okay teacher\r\n\r\n-	Good morning teacher\r\n-	Were good teacher\r\n\r\n-	Present teacher!\r\n-	Present teacher!\r\n-	Present teacher!\r\n', '-	Before the teacher will show some pictures, teacher and students will sing a song that related to the topic.', '-	Students singing', 'a.	Rainy\r\nb.	Sunny\r\nc.	Windy\r\nd.	Stormy\r\ne.	Cloudy\r\n', 'Student Activity', 'After 10 minutes the teacher will ask question in every group.', '●	(one pupil answer)\r\n●	Rainy days!\r\n', 'There are various types of weather conditions that occur around the world. Here are some common types of weather:', 'Student Abstraction', 'Teacher Application', 'Student Application', 'Assignment', 'Arbel A. Casquejo', '2024-12-06 00:09:35', '2024-12-05 16:09:35'),
(0, 'DIFFERENT TYPES OF WEATHER ( EARTH AND SPACE)', 'A.	The student should know about the different types of weather.\r\nB.	The students can recognize and appreciate about the weather\r\nC.	The instructor will give task or activities about the lesson which is the different types of weather.\r\n', 'A.	LEARNING RESOURCES\r\nhttps://youtu.be/NbZl3-VvUnc?si=z8gCZ64Bxxun1ZCa\r\n', '●	Prayer\r\n\r\n●	Greetings\r\n\r\n\r\n\r\n\r\n\r\n\r\n●	Checking the Attendance\r\n', '-	Kieffer can you lead the prayer?\r\n\r\n-	Good morning class!\r\n-	How are you today?\r\n\r\n\r\n\r\n\r\n-	Let’s check the attendance first, say present if your name is called… Espiel? Imbong? Suganob?\r\n\r\n', '(One student will lead the prayer)\r\n-	Okay teacher\r\n\r\n-	Good morning teacher\r\n-	Were good teacher\r\n\r\n-	Present teacher!\r\n-	Present teacher!\r\n-	Present teacher!\r\n', '-	Before the teacher will show some pictures, teacher and students will sing a song that related to the topic.', '-	Students singing', 'a.	Rainy\r\nb.	Sunny\r\nc.	Windy\r\nd.	Stormy\r\ne.	Cloudy\r\n', 'Student Activity', 'After 10 minutes the teacher will ask question in every group.', '●	(one pupil answer)\r\n●	Rainy days!\r\n', 'There are various types of weather conditions that occur around the world. Here are some common types of weather:', 'Student Abstraction', 'Teacher Application', 'Student Application', 'Assignment', 'Arbel A. Casquejo', '2024-12-06 00:09:35', '2024-12-05 16:09:35');

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
  `preliminary_teachers_activities` text NOT NULL,
  `preliminary_students_activities` text NOT NULL,
  `teacher_developing_activities` text NOT NULL,
  `student_developing_activities` text NOT NULL,
  `teacher_activity` text NOT NULL,
  `student_activity` text NOT NULL,
  `teacher_analysis` text NOT NULL,
  `student_analysis` text NOT NULL,
  `teacher_abstraction` text NOT NULL,
  `student_abstraction` text NOT NULL,
  `teacher_application` text NOT NULL,
  `student_application` text NOT NULL,
  `assignment` text NOT NULL,
  `teacher` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active',
  `file_path` varchar(255) NOT NULL
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
  `sch_status` tinyint(4) DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `sch_id`, `sch_acro`, `sch_name`, `sch_address`, `sch_contact`, `sch_status`, `created`) VALUES
(1, '0001', 'CPC', 'Cordova, Public, College', 'Gabi, Cordova, Cebu 6017', '234-1117', 1, '2024-12-01 02:48:11'),
(12, '0002', 'CCES', 'Cordova Central Elementary School', 'Poblacion, Cordova  Cebu', '09273742667', 1, '2024-12-06 19:41:35'),
(13, '0003', 'CNHS', 'Cordova National High School', 'Day-as, Cordova  Cebu', '9273742667', 0, '2024-12-06 19:46:36'),
(14, '0003', 'BNHS', 'Babag National High School', 'Babag, Lapu-Lapu City', '9273742667', 0, '2024-12-06 20:26:08'),
(15, '0004', 'MNHS ', 'Marigondon National High School', 'Marigondon, Lapu-Lapu City', '9273742667', 2, '2024-12-06 20:39:17');

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
(4, 1, 'Ronel', 'Meramonte', NULL, NULL, NULL, NULL, 1, '2024-12-06 21:20:01');

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
(11, 2, 12, NULL, 'cces@gmail.com', '$2y$10$4GtDRqukcKGiDReVColgo.pODg971lQBnv4amsF40ZL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-12-06 19:41:35', NULL),
(12, 2, 13, NULL, 'cnhs@gmail.com', '$2y$10$SD3ddV0hz6yIvUxJjKFdMODCPQXm9ef0GOZC0TaD/7T', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-12-06 19:46:36', NULL),
(13, 2, 14, NULL, 'bnhs@gmail.com', '$2y$10$U66Kn7El9lHdNup5dUNXRO0yIawKDuTPldSFGAOmKQS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-06 20:26:08', NULL),
(14, 2, 15, NULL, 'mnhs@gmail.com', '$2y$10$Vim3qC5BIwyVHLbV.9UL9u/anJT2Y2A2jNlHZ/Oou18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, '2024-12-06 20:39:17', NULL),
(15, 3, 1, 4, 'meramonte@gmail.com', '$2y$10$b8V8lyiYHJp2fOiJPoZdnujcx7b7l79DwCu7q8owDkZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-12-06 21:20:01', NULL);

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
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `parent_message_id` (`parent_message_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `class_students`
--
ALTER TABLE `class_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `class_work`
--
ALTER TABLE `class_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `teacher_id` (`teacher_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher` (`teacher`);

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
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `class_students`
--
ALTER TABLE `class_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_work`
--
ALTER TABLE `class_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lesson_plans`
--
ALTER TABLE `lesson_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD CONSTRAINT `calendar_events_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `calendar_events_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `calendar_events_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `chats_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `chats_ibfk_5` FOREIGN KEY (`parent_message_id`) REFERENCES `chats` (`id`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `class_students`
--
ALTER TABLE `class_students`
  ADD CONSTRAINT `class_students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `class_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `class_work`
--
ALTER TABLE `class_work`
  ADD CONSTRAINT `class_work_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `class_work_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `class_work_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD CONSTRAINT `fk_school_id` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_plans`
--
ALTER TABLE `lesson_plans`
  ADD CONSTRAINT `lesson_plans_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
