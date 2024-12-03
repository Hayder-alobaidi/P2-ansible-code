<?php
// This file contains database connection details and is stored outside the web root at /var/www/secure

$servername = "terraform-20241202204457971800000007.cf84642m41vi.us-east-1.rds.amazonaws.com";
$username = "admin";
$password = "password";
$dbname = "todo_app";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
