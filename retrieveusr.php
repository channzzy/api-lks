<?php

require('validate_token.php');


Success([
    'id' => $reqUser['id'],
    'nama_user' => $reqUser['nama_user'],
    'telepon' => $reqUser['telepon'],
    'alamat' => $reqUser['alamat']
]);