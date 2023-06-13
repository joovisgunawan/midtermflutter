<?php
    if (!isset($_POST)) {
        $response = array('status' => 'failed', 'data' => null);
        sendJsonResponse($response);
        die();
    }
    include 'dbconnect.php';
    $user_name=$_POST['user_name'];
    $user_email=$_POST["user_email"];
    $user_password=$_POST['user_password'];
    
    $signupquery="INSERT INTO users_table (user_name, user_email, user_password) VALUES('$user_name','$user_email','$user_password')";
    if ($conn->query($signupquery) === TRUE) {
        $response = array('status' => 'success', 'data' => null);
        sendJsonResponse($response);
    }else{
        $response = array('status' => 'failed', 'data' => null);
        sendJsonResponse($response);
    }
    
    function sendJsonResponse($sentArray)
    {
        header('Content-Type: application/json');
        echo json_encode($sentArray);
    }
?>