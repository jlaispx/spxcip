<?php
function alert($message) {
	echo "<script type='text/javascript'>alert('$message');</script>";
}
session_start();

$error="Processing Login";  //Default message
require 'DBUtils.php';
$footer="Not Logged In";
$method= $_SERVER["REQUEST_METHOD"];

if	($method=="POST") {
	if (empty($_POST['username']) || empty($_POST['password'])) {
		$error = "Login invalid - please enter a Username and Password";
	} else {
		// remove all session variables
		session_unset(); 

		// destroy the session 
		session_destroy();
		session_start();
	// ATTEMPTING LOGIN NOW
		$conn = getConn();
		//Get Login fields
		$username = $_POST["username"];
		$password = $_POST["password"];

		$sql = "SELECT u.UserID, u.UserName, u.PASSWORD, u.firstName, u.lastName, u.Email, u.Role, h.homeroomId, h.homeroom, yr.yearId, yr.year FROM Users AS u, teacherhomeroom AS t, cip_year AS yr, homeroom AS h WHERE u.userid = t.userId AND t.yearId = yr.yearId AND h.homeroomId = t.homeroomId AND yr.YEAR = year(NOW()) AND LOWER(u.UserName) = LOWER('$username') AND u.Password = '$password'";
		
		$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
		//$result = $conn->query($sql);
		
		if (mysqli_num_rows($result)==1) {
			// Get the results into $row 
			$row = mysqli_fetch_assoc($result);
			
			$userId = $row['UserID'];
;			$firstName = $row["firstName"];
			$lastName = $row["lastName"];//
			$role = $row["Role"];
			$email = $row["Email"];
			$year = $row["year"];
			$yearId = $row["yearId"];
			$homeroom = $row["homeroom"];
			$homeroomId = $row["homeroomId"];
			if ($role=="0") {
				$error = "<p>Admin logged In Successfully</p>";
			} else {
				$error = "<p>($username) $firstName $lastName logged In Successfully</p>";
			}
			echo($method." here2");
			$_SESSION["username"]=$username;
			//$_SESSION["password"]=$password;
			$_SESSION["firstName"]=$firstName;
			$_SESSION["lastName"]=$lastName;
			$_SESSION["role"]=$role;
			$_SESSION["email"]=$email;
			$_SESSION["year"] = $year;
			$_SESSION["yearId"] = $yearId;
			$_SESSION["homeroom"] = $homeroom;
			$_SESSION["homeroomId"] = $homeroomId;
			$_SESSION["userId"] = $userId;
			
			$footer = "<div><div>Current User:". $_SESSION['username']."</div><div>Name: $firstName $lastName</div></div>";
			
			$_SESSION["footer"]=$footer;
			header("Location: index.php");
		} else {
			$error = "<p>(login) Invalid Username and password</p>";
		}
		mysqli_close($conn);
	} 
}

?>
<!DOCTYPE html>
<html>
<head>
	<title>St Pius X CIP - Home Page</title>
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
<form id="loginForm" name="loginForm" action="" method="post" class="loginForm">
<div id="userLogin">
<div id="user">
	<div><label>Username:</label></div>
	<div>
		<input type="text" autocomplete="username" id="username" name="username">
	</div>
	<div>Password:</div>
	<div>
		<input type="password" autocomplete="current-password" id="password" name="password" placeholder="**********" >
	</div>
	<button type="submit" name="loginBtn" id="loginBtn" >Login</button>
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
