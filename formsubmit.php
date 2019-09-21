<?php 
ob_start();
session_start();
require_once 'dbconnect.php';

$emailcheck = $_POST["emailcheck"];
$usernamecheck = $_POST["usernamecheck"];
$password1 = $_POST["password"];
$password2 = $_POST["re_password"];
$firstname = $_POST["name"];
$lastname = $_POST["lastname"];
$username = $_POST["username"];
$email = $_POST["email"];
$password_first = hash('sha256' , $password1);
$password_second = hash('sha256' , $password2);

$query = "INSERT INTO `userdata` (`firstname`,`lastname`,`username`,`password`,`email`,`userrole`) VALUES  ('$firstname','$lastname','$username','$password_second','$email',0);";


if ($emailcheck==="email is unique") {
	if ($usernamecheck==="username is unique") {
		if ($password_first===$password_second) {
			$conn->query($query);
			echo "<h1> You are registered </h1>";
			header("Location:home.php");
			
		}else{
			echo "Your passwords do not match!";
		}
	}else{
		echo "You username is not unique";
	}
}else{
	echo "Your email is not unique!";
}





 ?>