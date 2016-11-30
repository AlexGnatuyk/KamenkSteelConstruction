<?php

$firstname = $_REQUEST['first_name'];
$lastname = $_REQUEST['last_name'];
$birthday = $_REQUEST['birthday'];
$pasportNum = $_REQUEST['pasportNum'];
$positionId = $_REQUEST['state'];
$positionUnits=$_REQUEST['units'];


include 'conn.php';



mysql_query("SET AUTOCOMMIT=0");
mysql_query("START TRANSACTION");

$sql = "insert into staff (first_name, last_name, birthday,pasportnum) value ('$firstname','$lastname','$birthday','$pasportNum')";
$result = @mysql_query($sql);
if(!$result){
mysql_query("ROLLBACK");
    return;
}

$where = "first_name = '$firstname' and last_name = '$lastname'";
$rs = mysql_query("select id from staff where ".$where);
if(!$rs){
mysql_query("ROLLBACK");
    return;
}
if($idstaff = mysql_fetch_object($rs)){
$row=$idstaff->id;
}

$sql = "insert into staff_has_position(Staff_id,Position_id) values ('$row','$positionId')";
$result2= @mysql_query($sql);
if(!$result2){
mysql_query("ROLLBACK");
    return;
}

$sql= "insert into units_has_staff (staff_id, units_id) values
($row,$positionUnits)";
$result3= @mysql_query($sql);
if(!$result3){
mysql_query("ROLLBACK");
    return;
}
if ($result and $result2 and $result3 and $rs){
    mysql_query("COMMIT");
	echo json_encode(array('success'=>true));
} else {
    mysql_query("ROLLBACK");
	echo json_encode(array('msg'=>'Some errors occured.'));
}
?>