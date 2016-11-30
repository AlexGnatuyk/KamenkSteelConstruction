<?php
    include 'conn.php';
    $rs=mysql_query("select id, description from objects");
    $items = array();
    while($row = mysql_fetch_object($rs)){
    array_push($items, $row);
    }
    
    echo json_encode($items);

?>