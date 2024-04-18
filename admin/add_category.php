<?php
session_start();
error_reporting(0);
include('config.php');
if (strlen($_SESSION['loggedin']) == 0) {
    header('location:/html/index.php');
} else {

    if (isset($_POST['create'])) {
        $category = $_POST['category'];
        $status = $_POST['status'];
        $sql = "INSERT INTO  tblcategory(CategoryName,Status) VALUES(?,?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('si', $category, $status);
        $stmt->execute();
        $lastInsertId = $stmt->insert_id;
        if ($lastInsertId) {
            $_SESSION['msg'] = "Brand Listed successfully";
            header('location:categories.php');
        } else {
            $_SESSION['error'] = "Something went wrong. Please try again";
            header('location:categories.php');
        }
    }
?>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Library Management System | Add Categories</title>
        <!-- BOOTSTRAP 4 CORE STYLE  -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <!-- FONT AWESOME 5 STYLE  -->
        <link href="assets/css/fontawesome.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    </head>

    <body>
        <!------MENU SECTION START-->
        <?php include('head_nav.php'); ?>
        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Add category</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Category Info
                            </div>
                            <div class="panel-body">
                                <form role="form" method="post">
                                    <div class="form-group">
                                        <label>Category Name</label>
                                        <input class="form-control" type="text" name="category" autocomplete="off" required />
                                    </div>
                                    <div class="form-group">
                                        <label>Status</label>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="status" id="status" value="1" checked="checked">Active
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="status" id="status" value="0">Inactive
                                            </label>
                                        </div>
                                    </div>
                                    <button type="submit" name="create" class="btn btn-info">Create</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY  -->
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <!-- BOOTSTRAP 4 SCRIPTS  -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="assets/js/custom.js"></script>
    </body>
 <!-- CUSTOM STYLE  -->
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f8f9fa; /* Light gray background */
        }

        /* Navbar Styling */
        .navbar {
            background-color: #a68df2; /* Light violet navbar background */
            color: #ffffff; /* White text color */
        }

        .navbar-brand img {
            max-height: 40px; /* Adjust the logo height */
            margin-right: 10px; /* Optional: Increase spacing */
        }

        .navbar-nav .nav-link {
            color: #ffffff; /* White text color */
        }

        /* Content Wrapper Styling */
        .content-wrapper {
            padding-top: 20px; /* Optional: Adjust top padding */
            padding-bottom: 20px; /* Optional: Adjust bottom padding */
        }

        /* Panel Styling */
        .panel-heading {
            background-color: #a68df2; /* Light violet panel heading background */
            color: #ffffff; /* White panel heading text color */
        }

        .panel-body {
            background-color: #ffffff; /* White panel body background */
            border: 1px solid #a68df2; /* Light violet border */
            border-radius: 5px; /* Optional: Add border radius */
            padding: 15px; /* Optional: Adjust padding */
        }

        /* Form Styling */
        form {
            margin-bottom: 0; /* Remove default form margin */
        }

        .form-group label {
            color: #495057; /* Dark text color for form labels */
        }

        .form-control {
            border-color: #a68df2; /* Light violet form control border color */
        }

        /* Button Styling */
        .btn-info {
            background-color: #a68df2; /* Light violet button background */
            border-color: #a68df2; /* Light violet button border color */
            color: #ffffff; /* White button text color */
        }

        .btn-info:hover {
            background-color: #8250c7; /* Dark violet hover background */
            border-color: #8250c7; /* Dark violet hover border color */
        }
    </style>
    </html>
<?php } ?>
