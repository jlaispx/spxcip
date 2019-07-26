<?php
require("sessionCheck.php");
require('escape.php');

$error="Please choose a Student to maintain or click Add Student";  //Default message
require 'DBUtils.php';
$conn = getConn();

$userId = $_SESSION['userId'];
$yearId = $_SESSION['yearId'];
$year = $_SESSION['year'];
$homeroomId = $_SESSION['homeroomId'];
$homeroom = $_SESSION['homeroom'];
$firstName = $_SESSION["firstName"];
$lastName = $_SESSION["lastName"];
$method= $_SERVER["REQUEST_METHOD"];

if	($method=="POST") {
	header("Location: student.php?function=add");
	exit;
}
$pageHead = "<h2>$year Teacher: $firstName $lastName - Homeroom: $homeroom</h2>";

// GET INFO ABOUT STUDENTS FOR THIS TEACHER AND YEAR
$sql = 'SELECT s.studentId, s.studentFirstName, s.studentPreferredName, s.studentLastName, s.userId, ys.yearstudentId FROM yearstudents AS ys, student AS s, homeroom AS h, cip_year AS yr, teacherhomeroom AS th WHERE ys.studentid = s.studentid AND ys.homeroomid = h.homeroomId AND ys.yearid = yr.yearId AND ys.homeroomid = th.homeroomId AND ys.yearid = th.yearId AND th.userId = "'.$userId.'" AND yr.year = '.$year.' ORDER BY StudentLastName, StudentFirstName';
		
$studentList = "";
$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
if (mysqli_num_rows($result)>0) {
	// Get the results into venue list 
	$studentList .= "<form id='students' name='students' action='' method='post' class='tableText'>";
	$studentList .=  "<table width='100%'  id='myTable'>";
	$studentList .=  "<tr class='header'><th>Homeroom</th><th></th><th >Student</th><th>Venues</th><th>Total Hours</th></tr>";
	while($studRow = mysqli_fetch_assoc($result)) {
		$studentId 			= $studRow["studentId"];
		$studentFirstName 	= $studRow["studentFirstName"];
		$studentPreferredName = $studRow["studentPreferredName"];
		$studentLastName 	= $studRow["studentLastName"];
		$studentUserId 		= $studRow["userId"];
		$studentImage 		= 'studentImages/'.$studentUserId.'.jpg';
		$yearstudentId 		= $studRow['yearstudentId'];
		$studentList 		.= "<tr>";
		$studentList		.= "<td align='center'>$homeroom</td>";
		$studentList .= "<td width='100px' align='center'><a href='student.php?yearstudentId=$yearstudentId&function=edit'>";
		$studentList .= "<img src='$studentImage' title='$studentFirstName $studentLastName'></a></td>";
		$studentList .= "<td width='15%' align='center'><a href='student.php?yearstudentId=$yearstudentId&function=edit'>";
		$studentList .= "$studentFirstName ";
		$spn = ($studentPreferredName=="")? "" :" ($studentPreferredName) "; 
		$studentList .= " ".$spn." ";
		$studentList .= " $studentLastName</a></td>";
		
		// For each student year - see if any providers
		$provsql = "SELECT syp.studentYearProviderId, syp.providerId, p.providerName, p.location, syp.cipHours,syp.venueFormFlag, syp.logBookFlag, syp.comments FROM studentyearprovider AS syp, cip_provider AS p, yearstudents AS ys, student AS s WHERE syp.providerId = p.providerId AND syp.yearstudentId = ys.yearstudentId AND ys.studentid = s.studentid AND syp.yearStudentId = ".$yearstudentId;

		$studentYearProviderId = -1;
		
		$provresult = mysqli_query($conn,$provsql) or die(mysqli_error($conn)) ;
		//echo (mysqli_num_rows($result));
		if (mysqli_num_rows($result)>0) {
			$studentList .=  "<td width='60%'><ol>";
			// Get the results into venue list 
			$totalCipHrs = 0;
			$present = 0;
			while($provRow = mysqli_fetch_assoc($provresult)) {
				$present=1;
				$studentYearProviderId 	= $provRow["studentYearProviderId"];
				$providerId 			= $provRow["providerId"];
				$providerName 			= $provRow["providerName"];
				$location 				= $provRow["location"];
				$cipHours 				= $provRow["cipHours"];
				$totalCipHrs += $cipHours;
				$venueFormFlag 			= $provRow["venueFormFlag"]==1?'Y' : 'N';
				$logBookFlag 			= $provRow["logBookFlag"]==1?'Y':'N';
				$comments 				= unesc($provRow["comments"]);
				
				$studentList .= "<li><div id='myTable1' style='width:100%;' class='rTable'><div class='rTableRow'><div style='width:50%;' class='rTableCell'><a href='studentYearProvider.php?studentYearProviderId=".$studentYearProviderId."&yearstudentId=".$yearstudentId."&function=edit' title='$comments'>".$providerName." (".$location.")</a></div><div style='width:10%;' class='rTableCell'>".$cipHours." hrs</div><span style='width:40%;'>(Venue Form? <b>".$venueFormFlag."</b>, Log Book? <b>".$logBookFlag."</b>)</span></div></div></li>";
			}
			$studentList .= "";
			if ($present==0) {
				$studentList .= "<div><a href='studentYearProvider.php?yearstudentId=".$yearstudentId."&function=add'>Add New Venue</a></div>";
			}
			$studentList .= "</ol></td>";
		} else {
			//echo("here");
		}
		$studentList .= "<td><table width='85%'>";
		$studentList .= "<tr><td align='right'>";
		if ($totalCipHrs==0) {
			$studentList .= "<b><div style='background-color:yellow;color:red;'>$totalCipHrs hrs</div></b></td>";
		} else if ($totalCipHrs>=20) {
			$studentList .= "<b><div style='background-color:lightblue;color:red;'>$totalCipHrs hrs</div></b></td>";
		} else {
			$studentList .= "<b>$totalCipHrs hrs</b></td>";
		}
		if ($totalCipHrs>=20) {
			$studentList .= "<td><b>Y</b></td>";
		} else {
			$studentList .= "<td><b>N</b></td>";
		}
		$studentList .=  "</tr></table></td>\n";

		$studentList .=  "</tr>";
	} 
	$studentList .=  "</table>";
	$studentList .=  "<p></p>";
	$studentList .=  "<button type='submit' name='new'>Add New Student</button>";
	$studentList .=  "<p></p>";
	$studentList .=  "</form>";
	mysqli_close($conn); 
} else {
	$error = "<p>No Students Available!</p>";
}
?>

<!DOCTYPE html>
<html>
<head>
	<title>St Pius X CIP - Manage Students</title>
	<link href="css/spxcip.css" rel="stylesheet" type="text/css">
	<link href="css/filterTable.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/filterTable.js"></script>
	<?php require('favicon.php'); ?>
</head>
<body>
<header class="page-header">
<h1>St Pius X CIP Hours</h1>
</header>
<?php require("nav.php"); ?>
<maincontent>
<?php echo($pageHead); ?>
<h1>Manage Students</h1>
<div>
<input type="text" class="myInput" id="myInput0" onkeyup="myFunction(0)" placeholder="filter by Homeroom..">
<input type="text" class="myInput" id="myInput2" onkeyup="myFunction(2)" placeholder="filter by Student..">
<input type="text" class="myInput" id="myInput6" onkeyup="myFunction(6)" placeholder="filter by Completed..">
<?php echo($studentList); ?>
</div>

<span><p><?php echo $error; ?></p></span>
</maincontent>
<footer>
<span><?php echo $footer;?>
</span>	
</footer>

</body>
</html>
