<?php
require ('koneksi.php');
$sql = "select * from tbl_barang";
$eksekusi = mysqli_query($con,$sql);

$barang = [];

if(mysqli_num_rows($eksekusi) > 0){
    while($row = mysqli_fetch_object($eksekusi)){
        $row -> image = "http://10.0.2.2/images/" . $row -> image;
        array_push($barang, $row);
    }
}

Success($barang);
mysqli_close($con);