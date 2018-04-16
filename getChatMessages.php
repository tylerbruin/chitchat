<?php
require_once('dbconnect.php');


$stmt = $con->prepare("SELECT * FROM `messages` WHERE DATE(`datetime`) = :newdate");
$stmt->bindParam(':newdate', $_REQUEST['newdate']);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($data);

/* 
$result = $con->prepare("SELECT * FROM `messages` WHERE DATE(`datetime`) = :newdate");
$result->bindParam(':newdate', $_REQUEST['newdate']);
$result->execute();
$data = $result->fetchAll(PDO::FETCH_ASSOC);
// CURDATE()");
echo json_encode($data);


*/



?>