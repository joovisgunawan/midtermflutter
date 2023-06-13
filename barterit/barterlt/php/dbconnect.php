<?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass="";
    $db = "barterlt";

    $conn = new mysqli($dbhost, $dbuser, $dbpass,$db);
    if(!$conn){
        die("Connection failed: " . $conn->connect_error);
    }
    // echo "Connected to MySql";
    // if(isset($dbpass)){
    //     echo "dbpass is set";
    // }
?>