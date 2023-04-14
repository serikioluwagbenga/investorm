<?php
    require_once "database.php";
    $d = new database;
    if(isset($_POST['tnx'])){
        
        $tnx = $_POST['tnx'];
        $data = $d->fastgetwhere("transactions", "tnx = ?", $tnx, "details");
        if(is_array($data)){
             $image = $d->process_image(uniqid("IMG"), "upload/", "reference");
            if($image){
                if($data['reference'] != ""){
                    if(file_exists("upload/".$data['reference'])){
                        unlink("upload/".$data['reference']);
                    }
                }
                $where = "tnx = '$tnx'";
                $update = $d->update("transactions", "", $where, ["reference"=>$image, "status"=>"onhold"], "Deposit updated. please wait or <a href='deposit-complete'>Click here</a> to complete the proccess");
                // if($update){
                //     $return = [
                //         "message" => ["Success", "Account Created", "success"],
                //         "function" => ["loadpage", "data"=>["login.php", "null"]],
                //     ];
                //     return json_encode($return);
                // }
            }
        }else{
            $d->message("Not found.", "error");
        }
    }
?>

