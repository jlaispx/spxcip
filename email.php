<?php

$host = "smtp.gmail.com";
$port = "465";
$auth_username = "jlaispx@gmail.com";
$auth_password = "K3ntlyn$$";
ini_set("SMTP",$host);
ini_set("smtp_port",$port);
ini_set("auth_username",$auth_username);
ini_set("auth_password",$auth_password);

$to = "josephhylai@gmail.com";
$subject = "HTML email";

$message = "
<html>
<head>
<title>HTML email</title>
</head>
<body>
<p>This email contains HTML Tags!</p>
<table>
<tr>
<th>Firstname</th>
<th>Lastname</th>
</tr>
<tr>
<td>John</td>
<td>Doe</td>
</tr>
</table>
</body>
</html>
";

// Always set content-type when sending HTML email
$headers = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

// More headers
$headers .= 'From: <webmaster@example.com>' . "\r\n";
$headers .= 'Cc: myboss@example.com' . "\r\n";

mail($to,$subject,$message,$headers);
?>