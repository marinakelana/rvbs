<?php 
session_start();
$koneksi = new mysqli("localhost","root","","toko");
?>

<!DOCTYPE html>
<html>
<head>
      <title> LOGIN PELANGGAN </title>
      <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
  </head>
  <body>
  	 <?php include 'menu.php'; ?>
  		<div class="container">
  				<div class="row">
  				<div class="col-md-4">
  				<div class="panel panel-default">
  				<div class="panel-heading">
  					<h3 class ="panel-title">Login Pelanggan </h3>
  				</div>
  				<div class="panel-body">	
  				<form method="post"> 
  					<div class="form-group">
  					<label>Email</label>
  					<input type="email" class="form-control" name="email">
  				</div>
  				<div class="form-group">
  					<label>Password</label>
  					<input type="password" class="form-control" name="password">
  				</div>
  				<button class="btn btn-primary" name="simpan">Login</button>
           <span class="pull-right">
               <a href="admin/login.php" >Login as admin? </a> 
             </span>
           </div>

  				</form>
  			</div>
  		</div>
  	</div>
  </div>
</div>

<?php

if (isset($_POST["simpan"])) 
{

$email = $_POST["email"];
$password = $_POST["password"];

$ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan='$email' AND password_pelanggan='$password'");

$akunyangcocok = $ambil->num_rows;

if ($akunyangcocok==1)
{
	$akun = $ambil->fetch_assoc();
	$_SESSION["pelanggan"] = $akun;
	echo "<script>alert('Anda Sukses Login');</script>";
  //jika sukses belanja
  if (isset($_SESSION["keranjang"]) or !empty($_SESSION["keranjang"]))
  {
      echo "<script>location='checkout.php';</script>";
  }
  else
  {
    echo "<script>location='riwayat.php';</script>";
  }
}
else
{
			echo "<script>alert('Anda Gagal Login, Periksa Akun Anda');</script>";
			echo "<script>location='login.php';</script>";	
}

}

?>


  </body>
  </html>