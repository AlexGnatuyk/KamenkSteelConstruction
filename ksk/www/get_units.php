<?php
    include 'conn.php';
    $rs=mysql_query("select units.id, units_name, last_name from units,boss,staff
where units.boss_id=boss.id
and boss.Staff_id = staff.id");
    $items = array();
    while($row = mysql_fetch_object($rs)){
    array_push($items, $row);
    }
    
    echo json_encode($items);

?>