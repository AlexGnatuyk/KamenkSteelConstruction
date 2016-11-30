<?php

$conn = mysql_pconnect('127.0.0.1','root','');
if (!$conn) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db('ksk', $conn);
mysql_query("set character_set_client ='utf8'"); 
mysql_query("set character_set_results ='utf8'"); 
mysql_query("set collation_connection ='utf8_general_ci'");

?>