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
	<title>Teddy Bear's Picnic - Quiz Answers</title>
	<link href="css/teddyBears.css" rel="stylesheet" type="text/css">
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

<h1>Teddy Bear Quiz Answers</h1>

	<?php 
	require 'DBUtils.php';
	$right = "Y";
	$wrong = "N";
	$conn = getConn();	

	//Input :  $param - question to check in $_POST, e.g. "q1"
	//Process: Check if question in $_POST is set
	//         if it is, then return the value from $_POST
	//         otherwise just return "F" rather than an error
	//Output:  $answer - the answer we derived in this function
	
	FUNCTION checkPost($param) {
		IF (isset($_POST[$param])) {  //check if the $_POST exists
			$answer = $_POST[$param]; //retrieve it if it does
		} ELSE {					  //otherwise
			$answer = $GLOBALS['wrong'];				
		}
		RETURN $answer;
	}
	
	// Function: Check Answer
	// Input: 	$qno - question number
	//			$answer - the answer passedin from the webpage
	//			$correct - the correct answer to the quiz question
	// Process: This function checks the answer passed in and displays the correct answer`
	//          and increments the totalscore 
	// Output: 	$totscore - the totalscore passed in and incremented by 1 if correct
	FUNCTION checkAnswer($qno, $answer) {
		IF($answer==$GLOBALS['right']) {
			$ok = TRUE;
			echo("<p>Well done, ".$qno." is correct</p>");
		} ELSE {
			$ok = FALSE;
			$correct=$_POST[$qno."c"];
			echo("<p>Sorry, ".$qno." is incorrect, answer is '".$correct."'</p>");
		}
		RETURN $ok;
	}
	$qno = "q";
	$totalscore = 0;
	$max = 3;
	
	// Loop through from 1 to maximum number of questions, incrementing by 1
	FOR ($x=1;$x<=$max;$x++) {
		$q = $qno.$x;
		$ok = checkAnswer($q, checkPost($q));
		IF ($ok==TRUE) {
			$totalscore +=1;
		}
	}
	
	ECHO("<h3>Total score is ".$totalscore." out of ".$max."</h3>")

	?>
	
	
	
	
	
	
	
	
	
	
</maincontent>
<footer>
Copyright Mr Lai 2018
<span><?php echo $footer;?>
</span>	
</footer>
	</body>
</html>