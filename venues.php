<?php
require("sessionCheck.php");
FUNCTION esc($string) {
	return str_replace("'","&rsquo;",$string);
}

$userId = $_SESSION['userId'];
$yearId = $_SESSION['yearId'];
$year = $_SESSION['year'];
$homeroomId = $_SESSION['homeroomId'];
$homeroom = $_SESSION['homeroom'];
$firstName = $_SESSION["firstName"];
$lastName = $_SESSION["lastName"];

$pageHead = "<h2>$year Teacher: $firstName $lastName - Homeroom: $homeroom</h2>";

$error="Please choose a Venue to maintain or click Add Venue";  //Default message
require 'DBUtils.php';
$conn = getConn();

// GET QUIZ TOPICS THAT ARE ACTIVE FIRST
$sql = 'SELECT providerId, providerName, location FROM cip_provider ORDER BY providerName';

$venueList = "";

////echo $sql;	
$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
if (mysqli_num_rows($result)>0) {
	// Get the results into venue list 
	$venueList .= "<form id='venues' name='venues' action='venue.php' method='post' class='tableText'>";
	$venueList .= "<ol>";
	while($provRow = mysqli_fetch_assoc($result)) {
		$providerId = $provRow["providerId"];
		$providerName = $provRow["providerName"];
		$location=$provRow["location"];
		$venueList .= "<li><a href='venue.php?venue=$providerId&function=edit'>".$providerName.' ('.$location.')'."</a>";
		$venueList .= "</li>";
	} 
	$venueList .= "</ol>";
	$venueList .= "<button type='submit' name='new'>Add New Venue</button>";
	$venueList .= "<p></p>";
	$venueList .= "</form>";
	mysqli_close($conn); 
} else {
	$error = "<p>No Venues Available!</p>";
}

?>
<!DOCTYPE html>
<html>
<head>
	<title>St Pius X CIP - Manage Venues</title>
	<link href="css/spxcip.css" rel="stylesheet" type="text/css">
	<?php require('favicon.php'); ?>
</head>
<body>
<header class="page-header">
<h1>St Pius X CIP Hours</h1>
</header>
<?php require("nav.php"); ?>
<maincontent>
<?php echo($pageHead); ?>
<h1>Manage Venues</h1>
<div>
<?php echo($venueList);
?>
</div>
<span><p><?php echo $error; ?></p></span>
</maincontent>
<footer>
Copyright Mr Lai 2018
<span><?php echo $footer;?>
</span>	
</footer>

</body>
</html>
