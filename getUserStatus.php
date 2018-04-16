<?php
require_once('dbconnect.php');


$result = $con->prepare("SELECT username FROM `users` WHERE status = 'online'");
$result->execute();
$data['online'] = $result->fetchAll(PDO::FETCH_ASSOC);

$result = $con->prepare("SELECT username FROM `users` WHERE status = 'offline'");
$result->execute();
$data['offline'] = $result->fetchAll(PDO::FETCH_ASSOC); 

echo json_encode($data);
?>