<!DOCTYPE html>
<html>
	<head><?php
require("sessionCheck.php");
require('escape.php');

require 'DBUtils.php';
$conn = getConn();

$userId 	= $_SESSION['userId'];
$yearId 	= $_SESSION['yearId'];
$year 		= $_SESSION['year'];
$homeroomId = $_SESSION['homeroomId'];
$homeroom 	= $_SESSION['homeroom'];

$sql = 'SELECT s.studentId, s.studentFirstName, s.studentPreferredName, s.studentLastName, s.userId, ys.yearstudentId FROM yearstudents AS ys, student AS s, homeroom AS h, cip_year AS yr, teacherhomeroom AS th WHERE ys.studentid = s.studentid AND ys.homeroomid = h.homeroomId AND ys.yearid = yr.yearId AND ys.homeroomid = th.homeroomId AND ys.yearid = th.yearId AND th.userId = "'.$userId.'" AND yr.year = '.$year.' ORDER BY StudentLastName, StudentFirstName';
		
$studentComments = "<table>";
$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
if (mysqli_num_rows($result)>0) {
	while($studRow = mysqli_fetch_assoc($result)) {
		$studentId 				= $studRow["studentId"];
		$studentFirstName 		= $studRow["studentFirstName"];
		$studentPreferredName 	= $studRow["studentPreferredName"];
		$studentLastName 		= $studRow["studentLastName"];
		$studentUserId 			= $studRow["userId"];
		$yearstudentId 			= $studRow['yearstudentId'];
		
		$adjsql = "SELECT pastoralAdjective FROM pastoralAdjectives";
		$adjresult = mysqli_query($conn,$adjsql) or die(mysqli_error($conn)) ;
		
		$adjectiveList = array();
		while($adjRow = mysqli_fetch_assoc($adjresult)) {
			array_push($adjectiveList,$adjRow["pastoralAdjective"]); 
		}
		
		//foreach($adjectiveList as $adj) {echo $adj;}
		$adjKey = array_rand($adjectiveList, 2);
		$i1 = $adjectiveList[$adjKey[0]];
		$i2 = $adjectiveList[$adjKey[1]];
		//echo("$i1,\n$i2");
		
		//====== ACHIEVEMENTS =================//
		$awardsSql = "SELECT at.achievementTypeName, a.achievementDescription FROM achievements as a, achievementType as at WHERE a.yearStudentId =".$yearstudentId." AND a.achievementTypeId = at.achievementTypeId AND a.achievementTypeId = 2 ORDER BY achievementTypeName";
		$awardsresult = mysqli_query($conn,$awardsSql) or die(mysqli_error($conn)) ;
		
		$awards = "";
		$num = mysqli_num_rows($awardsresult);
		if ($num == 1) {
			$awardsRow = mysqli_fetch_assoc($awardsresult);
			$awards .= $awardsRow['achievementDescription']."";
		} else {
			while($awardsRow = mysqli_fetch_assoc($awardsresult)) {
				$num--;
				if ($num > 0) { 
					$awards .= $awardsRow['achievementDescription'].", ";
				} else {
					$awards .= "and ".$awardsRow['achievementDescription']."";
				}
			}
			
		}
		
		$cocSql = "SELECT at.achievementTypeName, a.achievementDescription FROM achievements as a, achievementType as at WHERE a.yearStudentId ='".$yearstudentId."' AND a.achievementTypeId = at.achievementTypeId AND a.achievementTypeId = 1 ORDER BY achievementTypeName";
		$cocresult = mysqli_query($conn,$cocSql) or die(mysqli_error($conn)) ;
		
		$cocs = "";
		$num = mysqli_num_rows($cocresult);
		if ($num == 1) {
			$cocRow = mysqli_fetch_assoc($cocresult);
			$cocs .= $cocRow['achievementDescription']."";
		} else {
			while($cocRow = mysqli_fetch_assoc($cocresult)) {
				$num--;
				if ($num >0) { 
					$cocs .= $cocRow['achievementDescription'].", ";
				} else {
					$cocs .= "and ".$cocRow['achievementDescription'];
				}
			}
		}
		
		$studentComments .= "<tr><p>$studentFirstName's $i1 and $i2 nature is valued by his peers in our Homeroom. ";
		$studentComments .= "He should be congratulated for his involvement is the school's co-curricular programme ";
		
		if (strlen($cocs)>0) {
			$studentComments .= "as part of $cocs";
		}
//		if (strlen($awards)>0) {
//			$studentComments .= ", as well as receiving $awards at the end of last year";
//		} 
		$studentComments .= ". ";
		
		$provsql = "SELECT syp.studentYearProviderId, syp.providerId, p.providerName, p.location, syp.cipHours,syp.venueFormFlag, syp.logBookFlag, syp.comments FROM studentyearprovider AS syp, cip_provider AS p, yearstudents AS ys, student AS s WHERE syp.providerId = p.providerId AND syp.yearstudentId = ys.yearstudentId AND ys.studentid = s.studentid AND syp.yearStudentId = ".$yearstudentId;

		$studentYearProviderId = -1;
		
		$provresult = mysqli_query($conn,$provsql) or die(mysqli_error($conn)) ;
		//echo (mysqli_num_rows($result));
		$numRows = mysqli_num_rows($provresult);
		
		if ($numRows>0) {
			$studentComments .= "$studentFirstName should also be commended for his participation in the Community Involvement Programme (CIP), including his involvement with ";
			$totalCipHrs = 0;
			$present = 0;
			$moreThanOne = 0;
			while($provRow = mysqli_fetch_assoc($provresult)) {
				++$present;
				$studentYearProviderId = $provRow["studentYearProviderId"];
				$providerId = $provRow["providerId"];
				$providerName = $provRow["providerName"];
				$location = $provRow["location"];
				$cipHours = $provRow["cipHours"];
				$totalCipHrs += $cipHours;
				$venueFormFlag = $provRow["venueFormFlag"]==1?'Y' : 'N';
				$logBookFlag = $provRow["logBookFlag"]==1?'Y':'N';
				$comments = unesc($provRow["comments"]);
				echo("($yearstudentId) $studentFirstName $numRows - $providerName, $present \n");
				if ($numRows == 1) {
					$studentComments .= "$providerName in $location. ";
				} else if (($present >= $numRows) and ($moreThanOne != 0)) {
					$studentComments .= "and $providerName in $location. ";
				} else {
					$moreThanOne = 1;
					$studentComments .= "$providerName in $location, ";
				}
			}
		} else {
			$studentComments .= "$studentFirstName in encouraged to begin participating in the Community Involvement Programme (CIP). ";
		}
		$studentComments .= "</p></tr>";
	}
	$studentComments .= "</table>";
}
mysqli_close($conn);
?>

	</head>
	<body>
		<?php echo $studentComments; ?>
	</body>