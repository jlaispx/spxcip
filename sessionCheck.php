<?php

echo "<script>console.log('session check')</script>";
$time = $_SERVER['REQUEST_TIME'];
session_start();
echo("<script>console.log('Current Time:".$time."');</script>");

/**
* for a 30 minute timeout, specified in seconds
*/
$timeout_duration = 1800;
/**
* Here we look for the user's LAST_ACTIVITY timestamp. If
* it's set and indicates our $timeout_duration has passed,
* blow away any previous $_SESSION data and start a new one.
*/
echo("<script>console.log('Timeout check=".$timeout_duration."')</script>");

if (isset($_SESSION['LAST_ACTIVITY'])) {
	$last = $_SESSION['LAST_ACTIVITY'];
	$duration = $time-$last;
	echo("<script>console.log('Curr Last activity=".$last."')</script>");
	echo("<script>console.log('Duration =".$duration."')</script>");
	
   	IF ($duration > $timeout_duration)  {
		echo "<script>console.log('Timeout at ".$time."');</script>";
		header("Location: logout.php");
		}
}
/**
* Finally, update LAST_ACTIVITY so that our timeout
* is based on it and not the user's login time.
*/
$_SESSION['LAST_ACTIVITY'] = $time;
$last=$time;
echo("<script>console.log('New Last activity=".$last."')</script>");
/**
* Now check if user has signed on
* 
*/
if (!isset($_SESSION['username'])) {
	echo ("<script>alert('not logged in');</script>");
	header("Location: login.php");
	exit;
} else {
	$username 	= $_SESSION["username"];
	$role 		= $_SESSION["role"];
	$userRole	= $_SESSION["userRole"];
	$firstName 	= $_SESSION["firstName"];
	$lastName 	= $_SESSION["lastName"];
	$systemAdmin = $_SESSION["systemAdmin"];
	$footer = "Copyright Joseph Lai 2019<div><div>Current User: $username</div><div>Name: $firstName $lastName ($userRole)</div></div>";
	echo ("<script>console.log('logged in as $username');</script>");
	$_SESSION["footer"] = $footer;
	//echo("Logged in as ".$username);
}

?>