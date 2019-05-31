<?php
FUNCTION esc($string) {
	return str_replace("'","&rsquo;",$string);
}

require 'DBUtils.php';
$conn = getConn();

define('CSV_PATH','C:/Users/jlai/Documents/websites/spxcip/');
$csv_file = CSV_PATH."studentImport.csv"; // Name of your CSV file
$csvfile = fopen($csv_file, 'r');
$theData = fgets($csvfile);
$i = 0;
//$size = filesize($csvfile);

while (!feof($csvfile))
{
	$csv_data[] = fgets($csvfile);
	$csv_array = explode(",", $csv_data[$i]);
	$insert_csv = array();
	$insert_csv['userId'] 	= esc($csv_array[0]);
	$insert_csv['studentFirstName'] = esc($csv_array[1]);
	$insert_csv['studentPreferredName'] = esc($csv_array[2]);
	$insert_csv['studentLastName'] = esc($csv_array[3]);
	$insert_csv['homeroom'] = esc($csv_array[4]);
	if (isset($insert_csv['userId'])) {
		$sql="INSERT INTO studentImport (userId, studentFirstName,studentPreferredName, studentLastName,  homeroom) VALUES ('".$insert_csv['userId']."','".$insert_csv['studentFirstName']."','".esc($insert_csv['studentPreferredName'])."','".$insert_csv['studentLastName']."','".$insert_csv['homeroom']."')";
		echo('<p>'.$sql.'</p>');
		$result = mysqli_query($conn,$sql) or die(mysqli_error($conn)) ;  
		$i++;
	}
}
fclose($csvfile);
echo($i." records inserted today");
mysqli_close($conn);
	


?>