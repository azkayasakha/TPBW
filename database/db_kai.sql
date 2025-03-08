-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2025 at 02:50 PM
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
-- Database: `db_kai`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jalur`
--

CREATE TABLE `tbl_jalur` (
  `id` varchar(5) NOT NULL,
  `kode` varchar(5) NOT NULL,
  `jalur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_jalur`
--

INSERT INTO `tbl_jalur` (`id`, `kode`, `jalur`) VALUES
('JAKK', 'TP1', 'Tanjung Priok'),
('KPB', 'TP2', 'Tanjung Priok'),
('AC', 'TP3', 'Tanjung Priok'),
('TPK', 'TP5', 'Tanjung Priok'),
('DU', 'T1', 'Tangerang'),
('GRG', 'T2', 'Tangerang'),
('PSG', 'T3', 'Tangerang'),
('TKO', 'T4', 'Tangerang'),
('BOI', 'T5', 'Tangerang'),
('RW', 'T6', 'Tangerang'),
('KDS', 'T7', 'Tangerang'),
('PI', 'T8', 'Tangerang'),
('BPR', 'T9', 'Tangerang'),
('TTI', 'T10', 'Tangerang'),
('TNG', 'T11', 'Tangerang'),
('POK', 'C1', 'Cikarang'),
('KMT', 'C2', 'Cikarang'),
('GST', 'C3', 'Cikarang'),
('PSE', 'C4', 'Cikarang'),
('KMO', 'C5', 'Cikarang'),
('RJW', 'C6', 'Cikarang'),
('KPB', 'C7', 'Cikarang'),
('AK', 'C8', 'Cikarang'),
('DU', 'C9', 'Cikarang'),
('THB', 'C10', 'Cikarang'),
('KAT', 'C11', 'Cikarang'),
('SUDB', 'C11', 'Cikarang'),
('SUD', 'C12', 'Cikarang'),
('MRI', 'C13', 'Cikarang'),
('MTR', 'C14', 'Cikarang'),
('JNG', 'C15', 'Cikarang'),
('KLD', 'C16', 'Cikarang'),
('BUA', 'C17', 'Cikarang'),
('KLDB', 'C18', 'Cikarang'),
('CUK', 'C19', 'Cikarang'),
('KRI', 'C20', 'Cikarang'),
('BKS', 'C21', 'Cikarang'),
('BKST', 'C22', 'Cikarang'),
('TB', 'C23', 'Cikarang'),
('CIT', 'C24', 'Cikarang'),
('MTM', 'C25', 'Cikarang'),
('CKR', 'C26', 'Cikarang'),
('JAKK', 'B1', 'Bogor'),
('JAY', 'B2', 'Bogor'),
('MGB', 'B3', 'Bogor'),
('SWB', 'B4', 'Bogor'),
('JUA', 'B5', 'Bogor'),
('GDD', 'B7', 'Bogor'),
('CKI', 'B8', 'Bogor'),
('MRI', 'B9', 'Bogor'),
('TEB', 'B10', 'Bogor'),
('CW', 'B11', 'Bogor'),
('DRN', 'B12', 'Bogor'),
('PSMB', 'B13', 'Bogor'),
('PSM', 'B14', 'Bogor'),
('TNT', 'B15', 'Bogor'),
('LNA', 'B16', 'Bogor'),
('UP', 'B17', 'Bogor'),
('UI', 'B18', 'Bogor'),
('POC', 'B19', 'Bogor'),
('DPB', 'B20', 'Bogor'),
('DP', 'B21', 'Bogor'),
('CTA', 'B22', 'Bogor'),
('PDRG', 'b23', 'Bogor'),
('CBN', 'b24', 'Bogor'),
('NMO', 'b26', 'Bogor'),
('BJD', 'B23', 'Bogor'),
('CLT', 'B24', 'Bogor'),
('BOO', 'B26', 'Bogor'),
('THB', 'R1', 'Rangkasbitung'),
('PLM', 'R2', 'Rangkasbitung'),
('KBY', 'R3', 'Rangkasbitung'),
('PDJ', 'R4', 'Rangkasbitung'),
('JMG', 'R5', 'Rangkasbitung'),
('SDM', 'R6', 'Rangkasbitung'),
('RU', 'R7', 'Rangkasbitung'),
('SRP', 'R8', 'Rangkasbitung'),
('CSK', 'R9', 'Rangkasbitung'),
('CC', 'R10', 'Rangkasbitung'),
('PRP', 'R12', 'Rangkasbitung'),
('CJT', 'R14', 'Rangkasbitung'),
('DAR', 'R15', 'Rangkasbitung'),
('TEJ', 'R16', 'Rangkasbitung'),
('TGS', 'R18', 'Rangkasbitung'),
('CKY', 'R19', 'Rangkasbitung'),
('MJ', 'R20', 'Rangkasbitung'),
('CTR', 'R21', 'Rangkasbitung'),
('RK', 'R22', 'Rangkasbitung'),
('RK', 'LM1', 'Merak Lokal'),
('JBU', 'LM2', 'Merak Lokal'),
('CT', 'LM3', 'Merak Lokal'),
('CKL', 'LM4', 'Merak Lokal'),
('WLT', 'LM5', 'Merak Lokal'),
('SG', 'LM6', 'Merak Lokal'),
('KRA', 'LM7', 'Merak Lokal'),
('TOJB', 'LM8', 'Merak Lokal'),
('CLG', 'LM9', 'Merak Lokal'),
('KEN', 'LM10', 'Merak Lokal'),
('MER', 'LM11', 'Merak Lokal'),
('YK', 'Y1', 'Yogyakarta'),
('LPN', 'Y2', 'Yogyakarta'),
('MGW', 'Y3', 'Yogyakarta'),
('BBN', 'Y4', 'Yogyakarta'),
('SWT', 'Y5', 'Yogyakarta'),
('KT', 'Y6', 'Yogyakarta'),
('CE', 'Y7', 'Yogyakarta'),
('DL', 'Y8', 'Yogyakarta'),
('GW', 'Y9', 'Yogyakarta'),
('PWS', 'Y10', 'Yogyakarta'),
('SLO', 'Y11', 'Yogyakarta'),
('SK', 'Y12', 'Yogyakarta'),
('PL', 'Y13', 'Yogyakarta'),
('YK', 'P1', 'Prambanan Express'),
('WT', 'P5', 'Prambanan Express'),
('WJ', 'P7', 'Prambanan Express'),
('JN', 'P8', 'Prambanan Express'),
('KTA', 'P9', 'Prambanan Express');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lokasi`
--

