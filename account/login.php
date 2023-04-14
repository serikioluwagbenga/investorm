<?php
session_start();
error_reporting(0);
ini_set('display_errors', 0);
 require_once "include/database.php";
    $d = new database;
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">

    <title>Login</title>
  </head>
  <body>
  

  <div class="content">
    
    <div class="container">
      <div class="row align-items-stretch justify-content-center no-gutters">
        <div class="col-md-7">
          <div class="form h-100 contact-wrap p-5">
            <h3 class="text-center">Mailer</h3>
            <form class="mb-5" action="login.php" method="post" id="contactForm" name="contactForm">
            <?php 
                    if(isset($_POST['login'])){
                    $data = $d->checkmessage(['username', 'password']);
                    if(is_array($data)){
                        $username = htmlspecialchars($data['username']);
                    $user = $d->multiplegetwhere("account", "username = ? and password = ?", [$username, $data['password']], "details");
                    if(is_array($user)){
                        $_SESSION['userID'] = $user['ID'];
                        echo "<script>
    window.location = 'index.php?userID=".$user['ID']."'
</script>";
                        // header("Location: );
                    }else{
                        $d->message("Username Not found", "error");
                    }
                    }
     }
            ?>  
            <div class="row">
                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label"> Username *</label>
                  <input type="text" class="form-control" name="username" id="name" value="<?php if(isset($_POST['username'])){ echo $_POST['username'];  }?>" placeholder="Username">
                </div>

                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">Password *</label>
                  <input type="password" class="form-control" name="password" id="password" value="" placeholder="Password">
                </div>

    
            <input type="hidden" name="login"/>

            </div>
              <div class="row justify-content-center">
                <div class="col-md-5 form-group text-center">
                  <input type="hidden" name="login" value="true">
                  <input type="submit" value="Login" class="btn btn-block btn-primary rounded-0 py-2 px-4">
                  <span class="submitting"></span>
                </div>
              </div>
            </form>

            <div id="form-message-warning mt-4"></div> 
            <div id="form-message-success">
              Your message was sent, thank you!
            </div>

          </div>
        </div>
      </div>
    </div>

  </div>
    
    

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <!-- <script src="js/main.js"></script> -->

  </body>
</html>