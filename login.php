<?php
session_start();
session_unset(); 
?>
<!DOCTYPE html>
<html>
<head>
<title>St Pius X CIP - Home Page</title>
<link href="css/spxcip.css" rel="stylesheet" type="text/css">
</head>
<body>
<header class="page-header">
<h1>St Pius X CIP Hours</h1>
</header>
<nav>
	<ul>
		<li><a href="index.html">Home</a></li>
		<li><a href="venues.php">Manage Venues</a></li>
		<li><a href="students.php">Manage Students</a></li>
		<li><a href="ciphours.php">Enter Student Hours</a></li>
	</ul>
</nav>
<maincontent>

<h1>Welcome</h1>
<div>
<?php

$error="Processing Login";  //Default message
require 'DBUtils.php';
$footer="Not Logged In";

if (isset($_POST['submit'])) {  // Has the submit button been pressed?
	if (empty($_POST['username']) || empty($_POST['password'])) {
		$error = "Login invalid - please enter a Username and Password";
	} else {
	// ATTEMPTING LOGIN NOW
		$conn = getConn();
		//Get Login fields
		$username = $_POST["username"];
		$password = $_POST["password"];

		$sql = "SELECT UserID, UserName, Password, firstName, lastName, Email, Role FROM Users WHERE UserName = '$username' AND Password = '$password'";
		
		//echo $sql;
		$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
		//$result = $conn->query($sql);
		
		if (mysqli_num_rows($result)>0) {
			// Get the results into $row 
			$row = mysqli_fetch_assoc($result);
			
			$role = $row["Role"];
			
			$firstname = $row["firstName"];
			$lastname = $row["lastName"];//
			$email = $row["Email"];
			
			if ($role=="0") {
				$error = "<p>Admin Logged In Successfully</p>";
			} else {
				$error = "<p>$username Logged In Successfully</p>";
			}
			$_SESSION["username"]=$username;
			$_SESSION["password"]=$password;
			$_SESSION["firstname"]=$firstname;
			$_SESSION["lastname"]=$lastname;
			$_SESSION["role"]=$role;
			$_SESSION["email"]=$email;
			
			$footer = "<div><div>Current User: $username</div><div>Name: $firstname $lastname</div></div>";
		} else {
			$error = "<p>Invalid Username and password</p>";
		}
			mysqli_close($conn);
		} 
} else {
	$error = "<p>Login invalid!</p>";
}
?>
</div>
<span><?php echo $error; ?></span>
</maincontent>
<footer>
Copyright Mr Lai 2018
<span><?php echo $footer;?></span>	
</footer>

</body>
</html>
