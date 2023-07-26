-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2023 at 08:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `volt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_pwd` varchar(120) DEFAULT NULL,
  `admin_username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_pwd`, `admin_username`) VALUES
(1, '1234', 'oyoma@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('7123f1157413');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_price` float NOT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_price`, `updated_date`) VALUES
(1, 'Documents', 5000, NULL),
(2, 'Parcels and Packages', 6000, NULL),
(3, 'Retail Products', 7000, NULL),
(4, 'Delicate Items', 8000, NULL),
(5, 'Specialty Items', 1000, NULL),
(6, 'Hazardous Materials', 9000, '2023-07-08 23:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `message` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `fullname`, `phone_number`, `email`, `message`) VALUES
(1, 'oyoma ogugu', '08149508448', 'good@gmail.com', 'would love to meet');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `fullname`, `phone_number`, `email`, `address`) VALUES
(1, 'david', '08149508448', 'oma@gmail.com', 'no 6 foreign'),
(2, 'toyo', '08149508448', 'ooyoma@gmail.com', 'no 6 bolajide avenue');

-- --------------------------------------------------------

--
-- Table structure for table `journey`
--

CREATE TABLE `journey` (
  `journey_id` int(11) NOT NULL,
  `journey_user_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `destination` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `journey_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lga`
--

CREATE TABLE `lga` (
  `lga_id` int(11) NOT NULL,
  `lga_name` varchar(255) NOT NULL,
  `lga_state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lga`
--

INSERT INTO `lga` (`lga_id`, `lga_name`, `lga_state_id`) VALUES
(1, 'Aba North', 1),
(2, 'Aba South', 1),
(3, 'Arochukwu', 1),
(4, 'Bende', 1),
(5, 'Ikwuano', 1),
(6, 'Isiala-Ngwa North', 1),
(7, 'Isiala-Ngwa South', 1),
(8, 'Isikwuato', 1),
(9, 'Nneochi', 1),
(10, 'Obi-Ngwa', 1),
(11, 'Ohafia', 1),
(12, 'Osisioma', 1),
(13, 'Ugwunagbo', 1),
(14, 'Ukwa East', 1),
(15, 'Ukwa West', 1),
(16, 'Umuahia North', 1),
(17, 'Umuahia South', 1),
(18, 'Demsa', 2),
(19, 'Fufore', 2),
(20, 'Genye', 2),
(21, 'Girei', 2),
(22, 'Gombi', 2),
(23, 'guyuk', 2),
(24, 'Hong', 2),
(25, 'Jada', 2),
(26, 'Jimeta', 2),
(27, 'Lamurde', 2),
(28, 'Madagali', 2),
(29, 'Maiha', 2),
(30, 'Mayo Belwa', 2),
(31, 'Michika', 2),
(32, 'Mubi North', 2),
(33, 'Mubi South', 2),
(34, 'Numan', 2),
(35, 'Shelleng', 2),
(36, 'Song', 2),
(37, 'Toungo', 2),
(38, 'Yola', 2),
(39, 'Abak', 3),
(40, 'Eastern-Obolo', 3),
(41, 'Eket', 3),
(42, 'Ekpe-Atani', 3),
(43, 'Essien-Udim', 3),
(44, 'Esit Ekit', 3),
(45, 'Etim-Ekpo', 3),
(46, 'Etinam', 3),
(47, 'Ibeno', 3),
(48, 'Ibesikp-Asitan', 3),
(49, 'Ibiono-Ibom', 3),
(50, 'Ika', 3),
(51, 'Ikono', 3),
(52, 'Ikot-Abasi', 3),
(53, 'Ikot-Ekpene', 3),
(54, 'Ini', 3),
(55, 'Itu', 3),
(56, 'Mbo', 3),
(57, 'Mkpae-Enin', 3),
(58, 'Nsit-Ibom', 3),
(59, 'Nsit-Ubium', 3),
(60, 'Obot-Akara', 3),
(61, 'Okobo', 3),
(62, 'Onna', 3),
(63, 'Oron', 3),
(64, 'Oro-Anam', 3),
(65, 'Udung-Uko', 3),
(66, 'Ukanefun', 3),
(67, 'Uru Offong Oruko', 3),
(68, 'Uruan', 3),
(69, 'Uquo Ibene', 3),
(70, 'Uyo', 3),
(71, 'Aguata', 4),
(72, 'Anambra', 4),
(73, 'Anambra West', 4),
(74, 'Anocha', 4),
(75, 'Awka- North', 4),
(76, 'Awka-South', 4),
(77, 'Ayamelum', 4),
(78, 'Dunukofia', 4),
(79, 'Ekwusigo', 4),
(80, 'Idemili-North', 4),
(81, 'Idemili-South', 4),
(82, 'Ihiala', 4),
(83, 'Njikoka', 4),
(84, 'Nnewi-North', 4),
(85, 'Nnewi-South', 4),
(86, 'Ogbaru', 4),
(87, 'Onisha North', 4),
(88, 'Onitsha South', 4),
(89, 'Orumba North', 4),
(90, 'Orumba South', 4),
(91, 'Oyi', 4),
(92, 'Alkaleri', 5),
(93, 'Bauchi', 5),
(94, 'Bogoro', 5),
(95, 'Damban', 5),
(96, 'Darazo', 5),
(97, 'Dass', 5),
(98, 'Gamawa', 5),
(99, 'Ganjuwa', 5),
(100, 'Giade', 5),
(101, 'Itas/Gadau', 5),
(102, 'Jama\'are', 5),
(103, 'Katagum', 5),
(104, 'Kirfi', 5),
(105, 'Misau', 5),
(106, 'Ningi', 5),
(107, 'Shira', 5),
(108, 'Tafawa-Balewa', 5),
(109, 'Toro', 5),
(110, 'Warji', 5),
(111, 'Zaki', 5),
(112, 'Brass', 6),
(113, 'Ekerernor', 6),
(114, 'Kolokuma/Opokuma', 6),
(115, 'Nembe', 6),
(116, 'Ogbia', 6),
(117, 'Sagbama', 6),
(118, 'Southern-Ijaw', 6),
(119, 'Yenegoa', 6),
(120, 'Kembe', 6),
(121, 'Ado', 7),
(122, 'Agatu', 7),
(123, 'Apa', 7),
(124, 'Buruku', 7),
(125, 'Gboko', 7),
(126, 'Guma', 7),
(127, 'Gwer-East', 7),
(128, 'Gwer-West', 7),
(129, 'Katsina-Ala', 7),
(130, 'Konshisha', 7),
(131, 'Kwande', 7),
(132, 'Logo', 7),
(133, 'Makurdi', 7),
(134, 'Obi', 7),
(135, 'Ogbadibo', 7),
(136, 'Ohimini', 7),
(137, 'Oju', 7),
(138, 'Okpokwu', 7),
(139, 'Otukpo', 7),
(140, 'Tarkar', 7),
(141, 'Vandeikya', 7),
(142, 'Ukum', 7),
(143, 'Ushongo', 7),
(144, 'Abadan', 8),
(145, 'Askira-Uba', 8),
(146, 'Bama', 8),
(147, 'Bayo', 8),
(148, 'Biu', 8),
(149, 'Chibok', 8),
(150, 'Damboa', 8),
(151, 'Dikwa', 8),
(152, 'Gubio', 8),
(153, 'Guzamala', 8),
(154, 'Gwoza', 8),
(155, 'Hawul', 8),
(156, 'Jere', 8),
(157, 'Kaga', 8),
(158, 'Kala/Balge', 8),
(159, 'Kukawa', 8),
(160, 'Konduga', 8),
(161, 'Kwaya-Kusar', 8),
(162, 'Mafa', 8),
(163, 'Magumeri', 8),
(164, 'Maiduguri', 8),
(165, 'Marte', 8),
(166, 'Mobbar', 8),
(167, 'Monguno', 8),
(168, 'Ngala', 8),
(169, 'Nganzai', 8),
(170, 'Shani', 8),
(171, 'Abi', 9),
(172, 'Akamkpa', 9),
(173, 'Akpabuyo', 9),
(174, 'Bakassi', 9),
(175, 'Bekwara', 9),
(176, 'Biasi', 9),
(177, 'Boki', 9),
(178, 'Calabar-Municipal', 9),
(179, 'Calabar-South', 9),
(180, 'Etunk', 9),
(181, 'Ikom', 9),
(182, 'Obantiku', 9),
(183, 'Ogoja', 9),
(184, 'Ugep North', 9),
(185, 'Yakurr', 9),
(186, 'Yala', 9),
(187, 'Aniocha North', 10),
(188, 'Aniocha South', 10),
(189, 'Bomadi', 10),
(190, 'Burutu', 10),
(191, 'Ethiope East', 10),
(192, 'Ethiope West', 10),
(193, 'Ika North East', 10),
(194, 'Ika South', 10),
(195, 'Isoko North', 10),
(196, 'Isoko South', 10),
(197, 'Ndokwa East', 10),
(198, 'Ndokwa West', 10),
(199, 'Okpe', 10),
(200, 'Oshimili North', 10),
(201, 'Oshimili South', 10),
(202, 'Patani', 10),
(203, 'Sapele', 10),
(204, 'Udu', 10),
(205, 'Ughilli North', 10),
(206, 'Ughilli South', 10),
(207, 'Ukwuani', 10),
(208, 'Uvwie', 10),
(209, 'Warri Central', 10),
(210, 'Warri North', 10),
(211, 'Warri South', 10),
(212, 'Abakaliki', 11),
(213, 'Ofikpo North', 11),
(214, 'Ofikpo South', 11),
(215, 'Ebonyi', 11),
(216, 'Ezza North', 11),
(217, 'Ezza South', 11),
(218, 'ikwo', 11),
(219, 'Ishielu', 11),
(220, 'Ivo', 11),
(221, 'Izzi', 11),
(222, 'Ohaukwu', 11),
(223, 'Ohaozara', 11),
(224, 'Onicha', 11),
(225, 'Akoko Edo', 12),
(226, 'Egor', 12),
(227, 'Esan Central', 12),
(228, 'Esan North East', 12),
(229, 'Esan South East', 12),
(230, 'Esan West', 12),
(231, 'Etsako-Central', 12),
(232, 'Etsako-West', 12),
(233, 'Igueben', 12),
(234, 'Ikpoba-Okha', 12),
(235, 'Oredo', 12),
(236, 'Orhionmwon', 12),
(237, 'Ovia North East', 12),
(238, 'Ovia South West', 12),
(239, 'owan east', 12),
(240, 'Owan West', 12),
(241, 'Umunniwonde', 12),
(242, 'Ado Ekiti', 13),
(243, 'Aiyedire', 13),
(244, 'Efon', 13),
(245, 'Ekiti-East', 13),
(246, 'Ekiti-South West', 13),
(247, 'Ekiti West', 13),
(248, 'Emure', 13),
(249, 'Ido Osi', 13),
(250, 'Ijero', 13),
(251, 'Ikere', 13),
(252, 'Ikole', 13),
(253, 'Ilejemeta', 13),
(254, 'Irepodun/Ifelodun', 13),
(255, 'Ise Orun', 13),
(256, 'Moba', 13),
(257, 'Oye', 13),
(258, 'Aninri', 14),
(259, 'Awgu', 14),
(260, 'Enugu East', 14),
(261, 'Enugu North', 14),
(262, 'Enugu South', 14),
(263, 'Ezeagu', 14),
(264, 'Igbo Etiti', 14),
(265, 'Igbo Eze North', 14),
(266, 'Igbo Eze South', 14),
(267, 'Isi Uzo', 14),
(268, 'Nkanu East', 14),
(269, 'Nkanu West', 14),
(270, 'Nsukka', 14),
(271, 'Oji-River', 14),
(272, 'Udenu', 14),
(273, 'Udi', 14),
(274, 'Uzo Uwani', 14),
(275, 'Akko', 15),
(276, 'Balanga', 15),
(277, 'Billiri', 15),
(278, 'Dukku', 15),
(279, 'Funakaye', 15),
(280, 'Gombe', 15),
(281, 'Kaltungo', 15),
(282, 'Kwami', 15),
(283, 'Nafada/Bajoga', 15),
(284, 'Shomgom', 15),
(285, 'Yamltu/Deba', 15),
(286, 'Ahiazu-Mbaise', 16),
(287, 'Ehime-Mbano', 16),
(288, 'Ezinihtte', 16),
(289, 'Ideato North', 16),
(290, 'Ideato South', 16),
(291, 'Ihitte/Uboma', 16),
(292, 'Ikeduru', 16),
(293, 'Isiala-Mbano', 16),
(294, 'Isu', 16),
(295, 'Mbaitoli', 16),
(296, 'Ngor-Okpala', 16),
(297, 'Njaba', 16),
(298, 'Nkwerre', 16),
(299, 'Nwangele', 16),
(300, 'obowo', 16),
(301, 'Oguta', 16),
(302, 'Ohaji-Eggema', 16),
(303, 'Okigwe', 16),
(304, 'Onuimo', 16),
(305, 'Orlu', 16),
(306, 'Orsu', 16),
(307, 'Oru East', 16),
(308, 'Oru West', 16),
(309, 'Owerri Municipal', 16),
(310, 'Owerri North', 16),
(311, 'Owerri West', 16),
(312, 'Auyu', 17),
(313, 'Babura', 17),
(314, 'Birnin Kudu', 17),
(315, 'Birniwa', 17),
(316, 'Bosuwa', 17),
(317, 'Buji', 17),
(318, 'Dutse', 17),
(319, 'Gagarawa', 17),
(320, 'Garki', 17),
(321, 'Gumel', 17),
(322, 'Guri', 17),
(323, 'Gwaram', 17),
(324, 'Gwiwa', 17),
(325, 'Hadejia', 17),
(326, 'Jahun', 17),
(327, 'Kafin Hausa', 17),
(328, 'Kaugama', 17),
(329, 'Kazaure', 17),
(330, 'Kirikasanuma', 17),
(331, 'Kiyawa', 17),
(332, 'Maigatari', 17),
(333, 'Malam Maduri', 17),
(334, 'Miga', 17),
(335, 'Ringim', 17),
(336, 'Roni', 17),
(337, 'Sule Tankarkar', 17),
(338, 'Taura', 17),
(339, 'Yankwashi', 17),
(340, 'Birnin-Gwari', 18),
(341, 'Chikun', 18),
(342, 'Giwa', 18),
(343, 'Gwagwada', 18),
(344, 'Igabi', 18),
(345, 'Ikara', 18),
(346, 'Jaba', 18),
(347, 'Jema\'a', 18),
(348, 'Kachia', 18),
(349, 'Kaduna North', 18),
(350, 'Kagarko', 18),
(351, 'Kajuru', 18),
(352, 'Kaura', 18),
(353, 'Kauru', 18),
(354, 'Koka/Kawo', 18),
(355, 'Kubah', 18),
(356, 'Kudan', 18),
(357, 'Lere', 18),
(358, 'Makarfi', 18),
(359, 'Sabon Gari', 18),
(360, 'Sanga', 18),
(361, 'Sabo', 18),
(362, 'Tudun-Wada/Makera', 18),
(363, 'Zango-Kataf', 18),
(364, 'Zaria', 18),
(365, 'Ajingi', 19),
(366, ' Albasu', 19),
(367, 'Bagwai', 19),
(368, 'Bebeji', 19),
(369, 'Bichi', 19),
(370, 'Bunkure', 19),
(371, 'Dala', 19),
(372, 'Dambatta', 19),
(373, 'Dawakin Kudu', 19),
(374, 'Dawakin Tofa', 19),
(375, 'Doguwa', 19),
(376, 'Fagge', 19),
(377, 'Gabasawa', 19),
(378, 'Garko', 19),
(379, 'Garun-Mallam', 19),
(380, 'Gaya', 19),
(381, 'Gezawa', 19),
(382, 'Gwale', 19),
(383, 'Gwarzo', 19),
(384, 'Kabo', 19),
(385, 'Kano Municipal', 19),
(386, 'Karaye', 19),
(387, 'Kibiya', 19),
(388, 'Kiru', 19),
(389, 'Kumbotso', 19),
(390, 'Kunchi', 19),
(391, 'Kura', 19),
(392, 'Madobi', 19),
(393, 'Makoda', 19),
(394, 'Minjibir', 19),
(395, 'Nasarawa', 19),
(396, 'Rano', 19),
(397, 'Rimin Gado', 19),
(398, 'Rogo', 19),
(399, 'Shanono', 19),
(400, 'Sumaila', 19),
(401, 'Takai', 19),
(402, 'Tarauni', 19),
(403, 'Tofa', 19),
(404, 'Tsanyawa', 19),
(405, 'Tudun Wada', 19),
(406, 'Ngogo', 19),
(407, 'Warawa', 19),
(408, 'Wudil', 19),
(409, 'Bakori', 20),
(410, 'Batagarawa', 20),
(411, 'Batsari', 20),
(412, 'Baure', 20),
(413, 'Bindawa', 20),
(414, 'Charanchi', 20),
(415, 'Danja', 20),
(416, 'Danjume', 20),
(417, 'Dan-Musa', 20),
(418, 'Daura', 20),
(419, 'Dutsi', 20),
(420, 'Dutsinma', 20),
(421, 'Faskari', 20),
(422, 'Funtua', 20),
(423, 'Ingara', 20),
(424, 'Jibia', 20),
(425, 'Kafur', 20),
(426, 'Kaita', 20),
(427, 'Kankara', 20),
(428, 'Kankia', 20),
(429, 'Katsina', 20),
(430, 'Kurfi', 20),
(431, 'Kusada', 20),
(432, 'Mai Adua', 20),
(433, 'Malumfashi', 20),
(434, 'Mani', 20),
(435, 'Mashi', 20),
(436, 'Matazu', 20),
(437, 'Musawa', 20),
(438, 'Rimi', 20),
(439, 'Sabuwa', 20),
(440, 'Safana', 20),
(441, 'Sandamu', 20),
(442, 'Zango', 20),
(443, 'Aleira', 21),
(444, 'Arewa', 21),
(445, 'Argungu', 21),
(446, 'Augie', 21),
(447, 'Bagudo', 21),
(448, 'Birnin-Kebbi', 21),
(449, 'Bumza', 21),
(450, 'Dandi', 21),
(451, 'Danko', 21),
(452, 'Fakai', 21),
(453, 'Gwandu', 21),
(454, 'Jega', 21),
(455, 'Kalgo', 21),
(456, 'Koko-Besse', 21),
(457, 'Maiyama', 21),
(458, 'Ngaski', 21),
(459, 'Sakaba', 21),
(460, 'Shanga', 21),
(461, 'Suru', 21),
(462, 'Wasagu', 21),
(463, 'Yauri', 21),
(464, 'Zuru', 21),
(465, 'Adavi', 22),
(466, 'Ajaokuta', 22),
(467, 'Ankpa', 22),
(468, 'Bassa', 22),
(469, 'Dekina', 22),
(470, 'Ibaji', 22),
(471, 'Idah', 22),
(472, 'Igalamela', 22),
(473, 'Ijumu', 22),
(474, 'Kabba/Bunu', 22),
(475, 'Kogi', 22),
(476, 'Lokoja', 22),
(477, 'Mopa-Muro-Mopi', 22),
(478, 'Ofu', 22),
(479, 'Ogori/Magongo', 22),
(480, 'Okehi', 22),
(481, 'Okene', 22),
(482, 'Olamaboro', 22),
(483, 'Omala', 22),
(484, 'Oyi', 22),
(485, 'Yagba-East', 22),
(486, 'Yagba-West', 22),
(487, 'Asa', 23),
(488, 'Baruten', 23),
(489, 'Edu', 23),
(490, 'Ekiti', 23),
(491, 'Ifelodun', 23),
(492, 'Ilorin East', 23),
(493, 'Ilorin South', 23),
(494, 'Ilorin West', 23),
(495, 'Irepodun', 23),
(496, 'Isin', 23),
(497, 'Kaiama', 23),
(498, 'Moro', 23),
(499, 'Offa', 23),
(500, 'Oke-Ero', 23),
(501, 'Oyun', 23),
(502, 'Pategi', 23),
(503, 'Agege', 24),
(504, 'Ajeromi-Ifelodun', 24),
(505, 'Alimosho', 24),
(506, 'Amuwo-Odofin', 24),
(507, 'Apapa', 24),
(508, 'Bagagry', 24),
(509, 'Epe', 24),
(510, 'Eti-Osa', 24),
(511, 'Ibeju-Lekki', 24),
(512, 'Ifako-Ijaiye', 24),
(513, 'Ikeja', 24),
(514, 'Ikorodu', 24),
(515, 'Kosofe', 24),
(516, 'Lagos-Island', 24),
(517, 'Lagos-Mainland', 24),
(518, 'Mushin', 24),
(519, 'Ojo', 24),
(520, 'Oshodi-Isolo', 24),
(521, 'Shomolu', 24),
(522, 'Suru-Lere', 24),
(523, 'Akwanga', 25),
(524, 'Awe', 25),
(525, 'Doma', 25),
(526, 'Karu', 25),
(527, 'Keana', 25),
(528, 'Keffi', 25),
(529, 'Kokona', 25),
(530, 'Lafia', 25),
(531, 'Nassarawa', 25),
(532, 'Nassarawa Eggor', 25),
(533, 'Obi', 25),
(534, 'Toto', 25),
(535, 'Wamba', 25),
(536, 'Agaie', 26),
(537, 'Agwara', 26),
(538, 'Bida', 26),
(539, 'Borgu', 26),
(540, 'Bosso', 26),
(541, 'Chanchaga', 26),
(542, 'Edati', 26),
(543, 'Gbako', 26),
(544, 'Gurara', 26),
(545, 'Katcha', 26),
(546, 'Kontagora', 26),
(547, 'Lapai', 26),
(548, 'Lavum', 26),
(549, 'Magama', 26),
(550, 'Mariga', 26),
(551, 'Mashegu', 26),
(552, 'Mokwa', 26),
(553, 'Muya', 26),
(554, 'Paikoro', 26),
(555, 'Rafi', 26),
(556, 'Rajau', 26),
(557, 'Shiroro', 26),
(558, 'Suleja', 26),
(559, 'Tafa', 26),
(560, 'Wushishi', 26),
(561, 'Abeokuta -North', 27),
(562, 'Abeokuta -South', 27),
(563, 'Ado-Odu/Ota', 27),
(564, 'Yewa-North', 27),
(565, 'Yewa-South', 27),
(566, 'Ewekoro', 27),
(567, 'Ifo', 27),
(568, 'Ijebu East', 27),
(569, 'Ijebu North', 27),
(570, 'Ijebu North-East', 27),
(571, 'Ijebu-Ode', 27),
(572, 'Ikenne', 27),
(573, 'Imeko-Afon', 27),
(574, 'Ipokia', 27),
(575, 'Obafemi -Owode', 27),
(576, 'Odeda', 27),
(577, 'Odogbolu', 27),
(578, 'Ogun-Water Side', 27),
(579, 'Remo-North', 27),
(580, 'Shagamu', 27),
(581, 'Akoko-North-East', 28),
(582, 'Akoko-North-West', 28),
(583, 'Akoko-South-West', 28),
(584, 'Akoko-South-East', 28),
(585, 'Akure- South', 28),
(586, 'Akure-North', 28),
(587, 'Ese-Odo', 28),
(588, 'Idanre', 28),
(589, 'Ifedore', 28),
(590, 'Ilaje', 28),
(591, 'Ile-Oluji-Okeigbo', 28),
(592, 'Irele', 28),
(593, 'Odigbo', 28),
(594, 'Okitipupa', 28),
(595, 'Ondo-West', 28),
(596, 'Ondo East', 28),
(597, 'Ose', 28),
(598, 'Owo', 28),
(599, 'Atakumosa', 29),
(600, 'Atakumosa East', 29),
(601, 'Ayeda-Ade', 29),
(602, 'Ayedire', 29),
(603, 'Boluwaduro', 29),
(604, 'Boripe', 29),
(605, 'Ede', 29),
(606, 'Ede North', 29),
(607, 'Egbedore', 29),
(608, 'Ejigbo', 29),
(609, 'Ife', 29),
(610, 'Ife East', 29),
(611, 'Ife North', 29),
(612, 'Ife South', 29),
(613, 'Ifedayo', 29),
(614, 'Ifelodun', 29),
(615, 'Ila', 29),
(616, 'Ilesha', 29),
(617, 'Ilesha-West', 29),
(618, 'Irepodun', 29),
(619, 'Irewole', 29),
(620, 'Isokun', 29),
(621, 'Iwo', 29),
(622, 'Obokun', 29),
(623, 'Odo-Otin', 29),
(624, 'Ola Oluwa', 29),
(625, 'Olorunda', 29),
(626, 'Ori-Ade', 29),
(627, 'Orolu', 29),
(628, 'Osogbo', 29),
(629, 'Afijio', 30),
(630, 'Akinyele', 30),
(631, 'Atiba', 30),
(632, 'Atisbo', 30),
(633, 'Egbeda', 30),
(634, 'Ibadan-Central', 30),
(635, 'Ibadan-North-East', 30),
(636, 'Ibadan-North-West', 30),
(637, 'Ibadan-South-East', 30),
(638, 'Ibadan-South West', 30),
(639, 'Ibarapa-Central', 30),
(640, 'Ibarapa-East', 30),
(641, 'Ibarapa-North', 30),
(642, 'Ido', 30),
(643, 'Ifedayo', 30),
(644, 'Ifeloju', 30),
(645, 'Irepo', 30),
(646, 'Iseyin', 30),
(647, 'Itesiwaju', 30),
(648, 'Iwajowa', 30),
(649, 'Kajola', 30),
(650, 'Lagelu', 30),
(651, 'Odo-Oluwa', 30),
(652, 'Ogbomoso-North', 30),
(653, 'Ogbomosho-South', 30),
(654, 'Olorunsogo', 30),
(655, 'Oluyole', 30),
(656, 'Ona-Ara', 30),
(657, 'Orelope', 30),
(658, 'Ori-Ire', 30),
(659, 'Oyo East', 30),
(660, 'Oyo West', 30),
(661, 'saki east', 30),
(662, 'Saki West', 30),
(663, 'Surulere', 30),
(664, 'Barkin Ladi', 31),
(665, 'Bassa', 31),
(666, 'Bokkos', 31),
(667, 'Jos-East', 31),
(668, 'Jos-South', 31),
(669, 'Jos-North', 31),
(670, 'Kanam', 31),
(671, 'Kanke', 31),
(672, 'Langtang North', 31),
(673, 'Langtang South', 31),
(674, 'Mangu', 31),
(675, 'Mikang', 31),
(676, 'Pankshin', 31),
(677, 'Quan\'pan', 31),
(678, 'Riyom', 31),
(679, 'Shendam', 31),
(680, 'Wase', 31),
(681, 'Abua/Odual', 32),
(682, 'Ahoada East', 32),
(683, 'Ahoada West', 32),
(684, 'Akukutoru', 32),
(685, 'Andoni', 32),
(686, 'Asari-Toro', 32),
(687, 'Bonny', 32),
(688, 'Degema', 32),
(689, 'Eleme', 32),
(690, 'Emuoha', 32),
(691, 'Etche', 32),
(692, 'Gokana', 32),
(693, 'Ikwerre', 32),
(694, 'Khana', 32),
(695, 'Obio/Akpor', 32),
(696, 'Ogba/Egbama/Ndoni', 32),
(697, 'Ogu/Bolo', 32),
(698, 'Okrika', 32),
(699, 'Omuma', 32),
(700, 'Opobo/Nkoro', 32),
(701, 'Oyigbo', 32),
(702, 'Port-Harcourt', 32),
(703, 'Tai', 32),
(704, 'Binji', 33),
(705, 'Bodinga', 33),
(706, 'Dange-Shuni', 33),
(707, 'Gada', 33),
(708, 'Goronyo', 33),
(709, 'Gudu', 33),
(710, 'Gwadabawa', 33),
(711, 'Illela', 33),
(712, 'Isa', 33),
(713, 'Kebbe', 33),
(714, 'Kware', 33),
(715, 'Raba', 33),
(716, 'Sabon-Birni', 33),
(717, 'Shagari', 33),
(718, 'Silame', 33),
(719, 'Sokoto North', 33),
(720, 'Sokoto South', 33),
(721, 'Tambuwal', 33),
(722, 'Tanzaga', 33),
(723, 'Tureta', 33),
(724, 'Wamakko', 33),
(725, 'Wurno', 33),
(726, 'Yabo', 33),
(727, 'Ardo Kola', 34),
(728, 'Bali', 34),
(729, 'Donga', 34),
(730, 'Gashaka', 34),
(731, 'Gassol', 34),
(732, 'Ibi', 34),
(733, 'Jalingo', 34),
(734, 'Karim-Lamido', 34),
(735, 'Kurmi', 34),
(736, 'Lau', 34),
(737, 'Sardauna', 34),
(738, 'Takuni', 34),
(739, 'Ussa', 34),
(740, 'Wukari', 34),
(741, 'Yarro', 34),
(742, 'Zing', 34),
(743, 'Bade', 35),
(744, 'Bursali', 35),
(745, 'Damaturu', 35),
(746, 'Fuka', 35),
(747, 'Fune', 35),
(748, 'Geidam', 35),
(749, 'Gogaram', 35),
(750, 'Gujba', 35),
(751, 'Gulani', 35),
(752, 'Jakusko', 35),
(753, 'Karasuwa', 35),
(754, 'Machina', 35),
(755, 'Nangere', 35),
(756, 'Nguru', 35),
(757, 'Potiskum', 35),
(758, 'Tarmua', 35),
(759, 'Yunisari', 35),
(760, 'Yusufari', 35),
(761, 'Anka', 36),
(762, 'Bakure', 36),
(763, 'Bukkuyum', 36),
(764, 'Bungudo', 36),
(765, 'Gumi', 36),
(766, 'Gusau', 36),
(767, 'Isa', 36),
(768, 'Kaura-Namoda', 36),
(769, 'Kiyawa', 36),
(770, 'Maradun', 36),
(771, 'Marau', 36),
(772, 'Shinkafa', 36),
(773, 'Talata-Mafara', 36),
(774, 'Tsafe', 36),
(775, 'Zurmi', 36),
(776, 'Obudu', 9),
(777, 'Abaji', 37),
(778, 'Bwari', 37),
(779, 'Gwagwalada', 37),
(780, 'Kuje', 37),
(781, 'Kwali', 37),
(782, 'Municipal', 37),
(783, 'Etsako-East', 12),
(784, 'Ahiazu-Mbaise', 16),
(785, 'Foreign', 38),
(786, 'Kaduna South', 18),
(787, 'Aboh-Mbaise', 16),
(788, 'Odukpani', 9);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `order_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_track_user_id` int(11) DEFAULT NULL,
  `order_track_package_id` int(11) DEFAULT NULL,
  `order_status` text NOT NULL,
  `tracking_number` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_tracking`
--

INSERT INTO `order_tracking` (`order_id`, `order_date`, `order_track_user_id`, `order_track_package_id`, `order_status`, `tracking_number`, `carrier_code`) VALUES
(1, NULL, NULL, NULL, '', '1234567777765', '43553636373');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `weight` varchar(255) NOT NULL,
  `package_cat_id` int(11) DEFAULT NULL,
  `pickup_address` varchar(255) NOT NULL,
  `destination_address` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `cost` varchar(100) DEFAULT NULL,
  `package_value` varchar(255) NOT NULL,
  `package_status` enum('pending','failed','paid') NOT NULL DEFAULT 'pending',
  `house_address` varchar(255) NOT NULL,
  `ref_no` varchar(100) DEFAULT NULL,
  `datesent` datetime DEFAULT NULL,
  `package_state_id` int(11) DEFAULT NULL,
  `package_local_govt_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `creation_date`, `weight`, `package_cat_id`, `pickup_address`, `destination_address`, `fullname`, `phone_number`, `cost`, `package_value`, `package_status`, `house_address`, `ref_no`, `datesent`, `package_state_id`, `package_local_govt_id`) VALUES
(1, '2023-07-02 12:52:04', '1000g', 2, 'no6', 'no6', 'ribspot ribspot', '08149508448', '', 'jsdjfcfsjdcjkldlscvsv', 'pending', 'no6', '6143563', '2023-07-02 12:52:04', 1, 1),
(2, '2023-07-03 11:51:25', '100', 3, 'no 6 bolajide avenue', 'no6', 'ribspot ribspot', '08149508448', '', 'jsdjfcfsjdcjkldlscvsv', 'pending', 'no6', '8539179', '2023-07-03 11:51:25', 1, 1),
(3, '2023-07-03 12:14:30', '1000g', 3, 'no6', 'no6', 'ribspot ribspot', '08149508448', '', 'dvd', 'pending', 'no6', '2203147', '2023-07-03 12:14:30', 1, 1),
(4, '2023-07-03 12:26:24', '1000g', 3, 'no6', 'no6', 'ribspot ribspot', '08149508448', '3', 'dvd', 'pending', 'no6', '1317730', '2023-07-03 12:26:24', 1, 1),
(5, '2023-07-03 12:27:45', '1000g', 2, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcjkldlscvsv', 'pending', 'no6', '3537219', '2023-07-03 12:27:45', 1, 1),
(6, '2023-07-03 12:30:58', '1000g', 3, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcjkldlscvsv', 'pending', 'no6', '560721', '2023-07-03 12:30:58', 1, 1),
(7, '2023-07-03 12:34:50', '1000g', 1, 'delta state', 'no6', 'ribspot ribspot', '08149508448', NULL, 'dvd', 'pending', 'no6', '5291656', '2023-07-03 12:34:50', 1, 1),
(8, '2023-07-03 12:57:16', '1000g', 2, 'no6', 'no6', 'ribspot ribspot', '08149508448', '2', 'jsdjfcfsjdcj', 'pending', 'no6', '4958138', '2023-07-03 12:57:16', 1, 1),
(9, '2023-07-03 12:59:30', '100', 3, 'delta state', 'no6', 'toyo', '08149508448', NULL, 'jsdjfcfsjdcjkldlscvsv', 'pending', 'no6', '3965726', '2023-07-03 12:59:30', 1, 4),
(10, '2023-07-03 13:32:06', '100', 2, 'delta state', 'no6', 'toyo', '08149508448', NULL, 'jsdjfcfsjdcjkldlscvsv', 'pending', 'no6', '6723322', '2023-07-03 13:32:06', 1, 4),
(11, '2023-07-03 13:42:19', '1000g', 5, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '3331463', '2023-07-03 13:42:19', 1, 1),
(12, '2023-07-03 13:52:28', '1000g', 2, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '1640745', '2023-07-03 13:52:28', 1, 1),
(13, '2023-07-03 13:52:42', '1000g', 5, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '9021718', '2023-07-03 13:52:42', 1, 1),
(14, '2023-07-03 13:53:05', '1000g', 2, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '2645592', '2023-07-03 13:53:05', 1, 1),
(15, '2023-07-03 13:56:26', '1000g', 3, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '1727270', '2023-07-03 13:56:26', 1, 1),
(16, '2023-07-03 14:51:43', '1000g', 2, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '9152949', '2023-07-03 14:51:43', 1, 1),
(17, '2023-07-03 14:54:19', '1000g', 3, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '8266461', '2023-07-03 14:54:19', 1, 1),
(18, '2023-07-03 14:55:16', '1000g', 4, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '9916645', '2023-07-03 14:55:16', 1, 1),
(19, '2023-07-03 16:01:20', '1000g', 3, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '6533482', '2023-07-03 16:01:20', 1, 1),
(20, '2023-07-03 16:01:40', '1000g', 2, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '6475666', '2023-07-03 16:01:40', 1, 1),
(21, '2023-07-03 16:03:16', '1000g', 5, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '7007827', '2023-07-03 16:03:16', 1, 1),
(22, '2023-07-03 16:04:36', '1000g', 3, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '1601016', '2023-07-03 16:04:36', 1, 1),
(23, '2023-07-03 16:05:38', '1000g', 4, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '4434009', '2023-07-03 16:05:38', 1, 1),
(24, '2023-07-03 16:09:26', '1000g', 2, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '3612366', '2023-07-03 16:09:26', 1, 1),
(25, '2023-07-03 16:15:48', '1000g', 2, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '1009254', '2023-07-03 16:15:48', 1, 1),
(26, '2023-07-03 16:16:38', '1000g', 2, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '3078491', '2023-07-03 16:16:38', 1, 1),
(27, '2023-07-03 16:20:12', '1000g', 2, 'no6', 'no6', 'mayowa', '08149508448', NULL, 'dvd', 'pending', 'no 6 bolajide avenue', '6563577', '2023-07-03 16:20:12', 1, 1),
(28, '2023-07-03 16:24:28', '1000g', 3, 'd', 'no6', 'ribspot ribspot', '08149508448', NULL, 'd', 'pending', 'ba', '3020188', '2023-07-03 16:24:28', 1, 1),
(29, '2023-07-03 16:48:22', '1000g', 2, 'no 6 bolajide avenue', 'no6', 'oyoma', '08149508448', NULL, '1000', 'pending', 'no6', '8982801', '2023-07-03 16:48:22', 18, 6),
(30, '2023-07-03 16:48:58', '1000g', 2, 'no 6 bolajide avenue', 'no6', 'oyoma', '08149508448', NULL, '1000', 'pending', 'no6', '1110760', '2023-07-03 16:48:58', 18, 6),
(31, '2023-07-03 16:52:43', '1000g', 2, 'no 6 bolajide avenue', 'no6', 'oyoma', '08149508448', NULL, '1000', 'pending', 'no6', '8611977', '2023-07-03 16:52:43', 18, 6),
(32, '2023-07-03 17:15:40', '1000g', 4, 'no 6 bolajide avenue', 'no6', 'oyoma', '08149508448', NULL, '1000', 'pending', 'no6', '1029067', '2023-07-03 17:15:40', 18, 6),
(33, '2023-07-03 20:38:28', '1000g', 2, 'no 6 bolajide avenue', 'no6', 'ribspot ribspot', '08149508448', NULL, '1000', 'pending', 'no6', '881043', '2023-07-03 20:38:28', 24, 498),
(34, '2023-07-03 20:41:05', '1000g', 2, 'no 6 bolajide avenue', 'no6', 'ribspot ribspot', '08149508448', NULL, '1000', 'pending', 'no6', '5677783', '2023-07-03 20:41:05', 24, 498),
(35, '2023-07-03 20:43:07', '1000g', 5, 'no 6 bolajide avenue', 'no6', 'ribspot ribspot', '08149508448', NULL, '1000', 'pending', 'no6', '5097662', '2023-07-03 20:43:07', 24, 498),
(36, '2023-07-03 20:43:46', '1000g', 1, 'no 6 bolajide avenue', 'no6', 'ribspot ribspot', '08149508448', NULL, '1000', 'pending', 'no6', '2576112', '2023-07-03 20:43:46', 24, 498),
(37, '2023-07-06 14:14:22', '1000g', 1, 'asaba', 'no 6 bolajide avenue', 'daniella okofu', '08149508448', NULL, '100', 'pending', 'no6', '4017831', '2023-07-06 14:14:22', 1, 5),
(38, '2023-07-06 14:31:03', '1000g', 2, 'asaba', 'no 6 bolajide avenue', 'daniella okofu', '08149508448', NULL, '100', 'pending', 'no6', '4663790', '2023-07-06 14:31:03', 1, 5),
(39, '2023-07-06 14:34:01', '1000g', 3, 'asaba', 'no 6 bolajide avenue', 'daniella okofu', '08149508448', NULL, '100', 'pending', 'no6', '3496434', '2023-07-06 14:34:01', 1, 5),
(40, '2023-07-08 13:02:39', '1000g', 3, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '4657970', '2023-07-08 13:02:39', 19, 1),
(41, '2023-07-08 13:16:20', '1000g', 2, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '9385883', '2023-07-08 13:16:20', 1, 5),
(42, '2023-07-08 15:36:56', '1000g', 2, 'no 6 bolajide avenue', 'no6', 'oyoma ogug', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '6284429', '2023-07-08 15:36:56', 1, 1),
(43, '2023-07-08 16:09:08', '1000g', 3, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '3267683', '2023-07-08 16:09:08', 1, 1),
(44, '2023-07-08 16:12:27', '1000g', 3, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '9442655', '2023-07-08 16:12:27', 1, 1),
(45, '2023-07-08 16:20:20', '1000g', 3, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '2324411', '2023-07-08 16:20:20', 1, 1),
(46, '2023-07-08 16:27:52', '1000g', 4, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '2945183', '2023-07-08 16:27:52', 1, 1),
(47, '2023-07-08 16:30:04', '1000g', 1, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '4203105', '2023-07-08 16:30:04', 1, 1),
(48, '2023-07-08 16:32:01', '1000g', 2, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '989543', '2023-07-08 16:32:01', 1, 1),
(49, '2023-07-08 16:33:51', '1000g', 2, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '5818164', '2023-07-08 16:33:51', 1, 1),
(50, '2023-07-08 16:33:59', '1000g', 4, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '815018', '2023-07-08 16:33:59', 1, 1),
(51, '2023-07-08 16:41:38', '1000g', 2, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '220801', '2023-07-08 16:41:38', 1, 1),
(53, '2023-07-08 16:42:10', '1000g', 5, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, 'jsdjfcfsjdcj', 'pending', 'no6', '640612', '2023-07-08 16:42:10', 1, 1),
(54, '2023-07-08 16:43:21', '100', 2, 'no6', 'no6', 'ribspot ribspot', '08149508448', NULL, '1000', 'pending', 'no6', '1047074', '2023-07-08 16:43:21', 1, 1),
(55, '2023-07-11 15:08:04', '1000g', 2, 'no 6 bolajide avenue', 'no6', 'gee', '08149508448', NULL, '1000', 'pending', 'no6', '1239422', '2023-07-11 15:08:04', 16, 6),
(56, '2023-07-12 10:54:49', '1000g', 4, '10 bamisile str ogba lagos', '2b ogunsanya road,ikeja lagos', 'peter', '07054443678', NULL, '100', 'pending', '2b ogunsanya road,ikeja lagos', '8984991', '2023-07-12 10:54:49', 1, 1),
(57, '2023-07-12 16:28:07', '1000g', 2, 'no6', 'no 6 bolajide avenue', 'oyoma ogugu', '08149508448', NULL, 'jsdjfcfsjdcjkldlscvsv', 'pending', 'no 6 bolajide avenue', '3297838', '2023-07-12 16:28:07', 1, 1),
(58, '2023-07-12 16:52:35', '1000g', 1, '2b ogunsanya road,ikeja lagos', 'no 6 bolajide avenue', 'oyoma ogugu', '08149508448', NULL, '100', 'pending', 'no 6 bolajide avenue', '6618747', '2023-07-12 16:52:35', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_user_id` int(11) DEFAULT NULL,
  `cost` varchar(255) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_package_id` int(11) DEFAULT NULL,
  `price_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `price_id` int(11) NOT NULL,
  `price_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `review_user_id` int(11) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `review_message` text NOT NULL,
  `review_rating` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `review_user_id`, `review_date`, `review_message`, `review_rating`) VALUES
(1, NULL, '2023-07-06 19:05:26', 'job well done', '3'),
(2, NULL, '2023-07-06 19:07:10', 'good job', '3'),
(3, NULL, '2023-07-06 19:07:46', 'nice', '4'),
(4, NULL, '2023-07-08 16:34:52', 'poor', '1'),
(5, NULL, '2023-07-12 16:34:17', 'mayowa refused to fix my bug', '4'),
(6, NULL, '2023-07-12 16:34:33', 'good job', '3'),
(7, NULL, '2023-07-12 16:34:54', 'thank you', '3');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Abia'),
(2, 'Adamawa'),
(3, 'Akwa Ibom'),
(4, 'Anambra'),
(5, 'Bauchi'),
(6, 'Bayelsa'),
(7, 'Benue'),
(8, 'Borno'),
(9, 'Cross River'),
(10, 'Delta'),
(11, 'Ebonyi'),
(12, 'Edo'),
(13, 'Ekiti'),
(14, 'Enugu'),
(15, 'Gombe'),
(16, 'Imo'),
(17, 'Jigawa'),
(18, 'Kaduna'),
(19, 'Kano'),
(20, 'Katsina'),
(21, 'Kebbi'),
(22, 'Kogi'),
(23, 'Kwara'),
(24, 'Lagos'),
(25, 'Nassarawa'),
(26, 'Niger'),
(27, 'Ogun'),
(28, 'Ondo'),
(29, 'Osun'),
(30, 'Oyo'),
(31, 'Plateau'),
(32, 'Rivers'),
(33, 'Sokoto'),
(34, 'Taraba'),
(35, 'Yobe'),
(36, 'Zamfara'),
(37, 'Abuje (FCT)'),
(38, 'Foreign');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `user_pwd` varchar(120) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `user_pix` varchar(120) DEFAULT NULL,
  `datesent` datetime DEFAULT NULL,
  `user_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `fullname`, `username`, `phone_number`, `email`, `user_pwd`, `address`, `user_pix`, `datesent`, `user_package_id`) VALUES
(1, 'oyoma ogugu', 'david', '08149508448', 'ooyoma@gmail.com', 'pbkdf2:sha256:600000$vXn1Q43vV8uSdMjT$b6e472874078b1af55f3ae64f2c71ce6c48c8e050ba9cd03b3af16b3dac4ee79', 'no6', NULL, '2023-07-01 21:09:44', NULL),
(2, 'toyo', 'admin', '09332555353', 'toyo@gmail.com', 'pbkdf2:sha256:600000$M3A0cEErzdaO8GCq$e3cd72c7756d482c8a451baa51962a4dda56423f9aebadd97f1291edf09df157', 'no6', NULL, '2023-07-03 12:58:42', NULL),
(3, 'mine ogugu', 'mineogugu', '08137979796', 'mine@gmail.com', 'pbkdf2:sha256:600000$dtiUA7lPRwvCXZXV$d8b8dc1e724f93821f645aac3d10aebd953d3bef0ec907ebf2e3fdcf3ffeeabb', 'no 6 bolajide', '3.png', '2023-07-03 20:36:45', NULL),
(4, 'daniella okofu', 'euphoria', '08149508448', 'omaokofu@gmail.com', 'pbkdf2:sha256:600000$0Qt77wdooLODFhWN$2675bbc910a44d842b268321daeea55577471fc9d3fe6d90d03cf879c688a871', 'no 6 bolajide avenue', 'father-little-daughter-spending-time-together.jpg', '2023-07-06 14:11:02', NULL),
(5, 'ribspot ribspot', 'admin', '08149508448', 'ooyoma@gmail.com', 'pbkdf2:sha256:600000$Hw3NhsGwTLEf6Bzg$528239c0c6aaa0a1eeaeedf0cc4c2c1fd6a0aed8e5d8810cc943ae89640251a9', 'no6', NULL, '2023-07-08 13:10:56', NULL),
(6, 'ribspot ribspot', 'admin', '08149508448', 'ooyoma@gmail.com', 'pbkdf2:sha256:600000$25nMunBlPe43jGqt$974828df121b04f54846b1bc81f223e67ee27a41daaaf151dc7537847c0ac9e8', 'no6', NULL, '2023-07-08 13:14:15', NULL),
(7, 'ribspot ribspot', 'admin', '08149508448', 'mana@gmail.com', 'pbkdf2:sha256:600000$bXlDmZYXxw7sW6YN$2731d705e777e041de5f32c06a0cb7adcbc880490c394eee99d37ff0df14d39b', 'no6', 'african-american-student-walking-street-talking-phone.jpg', '2023-07-08 13:15:24', NULL),
(8, 'noel', 'oyo', '08149508448', 'ooyoma@gmail.com', 'pbkdf2:sha256:600000$gOyjBVSBQ0zN4X8x$b51424f48d336036a33067244f0f5a7602f612fbf51b6d12386d2c402e2c4c01', 'no6', NULL, '2023-07-08 16:07:28', NULL),
(9, 'noel', 'oyo', '08149508448', 'go@gmail.com', 'pbkdf2:sha256:600000$EExTLHJQgy2ZVq7s$0e5485a1129225304be8925e5c26683e7e65458fef8d060e6d3fdf5231962b82', 'no6', 'IMG_20221120_121632~2.jpg', '2023-07-08 16:08:07', NULL),
(10, 'ribspot ribspot', 'admin', '08149508448', 'ma@gmail.com', 'pbkdf2:sha256:600000$Q3NfWbQsmdxJH9aa$d5358aea188f1c6b65bc948b923c1e9eae4cb5915bb26105413ee5f1ff6490c2', 'no6', 'IMG_20221120_121632~2.jpg', '2023-07-10 15:09:36', NULL),
(11, 'goerge', 'geeee', '08137979796', 'good@gmail.com', 'pbkdf2:sha256:600000$DktZHaphKsJeBJwN$b1d5affe43a3c5b8aa7973f20b758cd3d9665a4cf76d22ce82dd41d537032ce9', 'bolajide', 'IMG_20230108_084302.jpg', '2023-07-11 15:06:51', NULL),
(12, 'peter', 'peter', '07054443678', 'pjames@gmail.com', 'pbkdf2:sha256:600000$g09GRgghYG0YaC0T$299f81c75a2d99d5cf355895b075ab23451da617ec778c6f822f9d4c78b06d22', '2b ogunsanya road,ikeja lagos', '20220828_171605~3.jpg', '2023-07-12 10:52:54', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `journey`
--
ALTER TABLE `journey`
  ADD PRIMARY KEY (`journey_id`),
  ADD KEY `journey_package_id` (`journey_package_id`),
  ADD KEY `journey_user_id` (`journey_user_id`);

--
-- Indexes for table `lga`
--
ALTER TABLE `lga`
  ADD PRIMARY KEY (`lga_id`),
  ADD KEY `lga_state_id` (`lga_state_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_track_package_id` (`order_track_package_id`),
  ADD KEY `order_track_user_id` (`order_track_user_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `package_cat_id` (`package_cat_id`),
  ADD KEY `package_local_govt_id` (`package_local_govt_id`),
  ADD KEY `package_state_id` (`package_state_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_package_id` (`payment_package_id`),
  ADD KEY `payment_user_id` (`payment_user_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_user_id` (`review_user_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_package_id` (`user_package_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `journey`
--
ALTER TABLE `journey`
  MODIFY `journey_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lga`
--
ALTER TABLE `lga`
  MODIFY `lga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=789;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journey`
--
ALTER TABLE `journey`
  ADD CONSTRAINT `journey_ibfk_1` FOREIGN KEY (`journey_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `journey_ibfk_2` FOREIGN KEY (`journey_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `lga`
--
ALTER TABLE `lga`
  ADD CONSTRAINT `lga_ibfk_1` FOREIGN KEY (`lga_state_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_ibfk_1` FOREIGN KEY (`order_track_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `order_tracking_ibfk_2` FOREIGN KEY (`order_track_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`package_cat_id`) REFERENCES `category` (`cat_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`package_local_govt_id`) REFERENCES `lga` (`lga_id`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`package_state_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`payment_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`payment_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`price_id`) REFERENCES `price` (`price_id`);

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`review_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_package_id`) REFERENCES `package` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
