<?php

if	($_SERVER["REQUEST_METHOD"]=="POST") {
	
	$provId = $_POST["provId"];
	$mark = $_POST["mark"];
	$num = count($provId);
	for ($x=0;$x<$num;$x++) {
		echo('<p>'.$provId[$x].'-'.$mark[$x].'</p>');
	}
}



?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
	<form action="" method="post" name="inform">
		<input type="hidden" name="provId[]" value="123">
		<input type="text" name="mark[]" value="99">
		<input type="hidden" name="provId[]" value="234">
		<input type="text" name="mark[]" value="40">
		<input type="hidden" name="provId[]" value="456">
		<input type="text" name="mark[]" value="50">
		<input type="submit">
	</form>
</body>
</html>