<?php
require("sessionCheck.php");
require("escape.php");
$error="Please choose a Venue to connect to a Student";  //Default message
require 'DBUtils.php';
$conn = getConn();

$userId = $_SESSION['userId'];
$yearId = $_SESSION['yearId'];
$year 	= $_SESSION['year'];
if (isset($_SESSION["yearstudentId"])) {
	$yearstudentId = $_SESSION['yearstudentId'];
}
$homeroomId = $_SESSION['homeroomId'];
$homeroom 	= $_SESSION['homeroom'];
$firstName 	= $_SESSION["firstName"];
$lastName 	= $_SESSION["lastName"];
$method		= $_SERVER["REQUEST_METHOD"];

// POST to store all the CIP Hours
if	($method=="POST") {
	IF (isset($_POST['saveHours'])) {
		//echo("Save Hours");
		$studentYearProviderId = $_POST['studentYearProviderId'];
		$cipHours=$_POST['cipHours'];
		
		if (ISSET($_POST['venueFormFlag'])) {
			$venueFormFlag=$_POST['venueFormFlag'];
		} else {$venueFormFlag="";}

		if (ISSET($_POST['logBookFlag'])) {
			$logBookFlag=$_POST['logBookFlag'];
		} else {$logBookFlag="";}
		$comments = $_POST["comments"];
		
		$numVenues = count($studentYearProviderId);
		$success=0;
		$fail = 0;
		for ($x=0;$x<$numVenues;$x++) {
			$vFF = ISSET($venueFormFlag[$x]) ? 1 : 0;
			$lBF = ISSET($logBookFlag[$x]) ? 1 : 0;
			//$comm = ISSET($comments[$x]) ? $comments[$x] :None; 
			//echo($comments[$x]);
			$sql = "UPDATE studentYearProvider SET cipHours=".$cipHours[$x].", venueFormFlag=".$vFF.", logBookFlag=".$lBF.", comments='".esc($comments[$x])."' WHERE studentYearProviderId=".$studentYearProviderId[$x].';';
			//echo($sql);
			if (mysqli_query($conn,$sql) or die(mysqli_error($conn))) {
				$success++;
			} else {
				$fail++;
			}
		}
		$error = "<p>Venues Saved - ".$success."/".$fail."</p>";
		//echo($error);
	} //End Update CIP Hourse
	else if (isset($_POST['addVenue2Student'])) {
		$addProviderId = $_POST["addProviderId"];
		//echo('add venue to student:'.$addProviderId);
		$inssql = "INSERT INTO studentYearProvider (providerId, yearstudentId, cipHours,venueFormFlag, logBookFlag, comments) VALUES (".$addProviderId.",".$yearstudentId.",0,0,0,'')";
		if (mysqli_query($conn,$inssql) or die(mysqli_error($conn))) {
			$studentYearProviderId = mysqli_insert_id($conn);
			$_SESSION['studentYearProviderId']=$studentYearProviderId;
			$error = "<p>Venue added</p>";
		}
	}
}

if (isset($_GET["function"])) {
	$function = $_GET['function'];
} else {
 	$function = "";
}
if (isset($_GET["yearstudentId"])) {
	$yearstudentId = $_GET["yearstudentId"];
	$_SESSION['yearstudentId'] = $yearstudentId;
} 
if (isset($_GET["studentYearProviderId"])) {
	$studentYearProviderId = $_GET["studentYearProviderId"];
	$_SESSION["studentYearProviderId"] = $studentYearProviderId;
} 
if ($function=='delete') {
	//echo('deleting...'.$studentYearProviderId);
	$delsql = "DELETE FROM studentYearProvider WHERE studentYearProviderId = ".$studentYearProviderId;
	if (mysqli_query($conn,$delsql) or die(mysqli_error($conn))) {
		$error = "<p>Venue deleted</p>";
	}
}
$pageHead = "<h2>$year Teacher: $firstName $lastName - Homeroom: $homeroom</h2>";

// GET INFO ABOUT THIS STUDENT
$studsql = 'SELECT s.studentId, s.studentFirstName, s.studentPreferredName, s.studentLastName, s.userId, ys.yearstudentId FROM yearstudents AS ys, student AS s WHERE ys.studentId = s.studentId AND ys.yearstudentId ='.$yearstudentId; 

$studentList = "<h2>Student Details</h2>";

$result = mysqli_query($conn,$studsql) or die(mysqli_error($conn)) ;
if (mysqli_num_rows($result)>0) {
	$_SESSION['NumVenues']= mysqli_num_rows($result);
	
	$studentList .=  "<table>";
	while($studRow = mysqli_fetch_assoc($result)) {
		$studentId 			= $studRow["studentId"];
		$studentFirstName 	= $studRow["studentFirstName"];
		$studentPreferredName 	= $studRow["studentPreferredName"];
		$studentLastName 	= $studRow["studentLastName"];
		$studentUserId 		= $studRow["userId"];
		$studentImage 		= 'studentImages/'.$studentUserId.'.jpg';
		$yearstudentId 		= $studRow['yearstudentId'];
		$studentList .=  "<tr>";
		
		$studentList .=  "<td width='150px' align='center'><a href='student.php?yearstudentId=$yearstudentId&function=edit'>";
		$studentList .= "<img src='$studentImage' title='$studentFirstName $studentLastName' width='86px' height='128px'></a></td>";
		$studentList .=  "<td><a href='student.php?yearstudentId=$yearstudentId&function=edit'>";
		$studentList .= "$studentFirstName";
		$spn = ($studentPreferredName=="")? "" :" ($studentPreferredName) "; 
		$studentList .= " ".$spn." ";
		$studentList .= " $studentLastName</a></td></tr><tr><td></td></tr>";
	} 
	$studentList .= "</table>";
}

