<?php
require("sessionCheck.php");

FUNCTION esc($string) {
	return str_replace("'","&rsquo;",$string);
}

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
	$studentList .=  "<table width='80%' border='1'>";
	while($studRow = mysqli_fetch_assoc($result)) {
		$studentId = $studRow["studentId"];
		$studentFirstName = $studRow["studentFirstName"];
		$studentPreferredName = $studRow["studentPreferredName"];
		$studentLastName = $studRow["studentLastName"];
		$studentUserId = $studRow["userId"];
		$studentImage = 'studentImages/'.$studentUserId.'.jpg';
		$yearstudentId = $studRow['yearstudentId'];

		$studentList .=  "<tr>";
		$studentList .=  "<td width='150px' align='center'><a href='student.php?yearstudentId=$yearstudentId&function=edit'>";
		$studentList .= "<img src='$studentImage' title='$studentFirstName $studentLastName'></a></td>";
		$studentList .= "<td width='20%' align='center'><a href='student.php?yearstudentId=$yearstudentId&function=edit'>";
		$studentList .= "$studentFirstName ";
		$spn = ($studentPreferredName=="")? "" :" ($studentPreferredName) "; 
		$studentList .= " ".$spn." ";
		$studentList .= " $studentLastName</a></td>";
		
		// For each student year - see if any providers
		$provsql = "SELECT syp.studentYearProviderId, syp.providerId, p.providerName, p.location, syp.cipHours,syp.venueFormFlag, syp.logBookFlag FROM studentyearprovider AS syp, cip_provider AS p, yearstudents AS ys, student AS s WHERE syp.providerId = p.providerId AND syp.yearstudentId = ys.yearstudentId AND ys.studentid = s.studentid AND syp.yearStudentId = ".$yearstudentId;

		$studentList .=  "<td><ol>";
		$studentYearProviderId = -1;
		
		$provresult = mysqli_query($conn,$provsql) or die(mysqli_error($conn)) ;  
		if (mysqli_num_rows($result)>0) {
			// Get the results into venue list 
			while($provRow = mysqli_fetch_assoc($provresult)) {
				$studentYearProviderId = $provRow["studentYearProviderId"];
				$providerId = $provRow["providerId"];
				$providerName = $provRow["providerName"];
				$location = $provRow["location"];
				$cipHours = $provRow["cipHours"];
				$venueFormFlag = $provRow["venueFormFlag"]==1?'Y' : 'N';
				$logBookFlag = $provRow["logBookFlag"]==1?'Y':'N';
				
				$studentList .= "<li><table width='100%'><tr><td width='50%'><a href='studentYearProvider.php?studentYearProviderId=".$studentYearProviderId."&yearstudentId=".$yearstudentId."&function=edit'>".$providerName." (".$location.")</a></td><td width='10%'>".$cipHours." hrs</td><td width='30%'>(Venue Form? ".$venueFormFlag.", Log Book? ".$logBookFlag.")</td></tr></table></li>";
			}
		} 
		$studentList .= "<li><a href='studentYearProvider.php?yearstudentId=".$yearstudentId."&function=add'>Add New Venue</a></li>";
		$studentList .=  "</ol></td>";

		$studentList .=  "</tr>";
	} 
	$studentList .=  "</table>";
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
