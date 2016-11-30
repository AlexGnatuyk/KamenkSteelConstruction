<?php
    include 'conn.php';
    $rs=mysql_query("select id, position_name from position");
    $items = array();
    while($row = mysql_fetch_object($rs)){
    array_push($items, $row);
    }
    
    echo json_encode($items);

?>