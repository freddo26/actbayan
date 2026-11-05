SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- ============================================================================
-- STEP 1: BASE PARENT TABLES (location, address, contacts, registration)
-- ============================================================================

-- --------------------------------------------------------
-- 1. Table structure and data for `location`
-- --------------------------------------------------------
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,7) NOT NULL,
  `y` decimal(10,7) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `location` (`location_id`, `x`, `y`) VALUES
(1, 15.2023548, 121.0151596),
(2, 15.2024326, 121.0152243),
(4, 15.4453067, 120.9447569),
(5, 15.4453335, 120.9447505),
(6, 15.4453335, 120.9447505),
(7, 15.6041223, 121.0504937),
(8, 15.6031679, 121.0503244),
(9, 15.6045570, 121.0520606),
(10, 15.6054973, 121.0528767),
(11, 15.6021648, 121.0498082),
(12, 15.6050221, 121.0491443),
(13, 15.6098064, 121.0176801),
(14, 15.6010333, 121.0782158),
(15, 15.6084758, 121.0194317),
(16, 15.4495178, 120.9401655);

-- --------------------------------------------------------
-- 2. Table structure and data for `address`
-- --------------------------------------------------------
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_no` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `brgyorsubd` varchar(100) DEFAULT NULL,
  `cityormunicipality` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postalcode` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'Philippines',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `address` (`address_id`, `house_no`, `street`, `brgyorsubd`, `cityormunicipality`, `province`, `postalcode`, `country`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, 'Philippines'),
(2, NULL, NULL, NULL, NULL, NULL, NULL, 'Philippines'),
(10, '0327', 'Zone 4', 'Partida', 'San Miguel', 'Bulacan', NULL, 'Philippines'),
(11, '111', 'Calamansi', 'Bravo', 'General Mamerto Natividad', 'Nueva Ecija', NULL, 'Philippines'),
(15, 'NA', 'NA', 'San Francisco', 'Llanera', 'Nueva Ecija', NULL, 'Philippines'),
(16, 'Blk 1', 'Mabini', 'Buga', 'San Miguel', 'Bulacan', NULL, 'Philippines'),
(17, '123', 'Ipil St. ', 'Mataas na Kahoy', 'General Mamerto Natividad', 'Nueva Ecija', NULL, 'Philippines'),
(18, '0992', 'Zone4', 'Magsaysay Pob', 'Jovellar', 'Albay', NULL, 'Philippines'),
(19, 'isid', 'jeje', 'Bita', 'Culasi', 'Antique', NULL, 'Philippines'),
(20, '474', 'Ipil St. ', 'Mataas na Kahoy', 'General Mamerto Natividad', 'Nueva Ecija', NULL, 'Philippines'),
(22, '0992', 'Zone 5', 'Panacsac', 'General Mamerto Natividad', 'Nueva Ecija', NULL, 'Philippines');

-- --------------------------------------------------------
-- 3. Table structure and data for `contacts`
-- --------------------------------------------------------
CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `contacts` (`contact_id`, `email`, `phone_number`) VALUES
(1, 'lgu@actbayan.gov.ph', '09222222222'),
(2, 'admin@actbayan.gov.ph', '09111111111'),
(10, 'ijiayreusebio@gmail.com', '09506348554'),
(11, 'fredricksantiabs99@gmail.com', '09090909090'),
(14, 'sanfrbs26@gmail.com', '09760692055'),
(15, 'lee@gmail.com', '09365441563'),
(16, 'markly@gmail.com', '09123123412'),
(17, 'halomadlamgpipol@gmail.com', '09923456712'),
(18, 'kahitano@gmail.com', '09123456789'),
(19, 'markly1@gmail.com', '09121234567'),
(20, 'Canva@gmail.com', '09946531875');

-- --------------------------------------------------------
-- 4. Table structure and data for `registration`
-- --------------------------------------------------------
CREATE TABLE `registration` (
  `registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(50) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `verified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`registration_id`),
  UNIQUE KEY `email_address` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `registration` (`registration_id`, `email_address`, `phone_number`, `password_hash`, `created_at`, `verified_at`) VALUES
