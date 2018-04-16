<?php
require_once('dbconnect.php');


$stmt = $con->prepare("UPDATE users SET status = 'offline' WHERE username = :userLogin");
$stmt->bindParam(':userLogin', $_REQUEST['currentUser']);
$stmt->execute();