<?php
require "dbconnect.php";
if(!isset($_POST)){
    $response = array("status" =>"failed", "data" =>null);
}
// $product_name = $_POST["product_name"];
// $product_description = $_POST["product_description"];
// $product_price = $_POST["product_price"];
// $product_quantity = $_POST["product_quantity"];
// $product_location = $_POST["product_location"];
// $product_state = $_POST["product_state"];
// $product_image = $_POST["product_image"];

$userId = $_POST["user_id"];

$sql = "SELECT * FROM product_table";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $product['product'] = array();
    while ($row = $result->fetch_assoc()) {
        $productarray = array();
        $productarray['product_id'] = $row['product_id'];
        $productarray['product_name'] = $row['product_name'];
        $productarray['product_category'] = $row['product_category'];
        $productarray['product_description'] = $row['product_description'];
        $productarray['product_price'] = $row['product_price'];
        $productarray['product_quantity'] = $row['product_quantity'];
        $productarray['product_location'] = $row['product_location'];
        $productarray['product_state'] = $row['product_state'];
        $productarray['user_id'] = $row['user_id'];
        array_push($product['product'],$productarray);
    }
    $response = array('status' => 'success', 'data' => $product);
    sendJsonResponse($response);
}else{
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($response)
{
    header('Content-Type: application/json');
    echo json_encode($response);
}

?>