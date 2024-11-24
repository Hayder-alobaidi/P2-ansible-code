<?php
// This file contains database connection details and is stored outside the web root at /var/www/secure

$servername = "terraform-20241113203202616700000007.cn2iig8kcra8.us-east-1.rds.amazonaws.com";
$username = "testuser";
$password = "password";
$dbname = "todo_app";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
