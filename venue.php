<?php
require("sessionCheck.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>St Pius X CIP - Manage Venue</title>
	<link href="css/spxcip.css" rel="stylesheet" type="text/css">
	<?php require('favicon.php'); ?>
</head>
<body>
<header class="page-header">
<h1>St Pius X CIP Hours</h1>
</header>
<?php require("nav.php"); ?>
<maincontent>

<h1>Manage Venue</h1>
<div>
<?php
require('escape.php');
	
FUNCTION editVenue($providerId) {
	require 'DBUtils.php';
	$conn = getConn();
	// GET VENUE AND EDIT
	
	$sql = 'SELECT providerId, providerName, location FROM cip_provider WHERE providerId='.$providerId.' ORDER BY providerName';
			
	//echo $sql;	
	$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
	if (mysqli_num_rows($result)==1) {
		// Get the results into venue fields
		echo "<h2>Edit Venue/CIP Provider</h2>";

		echo "<table class='tableText'>";
		echo "<form id='venue' name='venue' action='venue.php?function=save' method='post'>";
		while($provRow = mysqli_fetch_assoc($result)) {
			
			$providerId 	= $provRow["providerId"];
			$_SESSION["providerId"] = $providerId;
			$providerName 	= $provRow["providerName"];
			$location		= $provRow["location"];
			echo "<tr>";
			echo "<td>Venue Id:</td><td>$providerId</td>";
			echo "</tr><tr>";
			echo "<td>Venue Name:</td><td><input type='text' name='providerName' value='".html_entity_decode($providerName)."'></td>";
			echo "</tr><tr>";
			echo "<td>Location:</td><td><input type='text' name='location' value='".html_entity_decode($location)."'></td>";
			echo "</tr><tr>";
			echo "<input type='hidden' name='providerId' value='$providerId'>";
		} 
		echo "<td><button type='submit' name='update'>Update Venue</button></td>";
		echo "<td><button type='submit' name='delete'>Delete Venue</button></td>";
		echo "</tr>";
		echo "</form>";
		echo "</table>";
	
	} else {
		$error = "<p>Venue Not Found!</p>";
	}
	mysqli_close($conn); 
}
FUNCTION addVenue() {
	echo "<h2>Add New Venue</h2>";
	echo "<table class='tableText'>";
	echo "<form id='venue' name='venue' action='venue.php?function=save' method='post'>";
	echo "<tr>";
	echo "<td>Venue Name: </td><td><input type='text' name='providerName'></td>";
	echo "</tr>";
	echo "<tr>";
	echo "<td>Location: </td><td><input type='text' name='location'></td>";
	echo "</tr>";
	echo "<tr>";
	echo "<input type='hidden' name='providerId' value=''></td>";
	echo "<td><button type='submit' name='submit'>Add Venue</button></td>";
	echo "</tr>";
	echo "</form>";
	echo "</table>";
}

FUNCTION saveVenue($providerId, $providerName, $location) {
	echo("Saving....");
	$function = "Updated";
	if ($providerId=="") {
		//INSERT
		$function="Added";
		$sql = 'INSERT INTO cip_provider (providerName, location) SELECT "'.htmlentities(ucwords($providerName)).'", "'.htmlentities(ucwords($location)).'" FROM DUAL WHERE NOT EXISTS( SELECT providerName FROM cip_provider WHERE LOWER(providerName) = LOWER("'.$providerName.'") AND LOWER(location) = LOWER("'.$location.'")) LIMIT 1';
	} else if (isset($_POST["update"])) {
		//Update
		$sql = 'UPDATE cip_provider SET providerName="'.htmlentities(ucwords($providerName)).'", location="'.htmlentities(ucwords($location)).'" WHERE providerId='.$providerId;
	} else if (isset($_POST["delete"])) {
		//Delete
		$function="Deleted";
		$sql = 'DELETE FROM cip_provider WHERE providerId='.$providerId;
	}
	require 'DBUtils.php';
	$conn = getConn();
	// SAVE VENUE
				
	echo $sql;	
	if (mysqli_query($conn,$sql) or die(mysqli_error($conn))) {  
		$error = "<p>Record Saved</p>";
		if ($providerId=='') { $providerId = mysqli_insert_id($conn);}
		$_SESSION['providerId']=$providerId;
	} else {
		$error = "<p>Venue Not $function!</p>";
	}
	echo "<script>alert('Finished Maintain Venue');</script>";
	header("Location: venues.php");	
}


//============================================================================
//echo "here";
$error="Please Update Venue";  //Default message
IF (isset($_GET["venue"])) { 
	$providerId = $_GET["venue"];
	$_SESSION["providerId"]=$providerId;
} else {
	$providerId=NULL;
}
if (isset($_GET["function"])) {
	$function=$_GET["function"];
} else {
	$function="add";
}
echo "<p>Function:".$function.", ";
echo "Venue Id:".$providerId."</p>";

if ($function=="edit") {
	editVenue($providerId);
	
} else if ($function=="save") {
	$providerId=$_POST["providerId"];
	$providerName=htmlentities($_POST["providerName"]);
	$location=htmlentities($_POST["location"]);
	saveVenue($providerId,$providerName,$location);
} else {
	$error="Please Add Venue";
	addVenue();
} 


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
