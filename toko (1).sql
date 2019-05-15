-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2019 at 03:57 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'eyinkelana', 'eyin'),
(3, 'eyinkelana', 'eyin'),
(4, 'eyinkelana', 'eyin'),
(5, 'eyinkelana', 'eyin'),
(6, 'aku', 'aku');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `nama_kota` varchar(50) NOT NULL,
  `tarif` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Jabodetabek', '8000'),
(2, 'All Sumatera ', '10000'),
(3, 'Jawa (except Jabodetabek)', '9000'),
(4, 'All Kalimantan', '12000'),
(5, 'All Sulawesi', '14000'),
(6, 'All Papua', '15000'),
(7, 'Luar Negeri', '50000');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'eyinkelana77@gmail.com', 'eyinkelana', 'eyin', '081991227229', ''),
(2, 'joyiscute@gmail.com', 'joyiscute', 'joy ', '08123456', ''),
(3, 'irene@gmail.com', 'irene', 'Irene Red Velvet', '08199112091', 'Jl. Nusantara'),
(4, 'opi@gmail.com', 'opi', 'Opi Hernayanti', '0812746247249', 'Kos Bu Retno'),
(5, 'sicilia@gmai.com', '123', 'Sicilia Rizki Ananda', '081626636773', 'indralaya'),
(6, 'heeh12@gmail.com', 'wewe12', 'hehe', '08199112091', 'indralaya'),
(7, 'eyincantik@gmail.com', 'eyincantik', 'eyincantik', '081991227229', 'Jl. Nusantara'),
(8, 'niki@gmail.com', 'niki', 'niki', '081991227229', 'niki'),
(9, 'tiarakelana@gmail.ocm', 'tiarakelana', 'Tiara Kelana', '081299103738', 'Jl. Nusantara Kijang'),
(10, 'ireneirene@gmail.com', 'irene', 'Princess Irene', '08199122879', 'Jl. Irene '),
(11, 'arara@gmail.com', 'arinyuyu', 'senja pagi', '087654234568', 'jambi');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `bank` int(30) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` varchar(100) NOT NULL,
  `nama_kota` varchar(50) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(50) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`) VALUES
