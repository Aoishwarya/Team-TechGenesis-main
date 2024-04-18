<?php
// Start session
session_start();

// Check if the user is not logged in
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: /html/login.php");
    exit;
}

// Include the database configuration file
require_once 'config.php';

// Retrieve the admin's details from the database
$email = $_SESSION["email"];
$sql = "SELECT id, firstname, lastname, email FROM admin WHERE email = ?";
if ($stmt = $conn->prepare($sql)) {
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows == 1) {
        $stmt->bind_result($id, $firstname, $lastname, $email);
        $stmt->fetch();
    }
    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Your custom CSS styles -->
    <style>

        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light gray background */
            color: #333; /* Dark text color */
            padding-top: 60px; /* Add padding for the fixed navbar */
        }

        /* Navbar styles */
        .navbar {
            background-color: #6a1b9a; /* Purple Navbar */
            border-bottom: 3px solid #4a148c; /* Darker purple border bottom */
        }
        .navbar-brand,
        .navbar-nav .nav-link {
            color: #fff; /* White text color */
        }
        .navbar-brand img {
            max-height: 40px; /* Limit logo height */
        }

        /* Main container styles */
        .container {
            background-color: #fff; /* White container background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        /* Profile heading styles */
        h2 {
            color: #6a1b9a; /* Purple heading */
            border-bottom: 2px solid #6a1b9a; /* Purple underline */
            padding-bottom: 8px;
            margin-bottom: 20px;
        }

        /* Profile details styles */
        p {
            font-size: 18px;
            margin-bottom: 12px;
        }
    
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">
            <img src="/assets/images/logo1.png" alt="Logo" height="40">
        </a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/admin.php">Admin Panel</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/html/logout.php">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main content area -->
    <div class="container mt-4">
        <h2>Admin Profile</h2>
        <p>Name: <?php echo $firstname . ' ' . $lastname; ?></p>
        <p>Email: <?php echo $email; ?></p>
        <!-- Add more profile details as needed -->
    </div>

    <!-- Include Bootstrap JS (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
