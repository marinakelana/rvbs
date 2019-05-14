<?php 
session_start();
$koneksi = new mysqli("localhost","root","","toko");
?>

    <!DOCTYPE html>
    <html>
    <head>
    	<title>Nota Belanja</title>
    	<link rel="stylesheet" href="admin/assets/css/bootstrap.css">
    </head>
    <body>
    	<?php include 'menu.php'; ?>
    <section class="konten">
    	<div clas="container"></div>

  <section class="konten">
      <div class="container">
<h2> Detail Pembelian </h2>
<?php 
$ambil=$koneksi->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan=pelanggan.id_pelanggan WHERE pembelian.id_pembelian='$_GET[id]'");
$detail = $ambil->fetch_assoc();
?>

<div class="row">
	<div class="col-md-4">
		<h3>Pembelian</h3>
	<strong>No. Pembelian :<?php echo $detail['id_pembelian']; ?></strong><br> 
	Tanggal Pembelian : <?php echo $detail['tanggal_pembelian']; ?> <br>
	Total : <?php echo $detail['total_pembelian']; ?>
</div>
<div class="row">
<div class="col-md-4"></div>
<div class="col-md-4">
	<h3>Pelanggan</h3>
	 <strong><?php echo $detail ['nama_pelanggan']; ?></strong> <br>
	 <p>
	 	 <?php echo $detail['telepon_pelanggan']; ?> <br>
		 <?php echo $detail['email_pelanggan']; ?> <br>
	</p>
</div>
<div class="row">
<div class="col-md-4">
	<h3>Pengiriman</h3>
	 <strong><?php echo $detail ['nama_kota']; ?></strong> <br>
	       Ongkos Kirim  : Rp. <?php echo number_format($detail['tarif']); ?>  <br>
	       Alamat : <?php echo $detail['alamat_pengiriman']; ?> <br>
	   </div>
	</div>
  <section class="konten">
      <div class="container">
<div class="row">
	<div class="col-md-7">
	<div class="alert alert-info">
		<p>
			Silahkan melakukan pembayaran sebesar <strong> Rp. <?php echo number_format($detail['total_pembelian']); ?> </strong> ke <br>
			<strong>BANK MANDIRI 10900.2929.927 a.n Nurullah Marina Kelana <br>
			BANK BNI 737379338 a.n Nurullah Marina Kelana </br>
			BANK BCA 283833738 a.n Nurullah Marina Kelana </br>
			BANK SUMSEL BABEL 1828.708.271 a.n Nurullah Marina Kelana</strong>
		</p>
			<a href= "pembayaran.php" class="btn btn-default">Upload Bukti Pembayaran</a>
	</div>
</div>
</div>
</div>
</section>

    </body>
    </html>