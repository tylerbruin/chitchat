<?php

   
   try{
   	
   	$con = new PDO('mysql:host=mysql.cms.waikato.ac.nz;dbname=tdb11','tdb11','my10959341sql');
   	} catch (PDOException $e) {
   		echo "Database connection error " . $e->getMessage();
   	} 
   
   /* $con = new PDO('mysql:host=localhost;dbname=chitchat','root','root');
    } catch (PDOException $e) {
        echo "Database connection error " . $e->getMessage();
    }
    
    */
?>