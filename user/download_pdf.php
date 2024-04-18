<?php
// Include necessary files and start session
session_start();
include('config.php');

// Validate user session
if (strlen($_SESSION['loggedin']) > 0) {
    // Check if book_id is sent via POST
    if (isset($_POST['book_id'])) {
        $bookId = $_POST['book_id'];

        // Perform necessary database query to retrieve PDF file path based on $bookId
        $sql = "SELECT pdfFilePath FROM tblbooks WHERE id = '$bookId'";
        $query = $conn->query($sql);

        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();
            $pdfFilePath = $row['pdfFilePath'];

            // Use appropriate headers to initiate PDF download
            header("Content-Type: application/pdf");
            header("Content-Disposition: attachment; filename='book.pdf'");
            readfile($pdfFilePath);

            // Optionally, update database or log download activity

            exit;
        }
    }
}

// If reached here, PDF download failed
echo json_encode(['success' => false]);
?>
