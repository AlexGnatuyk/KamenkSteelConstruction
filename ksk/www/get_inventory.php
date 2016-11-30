<?php

include 'conn.php';
     
    $id = mysql_real_escape_string($_REQUEST['id']);
    $rs = mysql_query("select id,description from inventory
where units_id='$id'");
$items = array();
    while($row = mysql_fetch_object($rs)){
        array_push($items, $row);
    }
    echo json_encode($items);
?>