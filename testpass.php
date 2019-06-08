<?php
$password1="password";
$salt = '$5$rounds=5000$stpiusxcipsystem2019jlai';
echo crypt($password1, $salt)."<br/>";
$options = [
    'cost' => 12,
];
echo password_hash($password1, PASSWORD_BCRYPT, $options);
?>