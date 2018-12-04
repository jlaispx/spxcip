<?php
session_start();
if (!isset($_SESSION['username'])) {
	echo "<script>alert('Login First!');windows.location.href='index.html';</script>";
	$footer = "Not logged In";
} else {
	$username = $_SESSION["username"];
	$isAdmin = $_SESSION["isAdmin"];
	$footer = "<div><div>Current User: $username</div><div>Is Admin: $isAdmin</div></div>";
}
?>
<!DOCTYPE html>
<html>
<head>
<title>St Pius X CIP - Manage Page</title>
<link href="css/spxcss.css" rel="stylesheet" type="text/css">
</head>
<body>
<header class="page-header">
<h1>Teddy Bear's Picnic</h1>
</header>
<nav>
	<ul>
		<li><a href="index.html">Home</a></li>
		<li><a href="quiz.php">Quiz</a></li>
	</ul>
</nav>
<maincontent>

<h1>Quiz</h1>
<div>
<?php
FUNCTION esc($string) {
	return str_replace("'","&rsquo;",$string);
}

$error="Please Answer Quiz";  //Default message
require 'DBUtils.php';
$conn = getConn();

// GET QUIZ TOPICS THAT ARE ACTIVE FIRST
$sql = 'SELECT t.quizTopicId, t.quizTopic FROM quiztopics AS t WHERE t.quizActive = "Y"';
		
echo $sql;	
$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
if (mysqli_num_rows($result)>0) {
			// Get the results into $topic 
	echo "<form id='quiz' name='quiz' action='quizAnswers.php' method='post'>";
	while($topicRow = mysqli_fetch_assoc($result)) {
		$quizTopicId = $topicRow["quizTopicId"];
		$quizTopic = $topicRow["quizTopic"];
		echo "<h2>Topic: $quizTopic</h2>";
		
		$sql2 = "SELECT q.quizQuestionsId, q.quizQuestion FROM quizquestions AS q WHERE q.quizTopicId = $quizTopicId ORDER BY q.quizQuestionsId";
		echo $sql2;
		$qresult = mysqli_query($conn,$sql2) or die(mysqli_error($conn)) ;  
		if (mysqli_num_rows($qresult)>0) {		
			echo "<ol>";
			$qno=0;
			while($questionrow = mysqli_fetch_assoc($qresult)) {
				$qno++;
				$quizQuestionsId = $questionrow["quizQuestionsId"];
				$quizQuestion = esc($questionrow["quizQuestion"]);
				echo "<h3><li>$quizQuestion</li></h3>";
				
				$sql3 = "SELECT a.quizAnswer, a.quizAnswerCorrectFlag FROM quizanswers AS a WHERE a.quizQuestionsId=$quizQuestionsId ORDER BY a.quizAnswersId";
				echo $sql3;
				$aresult = mysqli_query($conn,$sql3) or die(mysqli_error($conn)) ;  
				if (mysqli_num_rows($aresult)>0) {		

					$ano = 0;
					echo "<ol type='A'>";
					while($ansrow = mysqli_fetch_assoc($aresult)) {
						$ano++;
						$quizAnswer = esc($ansrow["quizAnswer"]);
						$quizAnswerCorrectFlag = $ansrow["quizAnswerCorrectFlag"];
						echo "<li><input type='radio' name='q$qno' id='q$qno$ano' value='$quizAnswerCorrectFlag'>$quizAnswer</input>";
						if ($quizAnswerCorrectFlag=="Y") {
							echo "<input type='hidden' name='q$qno"."c' value='Q:`$quizQuestion".", A:"."$quizAnswer'/>";
						}
						echo "</li>";
					}
					echo "</ol>";
				}
			} 
			echo "</ol>";
		}
		echo "<button type='submit' name='submit'>Submit Answers</button>";
		echo "</form>";
	}
	mysqli_close($conn); 
} else {
	$error = "<p>No Quiz Available!</p>";
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
