<?php

   
   try{

    $con = new PDO('mysql:host=localhost;dbname=chitchat','root','root');
    } catch (PDOException $e) {
        echo "Database connection error " . $e->getMessage();
    }

?>