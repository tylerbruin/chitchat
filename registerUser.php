<?php

require_once('dbconnect.php');

$stmt = $con->prepare("SELECT * FROM users WHERE username = :ruser");
$stmt->bindParam(':ruser', $_REQUEST['ruser']);
$stmt->execute();

$no=$stmt->rowCount();

if ($no == 0 ){

    $stmt = $con->prepare("INSERT INTO `users` (`username`, `password`, `fname`, `lname`, `email`, `status`) VALUES
    (:ruser, :rpass, :rfname, :rlname, :remail, 'offline')");
    
    $stmt->bindParam(':ruser', $_REQUEST['ruser']);
    $stmt->bindParam(':rpass', $_REQUEST['rpass']);
    $stmt->bindParam(':rfname', $_REQUEST['fname']);
    $stmt->bindParam(':rlname', $_REQUEST['lname']);
    $stmt->bindParam(':remail', $_REQUEST['email']);
    $stmt->execute();
    echo $no;

}
else {
    $x = "Invaild Username.";
    echo json_encode($x);
}


?>
