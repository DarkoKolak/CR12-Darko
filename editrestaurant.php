<?php 
  ob_start();
  session_start();
  include "snippet.php";
  require_once 'dbconnect.php';

    if ($_SESSION['role']!= 1) {
 header("Location: index.php");
 exit;
}

$image = $_POST['image'];
$name = $_POST['name'];
$adress = $_POST['adress'];
$zipCode = $_POST['zipCode'];
$webAdress = $_POST['webAdress'];
$type = $_POST['type'];
$id = $_POST['id'];
$location = $_POST['location'];


$asql = "UPDATE restaurant SET image= '$image',Name='$name',adress='$adress',zipCode='$zipCode',webAdress='$webAdress',type='$type' WHERE restaurantId='$id'";
$result = $conn->query($asql);

header('Location: adminindex.php');


 ?>