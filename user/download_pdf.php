<?php
session_start();
error_reporting(0);
include('config.php');
if (isset($_GET['bookId'])) {
    $bookId = $_GET['bookId'];

    // Retrieve the file path from the database based on the bookId
    $sql = "SELECT pdf_path FROM tblbooks WHERE id = $bookId";
    $query = $conn->query($sql);
    if ($query->num_rows > 0) {
        $result = $query->fetch_assoc();
        $pdfPath = $result['pdf_path'];

        // Send the PDF file for download
        header('Content-Type: application/pdf');
        header('Content-Disposition: attachment; filename="' . basename($pdfPath) . '"');
        header('Content-Length: ' . filesize($pdfPath));
        readfile($pdfPath);
        exit;
    }
}
?>
