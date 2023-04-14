<?php 
    session_start();
    error_reporting(0);
ini_set('display_errors', 0);
 if(isset($_GET['userID'])){
        $_SESSION['userID'] = htmlspecialchars($_GET['userID']);
    }
    
    
    if(!isset($_SESSION['userID'])){
        echo "Login into your account first. <a href='login.php'>Click here to login now!</a>";
        exit(); 
    }
    $userID = htmlspecialchars($_SESSION['userID']);
?>