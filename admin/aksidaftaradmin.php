<?php 
	
	session_start();
	$koneksi = new mysqli("localhost","root","","toko");
	$username = $_POST['username'];
	$password = $_POST['password'];

	$result = mysqli_query($koneksi,"INSERT INTO admin VALUES(null,'$username','$password')");


	if ($result) {
		echo "Anda Berhasil Registrasi!!!";
		echo("<br>");
		echo "Silahkan Login ";
		echo "<a href='loginadmin.php'>Disini</a>";
		
	}
	else {
		echo "Maaf Anda Belum Berhasil Registrasi";
		echo "<a href='daftaradmin.php'>Silahkan Coba Lagi</a>";
	}


?>