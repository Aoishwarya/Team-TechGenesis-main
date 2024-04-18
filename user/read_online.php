<!DOCTYPE html>
<html>
<head>
    <title>Read Online</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        iframe {
            width: 100%;
            height: 100vh;
            border: none;
        }
    </style>
</head>
<body>
    <iframe src="view_pdf.php?bookId=<?php echo $_GET['bookId']; ?>"></iframe>
</body>
</html>
