<?php
echo "<script>console.log('session check')</script>";
$time = $_SERVER['REQUEST_TIME'];

/**
* for a 30 minute timeout, specified in seconds
*/
$timeout_duration = 1800;
/**
* Here we look for the user's LAST_ACTIVITY timestamp. If
* it's set and indicates our $timeout_duration has passed,
* blow away any previous $_SESSION data and start a new one.
*/
if (isset($_SESSION['LAST_ACTIVITY'])) {
	echo("<script>console.log(Last activity:".$_SESSION['LAST_ACTIVITY']."</script>");
	echo("<script>console.log(".($time - $_SESSION['LAST_ACTIVITY'])."</script>");
   	IF (($time - $_SESSION['LAST_ACTIVITY']) > $timeout_duration)  {
		echo "<script>console.log('Timeout at ".$time."');</script>";
		header("Location: logout.php");
		} else {
			session_start();	
		}
} else {
	session_start();	
}
/**
* Finally, update LAST_ACTIVITY so that our timeout
* is based on it and not the user's login time.
*/
$last =ISSET($_SESSION['LAST_ACTIVITY'])? $_SESSION['LAST_ACTIVITY']:0; 
echo("<script>console.log('Last Activity:".$last."');</script>");
$_SESSION['LAST_ACTIVITY'] = $time;
echo("<script>console.log('Current Time:".$time."');</script>");
echo("<script>console.log('Duration= ".($time-$last)."');</script>");

if (!isset($_SESSION['username'])) {
	echo ("<script>alert('not logged in');</script>");
	header("Location: login.php");
	exit;
} else {
	$username 	= $_SESSION["username"];
	$role 		= $_SESSION["role"];
	$firstName 	= $_SESSION["firstName"];
	$lastName 	= $_SESSION["lastName"];
	$footer = "Copyright Mr Lai 2018<div><div>Current User: $username</div><div>Name: $firstName $lastName</div></div>";
	echo ("<script>console.log('logged in as $username');</script>");
	//echo("Logged in as ".$username);
}

?>