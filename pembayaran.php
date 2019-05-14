<?php 
session_start();
error_reporting(0);
$koneksi = new mysqli("localhost","root","","toko");

if (!isset($_SESSION["pelanggan"]) or empty($_SESSION["pelanggan"]))
{
  echo "<script>alert('Anda Belum Login, Silahkan Login Terlebih Dahulu');</script>";
  echo "<script>location='login.php';</script>";
  exit();
}
$idpem= $_GET["id"];
$ambil = $koneksi->query("SELECT * FROM pembelian WHERE id_pembelian='$idpem'");
$detpem = $ambil->fetch_assoc();

 $id_pelanggan_beli = $detpem["id_pelanggan"];
 $id_pelanggan_login = $_SESSION["pelanggan"]["id_pelanggan"];

if ($id_pelanggan_login !==$id_pelanggan_beli)
{
	echo "<script>alert('Klik opsi pembayaran untuk mengupload bukti pembayaran');</script>";
  	echo "<script>location='riwayat.php';</script>";
}

?>

<!DOCTYPE html>
<html>
<head>
      <title> RED VELVET BOOKSTORE </title>
      <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
  </head>
  <body>

  	<?php include 'menu.php'; ?>

  	<div class="container">
  		<h2> Konfirmasi Pembayaran </h2>
  		<p> Kirim Bukti Pembayaran Anda Disini </p>
  		<div class="alert alert-info">Total Tagihan Anda <strong>Rp. <?php echo number_format($detpem["total_pembelian"]) ?></strong></div>


  		<form method="post" enctype="multipart/form-data">
  			<div class="form-group">
  				<label>Nama Penyetor </label>
  				<input type="text" class="form-control" name="nama">
  			</div>
  			<div class="form-group">
  				<label>Bank </label>
  				<input type="text" class="form-control" name="bank">
  			</div>
  			<div class="form-group">
  				<label>Jumlah </label>
  				<input type="text" readonly value ="<?php echo number_format($detpem["total_pembelian"]) ?>" class="form-control" name="jumlah">
  			</div>
  			<div class="form-group">
  				<label>Bukti Pembayaran</label>
  				<input type="file" class="form-control" name="bukti">
  				<p class="text-danger">Foto Bukti harus JPG maksimal 2 MB</p>
  			</div>
  			<button class="btn btn-primary" name="kirim">Kirim</button>

  		<?php 
  		if (isset($_POST["kirim"]))
  		{
  			$namabukti = $_FILES["bukti"]["name"];
  			$lokasibukti = $_FILES["bukti"]["tmp_name"];
  			$namafiks= date("YmdHis").$namabukti;
  			move_uploaded_file($lokasibukti,"bukti_pembayaran/$namafiks");

  			$nama = $_POST["nama"];
  			$bank = $_POST["bank"];
  			$jumlah = $_POST["jumlah"];
  			$tanggal = date("Y-m-d");

  			$koneksi->query("INSERT INTO pembayaran(id_pembelian,nama,bank,jumlah,tanggal,bukti) VALUES ('$idpem','$nama',$bank','$jumlah','$tanggal','$namafiks') ");

  			$koneksi->query("UPDATE pembelian SET status_pembelian='Sudah Dibayar' WHERE id_pembelian='$idpem'"); 

  			echo "<script>alert('Terimakasih sudah membayar pesanan anda! Admin akan mengirimkan resi pengirim ke email anda.');</script>";
                  echo "<script>location='riwayat.php';</script>";
  		}
  		?>

  </body>
  </html>