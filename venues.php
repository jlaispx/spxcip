<?php
session_start();
if (!isset($_SESSION['username'])) {
	echo "<script>alert('Login First!');windows.location.href='index.html';</script>";
	header("Location: index.html");
	$footer = "Not logged In";
} else {
	$username = $_SESSION["username"];
	$role = $_SESSION["role"];
	$firstname = $_SESSION["firstname"];
	$lastname = $_SESSION["lastname"];
	$footer = "<div><div>Current User: $username</div><div>Name: $firstname $lastname</div></div>";
}
?>
<!DOCTYPE html>
<html>
<head>
<title>St Pius X CIP - Manage Venues</title>
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

<h1>Manage Venues</h1>
<div>
<?php
FUNCTION esc($string) {
	return str_replace("'","&rsquo;",$string);
}

$error="Please choose a Venue to maintain";  //Default message
require 'DBUtils.php';
$conn = getConn();

// GET QUIZ TOPICS THAT ARE ACTIVE FIRST
$sql = 'SELECT providerId, providerName, location FROM cip_provider ORDER BY providerName';
		
////echo $sql;	
$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
if (mysqli_num_rows($result)>0) {
	// Get the results into venue list 
	echo "<form id='venues' name='venues' action='venues.php' method='post'>";
	echo "<ol>";
	while($provRow = mysqli_fetch_assoc($result)) {
		$providerId = $provRow["providerId"];
		$providerName = $provRow["providerName"];
		echo "<li><button type='button' value='$providerId'> "//<a href='venue.php' value='$providerId'>$providerName</a>";
		echo "</li>";
	} 
	echo "</ol>";
	//echo "<button type='submit' name='submit'>Submit Answers</button>";
	echo "</form>";
	mysqli_close($conn); 
} else {
	$error = "<p>No Venues Available!</p>";
}
?>
</div>
<span><?php echo $error; ?></span>
</maincontent>
<footer>
Copyright Mr Lai 2018
<span><?php echo $footer;?>
</span>	
</footer>

</body>
</html>
