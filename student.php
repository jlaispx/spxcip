<?php
require("sessionCheck.php");
require('escape.php');

$userId = $_SESSION['userId'];
$yearId = $_SESSION['yearId'];
$year = $_SESSION['year'];
$firstName = $_SESSION["firstName"];
$lastName = $_SESSION["lastName"];
$homeroomId = $_SESSION['homeroomId'];
$homeroom = $_SESSION['homeroom'];	
?>
<!DOCTYPE html>
<html>
<head>
	<title>St Pius X CIP - Manage Student</title>
	<link href="css/spxcip.css" rel="stylesheet" type="text/css">
	<?php require('favicon.php'); ?>
</head>
<body>
<header class="page-header">
<h1>St Pius X CIP Hours</h1>
</header>
<?php require("nav.php"); ?>
<maincontent>

<h1>Manage Student</h1>
<div>
<?php

FUNCTION editStudent($yearstudentId) {
	require 'DBUtils.php';
	$conn = getConn();
	// Get Student via the YearStudent
	
	$sql = 'SELECT s.studentId, s.studentFirstName, s.studentPreferredName, s.studentLastName, s.userId FROM yearstudents as ys, student as s WHERE yearstudentId='.$yearstudentId.' AND ys.studentid = s.studentid';
			
	//echo $sql;	
	$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
	if (mysqli_num_rows($result)==1) {
		// Get the results into venue fields
		echo "<h2>Edit Student</h2>";
		echo "<table class='tableText'>";
		echo "<form id='student' name='student' action='student.php?function=save' method='post'>";
		while($studRow = mysqli_fetch_assoc($result)) {
			
			$studentId 			= $studRow["studentId"];
			$_SESSION["studentId"] = $studentId;
			$studentFirstName 	= $studRow["studentFirstName"];
			$studentPreferredName 	= $studRow["studentPreferredName"];
			$studentLastName 	= $studRow["studentLastName"];
			$studentUserId		= $studRow["userId"];
			echo "<tr>";
			echo "<td>Student Id:</td><td>$studentId</td>";
			echo "</tr><tr>";
			echo "<td>Student First Name:</td><td><input type='text' name='studentFirstName' value='$studentFirstName'></td>";
			echo "<td>Student Preferred Name:</td><td><input type='text' name='studentPreferredName' value='$studentPreferredName'></td>";
			echo "<td>Student Last Name:</td><td><input type='text' name='studentLastName' value='$studentLastName'></td>";
			echo "</tr><tr>";
			echo "<td>Student User Id:</td><td><input type='text' name='studentUserId' value='$studentUserId'></td>";
			echo "</tr><tr>";
			echo "<input type='hidden' name='studentId' value='$studentId'>";
			echo "<input type='hidden' name='yearstudentId' value='$yearstudentId'>";
		} 
		echo "<td><button type='submit' name='update'>Update Student</button></td>";
		echo "<td><button type='submit' name='delete'>Delete student</button></td>";
		echo "</tr>";
		echo "</form>";
		echo "</table>";
	
	} else {
		$error = "<p>Student Not Found!</p>";
	}
	mysqli_close($conn); 
}
	
