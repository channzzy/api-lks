<?php
require('koneksi.php');

if($_SERVER['REQUEST_METHOD'] !== 'POST'){
    Error('Invalid request');
}

$username = $_POST['username'];
$password = md5($_POST['password']);

$result = "select id,nama_user,username from tbl_user where username='$username' and password='$password' limit 1";
$eksekusi = mysqli_query($con,$result);

$user = mysqli_fetch_array($eksekusi);

if(is_null($user)){
    Error('User not found');
}

$token =  md5(uniqid($user['id']));
$expired = date('Y-m-d H:i:s',strtotime('+ 1 days'));
$userID = $user['id'];

$createToken = "insert into tbl_token(token,expired,id_user) values('$token', '$expired', '$userID')";
$ekse = mysqli_query($con,$createToken);

if(!$ekse){
    Error('Gagal Membuat Token');
}

Success([
    'id' => $user['id'],
    'nama_user' => $user['nama_user'],
    'username' => $user['username'],
    'token' => $token,
    'expired' => $expired
]);