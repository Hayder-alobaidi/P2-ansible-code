<?php
include '/var/www/secure/db_config.php'; // Include the configuration file

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $item = htmlspecialchars($_POST['item']); // Sanitize input

    $stmt = $conn->prepare("INSERT INTO todos (item) VALUES (?)");
    $stmt->bind_param("s", $item);

    if ($stmt->execute()) {
        header("Location: index.php");
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