(1, 1, 1, '2019-03-05', '', '', 0, '', 'Pending'),
(2, 1, 1, '2019-03-06', '', '', 0, '', 'Pending'),
(24, 7, 2, '2019-05-12', '', '', 0, '', 'Pending'),
(26, 7, 0, '2019-05-12', '', '', 0, '', 'Pending'),
(27, 9, 1, '2019-05-12', '', 'Jabodetabek', 8000, '', 'Pending'),
(28, 9, 1, '2019-05-12', '183000', 'Jabodetabek', 8000, '', 'Pending'),
(29, 9, 1, '2019-05-12', '108000', 'Jabodetabek', 8000, 'Jabodetabek aja', 'Pending'),
(30, 8, 2, '2019-05-13', '290000', 'All Sumatera ', 10000, 'Palembang', 'Sudah Dibayar'),
(31, 10, 2, '2019-05-13', '625000', 'All Sumatera ', 10000, 'Jl. Irene km 18', 'Sudah Dibayar'),
(32, 11, 2, '2019-05-14', '140000', 'All Sumatera ', 10000, 'hm jh ', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 1, 1, '0', 0, 0, 0, 0),
(2, 1, 2, 1, '0', 0, 0, 0, 0),
(3, 20, 13, 1, '0', 0, 0, 0, 0),
(4, 20, 12, 1, '0', 0, 0, 0, 0),
(5, 21, 13, 1, '0', 0, 0, 0, 0),
(6, 21, 12, 1, '0', 0, 0, 0, 0),
(7, 22, 13, 1, '0', 0, 0, 0, 0),
(8, 22, 12, 1, '0', 0, 0, 0, 0),
(9, 23, 13, 1, '0', 0, 0, 0, 0),
(10, 24, 18, 1, '0', 0, 0, 0, 0),
(11, 25, 15, 1, '0', 0, 0, 0, 0),
(12, 26, 8, 1, '0', 0, 0, 0, 0),
(13, 0, 16, 1, '0', 0, 0, 0, 0),
(14, 0, 9, 1, '0', 0, 0, 0, 0),
(15, 0, 3, 1, '0', 0, 0, 0, 0),
(16, 0, 18, 1, '0', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`) VALUES
(3, 'The Selection', 200000, 200, 'theselection.jpg', ' 			 			 			 			 			 			For thirty-five girls, the Selection is the chance of a lifetime. The opportunity to escape the life laid out for them since birth. To be swept up in a world of glittering gowns and priceless jewels. To live in a palace and compete for the heart of gorgeous Prince Maxon. 		 		 		 		 		 		'),
(8, 'TFIOS', 200000, 200, 'tfios.jpg', ' 			 			Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis.  		 		'),
(9, 'Me Before You', 130000, 130, 'mby.jpg', ' 			Louisa Clark is an ordinary young woman living an exceedingly ordinary lifeâ€”steady boyfriend, close familyâ€”who has never been farther afield than their tiny village. She takes a badly needed job working for ex-Master of the Universe Will Traynor, who is wheelchair-bound after an accident.  		'),
(12, 'Broken Thorne ', 175000, 250, '3.jpg', ' 			 			The perfect addition to the #1 New York Times bestselling Red Queen series, this gorgeously designed package features three brand-new novellas, two previously published novellas, Steel Scars and Queen Song, and never-before-seen maps, flags, bonus scenes, journal entries, and much more exclusive content. 		 		'),
(13, 'One of Us Is Lying ', 140000, 300, '4.jpg', ' 			Pay close attention and you might solve this.\r\nOn Monday afternoon, five students at Bayview High walk into detention.\r\n    Bronwyn, the brain, is Yale-bound and never breaks a rule. \r\n    Addy, the beauty, is the picture-perfect homecoming princess. \r\n    Nate, the criminal, is already on probation for dealing.\r\n    Cooper, the athlete, is the all-star baseball pitcher.\r\n    And Simon, the outcast, is the creator of Bayview Highâ€™s notorious gossip app. 		'),
(14, 'Textrovert', 100000, 200, '5.jpg', ' 			Was it just a cell phone swap â€¦ or fate? \r\n\r\nItâ€™s bad enough when high-school senior Keeley mistakenly swaps cell phones with a stranger. Itâ€™s even worse when the stranger turns out to be an obnoxious, self-centered boy named Talon â€¦ whoâ€™s just left for football camp with her phone. Reluctantly, the two agree to forward messages for a week. As Keeley gets to know Talon through their texts, she finds out heâ€™s more than just an egocentric jock. In fact, the two fall for each other, hard. But Talon has been keeping a secret. One that makes their relationship all but impossible. Will Keeley ever be able to trust him? \r\n\r\nThis romance offers high-school drama, humor and heart, plus a love story that will sweep you away. 		'),
(15, 'We Were Liars', 200000, 350, '6.jpg', ' 			 			\r\nA beautiful and distinguished family.\r\nA private island.\r\nA brilliant, damaged girl; a passionate, political boy.\r\nA group of four friendsâ€”the Liarsâ€”whose friendship turns destructive.\r\nA revolution. An accident. A secret.\r\nLies upon lies.\r\nTrue love.\r\nThe truth.\r\n \r\nWe Were Liars is a modern, sophisticated suspense novel from New York Times bestselling author, National Book Award finalist, and Printz Award honoree E. Lockhart. \r\nRead it.\r\nAnd if anyone asks you how it ends, just LIE. 		 		'),
(16, 'The One', 139000, 240, 'theone.jpg', ' 			 			America Singer searches for her happily ever after in this swoon-worthy YA dystopian romance, perfect for readers who loved Veronica Rothâ€™s Divergent, Lauren Oliverâ€™s Delirium, or RenÃ©e Ahdiehâ€™s The Wrath & the Dawn.\r\n 		 		'),
(17, 'P.S. I Still Love You', 200000, 180, '51KCVxdp11L.jpg', ' 			 			Given the way love turned her heart in the New York Times bestselling To All The Boys Iâ€™ve Loved Before, which School Library Journal called a â€œlovely, lighthearted romance,â€ itâ€™s no surprise that Laura Jean still has letters to write. 		 		'),
(18, 'Shug', 140000, 140, '61D+nclwQ8L._SX334_BO1,204,203,200_.jpg', ' 			 			Annemarie â€œShugâ€ Wilcox is clever and brave and true (on the inside anyway). And sheâ€™s about to become your new best friend in this enchanting middle grade novel from the New York Times bestselling author of To All the Boys Iâ€™ve Loved Before (soon to be a major motion picture!), Jenny Han.\r\n 		 		'),
(19, 'Twilight #1', 110000, 200, 'twilight.jpg', 'Bella Swan meet Edward Cullen who Vampire'),
(20, 'Girl Gone Viral', 200000, 200, 'a.jpg', 'For seventeen-year-old Opal Hopper, code is magic. She builds entire worlds from scratch: Mars craters, shimmering lakes, any virtual experience her heart desires. '),
(21, 'How to Break a Boy', 155000, 155, '29102902.jpg', ' 			Olivia Clayton has mastered the art of tearing others down to stay on top. She and her best friend, Adrienne, rule their small southern town like all good mean girls do--through intimidation and manipulation. 		'),
(22, 'Alex, Approximately', 120000, 110, '30312700.jpg', ' 			Classic movie fan Bailey â€œMinkâ€ Rydell has spent months crushing on a witty film geek she only knows online as Alex. Two coasts separate the teens until Bailey moves in with her dad, who lives in the same California surfing town as her online crush.\r\n 		'),
(23, 'The Kissing Booth', 145000, 145, 'A1EVlLa--EL.jpg', 'Is Elle headed for heartbreak or will she get her happily ever after?'),
(24, 'Love a la Mode', 110000, 110, '35065036.jpg', 'Rosie Radeke firmly believes that happiness can be found at the bottom of a mixing bowl.'),
(25, 'Prince in Disguise', 160000, 160, '25844635.jpg', 'But when Dusty wins the hand of the handsome Scottish laird-to-be Ronan on the TRC television networkâ€™s crown jewel, Prince in Disguise, Dylan has to face a different kind of reality: reality TV.'),
(26, 'Heartless', 180000, 180, 'abc.jpg', 'Catherine may be one of the most desired girls in Wonderland, and a favorite of the unmarried King of Hearts, but her interests lie elsewhere. A talented baker, all she wants is to open a shop with her best friend.'),
(27, 'The Burning Maze', 135000, 135, '28006096.jpg', ' 			The formerly glorious god Apollo, cast down to earth in punishment by Zeus, is now an awkward mortal teenager named Lester Papadopoulos. 		'),
(28, 'Kingdom of Ash', 120000, 120, '33590260.jpg', ' 			Aelin Galathynius has vowed to save her people but at a tremendous cost. Locked within an iron coffin by the Queen of the Fae, Aelin must draw upon her fiery will as she endures months of torture. 		');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
