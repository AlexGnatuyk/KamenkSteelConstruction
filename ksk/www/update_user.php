<?php

$id = intval($_REQUEST['id']);
$firstname = $_REQUEST['first_name'];
$lastname = $_REQUEST['last_name'];
$birthday = $_REQUEST['birthday'];
$pasportNum = $_REQUEST['pasportNum'];
$positionId = $_REQUEST['state'];
$positionUnits = $_REQUEST['units'];


include 'conn.php';

mysql_query("SET AUTOCOMMIT=0");
mysql_query("START TRANSACTION");

$sql = "update Staff set first_name='$firstname',last_name='$lastname',birthday='$birthday',pasportNum='$pasportNum' where id='$id'";
$result = @mysql_query($sql);

$sql = "update staff_has_position set position_id='$positionId' where staff_id='$id'";
$result2=@mysql_query($sql);

$sql= "update units_has_staff set units_id='$positionUnits' where staff_id='$id'";
$result3 = @mysql_query($sql);
if ($result and $result2 and $result3){
    mysql_query("COMMIT");
	echo json_encode(array('success'=>true));
} else {
     mysql_query("ROLLBACK");
	echo json_encode(array('msg'=>'Some errors occured.'));
}

?>