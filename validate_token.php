<?php

require('koneksi.php');

$token = $_SERVER['HTTP_AUTHORIZATION'];
$sql = "select tu.id,tu.nama_user,tu.username,tu.alamat,tu.telepon from tbl_token as tk inner join tbl_user as tu on tk.id_user=tu.id where tk.token='$token' and tk.expired > now() limit 1";
$eksekusi = mysqli_query($con,$sql);

$reqUser = [];

if(mysqli_num_rows($eksekusi) > 0){
    while($row = mysqli_fetch_object($eksekusi)){
        array_push($reqUser, $row);
    }
}

if(!$reqUser){
    Error('Unauthorize', 403);
}
Success($reqUser);