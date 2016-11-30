<?php

$id = intval($_REQUEST['id']);
$text = $_REQUEST['text'];

include 'conn.php';

$sql="update task set text='$text' where id='$id'";
$result=@mysql_query($sql);

if ($result){
	echo json_encode(array('success'=>true));
} else {
	echo json_encode(array('msg' => 'Some errors occured.'));
}
?>