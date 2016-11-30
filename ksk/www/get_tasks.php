<?php
	
	include 'conn.php';
	
    
	$rs = mysql_query("select count(*) 
from units, task,objects,units_has_task
where units_has_task.units_id=units.id
and units_has_task.Objects_id=objects.id
and units_has_task.task_id=task.id");
	$row = mysql_fetch_row($rs);
    $result["total"] = $row[0];
	$rs = mysql_query("select units_id,units_name,objects_id,task_id,text,description 
from units, task,objects,units_has_task
where units_has_task.units_id=units.id
and units_has_task.Objects_id=objects.id
and units_has_task.task_id=task.id");
	
	$items = array();
	while($row = mysql_fetch_object($rs)){
		array_push($items, $row);
	}
	$result["rows"] = $items;
    

	echo json_encode($result);

?>