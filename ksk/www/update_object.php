<?php

$id = intval($_REQUEST['id']);
$description = $_REQUEST['description'];

include 'conn.php';

$sql="update objects set description='$description' where id='$id'";
$result=@mysql_query($sql);

if ($result){
	echo json_encode(array('success'=>true));
} else {
	echo json_encode(array('msg' => 'Some errors occured.'));
}
?>