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
$Country = $_POST['Country'];
$City = $_POST['City'];
$id = $_POST['id'];

$sql = "UPDATE location SET image= '$image' ,Country='$Country',City='$City' WHERE LocationId='$id'";
$result = $conn->query($sql);

header('Location: adminindex.php');


 ?>