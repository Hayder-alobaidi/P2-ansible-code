<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { font-family: 'Arial', sans-serif; background-color: <?php echo getenv('BACKGROUND_COLOR'); ?>; padding-top: 50px; }
        .container { max-width: 600px; text-align: center; }
        h2 { color: #4682B4; }
        .form-group { margin-bottom: 15px; }
        .btn-primary { background-color: #6A5ACD; border: none; }
        .btn-primary:hover { background-color: #483D8B; }
        .btn-success { background-color: #32CD32; border: none; }
        .btn-success:hover { background-color: #228B22; }
        footer { margin-top: 50px; color: #4682B4; }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form action="register.php" method="post" class="form-inline justify-content-center mb-4">
            <div class="form-group mr-2">
                <input type="text" name="name" class="form-control" placeholder="Name" required>
            </div>
            <div class="form-group mr-2">
                <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>
    <div class="container text-center">
        <a href="view_users.php" class="btn btn-success">View Registered Users</a>
    </div>
    <footer class="text-center">
        <p>&copy; <?php echo date("Y"); ?> User Registration App</p>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
