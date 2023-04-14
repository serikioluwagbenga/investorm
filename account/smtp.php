<?php require_once "include/session.php"; ?>
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

    <title>SMTP </title>
  </head>
  <body>
  

  <div class="content">
    
    <div class="container">
      <div class="row align-items-stretch justify-content-center no-gutters">
        <div class="col-md-7">
          <div class="form h-100 contact-wrap p-5">
            <h3 class="text-center">Mailer SMTP setup</h3>
            <form class="mb-5" action="smtp.php?id=<?= htmlspecialchars($_GET['id']); ?>" method="post" id="contactForm" name="contactForm">
            <?php require_once "include/mailer.php" ?>  
            <div class="row">
                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">Server Name*</label>
                  <input type="text" class="form-control" name="server" id="name" value="<?php if(isset($_POST['email'])){ echo $_POST['email'];  }else{ echo $smtp['server']; }?>" placeholder="mail.website.com">
                </div>

                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">Username*</label>
                  <input type="text" class="form-control" name="username" id="name" value="<?php if(isset($_POST['username'])){ echo $_POST['username'];  }else{ echo $smtp['username']; }?>" placeholder="username">
                </div>

                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">Password *</label>
                  <input type="text" class="form-control" name="password" id="password" value="<?php if(isset($_POST['password'])){ echo $_POST['password'];  }else{ echo $smtp['password']; }?>" placeholder="Password">
                </div>

                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">Port*</label>
                  <input type="number" class="form-control" name="port" id="name" value="<?php if(isset($_POST['port'])){ echo $_POST['port'];  }else{ echo $smtp['port']; }?>" placeholder="465">
                </div>

                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">From email*</label>
                  <input type="email" class="form-control" name="from_email" id="name" value="<?php if(isset($_POST['from_email'])){ echo $_POST['from_email'];  }else{ echo $smtp['from_email']; }?>" placeholder="youremail@company.ext">
                </div>

            

            </div>
              <div class="row justify-content-center">
                <div class="col-md-5 form-group text-center">
                  <input type="hidden" name="smtpsetup" value="true">
                  <input type="submit" value="Save" class="btn btn-block btn-primary rounded-0 py-2 px-4">
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