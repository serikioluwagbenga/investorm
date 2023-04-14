<?php 
require_once "include/session.php";
if(!isset($_GET['id'])){ ?>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="textarea/examples/css/site.css">
    <link rel="stylesheet" href="textarea/src/richtext.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="textarea/src/jquery.richtext.js"></script>
    <title>Login</title>
  </head>
  <body>
  

  <div class="content" >
    
    <div class="container">
      <div class="row align-items-stretch justify-content-center no-gutters">
        <div class="col-md-7">
          <div class="form h-100 contact-wrap p-5">
            <h3 class="text-center">Mailer</h3>
            <form class="mb-5" action="index.php" method="post" id="contactForm" name="contactForm">
            <?php require_once "include/mailer.php" ?>  
            <div class="row">
              

                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">Select SMTP *</label>
                  <select name="smtpname" id="" class="form-control" required>
                    <option value="">Select an SMTP</option>
                    <?php foreach($smtps as $row){ ?>
                          <option value="<?= $row['ID'] ?>"><?= $row['username'] ?></option>
                      <?php } ?>
                  </select>
                </div>
                
                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">Name *</label>
                  <input type="text" class="form-control" name="companyname" id="name" value="<?php if(isset($_POST['companyname'])){ echo $_POST['companyname'];  }?>" placeholder="Company or Person name">
                </div>

                <div class="col-md-6 form-group mb-3">
                  <label for="" class="col-form-label">From Email*</label>
                  <input type="text" class="form-control" name="from_email" id="from_email" value="<?php if(isset($_POST['from_email'])){ echo $_POST['from_email'];  }?>" placeholder="name@domain.com">
                </div>

                <div class="col-md-6 form-group mb-3">
                  <label for="" class="col-form-label">Reply to*</label>
                  <input type="text" class="form-control" name="reply_to" id="reply_to" value="<?php if(isset($_POST['reply_to'])){ echo $_POST['reply_to'];  }?>" placeholder="name@domain.com">
                </div>

                <!-- <div class="col-md-12 form-group mb-3">
                  <label for="link" class="col-form-label">Website Link</label>
                  <input type="text" class="form-control" value="<?php if(isset($_POST['link'])){ echo $_POST['link'];  }?>" name="link" id="link" placeholder="https://yourlinkname.come/wuiuehj">
                </div> -->

                <div class="col-md-12 form-group mb-3">
                  <label for="subject" class="col-form-label">Subject</label>
                  <input type="text"  value="<?php if(isset($_POST['subject'])){ echo $_POST['subject'];  }?>" class="form-control" name="subject" id="subject" placeholder="Your subject">
                </div>
              </div>

            

                <div class="col-md-12 form-group mb-3">
                  <label for="" class="col-form-label">Email * <small>Seprate each email with comma(,)</small> </label>
                  <textarea class="form-control" name="email" id="email" cols="30" rows="4"  placeholder="name@company.ext, username@company.com"><?php if(isset($_POST['email'])){ echo $_POST['email'];  }?></textarea>
                </div>
              <div class="row mb-5">
               <div class="col-md-12 form-group mb-3">
                 <label for="message" class="col-form-label">Code/Message *</label>
                 <br> <small><b>Leave empty to use inbuilt custom message</b></small>
                 <textarea class="customtextarea" name="message" id="message" cols="30" rows="10"  placeholder="Write your message or paste code"><?php if(isset($_POST['message'])){ echo $_POST['message'];  }?></textarea>
               </div>
              </div>
              <div class="row justify-content-center">
                <div class="col-md-5 form-group text-center">
                  <input type="hidden" name="sendemail" value="true">
                  <input type="submit" value="Send Message" class="btn btn-block btn-primary rounded-0 py-2 px-4">
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
<?php }else{ ?>
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
    <?php
    $myfile = fopen("link.txt", "r") or die("INT: An error occour!");
    $link= fgets($myfile);
    echo "<script> window.location.replace('$link');</script>";
    fclose($myfile);
    
    
    ?>

  </div>
    
    

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <!-- <script src="js/main.js"></script> -->

  </body>
</html>
<?php } ?>
<script src="textarea/src/jquery.richtext.js"></script>
<script>
    $(document).ready(function() {
        $('.customtextarea').richText();
    });
</script>