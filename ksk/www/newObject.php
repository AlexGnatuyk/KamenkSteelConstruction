<?php
$description = $_REQUEST['description'];

include 'conn.php';
 
$sql = "insert into objects (description) values ('$description')";
$result = @mysql_query($sql);

if ($result){
	echo json_encode(array('success'=>true));
} else {
	echo json_encode(array('msg'=>'Some errors occured.'));
}

?>