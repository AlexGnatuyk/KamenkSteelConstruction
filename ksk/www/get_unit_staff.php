<?php


    include 'conn.php';
     
    $id = mysql_real_escape_string($_REQUEST['id']);
    $rs = mysql_query("select distinct( staff.first_name), staff.last_name, position_name from units,boss,staff_has_position,position,units_has_staff,staff
where position.id=staff_has_position.position_id
and staff_has_position.staff_id=staff.id
and units_has_staff.staff_id=staff.id
and units_has_staff.units_id='$id'");
    $items = array();
    while($row = mysql_fetch_object($rs)){
        array_push($items, $row);
    }
    echo json_encode($items);

?>