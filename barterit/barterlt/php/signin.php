<?php
    if (!isset($_POST)) {
        $response = array('status' => 'failed', 'data' => null);
        sendJsonResponse($response);
        die();
    }

    $email = $_POST['user_email'];
    $password = ($_POST['user_password']);

    include_once("dbconnect.php");

    $signinquery = "SELECT * FROM users_table WHERE user_email = '$email' AND user_password = '$password'";
    $result = $conn->query($signinquery);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $userarray = array();
            $userarray['user_id'] = $row['user_id'];
            $userarray['user_email'] = $row['user_email'];
            $userarray['user_name'] = $row['user_name'];
            $userarray['user_password'] = $_POST['user_password'];
            $response = array('status' => 'success', 'data' => $userarray);
            sendJsonResponse($response);
        }
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