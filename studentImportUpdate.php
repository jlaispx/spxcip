<?php
require 'DBUtils.php';
$conn = getConn();

$hrsql = "SELECT homeroomId, homeroom FROM homeroom ORDER BY homeroomId";

$hrresult = mysqli_query($conn,$hrsql) or die(mysqli_error($conn)) ;
if (mysqli_num_rows($hrresult)>0) {
	while ($hrrow = mysqli_fetch_assoc($hrresult)) {
		$hrhomeroomId = $hrrow["homeroomId"];
		$hrhomeroom = $hrrow["homeroom"];
		$year=1;
		echo("Processing homeroom $hrhomeroom");
		//For each homeroom get all the students to be imported
		$simpsql = "SELECT userId, StudentFirstName, StudentPreferredName, StudentLastName, homeroom FROM studentimport WHERE homeroom = '$hrhomeroom' ORDER BY StudentLastName, StudentFirstName";
		echo ($simpsql);
		$siresult = mysqli_query($conn,$simpsql) or die(mysqli_error($conn)) ;
		if (mysqli_num_rows($siresult)>0) {
			while($studRow = mysqli_fetch_assoc($siresult)) {
				$studentUserId = $studRow["userId"];
				$studentFirstName = $studRow["StudentFirstName"];
				$studentPreferredName = $studRow["StudentPreferredName"];
				$studentLastName = $studRow["StudentLastName"];
				$studentHomeroom = $studRow["homeroom"];

				$stexistsql = "SELECT studentId FROM student WHERE UserId = '$studentUserId'";
				$stexistresult = mysqli_query($conn,$stexistsql) or die(mysqli_error($conn)) ;
				if (mysqli_num_rows($stexistresult)>0) {
					$studentRow = mysqli_fetch_assoc($stexistresult);
					$studentId = $studentRow["studentId"];

					$stupdsql = "UPDATE student SET studentFirstName = '$studentFirstName', studentLastName = '$studentLastName', $studentPreferredName = '$studentPreferredName' WHERE studentId = $studentId";
					echo("$studentFirstName $studentLastName updated");
				} else {
					$sinssql = "INSERT INTO student (UserId, studentFirstName, studentPreferredName, studentLastName) VALUES ('$studentUserId','$studentFirstName','$studentPreferredName','$studentLastName')";
					if (mysqli_query($conn,$sinssql) or die(mysqli_error($conn))) {						echo("inserted new student: $studentFirstName $studentLastName");

						$studentId = mysqli_insert_id($conn);
						//Insert yearStudent record for this student
						$ysinssql = "INSERT INTO yearstudents (studentId, homeroomid, yearid) VALUES ($studentId, $hrhomeroomId, $year)";
						if (mysqli_query($conn,$ysinssql) or die(mysqli_error($conn))) {
							$yearstudentId = mysqli_insert_id($conn);
							echo("inserted student into homeroom $hrhomeroom");
						}
					}
				} 
			}
		}
	}
}

?>