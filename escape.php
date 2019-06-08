<?php 
FUNCTION esc($string) {
	$string = htmlentities($string);
	$string = str_replace("\\","&#92;",$string);
	$string = str_replace("'","&rsquo;",$string);
	$string = str_replace('&','&amp;',$string);
	$string = str_replace('"','&quot;',$string);
	return ($string);
}
FUNCTION unesc($string) {
	return html_entity_decode($string);
}
?>