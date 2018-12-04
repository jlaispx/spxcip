<?php
function getConn() {
	require 'dbconnect.php';
	$conn = new mysqli($dbserver, $dbusername, $dbpassword, $dbname);
		// Check connection
	if (!$conn) {
		die("Failed to connect to MySQL: " .mysqli_connect_error());
	} 
	return $conn;
}
?>