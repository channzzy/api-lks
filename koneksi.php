<?php
include('helper.php');
$con = mysqli_connect('localhost','root','','foodxyz');

if(!$con){
    die("Koneksi Gagal".mysqli_error());
}