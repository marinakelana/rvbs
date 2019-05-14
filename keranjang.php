<?php 
session_start();
$koneksi = new mysqli("localhost","root","","toko");

if (empty($_SESSION["keranjang"]) OR !isset($_SESSION["keranjang"]))
{
  echo "<script>alert('Keranjang Kosong, Silahkan Berbelanja Terlebih Dahulu');</script>";
echo "<script>location='index.php';</script>";
}
?>

<!DOCTYPE html>
<html>
<head>
      <title> Keranjang Belanja </title>
      <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
  </head>
  <body>
     <nav class="navbar navbar-default">
      <div class="container">

      <ul class="nav navbar-nav">   
      <li><a href="index.php">Home</a></li>
        <li><a href="keranjang.php">Keranjang</a></li>
    <!-- Jika sudah login -->
    <?php if (isset($_SESSION["pelanggan"])) : ?>
      <li><a href="logout.php">Login</a></li> 
    <!-- Jika belom login -->
      <?php else: ?>
      <li><a href="login.php">Login</a></li>  
      <li><a href="daftar.php">Daftar</a></li> 
      <?php endif ?>  
      <li><a href="checkout.php">Checkout</a></li> 
      </ul>
    </div>
    </nav>

    <section class="konten">
      <div class="container">
        <h1> Keranjang Belanja</h1>
        <hr>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>No</th>
              <th>Produk</th>
              <th>Harga</th>
              <th>Jumlah</th>
              <th>Jumlah Harga</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <?php $nomor=1; ?>
            <?php foreach ($_SESSION["keranjang"] as $id_produk => $jumlah): ?>
              <?php
              $ambil= $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'");
              $pecah= $ambil->fetch_assoc();
              $subharga = $pecah["harga_produk"]*$jumlah;
              
              ?>
            <tr>
            <td><?php echo $nomor; ?></td>
            <td><?php echo $pecah["nama_produk"]; ?></td>
            <td>Rp. <?php echo $pecah["harga_produk"]; ?></td>
            <td><?php echo $jumlah; ?></td>
            <td>Rp. <?php echo number_format($subharga); ?></td>
            <td>
              <a href="hapuskeranjang.php?id=<?php echo $id_produk ?>" class="btn btn-danger btn-xs">Hapus</a>
          </tr>
          <?php $nomor++; ?>
          <?php endforeach ?>
        </tbody>
          </thead>
          </table>
          <a href="index.php" class="btn btn-default">Lanjutkan Belanja</a>
          <a href="checkout.php" class="btn btn-primary">Checkout</a>
        </div>
      </section>

  </body>
  </html>
    