FUNCTION addStudent() {
	echo "<h2>Add New Student</h2>";
	echo "<table class='tableText'>";
	echo "<form id='student' name='student' action='student.php?function=save' method='post'>";
	echo "<tr>";
	echo "<td>Student First Name: </td><td><input type='text' name='studentFirstName'></td>";
	echo "<td>Student Preferred Name: </td><td><input type='text' name='studentPreferredName'></td>";
	echo "<td>Student Last Name: </td><td><input type='text' name='studentLastName'></td>";
	echo "</tr>";
	echo "<tr>";
	echo "<td>Student User Id: </td><td><input type='text' name='studentUserId'></td>";
	echo "</tr>";
	echo "<tr>";
	echo "<input type='hidden' name='yearstudentId' value=''></td>";
	echo "<td><button type='submit' name='submit'>Add Student</button></td>";
	echo "</tr>";
	echo "</form>";
	echo "</table>";
}
FUNCTION saveNewStudent($conn, $studentId, $studentFirstName, $studentPreferredName, $studentLastName, $studentUserId,$yearstudentId) {
	$success = False;
	$homeroomId = $_SESSION["homeroomId"];
	$yearId = $_SESSION["yearId"];

	$sql = "INSERT INTO student (studentFirstName, studentPreferredName, studentLastName, userId) VALUES ('$studentFirstName', '$studentPreferredName', '$studentLastName', '$studentUserId')";

	if (mysqli_query($conn,$sql) or die(mysqli_error($conn))) { 
		$studentId = mysqli_insert_id($conn);
		$_SESSION['studentId']=$studentId;

		//Insert Student Year and Homeroom 
		$sql = 'INSERT INTO yearstudents (studentId, homeroomId, yearId) VALUES ("'.$studentId.'", "'.$homeroomId.'", "'.$yearId.'")';

		if (mysqli_query($conn,$sql) or die(mysqli_error($conn))) { 
			$yearstudentId = mysqli_insert_id($conn);
			$_SESSION['yearstudentId']=$yearstudentId;
			$success = True;
		} 
	}
	return $success;
	
}
	
FUNCTION saveStudent($yearstudentId, $studentId, $studentFirstName, $studentPreferredName, $studentLastName, $studentUserId) {
	require 'DBUtils.php';
	$conn = getConn();
	//echo("Saving....");
	$success = False;
	
	if ($studentId=="") {
		
		//INSERT
		if (saveNewStudent($conn,$studentId, $studentFirstName, $studentPreferredName, $studentLastName, $studentUserId,$yearstudentId)) {
			$error = "<p>Record Saved</p>";
		} else {
			$error = "<p>Student Not Updated!</p>";
		}
	} else { 
		if (isset($_POST["update"])) {
		//Update
			$sql = "UPDATE student SET studentFirstName='$studentFirstName', studentPreferredName='$studentPreferredName', studentLastName='$studentLastName',
			userId='$studentUserId' WHERE studentId=$studentId";
		// SAVE STUDENT
		//echo $sql;	
			if (mysqli_query($conn,$sql) or die(mysqli_error($conn))) {
				$error = "<p>Record Saved</p>";
			} else {
				$error = "<p>Student Not Updated!</p>";
			}
		} else if (isset($_POST["delete"])) {
			//Update
			$sql = 'DELETE FROM yearstudents WHERE yearstudentId='.$yearstudentId.'; DELETE FROM student WHERE studentId='.$studentId;
			// DElete STUDENT and YearStudent
			//echo $sql;	
			if (mysqli_multi_query($conn,$sql) or die(mysqli_error($conn))) {
				$error = "<p>Record Saved</p>";
			} else {
				$error = "<p>Student Not Updated!</p>";
			}
		}
	}
	echo "<script>alert('Finished Maintain Student');</script>";
	header("Location: students.php");	
}


//============================================================================
//echo "here";
echo "<h2>$year Teacher: $firstName $lastName - Homeroom: $homeroom</h2>";$error="Please Update Student";  //Default message
IF (isset($_GET["yearstudentId"])) { 
	$yearstudentId = $_GET["yearstudentId"];
	$_SESSION["yearstudentId"]=$yearstudentId;
} else {
	$yearstudentId=NULL;
}
if (isset($_GET["function"])) {
	$function=$_GET["function"];
} else {
	$function="add";
}
//echo "<p>Function:".$function.", ";
//echo "Year Student Id:".$yearstudentId."</p>";

if ($function=="edit") {
	editStudent($yearstudentId);
	
} else if ($function=="save") {
	$studentId = $_POST["studentId"];
	$yearstudentId=$_POST["yearstudentId"];
	$studentFirstName=$_POST["studentFirstName"];
	$studentPreferredName=$_POST["studentPreferredName"];
	$studentLastName=$_POST["studentLastName"];
	$studentUserId=$_POST["studentUserId"];
	saveStudent($yearstudentId,$studentId, $studentFirstName,$studentPreferredName,$studentLastName,$studentUserId);
} else {
	$error="Please Add Student";
	addStudent();
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