// GET INFO ABOUT VENUES FOR THIS STUDENT
$venListsql = 'SELECT p.providerId, p.providerName, p.location FROM cip_provider as p WHERE p.providerId NOT IN (SELECT syp.providerId FROM studentYearProvider AS syp WHERE syp.yearstudentId = "'.$yearstudentId.'" ) ORDER BY p.providerName, p.location';
$vresult = mysqli_query($conn,$venListsql) or die(mysqli_error($conn)) ;
$venList = "<select name='addProviderId'>";
if (mysqli_num_rows($vresult)>0) {
	while($venRow = mysqli_fetch_assoc($vresult)) {
		$venList .= "<option value=".$venRow['providerId'].">".$venRow['providerName']."(".$venRow['location'].")</option>";
	}
	//mysqli_free_result($vresult);
}
$venList .= "</select>";
	
$vensql = 'SELECT p.providerId, p.providerName, p.location, syp.cipHours, syp.venueFormFlag, syp.logBookFlag, syp.comments, syp.studentYearProviderId FROM studentYearProvider as syp, cip_provider as p WHERE syp.providerId = p.providerId AND syp.yearstudentId = '.$yearstudentId.' ORDER BY p.providerName, p.location';
//echo($vensql);		
$studentYearProviderList = "";

$result = mysqli_query($conn,$vensql) or die(mysqli_error($conn)) ;  
if (mysqli_num_rows($result)>0) {
	// Get the results into venue list 
	$studentYearProviderList .= "<form id='providers' name='providers' action='' method='post' class='tableText'>";
	$studentYearProviderList .=  "<table bgcolor='yellow' width='100%' border=1>";
	$studentYearProviderList .=  "<tr><th>Venue</th><th>Location</th><th>CIP Hours</th><th>Venue Form?</th><th>Log Book?</th><th>Comments</th><th></th></tr>";
	$totalHours = 0;
	$p = 0;
	while($provRow = mysqli_fetch_assoc($result)) {
		$providerId 	= $provRow["providerId"];
		$providerName 	= $provRow["providerName"];
		$providerLocation = $provRow["location"];
		$cipHours 		= $provRow["cipHours"];
		$totalHours 	= $totalHours + $cipHours;
		$venueFormFlag 	= $provRow["venueFormFlag"];
		$logBookFlag 	= $provRow["logBookFlag"];
		$comments 		= $provRow["comments"];
		$studentYearProviderId = $provRow['studentYearProviderId'];
		//echo($venueFormFlag.'/'.$logBookFlag.'/'.$studentYearProviderId.'<br/>');
		$studentYearProviderList .=  "<tr>";
		$studentYearProviderList .=  "<td width='30%' align='center'>".$providerName."</td>";
		$studentYearProviderList .=  "<td width='20%' align='center'>".$providerLocation."</td>";
		$studentYearProviderList .=  "<td align='center' width='8%'><input type='hidden' name='studentYearProviderId[$p]' value=".$studentYearProviderId."><input type='number' name='cipHours[$p]' value='".$cipHours."' id='cipHours'/>Hrs</td>";
		$studentYearProviderList .=  "<td align='center'><input type='checkbox' name='venueFormFlag[$p]' ";
		if ($venueFormFlag==1) {
			$studentYearProviderList .= "checked";
		}
		$studentYearProviderList .= "/></td>";
		$studentYearProviderList .=  "<td align='center'><input type='checkbox' name='logBookFlag[$p]' ";
		if ($logBookFlag==1) {
			$studentYearProviderList .= "checked";
		}
		$studentYearProviderList .= "/></td>";
		$studentYearProviderList .= "<td width='20%'><input type='text' name='comments[$p]' size='80'  value='".unesc($comments)."' id='comments'/></td>";
		$studentYearProviderList .= "<td align='center'><a href='studentYearProvider.php?studentYearProviderId=".$studentYearProviderId."&function=delete'>delete</a></td>";
		$studentYearProviderList .= "</tr>\n";
		$p++;
	}
	$studentYearProviderList .=  "<tr><td colspan='3' align='right'><b>".$totalHours." Hrs</b></td><td colspan='4'></td></tr>";
	$studentYearProviderList .=  "</table>\n";
	$studentYearProviderList .=  "<table>";
	$studentYearProviderList .=  "<tr><td>";
	$studentYearProviderList .=  "<button type='submit' name='saveHours'>Save Venues</button>";
	$studentYearProviderList .=  "</td><td width='20%'>";
	$studentYearProviderList .=  "</td><td>";
	$studentYearProviderList .=  $venList;
	$studentYearProviderList .=  "</td><td>";
	$studentYearProviderList .=  "<button type='submit' name='addVenue2Student'>Add Venue To Student</button>";
	$studentYearProviderList .=  "</td></tr>";
	$studentYearProviderList .=  "</table>";

	$studentYearProviderList .=  "</form>";
	//mysqli_free_result($result);
	mysqli_close($conn); 
} else {
	$studentYearProviderList .= "<form id='providers' name='providers' action='' method='post' class='tableText'>";
	$studentYearProviderList .=  "<table>";
	$studentYearProviderList .=  "<tr><td>";
	$studentYearProviderList .=  "</td><td>";
	$studentYearProviderList .=  $venList;
	$studentYearProviderList .=  "</td><td>";
	$studentYearProviderList .=  "<button type='submit' name='addVenue2Student'>Add Venue To Student</button>";
	$studentYearProviderList .=  "</td></tr>\n";
	$studentYearProviderList .=  "</table></form>";	
	$error = "<p>No Venues</p>";
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>St Pius X CIP - Manage Students</title>
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
<h1>Student Venue CIP Hours</h1>
<div>
<?php
echo($studentList);
echo($studentYearProviderList);
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
