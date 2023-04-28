<?php
require('koneksi.php');

if($_SERVER['REQUEST_METHOD'] !== 'POST'){
    Error('Invalid request');
}

$nama = $_POST['nama_user'];
$alamat = $_POST['alamat'];
$telepon = $_POST['telepon'];
$username = $_POST['username'];
$password = md5($_POST['password']);

$checkQuery = "select id from tbl_user where username ='$username'";
$ekse = mysqli_query($con, $checkQuery);
if(mysqli_num_rows($ekse) > 0){
    Error('Username Sudah Digunakan');
}

$sql = "insert into tbl_user(nama_user,alamat,telepon,username,password) values('$nama','$alamat','$telepon','$username','$password')";
$eksekusi = mysqli_query($con, $sql);

if(mysqli_affected_rows($eksekusi) == 0){
    Error('Data Tidak Berhasil Di Simpan');
}else{
    Success([
        'Data Berhasil Di Simpan' => true
    ]);
}

mysqli_close($con);

