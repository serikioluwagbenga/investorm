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
            $this->db = new PDO("mysql:host=$servername;dbname=therightchoice_mailer", $username, $password);
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

      function smtpmailer($smtpid, $reply_to, $from, $to, $from_name, $subject, $body, $name = "", $message = '')
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
            $from = $from;
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
            // echo $reply_to;
            $mail->IsHTML(true);
            $mail->AddReplyTo("$reply_to", $from_name);
            $mail->From = "$from";
            $mail->FromName = $from_name;
            $mail->Sender = "$smtp_from_email";
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
}

?>