<?php
require_once('dbconnect.php');

$stmt = $con->prepare("SELECT * FROM users WHERE username = :userLogin AND password = :userPass");
$stmt->bindParam(':userLogin', $_REQUEST['userLogin']);
$stmt->bindParam(':userPass', $_REQUEST['userPass']);
$stmt->execute();

$no=$stmt->rowCount(); 


if ($no > 0) {
    $stmt = $con->prepare("UPDATE users SET status = 'online' WHERE username = :userLogin AND password = :userPass");
    $stmt->bindParam(':userLogin', $_REQUEST['userLogin']);
    $stmt->bindParam(':userPass', $_REQUEST['userPass']);
    $stmt->execute();
    echo $no;
} 
else {
    $x = "Wrong Username or Password.";
    echo json_encode($x);
} 

?>


