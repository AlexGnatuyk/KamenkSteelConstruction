<?php

$objectId = $_REQUEST['object'];
$unitId = $_REQUEST['unit'];
$text = $_REQUEST['text'];

include 'conn.php';

mysql_query("SET AUTOCOMMIT=0");
mysql_query("START TRANSACTION");

$sql = "insert into task (text) values ('$text')";
$result = @mysql_query($sql);

$where = "text = '$text'";
$rs = @mysql_query("select id from task where " .$where);

if($idTask= mysql_fetch_object($rs)){
$row=$idTask->id;
}

$sql = "insert into units_has_task (units_id,task_id,objects_id) values ('$unitId','$row','$objectId')";

$result2 = @mysql_query($sql);


if ($result and $result2){
    mysql_query("COMMIT");
	echo json_encode(array('success'=>true));
} else {
    mysql_query("ROLLBACK");
	echo json_encode(array('msg'=>'Some errors occured.'));
}

?>