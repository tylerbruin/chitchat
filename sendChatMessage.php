<?php

require_once('dbconnect.php');


$stmt = $con->prepare("INSERT INTO `messages` ( `content`, `username`) VALUES (:content, :username)");
$stmt->bindParam(':content', $_REQUEST['message']);
$stmt->bindParam(':username', $_REQUEST['currentuser']);
$stmt->execute();

?>

	