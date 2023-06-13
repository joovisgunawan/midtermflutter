<?php

require "dbconnect.php";

if (!isset($_POST)) {
    $response = array("status" => "failed", "data" => null);
    sendJsonResponse($response);
}

$product_name = $_POST["product_name"];
$product_description = $_POST["product_description"];
$product_price = $_POST["product_price"];
$product_quantity = $_POST["product_quantity"];
$product_location = $_POST["product_location"];
$product_state = $_POST["product_state"];
// $product_images = explode(',', $_POST["product_images"]);
$product_image = $_POST["product_image"];

$sql = "INSERT INTO product_table (product_name, product_description, product_price, product_quantity, product_location, product_state)
 VALUES ('$product_name', '$product_description', '$product_price', '$product_quantity','$product_location', '$product_state')";

if ($conn->query($sql) === TRUE) {
    $product_id = mysqli_insert_id($conn);
    
    // foreach ($product_images as $product_image) {
        $decoded_string = base64_decode($product_image);
        $filename = $product_id;
        $path = '../assets/images/'.$filename.'.png';
        file_put_contents($path, $decoded_string);
        
        // Perform additional operations with each product image if needed
        
        // Example: Store the image path in a database table
        $image_path = 'assets/images/'.$filename.'.png';
        // $image_sql = "INSERT INTO product_images (product_id, image_path) VALUES ('$product_id', '$image_path')";
        // $conn->query($image_sql);
    // }
    
    $response = array('status' => 'success', 'data' => null);
    sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($response)
{
    header('Content-Type: application/json');
    echo json_encode($response);
}

?>
