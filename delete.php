<?php 
  ob_start();
  session_start();
  include "snippet.php";
  require_once 'dbconnect.php';

    if ($_SESSION['role']!= 1) {
 header("Location: index.php");
 exit;
}


 ?>