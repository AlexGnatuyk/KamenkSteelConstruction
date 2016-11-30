<?php
$id = intval($_REQUEST['id']);

include 'conn.php';


$rs = mysql_query("select salary.count, payment.date  from payment,salary, staff
where staff.id=payment.Staff_id
and payment.Salary_id=salary.id
and payment.Staff_id='$id'");

$items= array();

    while($row = mysql_fetch_object($rs)){
        array_push($items, $row);
    }
    echo json_encode($items);

?>