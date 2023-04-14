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
                        <h3 class="text-center">Mailer SMTP LIST</h3>
                        <form class="mb-5" action="smtp.php" method="post" id="contactForm" name="contactForm">
                            <?php require_once "include/mailer.php" ?>
                            <div class="row">
                                <?php foreach($smtps as $row){ ?>
                                <div class="col-md-12 form-group mb-3 shadow-sm b-1 rounded p-3 mb-3 row">
                                    <div class="col-8"><?= $row['username']; ?></div>
                                    <a class="col-4 text-right" href="smtp.php?id=<?= $row['ID'] ?>">Edit</a>
                                </div>
                                <?php } ?>
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