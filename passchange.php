<?php
function alert($message) {
	echo "<script type='text/javascript'>alert('$message');</script>";
}
session_start();

$error="Processing Login";  //Default message
require 'DBUtils.php';
$footer="Not Logged In";
$method= $_SERVER["REQUEST_METHOD"];
$salt = '$5$rounds=5000$stpiusxcipsystem2019jlai';

if	($method=="POST") {
	if (empty($_POST['username']) || empty($_POST['password0'])|| empty($_POST['password1'])|| empty($_POST['password2'])) {
		$error = "Password Change invalid - please enter a Username and Current Password and New Passwords twice";
	} else {
	// Check existing LOGIN NOW
		$conn = getConn();
		//Get Login fields
		$username = $_POST["username"];
		$password0 = $_POST["password0"];
		$password1 = $_POST["password1"];
		$password2 = $_POST["password2"];
		if ($password0 !== "reset") {
			$password0=crypt($password0, $salt);
		}	
		$sql = "SELECT u.UserID, u.UserName, u.PASSWORD FROM Users AS u WHERE LOWER(u.UserName) = LOWER('$username') AND u.Password = '$password0'";
		
		$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
		//$result = $conn->query($sql);
		
		if (mysqli_num_rows($result)==1) {
			// Get the results into $row 
			$row = mysqli_fetch_assoc($result);
			$userId = $row['UserID'];
			IF ($password1 !== $password2) {
				$error = "<p>(Password Change) New passwords do not match - please re-enter new passwords</p>";
			} ELSE {
				$password=crypt($password1, $salt);
				$sql = "UPDATE Users SET password='$password' WHERE UserID = $userId";
				IF (mysqli_query($conn,$sql) or die(mysqli_error($conn))) {
					$error = "<p>Password updated</p>";
					echo ("<script>console.log('$username password updated - ".$_SERVER['REQUEST_TIME']."')</script>");
					header("Location: logout.php");
				} ELSE {
					$error = "<p>Password failed to update</p>";
					echo ("<script>console.log('$username password failed to update - ".$_SERVER['REQUEST_TIME']."')</script>");
				}
			}
		} ELSE {
			$error = "<p>(Password Change) Invalid Username and password</p>";
		}
		mysqli_close($conn);
	} 
}

?>
<!DOCTYPE html>
<html>
<head>
	<title>St Pius X CIP - Password Change</title>
	<link href="css/spxcip.css" rel="stylesheet" type="text/css">
	<?php require('favicon.php'); ?>
</head>
<body>
<header class="page-header">
<h1>St Pius X CIP Hours</h1>
</header>
	
<?php require('nav.php');?>
	
<maincontent>

<h1>Login</h1>
<h3>Please login to system</h3>
<form id="passChangeForm" name="passChangeForm" action="" method="post" class="loginForm">
<div id="userLogin">
<div id="user">
	<div><label>Username:</label></div>
	<div>
		<input type="text" autocomplete="username" id="username" name="username">
	</div>
	<div>Current Password:</div>
	<div>
		<input type="password" id="password0" name="password0" placeholder="**********" >
	</div>
	<div>New Password:</div>
	<div>
		<input type="password" id="password1" name="password1" placeholder="**********" >
	</div>
	<div>Repeat New Password:</div>
	<div>
		<input type="password" id="password2" name="password2" placeholder="**********" >
	</div>
	<button type="submit" name="passChangeBtn" id="passChangeBtn" >Change Password</button>
</div>
</div>
</form>	
	
	
<div>
</div>
<span><?php echo $error; ?></span>
</maincontent>
<footer>
Copyright Mr Lai 2018
<span><?php echo $footer;?></span>	
</footer>

</body>
</html>
