-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Des 2019 pada 15.03
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kp_amikom`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_coba`
--

CREATE TABLE `tb_coba` (
  `nama` varchar(50) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_coba`
--

INSERT INTO `tb_coba` (`nama`, `nim`, `kelas`) VALUES
('A', '16.11.0137', 'SI18Z');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hak_akses`
--

CREATE TABLE `tb_hak_akses` (
  `id_user` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_hak_akses`
--

INSERT INTO `tb_hak_akses` (`id_user`, `status`) VALUES
(1, ' tidak aktif'),
(8, 'aktif'),
(9, 'aktif'),
(15, 'tidak aktif'),
(16, 'aktif'),
(23, 'aktif'),
(25, 'aktif'),
(26, 'aktif'),
(27, 'aktif'),
(28, 'aktif'),
(29, 'aktif'),
(30, 'aktif'),
(31, 'aktif'),
(32, 'aktif'),
(34, 'aktif'),
(35, 'aktif'),
(36, 'aktif'),
(37, 'aktif'),
(38, 'aktif'),
(39, 'aktif'),
(40, 'aktif'),
(41, 'aktif'),
(43, 'aktif'),
(44, 'aktif'),
(45, 'aktif'),
(46, 'aktif'),
(47, 'aktif'),
(48, 'aktif'),
(49, 'tidak aktif'),
(50, 'aktif'),
(51, 'aktif'),
(52, 'aktif'),
(57, 'aktif'),
(60, 'aktif'),
(61, 'aktif'),
(62, 'aktif'),
(63, 'aktif'),
(64, 'tidak aktif'),
(65, 'aktif'),
(66, 'aktif'),
(67, 'aktif'),
(69, 'aktif'),
(71, 'aktif'),
(72, 'tidak aktif'),
(74, 'aktif'),
(75, 'aktif'),
(113, 'aktif'),
(114, 'aktif'),
(115, 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_history_surat`
--

CREATE TABLE `tb_history_surat` (
  `id_surat` varchar(255) NOT NULL,
  `penerima` varchar(255) NOT NULL,
  `dari` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_history_surat`
--

INSERT INTO `tb_history_surat` (`id_surat`, `penerima`, `dari`, `id`) VALUES
('002/AMIKOM PWT/FASBIS/02/XII/2019', '115', '25', 8),
('001/AMIKOM PWT/FASBIS/02/XII/2019', '115', '25', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_post`
--

CREATE TABLE `tb_post` (
  `id` int(30) NOT NULL,
  `title_post` varchar(350) NOT NULL,
  `body_post` text NOT NULL,
  `date` date NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `gambar` varchar(300) NOT NULL,
  `full_gambar` text NOT NULL,
  `type_gambar` text NOT NULL,
  `id_user` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_post`
--

INSERT INTO `tb_post` (`id`, `title_post`, `body_post`, `date`, `kategori`, `gambar`, `full_gambar`, `type_gambar`, `id_user`) VALUES
(1032, 'STMIK Amikom Purwokerto Mendapat Rekomendasi Jadi Universitas', '<p><strong>STMIK&nbsp;</strong>Amikom Purwokerto semakin dekat melakukan alih status menjadi Universitas Amikom Purwokerto. Setelah tujuh Assesor melakukan visitasi ke STMIK Amikom Purwokerto,. Ketua STMIK Amikom Purwokerto, Dr Berlilana M.Kom., M.Si mengungkapkan rasa syukurnya karena usaha seluruh&nbsp;keluarga STMIK Amikom Purwokerto sudah mencapai puncaknya.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“<em>Alhamdullilah&nbsp;</em>setelah Assesor melakukan visitasi kemarin, hasilnya verifikasi dan penilaian akhir utuk perubahan bentuk amikom Purwokerto secara umum dinilai sangat baik dan sudah direkomendasikan,” kata dia dalam&nbsp;<strong>silaturahmi dan hahalbihalal kelurga besar STMIK Amikom Purwokerto beserta keluraga di Aula kampus tersebut, Sabtu (15/6).</strong></p><p>Dalam vistasi ini ada tiga aspek yang dinilai. Diantaranya aspek hukum, Aspek keuangan, serta aspek sarana dan prasarana dan umum.” Hasilnya smua sdah baik, sudah mendapat rekomendasi tanpa catatan apapun hanya tinggal menunggu SK Kemenristekkdikti turun untuk perubahan status. Karena memang Amikom Purwokerto sudah siap menjadi universitas. Dan kita harus menjaga tantangan kepercayaan dari masyarakat dan Kemenristekdikti melalui kualitas mutu lulusannya,” katanya.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seperti Prodi Bisnis Digital yang&nbsp;<em>concern&nbsp;</em>&nbsp;pada&nbsp;<em>fintech&nbsp;</em>cocok untuk menjawab tantangan industri 4.0 dengan tren kemajuan teknologi. Lini bisnis saat ini semuanya sudah menggunakan teknologi digital dan&nbsp;<em>online</em>.</p><p>Sementara untuk prodi Ilmu Komunikasi meskipun beberapa perguruan tingai juga memiliki prodi ilmu komunikasi, tapi prodi di Amikom purwokero berbeda dengan perguruan tinggi lainnya. Sebab, di Amikom Purwokerto memberikan komunikasi yang sifatnya digitalisme.</p><p>“Tanpa menghilangkan dasar komunikasi tapi memberikan sentuhanpada komunikasi teknologi. Ditambah daya dukung laboratorium yang sudah dimiliki. Seperti radio, tv dengan izin resmi Kominfo serta memiliki beberapa laboratorium penunjang yang sifatnya untuk kemajuan Prodi Komunikasi,” katanya.</p><p>Ia berharap, kedepan Amikom Purrwokerto akan semakin baik dan berkembang, dan semua karyawan dan dosen semakin dewasa dan tetap bersinergi dengan baik. “ Persaingan untuk meraih prestasi harus tetap kita jaga. Mudah-mudahan kepercayaan masyarkat di Banyumas bisa semakin meningkat dengan baik, “ujarnya.&nbsp;</p>', '2019-08-09', 'Berita', 'Berita_09-08-2019_1565312269.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Berita_09-08-2019_1565312269.jpeg', 'image/jpeg', 0),
(1033, 'Resmi Menjadi Universitas AMIKOM', '<p><strong>Prodi Bisnis Digital Pertama di Jawa Tengah</strong></p><p><strong>PURWOKERTO-</strong>Prosesi pembinaan dan penyerahan SK Izin perubahan bentuk Perguruan Tinggi Universitas Amikom Purwokerto digelar Jum’at (26/7) pagi ini di aula Kampus Ungu.</p><p>Hadir dalam prosesi bersejarah bagi keluarga besar AMIKOM Purwokerto tersebut, Kepala LLDIKTI Wilayah VI Prof DYP Sugiharto M.Pd Kons, Ketua Dewan Pembina yayasan Amikom Purwokerto, Prof Dr M Muyanto MM, Ketua Yayasan Amikom Purwokerto M Hari Purwidiantoro ST MM M.Kom,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>Rektor Amikom Purwokerto Dr Berlilana M.Si dan kepala bagian kelembagaan dan Sistem Informasi LLDIKTI Wilayah VI Ngadiyanto ST M.Kom dalam sambutan mengatakan, Jum’at(26/7), menjadi hari yang sangat membahagiakan. Karena sudah sah, menjadi Universitas Amikom Purwokerto.</p><p>Penggabungan berjalan baik dan lancar, kata dia, tidak lepas dari peran Prof Dr M Suyanto MM selaku Ketua Dewan Opembina Yayasan Amikom Purwokerto.</p><p>“Mudah-mudahan dengan menjadi Universitas, Amikom purwokerto dapat semakin memberi kesan dan kontribusi positif bagi Banyumas khususnya, Indonesia dan dunia,” katanya</p><p>Ketua dewan Pembina Yayasan AMIKOM Purwokerto Prof Dr M Suyanto MM mengatakan, sejarah berubahnya STMIK AMIKOM Purwokerto menjadi Universitas AMIKOM Purwokerto berlangsung cepat hanya dalam waktu dua setengah bulan saja. Universitas AMIKOM Purwokerto harus mampu mengejar universitas AMIKOM Yogyakarta agar bisa sejajar dan menjadi universitas generasi keempat yang bisa mencerdaskan.</p><p>“Terimaksih kepada LLDIKTI Wilayah VI dan semua pihak yang sudah mendukung kami berada di sini,”ucapnya.</p><p>Kepala LLDIKTI Wilayah VI Prof DYP Sugiharto MPd Kons mengungkapkan program studi&nbsp;<strong>Bisnis Digital S1</strong>&nbsp;Universitas AMIKOM Purwokerto menjadi yang&nbsp;<strong>PERTAMA</strong>hadir di Jawa Tengah. Universitas AMIKOM Purwokerto sudah menjalankan permintaan Presiden Jokowi agar perguruan tinggi berani membuka program studi baru. Dari 255 Pergururn Tinggi Swasta (PTS) dan 9 Perguruan Tinggi Negeri (PTN) di Jawa Tengah, Universitas AMIKOM Purwokerto merupakan PTS yang ke 51 saat ini. “ Terimakasih AMIKOM Purwokerto sudah memulai.” Pungkasnya.&nbsp;<strong>((wn/hms)</strong></p>', '2019-08-09', 'Berita', 'Berita_09-08-2019_1565312243.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Berita_09-08-2019_1565312243.jpeg', 'image/jpeg', 0),
(1034, 'PELANTIKAN FORUM ASISTEN DOSEN (FA)', '<p>Selasa, 19 Maret 2019 Sebanyak 75 orang Mahasiswa dilantik sebagai Pengurus dan Anggota&nbsp;Forum Asisten Dosen (FA) STMIK AMIKOM Purwokerto untuk masa tugas semester Genap 2018/2019. Pelantikan diadakan di Ruang Aula Kampus Ungu oleh Kaprodi Teknik Informatika, Didit Suhartono, M.Kom, turut dihadiri oleh Kabag Kemahasiswaan (Prayoga Pribadi, M.Si), Kaprodi Sistem Informasi (Dr. Taqwa Hariguna, M.Kom).</p><p>Didit Suhartono, M.Kom&nbsp;dalam sambutannya menyampaikan bahwa tujuan dari pelantikan FA ini adalah untuk menyiapkan Asisten Praktikum yang memiliki kompetensi di setiap bidang guna mendukung kegiatan Praktikum di STMIK AMIKOM Purwokerto. Sebelum dilantik terlebih dahulu anggota Forum Asisten mengikuti tahapan seleksi, diantaranya Seleksi Administrasi (CV, KTM, Surat Pernyataan, KHS dan Transkrip Nilai ) serta Wawancara.</p><p>Berikut Daftar Pengurus Forum Asisten Dosen Semester Genap TA 2018/2019</p><p>Ketua&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Fathurrohman (TI 16)</p><p>Sekretaris&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Triana Yulistia (SI 16)</p><p>Bendahara&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Rahmita Pratama (TI 16)</p><p>Divisi Pemrograman&nbsp;&nbsp;: M. Ali Hasani (TI 16)</p><p>Divisi Multimedia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Umar Abdurahman (SI 16)</p><p>Divisi Jaringan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Anam Barera ( TI 16)</p><p>Divisi SDM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Viki Cahyani (SI 16)</p><p>Divisi IT Support&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Gilang Dwi Prasetyo (TI 16)</p>', '2019-08-09', 'Berita', 'Berita_09-08-2019_1565312208.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Berita_09-08-2019_1565312208.jpeg', 'image/jpeg', 0),
(1035, 'STMIK Amikom Purwokerto Juara 1 Krenova', '<p>PURWOKERTO, SATELITPOST-Mahasiswa STMIK Amikom Purwokerto kembali mengharumkan nama baik kampus dengan teknologi yang diciptakan. Kali ini, enam mahasiswa bimbingan Kuat Indartono ST MEng yang telah menorehkan prestasinya di tingkat Kabupaten Banyumas.</p><p>Mereka yakni, M Taufik NH, Desi Rahmawati, Resni Novelalita, Renita Isnaeni dan Ulvah Windi Rahayu. Keenam mahasiswa tersebut berhasil membawa pulang juara 1 dalam ajang komp?etisi Kreativitas dan Inovasi (Kreanova) yang digelar di Alun-alun Purwokerto, Sabtu-Minggu (25-26/11).</p><p>Juara pertama berhasil diraih karena teknologi karya enam mahasiswa tersebut. Yakni, Autes Tech (<em>Automatic Electric Scarescrow Technology</em>). Teknologi tersebut yakni sebuah alat pengusir hama burung secara otomatis.</p><p>“<em>Alhamdulillah</em>&nbsp;dari 10 besar yang masuk, STMIK Amikom Purwokerto berhasil menjadi yang terbaik,” kata M Taufik NH.</p><p>Menurutnya, alat pengusir burung ini bergerak secara otomatis. Dengan bergerak lima menit menyala dan lima menit mati. Sementara untuk menghidupkan dan mematikannya, menggunakan saklar&nbsp;<em>on/off</em>.</p><p>Raihan prestasi ini membuat Taufik dan kelima anggota lainnya berhak membawa pulang hadiah uang pembinaan senilai ?Rp 14 juta. Dan akan mengikuti kompetisi serupa di tingkat selanjutnya, tingkat provinsi.</p><p>Alat pengusir burung otomatis yang telah diterapkan di Desa Pasinggrangan, Banyumas ini berhasil memikat Bupati Banyumas, Ir Achmad Husein. Dengan memberikan respons ketertarikannya yang sangat positif.</p><p>Sementara itu, Ketua STMIK Amikom Purwokerto, Berlilana SP SKom MSi sangat mengapresiasi prestasi yang terus ditorehkan mahasiswa STMIK Amikom Purwokerto. “Semoga prestasi-prestasi yang diraih dapat memberikan motivasi bagi mahasiswa lainnya untuk turut berprestasi. Baik akademik maupun non akademik. Terutama supaya dapat terus mengembangkan kemampuan dalam bidang teknologinya,” kata dia.&nbsp;</p>', '2019-08-09', 'Prestasi', 'Prestasi_09-08-2019_1565312196.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Prestasi_09-08-2019_1565312196.jpeg', 'image/jpeg', 0),
(1036, 'STMIK Amikom Gelar 2nd Citisee 2017', '<p>STMIK Amikom Purwokerto, menggelar 2nd Citisee 2017 di Hotel Java Heritage, Kamis (7/12). Acara tersebut digelar atas kerjasama Neris Group dan organisasi profesi Indoceiss.</p><p>Neris group terdiri dari enam Perguruan Tinggi di Indonesia, yakni STMIK Amikom Purwokerto, AMIK Cipta Dharma Solo, STMIK Akmaluhur Pangkalpinang, STMIK PalComTech, Sekolah Teknik Bandung, dan STIKOM PGRI Banyuwangi.</p><p>Acara tersebut diikuti 70 pemakalah dan 90 peserta seminar. Dengan menghadirkan dua pemateri, yakni Prof Hidetaka Nambo dari Kanazawa University Jepang dan rektor Universitas Amikom Yogyakarta, M Suyanto. Agenda tersebut mengusung tema Optimalisasi Strategi yang Relevan dengan Peta Persaingan di Era Digital.</p><p>Ketua panitia, Kuat Indartono mengatakan, acara yang sudah digelar dua kali ini merupakan kegitan rutin tahunan STMIK Amikom Purwokerto. “Kegiatan ini untuk mengumpulkan dan mem-<em>publish&nbsp;</em>hasil penelitian dosen-dosen seluruh Indonesia,” kata Kuat.</p><p>Ketua STMIK Amikom Purwokerto, Dr Berlilana SP SKom MSi mengatakan, pergerakan industri kreatif semakin hari semakin meningkat dan berjalan sesuai perkembangan teknologi saat ini.</p><p>Dengan tema tersebut, ?ia berharap peserta yang fokus di ekonomi kreatif lebih memahami persaingan dan dapat menerapkan strategi tepat untuk pemasaran industri kreatif.</p><p>?”Perkembangan ekonomi kreatif sudah mencapai Rp 826 Triliun dengan tenaga kerja sekitar 15,9 juta orang. Peran Perguruan Tinggi, sangat penting sekali sebagai wadah supaya industri kreatif semakin berkembang dengan riset dan perkembangannya. Dan pemerintah dengan kebijakan dan aturan yang mendukung industri kreatif, supaya bisa berkembang sesuai harapan kita,” katanya.</p><p>?Narasumber dari Kanazawa University Jepang, Hidetaka Nambo mengatakan, di Jepang banyak lansia yang tinggal sendiri tidak bersama keluarganya. Di satu sisi, keterbatasan lansia yang hidup seorang diri membuat tidak ada yang dapat menolongnya.</p><p>Makanya, ia mengaku ingin menelitinya supay?a dapat memantaunya di ruangan dengan gas sensor yang ditangkap dari gerakan seseorang di ruangan itu. Pemantau itu dibuat dengan metode tertentu sebagai&nbsp;<em>rule</em>&nbsp;yang digunakan untuk estimasi posisi objek.</p><p>“Saat ini yang sedang dikembangkan bioelektrik tumbuhan yang diperlakukan khusu?s dengan menempelkan elektroda di daunnya,” kata dia.</p><p>Rektor Universitas Amikom Yogyakarta, M Suyanto mengatakan, era digital sangat berhubungan dengan populasi masyarakat di dunia. Hampir dipastikan setiap penduduk menonton film? minimal satu kali dalam satu tahun.</p><p>“Industri kreatif saat ini, sangat menjanjikan. Karena yang dijual bukan produk seperti industri biasa, tapi yang dijual&nbsp;<em>value</em>&nbsp;yang memiliki nilai tawar lebih,” katanya.</p><p>Jepang, menjadi satu negara yang cukup serius mengembangkan industri kreatif. Dimulai dari konten,&nbsp;<em>passion, local product&nbsp;</em>dan lainnya.</p>', '2019-08-09', 'Prestasi', 'Prestasi_09-08-2019_1565312187.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Prestasi_09-08-2019_1565312187.jpeg', 'image/jpeg', 0),
(1037, 'Bawor Jadi Lakon Game Edukatif Karya STMIK Amikom Purwokerto', '<p>Bawor sebagai tokoh wong Banyumas, kini telah dijadikan sebagai lakon dalam dua&nbsp;<em>game</em>&nbsp;edukatif karya STMIK Amikom Purwokerto dengan&nbsp;<em>game&nbsp;</em>Bawor Adventure.</p><p>?Tokoh pewayangan yang identik dengan perilaku&nbsp;<em>wong&nbsp;</em>Banyumas ini pertama hadir sebagai lakon di&nbsp;<em>game&nbsp;</em>Bawor Adventure. Permainan ini diproduksi PT Ampu Kreatif Studio yang merupakan badan usaha milik STMIK Amikom Purwokerto. Sedangkan yang kedua, dirilis oleh EMRC PPMP FKIP UMP.</p><p><em>Game&nbsp;</em>tersebut menampilkan kisah petualangan Bawor. Di mana pemain dituntut mengumpulkan barang yang nantinya terkonversi menjadi skor atau nilai bagi pemain&nbsp;<em>game</em>.?&nbsp;<em>Game&nbsp;</em>Bawor Adventure karya STMIK Amikom Purwokerto menampilkan Bawor berpetualang mengumpulkan peralatan untuk keperluan gelar budaya seni lokal Banyumas.</p><p>Direktur PT Ampu Kreatif Studio STMIK AMIKOM Purwokerto, Rachman Rasyidi mengatakan pihaknya banyak mengeksplorasi budaya dan kesenian lokal Banyumas.&nbsp;<em>Game&nbsp;</em>ini berkisah tentang petualangan Bawor yang diberi mandat oleh orangtuanya untuk membantu masyarakat Banyumas dalam mengumpulkan alat untuk keperluan adat Banyumas. Pemain&nbsp;<em>game online&nbsp;</em>Bawor Adventure akan diajak bertualang ke berbagai tempat, mulai alam pedesaan yang indah hingga kompleks candi.</p><p>Di sepanjang perjalanan, Bawor dituntut untuk menemukan peralatan untuk menggelar berbagai budaya adat Banyumas. Di berbagai tempat, pemain&nbsp;<em>game online</em>&nbsp;dapat membaca sekilas deskripsi budaya dan seni lokal Banyumas. Antara lain, kuda kepang, cowongan, jemblung.</p><p>“<em>Game</em>&nbsp;ini diciptakan tahun 2015. Bahkan sudah mengikuti berbagai kompetisi nasional dan internasional.&nbsp;<em>Game&nbsp;</em>ini juga pernah meraih Juara I Nasional di UNITY EduComp. Kompetisi&nbsp;<em>game&nbsp;</em>dengan mengusung topik pendidikan yang diselenggarakan oleh Universitas Negeri Yogyakarta (UNY),” kata dia.</p><p>Selain itu,&nbsp;<em>game</em>&nbsp;Bawor Adventure STMIK Amikom Purwokerto juga pernah mengikuti Festival Baros International Animation Festival (BIAF) dalam kurun waktu tiga tahun berturut-turut, yakni pada 2015, 2016 dan 2017.<em>Game&nbsp;</em>ini dikembangkan dengan sasaran pengguna anak sekolah dasar dan remaja di sekolah menengah pertama. “<em>Game&nbsp;</em>Bawor Adventures ini menjadi angin segar di tengah minimnya&nbsp;<em>game&nbsp;</em>yang mendidik,” katanya.</p>', '2019-08-09', 'Prestasi', 'Prestasi_09-08-2019_1565312168.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Prestasi_09-08-2019_1565312168.jpeg', 'image/jpeg', 0),
(1038, 'Agenda nomor 1', '<p>Ini adalah Event 1</p>', '2019-08-06', 'Event', 'Event_06-08-2019_1565106393.', 'http://localhost/kp_amikom/uploads_artikel/Event_06-08-2019_1565106393.', '', 25),
(1039, 'Agenda nomor 2', '<p>universitas amikom akan mengadakan event akan mendatang</p>', '2019-08-06', 'Event', 'Event_06-08-2019_1565106447.', 'http://localhost/kp_amikom/uploads_artikel/Event_06-08-2019_1565106447.', '', 25),
(1040, 'Agenda Nomor 3', '<p>Universitas Amikom akan Mengadakan acara 17 agustus </p>', '2019-08-06', 'Event', 'Event_06-08-2019_1565106502.', 'http://localhost/kp_amikom/uploads_artikel/Event_06-08-2019_1565106502.', '', 25),
(1041, 'Agenda Nomor 4', '<p>Kampus akan mengadakan event lomba dalam waktu dekat ini</p>', '2019-08-06', 'Event', 'Event_06-08-2019_1565106577.', 'http://localhost/kp_amikom/uploads_artikel/Event_06-08-2019_1565106577.', '', 25),
(1042, 'Agenda Nomor 5', '<p>event merupakan salah satu agenda </p>', '2019-08-06', 'Event', 'Event_06-08-2019_1565106624.', 'http://localhost/kp_amikom/uploads_artikel/Event_06-08-2019_1565106624.', '', 25),
(1043, 'Agenda Nomor 6 ', '<p>17 Agustus akan di adakan upacara </p>', '2019-08-06', 'Event', 'Event_06-08-2019_1565106672.', 'http://localhost/kp_amikom/uploads_artikel/Event_06-08-2019_1565106672.', '', 25),
(1059, 'MAHASISWA AMIKOM PURWOKERTO RAIH 2 EMAS', '<p>Dipenghujung tahun 2018 mahasiswa amikom berhasil mempersempahkan 2 emas dalam kejuaraan Makzom Cup Taekwondo Championship. Kejuaraan ini berlangsung Jumat – sabtu 21 – 22 Desember 2018 bertempat di Universitas Budi Luhur Jakarta. 2 Mahasiswa STMIK AMIKOM Purwokerto yang berhasil meraih medali Emas yaitu Jaka Satria Permana dan Adnan Dwi Prasetyo. Keduanya merupakan mahasiswa aktif di STMIK AMIKOM Purwokerto.</p><p>Ketua STMIK AMIKOM Purwokerto, Dr. Berlilana, M.Kom, M.Si mengucapkan selamat atas pencapain yang begitu luar biasa di akhir tahun 2018. “tahun 2018 Alhamdulillah telah dilewati dengan pencapaian luar biasa, selain prestasi dosen dan mahasiswa ditingkat&nbsp;nasional maupun internasional, juga telah diterimanya SK Prodi Baru, yaitu Teknologi Informasi, serta ditambah kado istimewa dari cabang Taekwondo. Semoga kado indah ini akan menjadikan support/modal untuk mengarungi perjalanan STMIK AMIKOM Purwokerto ditahun 2019 yang tinggal menghitung hari lagi.</p>', '2019-08-09', 'Prestasi', 'Prestasi_09-08-2019_1565312680.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Prestasi_09-08-2019_1565312680.jpeg', 'image/png', 0),
(1061, 'AMIKOM Purwokerto Gelar Family Day', '<p>STMIK Amikom Purwokerto kembali menggelar&nbsp;<em>family day&nbsp;</em>di Taman Botani Obyek Wisata Baturraden, Minggu (9/12). Kegiatan rutin tahunan ini diikuti sebanyak 325 keluarga besar STMIK Amikom Purwokerto mulai dari karyawan, dosen dan keluarga masing-masing.</p><p>Ketua STMIK Amikom Purwokerto, Dr Berlilana MKom MSi mengatakan,&nbsp;<em>family day&nbsp;</em>sudah menjadi agenda rutin setiap akhir tahun. Family day tersebut digelar bukan tanpa alasan, tapi untuk semakin meningkatkan kebersamaan dan kekompakan di antara keluarga besar STMIK Amikom Purwokerto.</p><p>“Kegiatan ini murni untuk meningkatkan kebersamaan seluruh keluarga besar STMIK Amikom Purwokerto. Tanpa ada batasan senioritas, umur dan status pekerjaan semua menikmati rangkaian kegiatan,” kata dia.</p><p>Dalam kegiatan ini, seluruh keluarga besar STMIK Amikom Purwokerto mengikuti serangkaian kegiatan bersama. Mulai dari berjalan-jalan di sekitar obyek wisata, lomba-lomba hingga yang paling ditunggu pembagian hadiah dan&nbsp;<em>door prize</em>.&nbsp;<em>Door prize&nbsp;</em>yang diberikan pun cukup menarik, seperti satu buah kulkas, sepeda, dan LED TV Sharp 24 inch.</p><p>Ia mengatakan, berbagai prestasi yang berhasil ditorehkan STMIK Amikom Purwokerto semuanya juga karena peran serta keluarga besar STMIK Amikom Purwokerto. “<em>Alhamdulillah</em>, dari STMIK Amikom masih sangat kecil hingga seperti sekarang semua karena kerja keras keluarga besar STMIK Amikom Purwokerto,” katanya.</p><p>Pihaknya mengungkapkan akan terus menambah sarana prasarana kampus, meningkatkan kualitas dosen dengan semakin banyak meluluskan dosen bergelar doktor (S3) serta meningkatkan kompetensi lulusan. “Kami juga mohon dukungan dan doanya untuk kelancaran mulai persiapan hingga proses beralih status dari STMIK menjadi universitas Amikom Purwokerto,” katanya.</p>', '2019-08-09', 'Berita', 'Berita_09-08-2019_1565312848.jpeg', 'http://localhost/kp_amikom/uploads_artikel/Berita_09-08-2019_1565312848.jpeg', 'image/jpeg', 25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_surat`
--

CREATE TABLE `tb_surat` (
  `id` varchar(255) NOT NULL,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `judul_surat` varchar(100) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `tanggal` varchar(30) NOT NULL,
  `file_surat` text NOT NULL,
  `isi_surat` text NOT NULL,
  `id_user` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_surat`
--

INSERT INTO `tb_surat` (`id`, `nomor_surat`, `judul_surat`, `jenis_surat`, `tanggal`, `file_surat`, `isi_surat`, `id_user`) VALUES
('002/AMIKOM PWT/FASBIS/02/XII/2019', '002/AMIKOM PWT/FASBIS/02/XII/2019', 'hgl', 'FASBIS', '2019-12-11', 'http://localhost/kp_amikom/uploads_surat/FASBIS_11-12-2019_1576043576.docx', 'FASBIS_11-12-2019_1576043576.docx', 0),
('001/AMIKOM PWT/FASBIS/02/XII/2019', '001/AMIKOM PWT/FASBIS/02/XII/2019', 'gfhjh', 'FASBIS', '2019-12-11', 'http://localhost/kp_amikom/uploads_surat/FASBIS_11-12-2019_1576036783.pdf', 'FASBIS_11-12-2019_1576036783.pdf', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nidn` int(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `foto_profil` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `nidn`, `email`, `password`, `kategori`, `foto_profil`) VALUES
(25, 'Untung Nur Khifni', 16110444, 'untung@amikompurwokerto.ac.id', '0192023a7bbd73250516f069df18b500', 'Prodi', 'Dosen_02-12-2019_1575249732.png'),
(115, 'Trian', 12345678, 'trian@amikompurwokerto.ac.id', '0192023a7bbd73250516f069df18b500', 'Dosen', 'Dosen_02-12-2019_1575249732.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_coba`
--
ALTER TABLE `tb_coba`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tb_history_surat`
--
ALTER TABLE `tb_history_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_post`
--
ALTER TABLE `tb_post`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_surat`
--
ALTER TABLE `tb_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_history_surat`
--
ALTER TABLE `tb_history_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_post`
--
ALTER TABLE `tb_post`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1062;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
