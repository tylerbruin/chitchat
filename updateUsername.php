<?php
require_once('dbconnect.php');

$stmt = $con->prepare("SELECT * FROM users WHERE username = :newUserLogin");
$stmt->bindParam(':newUserLogin', $_REQUEST['newUserLogin']);
$stmt->execute();

$no=$stmt->rowCount();

if ($no == 0 ){

    $stmt = $con->prepare("UPDATE users SET username = :newUserLogin WHERE username = :userLogin");
    $stmt->bindParam(':newUserLogin', $_REQUEST['newUserLogin']);
    $stmt->bindParam(':userLogin', $_REQUEST['userLogin']);
    $stmt->execute();

    $stmt1 = $con->prepare("UPDATE messages SET username = :newUserLogin2 WHERE username = :userLogin2");
    $stmt1->bindParam(':newUserLogin2', $_REQUEST['newUserLogin']);
    $stmt1->bindParam(':userLogin2', $_REQUEST['userLogin']);
    $stmt1->execute();

    echo $no;
}
else {
    $x = "Unable to change username - Username already taken.";
    echo json_encode($x);
}
/* 
    $stmt = $con->prepare("UPDATE users u, messages m SET u.username = :newUserLogin, m.username = :newUserLogin2 WHERE u.username = :userLogin AND m.username = :userLogin2");
    $stmt->bindParam(':newUserLogin', $_REQUEST['newUserLogin']);
    $stmt->bindParam(':newUserLogin2', $_REQUEST['newUserLogin']);
    $stmt->bindParam(':userLogin', $_REQUEST['userLogin']);
    $stmt->bindParam(':userLogin2', $_REQUEST['userLogin']);
    $stmt->execute();
*/
?>