CREATE TABLE `tbl_lokasi` (
  `id` varchar(5) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_lokasi`
--

INSERT INTO `tbl_lokasi` (`id`, `latitude`, `longitude`) VALUES
('AC', '-6.127887018', '106.8450818'),
('AK', '-6.144527311', '106.80086'),
('BBN', '-7.756345391', '110.5003169'),
('BJD', '-6.493059828', '106.7949939'),
('BKS', '-6.236339804383', '106.99909505137'),
('BKST', '-6.246547965', '107.0180941'),
('BOI', '-6.160032063', '106.7363546'),
('BOO', '-6.594323183647', '106.79059442411'),
('BPR', '-6.171915008', '106.6649697'),
('BUA', '-6.215563882752', '106.92320607922'),
('CBN', '-6.464082175645', '106.85259875892'),
('CC', '-6.329364139', '106.6189367'),
('CE', '-7.668618109', '110.6747351'),
('CIT', '-6.261816925094', '107.08361541526'),
('CJT', '-6.354161041', '106.5095015'),
('CKI', '-6.19823646', '106.8413345'),
('CKL', '-6.216645647', '106.2446175'),
('CKR', '-6.254801627', '107.1450044'),
('CKY', '-6.335500617', '106.4117881'),
('CLG', '-6.019437634', '106.0531128'),
('CLT', '-6.531012564', '106.8005775'),
('CSK', '-6.324322624', '106.64167'),
('CT', '-6.265528211', '106.2679353'),
('CTA', '-6.448704703', '106.8025151'),
('CTR', '-6.334877747', '106.3326932'),
('CUK', '-6.218767375', '106.9523764'),
('CW', '-6.242269769', '106.8586646'),
('DAR', '-6.337866038', '106.4923891'),
('DL', '-7.621926637', '110.7066325'),
('DP', '-6.405169143', '106.8171628'),
('DPB', '-6.391002103', '106.8216566'),
('DRN', '-6.255076228', '106.8549352'),
('DU', '-6.155055747', '106.8013866'),
('GDD', '-6.185751217', '106.8325434'),
('GRG', '-6.161943183', '106.7889562'),
('GST', '-6.185988495', '106.8507965'),
('GW', '-7.589047026', '110.7444318'),
('JAKK', '-6.13737449', '106.8146168'),
('JAY', '-6.141065816', '106.822939'),
('JBU', '-6.302682574', '106.2605051'),
('JMG', '-6.288581897', '106.7291775'),
('JN', '-7.802719304627', '110.00126237543'),
('JNG', '-6.214667815', '106.870301'),
('JUA', '-6.166593585', '106.8304087'),
('KAT', '-6.200764831360', '106.81596404581'),
('KBY', '-6.237179573', '106.7826562'),
('KDS', '-6.165816764', '106.7038898'),
('KEN', '-6.009563709', '106.02304'),
('KLD', '-6.213074014', '106.8993556'),
('KLDB', '-6.217340022', '106.9401049'),
('KMO', '-6.161477317', '106.8415085'),
('KMT', '-6.193622077', '106.8565182'),
('KPB', '-6.132452543', '106.8286125'),
('KRA', '-6.038986544', '106.1618229'),
('KRI', '-6.224243088', '106.979803'),
('KT', '-7.712203863', '110.6029457'),
('KTA', '-7.726020890356', '109.90717536180'),
('LNA', '-6.330166444', '106.8348172'),
('LPN', '-7.790111959', '110.3754461'),
('MER', '-5.929993452', '105.9968488'),
('MGB', '-6.14949033', '106.8270256'),
('MGW', '-7.785035951156', '110.43674127090'),
('MJ', '-6.332297433', '106.3965255'),
('MRI', '-6.210033120195', '106.84964534139'),
('MTM', '-6.25701573', '107.1112828'),
('MTR', '-6.212229881', '106.8597219'),
('NMO', '-6.466049969', '106.9062915'),
('PDJ', '-6.276545463', '106.7446146'),
('PDRG', '-6.460806197', '106.8242132'),
('PI', '-6.169568708', '106.6811125'),
('PL', '-7.568190514980', '110.87506718673'),
('PLM', '-6.207360053', '106.7973142'),
('POC', '-6.368884091021', '106.83214912326'),
('POK', '-6.209123622', '106.8622822'),
('PRP', '-6.343930654', '106.5699112'),
('PSE', '-6.174415334', '106.8443687'),
('PSG', '-6.16115114', '106.7718648'),
('PSM', '-6.283940424', '106.8445369'),
('PSMB', '-6.262889433', '106.8516376'),
('PWS', '-7.561447175', '110.7965289'),
('RJW', '-6.144855216', '106.8367142'),
('RK', '-6.352562695', '106.2515407'),
('RU', '-6.314769743', '106.6763159'),
('RW', '-6.162634912', '106.7236431'),
('SDM', '-6.296721037', '106.7126945'),
('SG', '-6.112177569', '106.1585773'),
('SK', '-7.562023653', '110.839395'),
('SLO', '-7.556791079', '110.821349'),
('SRP', '-6.320122049', '106.6655761'),
('SUD', '-6.202436557706', '106.82377330052'),
('SUDB', '-6.201557972885', '106.81982219993'),
('SWB', '-6.160498851', '106.8276157'),
('SWT', '-7.741410756440', '110.54913858356'),
('TB', '-6.25850002', '107.0558629'),
('TEB', '-6.226340616', '106.8584633'),
('TEJ', '-6.327311338', '106.4616249'),
('TGS', '-6.328927216', '106.4341836'),
('THB', '-6.185485653', '106.8108936'),
('TKO', '-6.158374521', '106.7566072'),
('TNG', '-6.176882654', '106.6321804'),
('TNT', '-6.307583691', '106.8389127'),
('TOJB', '-6.031044877', '106.1213667'),
('TPK', '-6.110870554', '106.8811889'),
('TTI', '-6.175073741', '106.6464327'),
('UI', '-6.360576092', '106.8316177'),
('UP', '-6.338731246', '106.8343874'),
('WJ', '-7.861734104', '110.0405761'),
('WLT', '-6.155173403', '106.2187489'),
('WT', '-7.859277731', '110.1579748'),
('YK', '-7.789023257', '110.3635387');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stasiun`
--

CREATE TABLE `tbl_stasiun` (
  `nama` varchar(25) NOT NULL,
  `id` varchar(5) NOT NULL,
  `area` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_stasiun`
--

INSERT INTO `tbl_stasiun` (`nama`, `id`, `area`) VALUES
('Ancol', 'AC', 'jabodetabek'),
('Angke', 'AK', 'jabodetabek'),
('Brambanan', 'BBN', 'yogyakarta'),
('Bojong Gede', 'BJD', 'jabodetabek'),
('Bekasi', 'BKS', 'jabodetabek'),
('Bekasi Timur', 'BKST', 'jabodetabek'),
('Bojong Indah', 'BOI', 'jabodetabek'),
('Bogor', 'BOO', 'jabodetabek'),
('Batu Ceper', 'BPR', 'jabodetabek'),
('Buaran', 'BUA', 'jabodetabek'),
('Cibinong', 'CBN', 'jabodetabek'),
('Cicayur', 'CC', 'jabodetabek'),
('Ceper', 'CE', 'yogyakarta'),
('Cibitung', 'CIT', 'jabodetabek'),
('Cilejit', 'CJT', 'jabodetabek'),
('Cikini', 'CKI', 'jabodetabek'),
('Cikeusal', 'CKL', 'merak'),
('Cikarang', 'CKR', 'jabodetabek'),
('Cikoya', 'CKY', 'jabodetabek'),
('Cilegon', 'CLG', 'serang'),
('Cilebut', 'CLT', 'jabodetabek'),
('Cisauk', 'CSK', 'jabodetabek'),
('Catang', 'CT', 'merak'),
('Citayam', 'CTA', 'jabodetabek'),
('Citeras', 'CTR', 'jabodetabek'),
('Cakung', 'CUK', 'jabodetabek'),
('Cawang', 'CW', 'jabodetabek'),
('Daru', 'DAR', 'jabodetabek'),
('Delanggu', 'DL', 'yogyakarta'),
('Depok', 'DP', 'jabodetabek'),
('Depok Baru', 'DPB', 'jabodetabek'),
('Duren Kalibata', 'DRN', 'jabodetabek'),
('Duri', 'DU', 'jabodetabek'),
('Gondangdia', 'GDD', 'jabodetabek'),
('Grogol', 'GRG', 'jabodetabek'),
('Gang Sentiong', 'GST', 'jabodetabek'),
('Gawok', 'GW', 'yogyakarta'),
('Jakarta Kota', 'JAKK', 'jabodetabek'),
('Jayakarta', 'JAY', 'jabodetabek'),
('Jambubaru', 'JBU', 'merak'),
('Jurang Mangu', 'JMG', 'jabodetabek'),
('Jenar', 'JN', 'yogyakarta'),
('Jatinegara', 'JNG', 'jabodetabek'),
('Juanda', 'JUA', 'jabodetabek'),
('Karet', 'KAT', 'jabodetabek'),
('Kebayoran', 'KBY', 'jabodetabek'),
('Kali Deres', 'KDS', 'jabodetabek'),
('Krenceng', 'KEN', 'serang'),
('Klender', 'KLD', 'jabodetabek'),
('Klender Baru', 'KLDB', 'jabodetabek'),
('Kemayoran', 'KMO', 'jabodetabek'),
('Kramat', 'KMT', 'jabodetabek'),
('Kampung Bandan', 'KPB', 'jabodetabek'),
('Karangantu', 'KRA', 'merak'),
('Kranji', 'KRI', 'jabodetabek'),
('Klaten', 'KT', 'yogyakarta'),
('Kutoarjo', 'KTA', 'yogyakarta'),
('Lenteng Agung', 'LNA', 'jabodetabek'),
('Lempuyangan', 'LPN', 'yogyakarta'),
('Merak', 'MER', 'serang'),
('Mangga Besar', 'MGB', 'jabodetabek'),
('Maguwo', 'MGW', 'yogyakarta'),
('Maja', 'MJ', 'jabodetabek'),
('Manggarai', 'MRI', 'jabodetabek'),
('Metland Telaga Murni', 'MTM', 'jabodetabek'),
('Matraman', 'MTR', 'jabodetabek'),
('Nambo', 'NMO', 'jabodetabek'),
('Pondok Ranji', 'PDJ', 'jabodetabek'),
('Pondok Rajeg', 'PDRG', 'jabodetabek'),
('Poris', 'PI', 'jabodetabek'),
('Palur', 'PL', 'yogyakarta'),
('Palmerah', 'PLM', 'jabodetabek'),
('Pondok Cina', 'POC', 'jabodetabek'),
('Pondok Jati', 'POK', 'jabodetabek'),
('Parung Panjang', 'PRP', 'jabodetabek'),
('Pasar Senen', 'PSE', 'jabodetabek'),
('Pesing', 'PSG', 'jabodetabek'),
('Pasar Minggu', 'PSM', 'jabodetabek'),
('Pasar Minggu Baru', 'PSMB', 'jabodetabek'),
('Purwosari', 'PWS', 'yogyakarta'),
('Rajawali', 'RJW', 'jabodetabek'),
('Rangkasbitung', 'RK', 'serang'),
('Rawa Buntu', 'RU', 'jabodetabek'),
('Rawa Buaya', 'RW', 'jabodetabek'),
('Sudimara', 'SDM', 'jabodetabek'),
('Serang', 'SG', 'serang'),
('Solo Jebres', 'SK', 'yogyakarta'),
('Solo Balapan', 'SLO', 'yogyakarta'),
('Serpong', 'SRP', 'jabodetabek'),
('Sudirman', 'SUD', 'jabodetabek'),
('BNI City', 'SUDB', 'jabodetabek'),
('Sawah Besar', 'SWB', 'jabodetabek'),
('Srowot', 'SWT', 'yogyakarta'),
('Tambun', 'TB', 'jabodetabek'),
('Tebet', 'TEB', 'jabodetabek'),
('Tenjo', 'TEJ', 'jabodetabek'),
('Tigaraksa', 'TGS', 'jabodetabek'),
('Tanah Abang', 'THB', 'jabodetabek'),
('Taman Kota', 'TKO', 'jabodetabek'),
('Tangerang', 'TNG', 'jabodetabek'),
('Tanjung Barat', 'TNT', 'jabodetabek'),
('Tonjongbaru', 'TOJB', 'serang'),
('Tanjung Priok', 'TPK', 'jabodetabek'),
('Tanah Tinggi', 'TTI', 'jabodetabek'),
('Universitas Indonesia', 'UI', 'jabodetabek'),
('Universitas Pancasila', 'UP', 'jabodetabek'),
('Wojo', 'WJ', 'yogyakarta'),
('Walantaka', 'WLT', 'merak'),
('Wates', 'WT', 'yogyakarta'),
('Yogyakarta', 'YK', 'yogyakarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_lokasi`
--
ALTER TABLE `tbl_lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_stasiun`
--
ALTER TABLE `tbl_stasiun`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
