<?php

function Error($message, $erorCode = 400){
    header("Content-Type: application/json; charset=UTF-8");
    http_response_code($erorCode);
    echo json_encode([
        'message' => $message
    ]);
    exit();
}

function Success($data){
    header("Content-Type: application/json; charset=UTF-8");
    http_response_code(200);
    echo json_encode(['data' => $data]);
    exit();
}