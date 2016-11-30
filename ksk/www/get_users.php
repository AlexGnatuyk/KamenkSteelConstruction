<?php
	$page = isset($_POST['page']) ? intval($_POST['page']) : 1;
	$rows = isset($_POST['rows']) ? intval($_POST['rows']) : 10;
	$offset = ($page-1)*$rows;
	$result = array();
    
    $firstnameid = isset($_POST['first_nameid']) ? mysql_real_escape_string($_POST['first_nameid']) : '';  
$productid = isset($_POST['last_nameid']) ? mysql_real_escape_string($_POST['last_nameid']) : '';  
  

	include 'conn.php';
	
    $where = "first_name like '$firstnameid%' and last_name like '$lastnameid%'";  
	$rs = mysql_query("select count(*) from staff,position, staff_has_position,units_has_staff,units 
where  staff.id=staff_has_position.Staff_id 
and staff_has_position.position_id=position.id 
and staff.id=units_has_staff.Staff_id
and units_has_staff.units_id=units.id and ".$where);
	$row = mysql_fetch_row($rs);
	$result["total"] = $row[0];
	$rs = mysql_query("select staff.id,first_name, last_name,birthday,pasportNum,position.position_name, units.units_name from staff,position, staff_has_position,units_has_staff,units
where  staff.id=staff_has_position.Staff_id 
and staff_has_position.position_id=position.id 
and staff.id=units_has_staff.Staff_id
and units_has_staff.units_id=units.id and ".$where." limit $offset,$rows");
	
	$items = array();
	while($row = mysql_fetch_object($rs)){
		array_push($items, $row);
	}
	$result["rows"] = $items;
    

	echo json_encode($result);

?>