(1, 'jayreusebio@gmail.com', '09506348554', '$2b$12$E.Rxw7dr3t2ypWo.ZCweUujg2XOthv1LA5C3LxYL6GzRSxP86hlx6', '2026-07-14', NULL),
(2, 'ijayreusebio@gmail.com', '09090909090', '$2b$12$HUvmFcVCvawgHy0LGRxHQuoMBwgFE..8JkMn23jVtM.Ji1e8Fv1Lm', '2026-07-14', NULL),
(14, 'ladygaga@gmail.com', '09654789632', '$2b$12$zYjy5cINHPAKMxBb2M0HKOUTtx6ViuFzJ/FgloM8khkLZ6jOo6FLy', '2026-08-19', NULL),
(21, 'markly@msn.com', '09121234123', '$2b$12$5iy34TySLCoJ2hz8DZvBsOfYGyx1ufCaIkbHBHIsuGn8v9Pt5ECze', '2026-08-27', NULL);


-- ============================================================================
-- STEP 2: ACCOUNTS & REPORTS TABLES (Populated before report_activity)
-- ============================================================================

-- --------------------------------------------------------
-- 5. Table structure and data for `accounts`
-- --------------------------------------------------------
CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_initial` varchar(10) DEFAULT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `contact_id` (`contact_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `accounts` (`account_id`, `contact_id`, `address_id`, `first_name`, `last_name`, `middle_initial`, `dob`) VALUES
(1, 1, 1, 'LGU', 'Official', '', '1990-01-01'),
(2, 2, 2, 'System', 'Admin', '', '1990-01-01'),
(10, 10, 10, 'Ferdinand Jr', 'Eusebio', 'D', '2005-05-05'),
(11, 11, 11, 'Fred Rick', 'Santiago', 'B', '2005-03-26'),
(15, 14, 15, 'Fred Rick', 'Santiago', '', '2010-09-05'),
(16, 15, 16, 'Lee', 'Pineda', 'G', '2005-01-24'),
(17, 16, 17, 'Markly Harrison', 'Magbuhos', '', '2005-08-12'),
(18, 17, 18, 'Juan', 'Dela cruz', 'M', '2006-01-19'),
(19, 18, 19, 'joe', 'MaMa', '', '2011-08-24'),
(20, 19, 20, 'Markly', 'Magbuhos', '', '2011-08-27'),
(22, 20, 22, 'Anastasia ', 'Dela Cruz', 'N', '2006-02-14');

