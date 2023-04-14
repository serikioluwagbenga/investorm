<?php
class database {
    public $db;
    private static $instance;
    private $magic_quotes_active;
    private $real_escape_string_exists;
    public $err = "no";
    public $userID;
    // private constructor
    public function __construct()
    {
        // $this->d = new database;
        $servername = "localhost";
        $username = "therightchoice_user";
		$password = "ssCyjqm2E8-y";
        try {
            $this->db = new PDO("mysql:host=$servername;dbname=therightchoice_prime", $username, $password);
            // set the PDO error mode to exception
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //echo "Connected successfully";
            // I won't echo this message but use it to for checking if you connected to the db
            //incase you don't get an error message
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
        // $this->userID = htmlspecialchars($_SESSION['adminSession']);  
    }


    function checkmessage($arry)
    {
        foreach ($arry as $key) {
            $check = substr($key, -5);
            if ($check == "_null") {
                $key = substr_replace($key, "", -5);
            }
            $key = str_replace(" ", "_", $key);
            if ($check != "_null") {
                if ($_POST["$key"] == "" || !isset($_POST["$key"]) && $key != "referral_code") {
                    $this->err = "yes";
                    database::message("Please enter your $key", "error");
                } else {
                    $set["$key"] = ${$key} = htmlspecialchars($_POST["$key"]);
                }
            } else {
                $set["$key"] = ${$key} = htmlspecialchars($_POST["$key"]);
            }
        }
        if (isset($set['password']) && isset($set['confirm_password'])) {
            if (isset($set['confirm_password'])) {
                $check = database::checkpass($set['password'], $set['confirm_password']);
                if ($check) {
                    return $set;
                } else {
                    $this->err = "yes";
                }
            } else {
                $this->err = "yes";
                database::message("IntErr: We can't confirm your password", "error");
            }
        } elseif ($this->err != "yes") {
            return $set;
        } else {
            return $this->err;
        }
    }

    private function checkpass($password, $cpass)
    {
        // Validate password strength
        $uppercase = preg_match('@[A-Z]@', $password);
        $lowercase = preg_match('@[a-z]@', $password);
        $number    = preg_match('@[0-9]@', $password);
        // $specialChars = preg_match('@[^\w]@', $password);

        if (!$uppercase || !$lowercase || !$number || strlen($password) < 4) {
            database::message("Password should be at least 4 characters in length and should include at least one upper case letter and one number.", "error");
            return false;
        } else {
            if ($password == $cpass) {
                return true;
            } else {
                database::message("Password don't match. Check and try again", "error");
                return false;
            }
        }
    }

    public function delete($where_to_delete, $what_to_delete, $ID, $message = "yes")
    {
        $stmt = $this->db->prepare("delete FROM $what_to_delete WHERE $where_to_delete= ? LIMIT 1"); //using LIMIt fro optimization purpose
        // include_once("include/session.php");
        $stmt->execute([$ID]);
        if ($stmt) {
            if ($message == "no") {
            } else {
                $message = $what_to_delete . 'Deleted';
                Database::message($message, $type = 'success');
            }
            return true;
        } else {
            $message = $what_to_delete . 'not deleted';
            Database::message($message, $type = 'error');
        }
    }

    function fastget($what_to_get, $order_by, $limit)
    {
        try {
            $que = $this->db->prepare("SELECT * FROM $what_to_get ORDER BY $order_by $limit");
            $que->execute();
            $count = $que->rowCount();
            if ($count < 1) {
                return $count;
            } else {
                return $que;
                $que = null;
            }
        } catch (PDOException $e) {
        }
    }

    function fastgetcount($what_to_get, $order_by, $limit)
    {
        try {
            $que = $this->db->prepare("SELECT * FROM $what_to_get ORDER BY $order_by ASC $limit");
            $que->execute();
            return $que->rowCount();
        } catch (PDOException $e) {
        }
    }


    public function fastgetwhere($what_to_get, $where, $what, $status)
    {
        $stmt = $this->db->prepare("SELECT * FROM $what_to_get WHERE $where"); //using LIMIt fro optimization purpose
        $stmt->execute([$what]);
        return database::getmethod($status, $stmt);
    }

    function getmethod($status, $stmt)
    {
        if ($status == 'details') {
            $count = $stmt->rowCount();
            if ($count < 1) {
                return "";
            } else {
                return $stmt->fetch(PDO::FETCH_ASSOC);
            }
        } elseif ($status == 'moredetails') {
            $count = $stmt->rowCount();
            if ($count < 1) {
                // echo "yess";
                return "";
            } else {
                return $stmt;
            }
        } else {
            return $count = $stmt->rowCount();
        }
    }

    public function multiplegetwhere($what, $where, $data, $status)
    {
        $stmt = $this->db->prepare("SELECT * FROM $what WHERE $where"); //using LIMIt fro optimization purpose
        $stmt->execute($data);
        return database::getmethod($status, $stmt);
    }

    public function quick_insert($enter, $column, $data, $message = "0")
    {
        $column2 = "";
        foreach ($data as $key => $value) {
            $sets[] = "?,";
            $column2 .= $column . $key . ", ";
        }
        $set = substr(implode(" ", $sets), 0, -1);
        if ($column == "") {
            $column = mb_substr($column2, 0, -2);
        }
        $stmt = $this->db->prepare("INSERT INTO $enter($column) 
        VALUES ($set)");
        $data = array_values($data);
        $stmt->execute($data);
        if ($stmt) {
            if ($message != "0") {
                Database::message($message, $type = 'success');
            }
            return true;
        } else {
            $message = 'Something Went Wrong please try again';
            Database::message($message, $type = 'error');
        }
    }

    public function update($what, $set, $where, $data, $message = "")
    {
        try {
            // $set = str_replace(",", " = ?", $set).' = ?';
            if ($set == "null" || $set == "") {
                foreach ($data as $key => $value) {
                    $sets[] = "$key = ?,";
                }
                $set = substr(implode(" ", $sets), 0, -1);
            }
            $set;
            $stmt = $this->db->prepare("UPDATE $what SET $set WHERE $where");
            $data = array_values($data);
            $stmt->execute($data);
            if ($stmt) {
                if ($message != "") {
                    Database::message($message, "success");
                }
                return true;
            }
            $stmt = null;
        } catch (PDOException $e) {
            // For handling error
            return false;
            //   Database::message("Something went wrong $e", "error");
        }
    }

    public function message($message, $type)
    {
        if ($type == "error") {
            $type = "danger";
        } elseif ($type == "success") {
            $type = "success";
        }
        $message = str_replace("_", " ", $message);
        //     echo "<div class='bg-$type fade show mb-5' role='bg'>
        //     <!--  <div class='bg-icon'><i class='flaticon-$type'></i></div> -->
        //     <div class='bg-text'>$message</div>
        // </div>";
        if ($type == "success") {
             echo "<div class='message $type' style='color:green!important'>
                <span class='closebtn' onclick=\"this.parentElement.style.display='none';\">&times;</span>
                $message
                </div>";
                        } else {
                            echo "<div class='message $type' style='color:red!important'>
                <span class='closebtn' onclick=\"this.parentElement.style.display='none';\">&times;</span>
                $message
                </div>";
        }
    }

    function sendverifyemail($userID){
        $d = new database;
        $user = $d->fastgetwhere("users", "ID = ?", $userID, "details");
        if(!is_array($user)){
            $d->message("User not found please login and try again", "error");
            return false;
        }

        if($user['email_verify'] == 1){
            $d->message("Seems user account is verified please login into your account", "error");
            return false;
        }
        $token = $user['token'];
        if($user['token'] == "0"){
            $token = $d->randcar(40);
            $d->update("users", "", "ID = '$userID'", ["token"=>$token]);
        }
        $email = $user['email'];
        $sendemail = $d->smtpmailer(1, $user['email'], "Account Email Verification", "Please verify your account with the link provided below <br> <a href='verify.php?token=$token&e=$email'>verify Account</a>");
        if($sendemail){
            $d->message("Email Sent Successfully", "success");
        }else{
            $d->message("Error sending email please try again later", "error");
        }
    }

    function randcar($no = 20){
        $seed = str_split('abcdefghijklmnopqrstuvwxyz'
                 .'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                 .'0123456789'); // and any other characters
        shuffle($seed); // probably optional since array_is randomized; this may be redundant
        $rand = '';
        foreach (array_rand($seed, $no) as $k) $rand .= $seed[$k];
        return $rand;
    }
      function smtpmailer($smtpid, $to, $subject, $body, $name = "", $message = '')
    {
        $d = new database;
        $smtp = $d->fastgetwhere("smtp_config", "ID = ?", "$smtpid", "details");
        if(!is_array($smtp)){
            $d->message("SMTP selected not found please choose another one or refresh page and try again", "error");
            return false;
        }
        $server = $smtp['server'];
        $username = $smtp['username'];
        $password = $smtp['password'];
        $port = $smtp['port'];
        $smtp_from_email = $smtp['from_email'];

        // echo $body;
        try {
            $from = $username;
            $mail = new PHPMailer(true);
            $mail->IsSMTP();
            $mail->SMTPAuth = true;
            $mail->SMTPSecure = 'ssl'; 
            $mail->Host = "$server";
            $mail->Port = "$port";
            $mail->Username ="$username";
            $mail->Password = "$password";   
  
            //   $path = 'reseller.pdf';
            //   $mail->AddAttachment($path);

            $mail->IsHTML(true);
            $mail->From = "$username";
            $mail->FromName = $username;
            $mail->Sender = "$smtp_from_email";
            $mail->AddReplyTo("$username", $username);
            $mail->Subject = $subject;
            $mail->Body = $body;
            $mail->AddAddress($to);
            $send = $mail->Send();
            if ($send) {
                return true;
            }
        } catch (phpmailerException $e) {
            
            // echo $e->errorMessage(); //Pretty error messages from PHPMailer
            // $d->message("Error Sending message. You can try new SMTP", "error");
            return false;
        } catch (Exception $e) {
            // echo $e->getMessage(); //Boring error messages from anything else!
            // $d->message("Error Sending message. You can try new SMTP", "error");
            return false;
        }
    }


    protected function upload_multiple_image($names){
        foreach ($names as $key) {
            $check = substr($key, -5);
            if ($check == "_null") {
                $key = substr_replace($key, "", -5);
            }
            $key = str_replace(" ", "_", $key);
            if ($check != "_null") {
                if ($_FILES["$key"]['name'] == "" || !isset($_FILES["$key"]['name'])) {
                    $this->err = "yes";
                    database::message("You need to upload your $key", "error");
                } else {
                    $set["$key"] = ${$key} = htmlspecialchars($_FILES["$key"]['name']);
                }
            } else {
                $set["$key"] = ${$key} = htmlspecialchars($_FILES["$key"]['name']);
            }
        }

        if ($this->err != "yes") {
            return $set;
        } else {
            return $this->err;
        }
    }
    public function process_image($title, $path, $name = "uploaded_file", $i = 0)
    {
        //file to place within the server
        if ($_FILES["$name"]["name"] == "") {
            echo "no";
            return null;
        }

        if($i == 0 && $name != "uploaded_file"){
            $image = $_FILES["$name"]["name"]; //input file name in this code is file1
            $size = $_FILES["$name"]["size"];
            $tmp = $_FILES["$name"]["tmp_name"];
        }else{
            $image = $_FILES["$name"]["name"][$i]; //input file name in this code is file1
            $size = $_FILES["$name"]["size"][$i];
            $tmp = $_FILES["$name"]["tmp_name"][$i];
        }
        

        $valid_formats1 = array("JPG", "jpg", "png", "jpeg", "JPEG", "PNG"); //list of file extention to be accepted
        if (empty($image)) {
            database::message("No file selected", "error");
            return false;
        }
        if (isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST") {

            if ($size < 3500000) {
                $fileInfo = pathinfo($image);
                $ext = $fileInfo['extension'];

                if (in_array($ext, $valid_formats1)) {
                    if ($path == "check") {
                        return true;
                    }
                    $titlename = str_replace(" ", "_", $title);
                    $actual_image_name =  $titlename . "." . $ext;

                    if (move_uploaded_file($tmp, $path . $actual_image_name)) {
                        return $actual_image_name;
                    } else {
                        database::message($message = '<b>' . $image . ': Image Not Uploaded Try again', $type = 'error');
                        return false;
                    }
                } else {

                    database::message($message = '<b>' . $image . ':</b> Image file Not Support. We support: ' . implode(" ", $valid_formats1), $type = 'error');
                    return false;
                }
            } else {
                database::message("<b>$image</b>: Image too large. Make sure your image size is not above 3MB", "error");
                return false;
            }
        }
    }
    protected function imageupload($name)
    {
        //��heck that we have a file
        if ((!empty($_FILES["uploaded_file"])) && ($_FILES['uploaded_file']['error'] == 0)) {
            //Check if the file is JPEG image and it's size is less than 350Kb
            $filename = basename($_FILES['uploaded_file']['name']);
            $ext = substr($filename, strrpos($filename, '.') + 1);
            if (($ext == "jpg") && ($_FILES["uploaded_file"]["type"] == "image/jpeg") &&
                ($_FILES["uploaded_file"]["size"] < 350000)
            ) {
                //Determine the path to which we want to save this file
                $name = $name . '.' . $ext;
                $newname = 'upload/' . $name;
                //Check if the file with the same name is already exists on the server
                // if (!file_exists($newname)) {
                //Attempt to move the uploaded file to it's new place
                if ((move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $newname))) {
                    //  database::message("Passport Uploaded Successfully", "success");
                    return $name;
                } else {
                    database::message("Error: A problem occurred during Passport upload!", "error");
                    return false;
                }
                // } else {
                //    echo "Error: File ".$_FILES["uploaded_file"]["name"]." already exists";
                // }
            } else {
                database::message("Error: Only .jpg images under 350Kb are accepted for upload", "error");
                return false;
            }
        } else {
            database::message("Error: No image uploaded", "error");
            return false;
        }
    }


}

?>