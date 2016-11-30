<?php
$date = $_REQUEST['paymentDate'];
$position_name = $_REQUEST['position'];
$id = $_REQUEST['id'];

include 'conn.php';
//echo json_encode(array('msg'=>$position_name));

mysql_query("SET AUTOCOMMIT=0");
mysql_query("START TRANSACTION");

$sql="select salary.id from position, position_has_salary,salary
where position.id= position_has_salary.position_id
and position_has_salary.salary_id=salary.id
and position.position_name='$position_name'";
$rs= @mysql_query($sql);

if($idSalary=mysql_fetch_object($rs)){
$row=$idSalary->id;
}

$sql="insert into payment (salary_id,date,staff_id) values 
('$row','$date','$id')";
$result=@mysql_query($sql);

if ($result){
     mysql_query("COMMIT");
	echo json_encode(array('success'=>true));
} else {
    mysql_query("ROLLBACK");
	echo json_encode(array('msg'=>'Some errors occured.'));
}

?>