-- --------------------------------------------------------
-- 6. Table structure and data for `announcements`
-- --------------------------------------------------------
CREATE TABLE `announcements` (
  `ann_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `ann_title` varchar(254) DEFAULT NULL,
  `ann_desc` text DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ann_id`),
  UNIQUE KEY `ann_title` (`ann_title`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `announcements` (`ann_id`, `account_id`, `ann_title`, `ann_desc`, `submitted_at`, `category`) VALUES
(1, 1, 'WANTED: Lester', 'Lester Romero was accused of a serious crime today. If you see him, please contact us. His alleged actions are deeply concerning.', '2026-07-20 18:42:17', 'General'),
(2, 1, 'Incoming Typhoon', 'Hello Fellow Residents,\r\n\r\nI am writing to you today with an urgent announcement regarding an impending natural phenomenon. We have received confirmation that a typhoon is headed directly towards our city, and its arrival is imminent. We urge all citizens to take this warning seriously and to prepare yourselves and your properties accordingly.\r\n\r\nYour safety is our utmost priority. Please ensure that all your valuable belongings are secured, and take all necessary precautions to protect your homes and loved ones. We understand that such events can be unsettling, and we want to assure you that the local government unit is working tirelessly to mitigate any potential risks and to provide support to our community.\r\n\r\nTo facilitate immediate assistance during this critical period, we have established an emergency hotline. This line will be operational 24/7, and we encourage you to call us without hesitation should you face any emergency situations or require immediate aid. We have a dedicated team ready to respond to your calls and to dispatch necessary resources.\r\n\r\nFurthermore, in light of the potential dangers posed by the typhoon, we have made the decision to transition all educational institutions to an online learning mode with immediate effect. This measure is being implemented to ensure the safety of our students and faculty, and we kindly request your cooperation in making this transition as smooth as possible. Further details regarding online learning protocols will be disseminated through respective school administrations.\r\n\r\nWe appreciate your understanding and cooperation during this challenging time. By working together, we can ensure the safety and well-being of everyone in our beloved city.\r\n\r\nThank you very much,\r\n\r\n-LGU Officials', '2026-08-24 14:07:08', 'Safety');

-- --------------------------------------------------------
-- 7. Table structure and data for `reports`
-- (`upvote_count` populated as INT from old `upvotes` table)
-- --------------------------------------------------------
CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_activity` timestamp NULL DEFAULT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `upvote_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`report_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `reports` (`report_id`, `title`, `location_id`, `description`, `status`, `created_at`, `last_activity`, `public_key`, `upvote_count`) VALUES
(4, 'Aftermath of the Massive Flood', 5, 'Greetings, esteemed LGU officials! We are reaching out to you today with an urgent and heartfelt plea for assistance from the municipality of Peñaranda, Nueva Ecija. Our community is currently grappling with the devastating aftermath of a massive flood, an event that has profoundly impacted every facet of our daily lives and is significantly hindering our ability to recover and progress. The extensive damage and disruption caused by this natural disaster have left many of our residents in a precarious situation, making it incredibly challenging for us to move forward and rebuild. We desperately need your support and intervention to overcome these immense obstacles and pave the way for our community\'s recovery.', 'In Progress', '2026-08-19 14:40:57', '2026-08-19 22:43:27', '32da69ca-b5ba-4aa1-957f-fb90d55a0c9a', 0),
(5, 'Massive Road Pots', 6, 'To the esteemed local government unit and our dearest Mayor of GMN,\r\n\r\nWe, the concerned citizens, are writing to you today with an urgent plea regarding the condition of our local road. The current state of this vital thoroughfare is causing significant distress and poses a serious threat to the safety of our community. The damage is extensive, making it not only difficult to traverse but also highly prone to unfortunate accidents. We implore your good office to intervene and provide the necessary assistance to resolve this pressing issue. Your immediate attention and support in this matter would be deeply appreciated, and we believe that with your help, we can make our roads safer for everyone. Thank you for your anticipated understanding and swift action.', 'Pending', '2026-08-19 14:52:59', '2026-08-19 14:52:59', 'e2595970-dd24-4084-9929-100f5e45de81', 0),
(7, 'Flooding Issues on Main Road', 8, 'Flooded areas are becoming a hassle with waist deep waters running and can\'t pass by small cars', 'Pending', '2026-08-24 06:00:23', '2026-08-24 06:00:23', 'b2eb3a2d-6ffa-4577-9792-042281a9d691', 0),
(8, 'Sirang Street light sa kanto', 9, 'May nakatumbang poste na ilaw sa kanto, nakakaharang sa daanan.', 'Pending', '2026-08-24 06:00:49', '2026-08-24 06:00:49', '4c08c407-ee2b-4287-b91e-fca2d1ceb81a', 0),
(9, 'Tulong LGU', 10, 'Dear LGU can please help us to resolve the issue after the massive flood?', 'Pending', '2026-08-24 06:01:10', '2026-08-24 06:01:10', '393b4bd0-34ee-47c9-8396-a965e5b1ba6b', 1),
(10, 'Baradong kanal sa kanto ng kamias', 11, 'Madaming basura na nakabara sa kalsada, kaya\'t ito ay nag dududlot ng baha sa daanan.', 'Pending', '2026-08-24 06:03:45', '2026-08-24 06:03:45', '76206de4-22f7-4677-9480-cd984ebf46c7', 0),
(11, 'Fallen Tree on our yard', 12, 'Patulong po, nabagsak po ung puno dito sa tapat ng aming bahay', 'Pending', '2026-08-24 06:06:22', '2026-08-24 06:06:22', '078dcb4d-59b3-4656-9620-32faadc0e1c5', 0),
(12, 'Muddy and Slippery Bridge Approach Road', 13, 'Yung daan papunta/palabas ng tulay ay puro putik at madulas, lalo na pag umuulan. Yung slope papuntang bridge ay walang proper pavement o hagdan/grip kaya mahirap daanan ng motor at mga sasakyan. Delikado lalo na sa mga sumasakay ng motor dahil sa pagkadulas ng gulong sa putik.', 'Pending', '2026-08-24 06:06:49', '2026-08-24 06:06:49', 'f3663f89-9b4d-4d6f-a48f-a3c706fcd519', 0),
(13, 'Dirty Poultry onTalabutab norte', 14, 'There was dirty poultry on talabutab norte, it causes foul smell, it needs to have action.', 'Pending', '2026-08-24 06:07:42', '2026-08-24 06:07:42', '317f1b10-8142-4e41-bc78-ca8c5de0047c', 0),
(14, 'Damaged Streetlight', 15, 'Kinakalawang at di na gumagana ang streetlight, nakaka apekto sa naglalakad lalo pag padilim na', 'Pending', '2026-08-24 06:12:04', '2026-08-24 06:12:04', 'e4626b5d-f068-4662-887e-46e7d98dc307', 0);

-- --------------------------------------------------------
-- 8. Table structure and data for `reports_media`
-- --------------------------------------------------------
CREATE TABLE `reports_media` (
  `report_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  KEY `report_id` (`report_id`),
  CONSTRAINT `reports_media_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `reports_media` (`report_id`, `path`) VALUES
(4, 'static/uploads/concerns/concern_10_1787150457_flood-aftermath-scene-stockcake.jpg'),
(5, 'static/uploads/concerns/concern_11_1787151179_broken-road-destruction-of-road-surface-photo.jpg'),
(7, 'static/uploads/concerns/concern_16_1787551223_inbound3228536767509443899.jpg'),
(8, 'static/uploads/concerns/concern_15_1787551249_1000418396.jpg'),
(9, 'static/uploads/concerns/concern_10_1787551270_flood.jpg'),
(10, 'static/uploads/concerns/concern_15_1787551425_1000418397.jpg'),
(11, 'static/uploads/concerns/concern_16_1787551582_inbound7134643433103837327.jpg'),
(12, 'static/uploads/concerns/concern_17_1787551609_6769.jpg'),
(13, 'static/uploads/concerns/concern_15_1787551662_1000418398.jpg'),
(14, 'static/uploads/concerns/concern_17_1787551924_6771.jpg');


-- ============================================================================
-- STEP 3: REPORT_ACTIVITY & ACTIVITY_MEDIA (Created after accounts & reports)
-- ============================================================================

-- --------------------------------------------------------
-- 9. Table structure and data for `report_activity`
-- (Populated as `report_update` and `feedbacks`)
-- --------------------------------------------------------
CREATE TABLE `report_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `activity_type` varchar(50) NOT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `account_id` (`account_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `report_activity_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `report_activity_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Note: FOREIGN_KEY_CHECKS is kept at 0 here so legacy records from the dump 
-- that reference previously deleted report_id (1, 2) or account_id (4, 6) insert cleanly.
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `report_activity` (`activity_id`, `account_id`, `report_id`, `activity_type`, `content`) VALUES
(1, 1, 1, 'report_update', 'okay dear resident we are taking this actions of this report we may asssume you that we will take responsibility on this'),
(2, 1, 2, 'report_update', 'jkjvhv'),
(3, 1, 1, 'report_update', 'still in progress but 50% are now clean, we expected to finish this problem by the end of OCTOBER'),
(4, 1, 1, 'report_update', 'If you have any concerns or require further clarification regarding this matter, please do not hesitate to report it. Your feedback is valuable and we are here to address any questions or issues you may have, ensuring a comprehensive understanding and resolution.'),
(5, 1, 4, 'report_update', 'Thank you for submitting your report. We have successfully received and recorded the information you provided, and we want to assure you that your concern will be given proper attention.\r\n\r\nOur team will carefully review your report and take the necessary steps to determine the appropriate action regarding the matter. We appreciate your patience and cooperation while we work to address your concern.\r\n\r\nPlease make sure that the contact information you provided is accurate and accessible, as a member of our team may contact you for additional details, clarification, or updates regarding your report.\r\n\r\nThank you for bringing this matter to our attention. We will keep you informed of any developments and will contact you through your provided contact information once there is an update.'),
(6, 4, 1, 'feedbacks', 'lmao'),
(7, 6, 1, 'feedbacks', 'okay pu');

-- --------------------------------------------------------
-- 10. Table structure and data for `activity_media`
-- --------------------------------------------------------
CREATE TABLE `activity_media` (
  `activity_id` int(11) NOT NULL,
  `path` text NOT NULL,
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `activity_media_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `report_activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `activity_media` (`activity_id`, `path`) VALUES
(3, 'static/uploads/update_1_1784519388_waste.webp'),
(4, 'static/uploads/update_1_1784520843_clean.webp');


-- ============================================================================
-- STEP 4: AUTHENTICATION, ROLES & ACCESS ATTEMPTS
-- ============================================================================

-- --------------------------------------------------------
-- 11. Table structure and data for `role`
-- --------------------------------------------------------
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'resident'),
(2, 'lgu official'),
(3, 'admin');

-- --------------------------------------------------------
-- 12. Table structure and data for `password`
-- --------------------------------------------------------
CREATE TABLE `password` (
  `pass_id` int(11) NOT NULL AUTO_INCREMENT,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `password` (`pass_id`, `password_hash`) VALUES
(1, '$2b$12$p7Dq/TMF5puHeg713vlV6ut7LphWkKyh/Q7tv.WhJOHFDiTwqPcIG'),
(2, '$2b$12$vfvJuUcIsRla4x/bbOXcd.UgYG9yHEsyU.XvGwpG8GeMNOSH8ANHG'), (3, '$2b$12$IsXaWuj/.NFv3n9cvGqOMeuZAyDUgCOenZFyk5TKOW1QQacGqwXGS'),
(4, '$2b$12$HTv/BTCMiNuaFTqVQC/PuOCiAE6b9trpjI4q6EXyYXlgYP/g0JeFq'), (5, '$2b$12$Qorx93u6N6f0u3pZ5oHGk.9R4nN5xErPjxQ9oA9M6U.OD7D1aeX9W'),
(6, '$2b$12$m540PNJNxKOe/HEdgi5S.OeCudtK4Nxa55VPfGofg7h0R7mT3HqOW'), (7, '$2b$12$lWKgVAmycv3MnXo/MskEfOiDndc1JdSxJ/mopHnuMFjGNWLAEJyc.'),
(8, '$2b$12$1GkRuE1vu6.B7RyB/l2fROEf5tXJuGc92ugxoSmc3gj4Uq2gWkmuW'),
(9, '$2b$12$9JJooBToNDbMVtH8BQAqN.OKg88WwnZrEGB90SgDRXIQfGp4FWweW'),
(10, '$2b$12$p5iNKgp6Uj/GOgjSYK/w0uawWcNKWD2PyMzYS8RFRYdnmYDqRnPSO'), (11, '$2b$12$VzQjqFFUf.fJFBvHzTGZxOd8F1AP/XPURCyURhS7T21nN5X9nEqoy'),
(12, '$2b$12$WFUaM/ptQSeaGtkPjmLxe.XqiY6YJvWoXsxUHxJ8kMLVeZOW10Tu.'), (13, '$2b$12$Y09J1spCFz27kSR3791daeQzKDVm0FJ0fTg.5hp/QI5g8wE1RtiDW'),
(14, '$2b$12$6ZpbvhfsaWEPV6hEcQtVWuldiraH7/l3TAVpjilw.mLkkF4gPJlaS'),
(15, '$2b$12$cLdq/x7cQvMdSF2qeuT30OYrvjT5N8usLRjHUr8TLrmK6Sl6ECuf6'), (16, '$2b$12$L7H5mK6qyVHZTu1TjYPdz.nzFPaPX1RArSiFD0Pr4.qZR5biWcMSm'),
(17, '$2b$12$f/ACjV7qjDvX5MfWQNOSmuXgkd4lOjNIJjkGymRizRCgHw0EFfhRe'), (18, '$2b$12$MZwDsVbqtf5PM3tqP2CAUOOOy5mhS7oISe3vVUuFunZZaVodNo..O'),
(19, '$2b$12$tInvW0JMFWB2gIcYl3XMSOY1hTC0B7etJZTuYACj2MyQYfeBjdqGO'), (20, '$2b$12$KAFrL1X21kCraF1DNIQa9u9Gi/KU.usCV2yhtvl93xk0mqWdiaE9q');

-- --------------------------------------------------------
-- 13. Table structure and data for `usercreds`
-- --------------------------------------------------------
CREATE TABLE `usercreds` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) DEFAULT NULL,
  `emorph` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `usercreds_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usercreds` (`user_id`, `contact_id`, `emorph`) VALUES
(1, 1, 'lgu@actbayan.gov.ph'),
(2, 1, '09222222222'),
(3, 2, 'admin@actbayan.gov.ph'),
(4, 2, '09111111111'),
(19, 10, 'ijiayreusebio@gmail.com'),
(20, 10, '09506348554'),
(21, 11, 'fredricksantiabs99@gmail.com'),
(22, 11, '09090909090'),
(27, 14, 'sanfrbs26@gmail.com'),
(28, 14, '09760692055'),
(29, 15, 'lee@gmail.com'),
(30, 15, '09365441563'),
(31, 16, 'markly@gmail.com'),
(32, 16, '09123123412'),
(33, 17, 'halomadlamgpipol@gmail.com'),
(34, 17, '09923456712'),
(35, 18, 'kahitano@gmail.com'),
(36, 18, '09123456789'),
(37, 19, 'markly1@gmail.com'),
(38, 19, '09121234567'),
(39, 20, 'Canva@gmail.com'),
(40, 20, '09946531875');

-- --------------------------------------------------------
-- 14. Table structure and data for `user_role`
-- --------------------------------------------------------
CREATE TABLE `user_role` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usercreds` (`user_id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 3),
(4, 3),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- --------------------------------------------------------
-- 15. Table structure and data for `credentials`
-- --------------------------------------------------------
CREATE TABLE `credentials` (
  `cred_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pass_id` int(11) DEFAULT NULL,
  `last_failed_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_active_on` datetime DEFAULT NULL,
  `is_locked` varchar(100) DEFAULT NULL,
  `is_banned` tinyint(1) DEFAULT 0,
  `ban_duration` int(11) DEFAULT NULL,
  `lock_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`cred_id`),
  KEY `user_id` (`user_id`),
  KEY `pass_id` (`pass_id`),
  CONSTRAINT `credentials_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usercreds` (`user_id`),
  CONSTRAINT `credentials_ibfk_2` FOREIGN KEY (`pass_id`) REFERENCES `password` (`pass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `credentials` (`cred_id`, `user_id`, `pass_id`, `last_failed_at`, `is_active`, `last_active_on`, `is_locked`, `is_banned`, `ban_duration`, `lock_duration`) VALUES
(1, 1, 1, NULL, 1, '2026-08-27 22:18:22', 'N', 0, NULL, NULL),
(2, 2, 1, NULL, 1, NULL, 'N', 0, NULL, NULL),
(3, 3, 2, NULL, 1, '2026-08-27 22:13:33', 'N', 0, NULL, NULL),
(4, 4, 2, NULL, 1, NULL, 'N', 0, NULL, NULL),
(19, 19, 10, '2026-08-19 22:34:13', 1, '2026-08-27 23:12:10', NULL, 0, NULL, NULL),
(20, 20, 10, NULL, 1, NULL, NULL, 0, NULL, NULL),
(21, 21, 11, NULL, 1, NULL, NULL, 0, NULL, NULL),
(22, 22, 11, NULL, 1, NULL, NULL, 0, NULL, NULL),
(27, 27, 14, '2026-08-27 21:55:57', 1, '2026-08-27 21:56:07', NULL, 0, NULL, NULL),
(28, 28, 14, NULL, 1, NULL, NULL, 0, NULL, NULL),
(29, 29, 15, '2026-08-24 13:57:37', 1, '2026-08-27 21:56:22', NULL, 0, NULL, NULL),
(30, 30, 15, NULL, 1, NULL, NULL, 0, NULL, NULL),
(31, 31, 16, NULL, 1, '2026-08-27 22:21:20', NULL, 0, NULL, NULL),
(32, 32, 16, NULL, 1, NULL, NULL, 0, NULL, NULL),
(33, 33, 17, NULL, 1, NULL, NULL, 0, NULL, NULL),
(34, 34, 17, NULL, 1, NULL, NULL, 0, NULL, NULL),
(35, 35, 18, NULL, 1, NULL, NULL, 0, NULL, NULL),
(36, 36, 18, NULL, 1, NULL, NULL, 0, NULL, NULL),
(37, 37, 19, NULL, 1, '2026-08-27 22:24:00', NULL, 0, NULL, NULL),
(38, 38, 19, NULL, 1, NULL, NULL, 0, NULL, NULL),
(39, 39, 20, NULL, 1, '2026-08-28 00:02:11', NULL, 0, NULL, NULL),
(40, 40, 20, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------
-- 16. Table structure and data for `access_attempt`
-- --------------------------------------------------------
CREATE TABLE `access_attempt` (
  `attempt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cred_id` int(11) DEFAULT NULL,
  `credential_used` varchar(100) DEFAULT NULL,
  `attempted_at` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`attempt_id`),
  KEY `cred_id` (`cred_id`),
  CONSTRAINT `access_attempt_ibfk_1` FOREIGN KEY (`cred_id`) REFERENCES `credentials` (`cred_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `access_attempt` (`attempt_id`, `cred_id`, `credential_used`, `attempted_at`, `action`) VALUES
(1, 3, 'admin@actbayan.gov.ph', '2026-07-14 17:24:41', 'Success'),
(2, 1, 'lgu@actbayan.gov.ph', '2026-07-14 17:25:22', 'Success'),
(3, 1, 'lgu@actbayan.gov.ph', '2026-07-14 17:37:43', 'Success'),
(4, 19, 'ijiayreusebio@gmail.com', '2026-07-14 17:38:22', 'Success'),
(5, 19, 'ijiayreusebio@gmail.com', '2026-07-14 17:43:14', 'Success'),
(6, 1, 'lgu@actbayan.gov.ph', '2026-07-14 17:50:46', 'Success'),
(7, 3, 'admin@actbayan.gov.ph', '2026-07-14 19:37:15', 'Success'),
(8, 3, 'admin@actbayan.gov.ph', '2026-07-14 19:37:42', 'Success'),
(9, 19, 'ijiayreusebio@gmail.com', '2026-07-14 20:04:22', 'Success'),
(10, 19, 'ijiayreusebio@gmail.com', '2026-07-14 20:09:43', 'Success'),
(11, 3, 'admin@actbayan.gov.ph', '2026-07-14 20:56:05', 'Success'),
(12, 19, 'ijiayreusebio@gmail.com', '2026-07-14 20:57:14', 'Success'),
(13, 1, 'lgu@actbayan.gov.ph', '2026-07-14 23:22:28', 'Success'),
(14, NULL, 'ferdinandjreusebio@gmail.com', '2026-07-14 23:25:22', 'Success'),
(15, NULL, 'ferdinandjreusebio@gmail.com', '2026-07-14 23:31:04', 'Success'),
(16, 19, 'ijiayreusebio@gmail.com', '2026-07-20 09:44:29', 'Success'),
(17, 1, 'lgu@actbayan.gov.ph', '2026-07-20 11:43:15', 'Success'),
(18, 3, 'admin@actbayan.gov.ph', '2026-07-20 11:50:36', 'Success'),
(19, 27, 'sanfrbs26@gmail.com', '2026-07-20 11:52:03', 'Failed'),
(20, 3, 'admin@actbayan.gov.ph', '2026-07-20 11:52:05', 'Success'),
(21, 1, 'lgu@actbayan.gov.ph', '2026-07-20 11:54:40', 'Success'),
(22, 3, 'admin@actbayan.gov.ph', '2026-07-20 11:55:00', 'Success'),
(23, 1, 'lgu@actbayan.gov.ph', '2026-07-20 12:01:11', 'Success'),
(24, 27, 'sanfrbs26@gmail.com', '2026-07-20 12:12:41', 'Success'),
(25, 19, 'ijiayreusebio@gmail.com', '2026-07-20 12:17:27', 'Success'),
(26, NULL, 'lesterromero14@gamil.com', '2026-07-20 18:37:28', 'Failed'),
(27, 1, 'lgu@actbayan.gov.ph', '2026-07-20 18:38:34', 'Success'),
(28, NULL, 'jayreusebio@gmail.com', '2026-07-20 18:43:29', 'Failed'),
(29, 19, 'ijiayreusebio@gmail.com', '2026-07-20 18:43:48', 'Success'),
(30, NULL, 'lesterromero14@gmail.com', '2026-07-20 18:46:21', 'Failed'),
(31, NULL, 'lesterromero14@gmail.com', '2026-07-20 18:46:48', 'Failed'),
(32, NULL, 'lesterromero14@gmail.com', '2026-07-20 18:48:14', 'Failed'),
(33, 1, 'lgu@actbayan.gov.ph', '2026-07-20 18:55:09', 'Success'),
(34, NULL, 'lesterandreimatiasromero@gmail.com', '2026-07-20 18:57:35', 'Success'),
(35, NULL, 'lesterandreimatiasromero@gmail.com', '2026-07-20 18:58:50', 'Success'),
(36, NULL, 'jayreusebio@gmail.com', '2026-07-20 19:00:29', 'Failed'),
(37, 19, 'ijiayreusebio@gmail.com', '2026-08-14 22:21:55', 'Success'),
(38, 19, 'ijiayreusebio@gmail.com', '2026-08-14 23:39:20', 'Success'),
(39, 19, 'ijiayreusebio@gmail.com', '2026-08-19 21:38:30', 'Success'),
(40, 19, 'ijiayreusebio@gmail.com', '2026-08-19 21:39:24', 'Success'),
(41, 19, 'ijiayreusebio@gmail.com', '2026-08-19 22:15:24', 'Success'),
(42, 3, 'admin@actbayan.gov.ph', '2026-08-19 22:28:33', 'Success'),
(43, 19, 'ijiayreusebio@gmail.com', '2026-08-19 22:34:09', 'Failed'),
(44, 19, 'ijiayreusebio@gmail.com', '2026-08-19 22:34:13', 'Failed'),
(45, 1, 'lgu@actbayan.gov.ph', '2026-08-19 22:38:13', 'Success'),
(46, 3, 'admin@actbayan.gov.ph', '2026-08-19 22:57:32', 'Success'),
(47, NULL, 'ladygaga@gmail.com', '2026-08-19 23:19:24', 'Failed (Banned)'),
(48, NULL, 'ladygaga@gmail.com', '2026-08-19 23:19:40', 'Success'),
(49, NULL, 'ladygaga@gmail.com', '2026-08-19 23:19:57', 'Failed (Banned)'),
(50, NULL, 'ladygaga@gmail.com', '2026-08-19 23:20:32', 'Failed'),
(51, 1, 'lgu@actbayan.gov.ph', '2026-08-20 10:29:07', 'Success'),
(52, 3, 'admin@actbayan.gov.ph', '2026-08-20 10:36:47', 'Success'),
(53, 27, 'sanfrbs26@gmail.com', '2026-08-20 10:58:44', 'Success'),
(54, 19, 'ijiayreusebio@gmail.com', '2026-08-24 11:28:24', 'Success'),
(55, 1, 'lgu@actbayan.gov.ph', '2026-08-24 13:50:17', 'Success'),
(56, 27, 'sanfrbs26@gmail.com', '2026-08-24 13:53:26', 'Success'),
(57, 27, 'sanfrbs26@gmail.com', '2026-08-24 13:56:37', 'Success'),
(58, 29, 'lee@gmail.com', '2026-08-24 13:57:37', 'Failed'),
(59, 29, 'lee@gmail.com', '2026-08-24 13:57:58', 'Success'),
(60, 19, 'ijiayreusebio@gmail.com', '2026-08-24 13:59:06', 'Success'),
(61, 3, 'admin@actbayan.gov.ph', '2026-08-24 14:16:05', 'Success'),
(62, 1, 'lgu@actbayan.gov.ph', '2026-08-24 14:16:59', 'Success'),
(63, 27, 'sanfrbs26@gmail.com', '2026-08-27 21:55:57', 'Failed'),
(64, 27, 'sanfrbs26@gmail.com', '2026-08-27 21:56:07', 'Success'),
(65, 29, 'lee@gmail.com', '2026-08-27 21:56:22', 'Success'),
(66, 31, 'markly@gmail.com', '2026-08-27 21:57:45', 'Success'),
(67, 1, 'lgu@actbayan.gov.ph', '2026-08-27 22:12:20', 'Success'),
(68, 3, 'admin@actbayan.gov.ph', '2026-08-27 22:13:33', 'Success'),
(69, 37, 'markly1@gmail.com', '2026-08-27 22:16:53', 'Success'),
(70, 31, 'markly@gmail.com', '2026-08-27 22:17:31', 'Success'),
(71, 1, 'lgu@actbayan.gov.ph', '2026-08-27 22:18:22', 'Success'),
(72, 31, 'markly@gmail.com', '2026-08-27 22:21:20', 'Success'),
(73, 37, 'markly1@gmail.com', '2026-08-27 22:24:00', 'Success'),
(74, 19, 'ijiayreusebio@gmail.com', '2026-08-27 23:07:15', 'Success'),
(75, 19, 'ijiayreusebio@gmail.com', '2026-08-27 23:12:10', 'Success'),
(76, 39, 'Canva@gmail.com', '2026-08-28 00:02:11', 'Success');


-- ============================================================================
-- STEP 5: TRIGGERS (Added after all tables and data are populated)
-- ============================================================================

DELIMITER $$

CREATE TRIGGER `passcontact` AFTER INSERT ON `contacts` FOR EACH ROW BEGIN
    IF NEW.email IS NOT NULL THEN
        INSERT INTO usercreds(contact_id, emorph)
        VALUES (NEW.contact_id, NEW.email);
    END IF;

    IF NEW.phone_number IS NOT NULL THEN
        INSERT INTO usercreds(contact_id, emorph)
        VALUES (NEW.contact_id, NEW.phone_number);
    END IF;
END$$

CREATE TRIGGER `insertuser` AFTER INSERT ON `usercreds` FOR EACH ROW BEGIN
    INSERT INTO credentials (user_id) VALUES (NEW.user_id);
END$$

CREATE TRIGGER `passpass` AFTER INSERT ON `password` FOR EACH ROW BEGIN
    UPDATE credentials
    SET pass_id = NEW.pass_id
    WHERE cred_id = (SELECT MAX(cred_id) FROM (SELECT cred_id FROM credentials) AS temp);
END$$

DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;