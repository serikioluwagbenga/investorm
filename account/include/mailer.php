
<style>
    .btn2 {
        padding: 10px 10px;
    }
    .btn-gray {
        background-color: gray;
        color: white;
    }
    a:active {
        background-color: green;
    }
</style>
<center>
<a href="index.php" class="btn2 btn-gray"> Mailer</a>
<a href="add.php" class="btn2 btn-primary"> New SMTP</a>
<a href="list.php" class="btn2 btn-success"> SMTP List</a>
</center>

<?php
ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);
    require "include/phpmailer/PHPMailerAutoload.php";
    require_once "include/database.php";
    $d = new database;
    $smtps = $d->fastgetwhere("smtp_config", "holdby = ?", "$userID", "moredetails");
    if(isset($_GET['id'])){
        $id = htmlspecialchars($_GET['id']);
        $smtp = $d->multiplegetwhere("smtp_config", "ID = ? and holdby = ?", [$id, $userID], "details");
        if(!is_array($smtp)){
             echo "SMTP not found <a href='index.php'>Take me home!</a>";
            exit();
        }
    }

     
    if(isset($_POST['smtpsetup'])){
        $data = $d->checkmessage(['username', 'password', 'port', 'server', 'from_email']);
        if(is_array($data)){
            $id = htmlspecialchars($_GET['id']);
         $where = "ID ='$id'";
         $update = $d->update("smtp_config", "", $where, $data, "SMTP updated successfully");
        }
     }

     if(isset($_POST['newsmtpsetup'])){
         $_POST['holdby'] = $userID;
        $data = $d->checkmessage(['username', 'password', 'port', 'server', 'from_email', 'holdby']);
        if(is_array($data)){
            if($d->fastgetwhere("smtp_config", "username = ?", $data['username'], "") > 0){
                $d->message("An smtp with this username exit.", "error");
            }else{
                $insert = $d->quick_insert("smtp_config", "", $data, "SMTP Added successfully");
            }
        }
     }

    $error = false;
    if(isset($_POST['sendemail'])){
        if(!isset($_POST['companyname']) || $_POST['companyname'] == ""){
            $d->message("Please enter company name", "error");
            $error = true;
        }

        if(!isset($_POST['email']) || $_POST['email'] == ""){
            $d->message("Please enter email(s)", "error");
            $error = true;
        }

        if(!isset($_POST['subject']) || $_POST['subject'] == ""){
            $d->message("Subject can not be empty", "error");
            $error = true;
        }

        // if(!isset($_POST['link']) || $_POST['link'] == ""){
        //     $d->message("Please enter your link", "error");
        //     $error = true;
        // }

        if(!isset($_POST['message']) || $_POST['message'] == ""){
            $d->message("Please enter your message", "error");
            $error = true;
        }

        if(!isset($_POST['from_email']) || $_POST['from_email'] == ""){
            $d->message("Please enter your From Email", "error");
            $error = true;
        }

        if(!isset($_POST['reply_to']) || $_POST['reply_to'] == ""){
            $d->message("Please enter Email to reply to", "error");
            $error = true;
        }

        if(!isset($_POST['smtpname']) || $_POST['smtpname'] == ""){
            $d->message("Select an SMTP", "error");
            $error = true;
        }else{
            $smtpid = htmlspecialchars($_POST['smtpname']);
        }

        

        if(!$error){
            $companyname = htmlspecialchars($_POST['companyname']);
            $email = htmlspecialchars($_POST['email']);
            $subject = htmlspecialchars($_POST['subject']);
            $message = $_POST['message'];
            $pattern = '/[a-z0-9_\-\+\.]+@[a-z0-9\-]+\.([a-z]{2,4})(?:\.[a-z]{2})?/i';
            preg_match_all($pattern, $email, $matches);
            // $emails =  explode(",", $email);
            $date = date("l Y-m-d");
            $i = 1;
            foreach($matches[0] as $row => $value){
            $send = $d->smtpmailer($smtpid, $_POST['reply_to'], $_POST['from_email'], $value, $companyname, $subject, $message);
            if($send){
                $d->message("$i - Email sent to $value", "success");
            }else{
                if($send){
                $d->message("$i - Email sent to $value", "success");
                }
              $d->message("$i - Error sending message to $value", "error");  
            }
            $i++;
            }
        }
    }


    
?>