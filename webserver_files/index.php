<!DOCTYPE html>
<html>
<head>
    <title>To-Do List</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { width: 300px; margin: 0 auto; text-align: center; }
        ul { list-style-type: none; padding: 0; }
        li { padding: 10px; text-align: left; }
        .completed { text-decoration: line-through; }
    </style>
</head>
<body>
    <div class="container">
        <h2>To-Do List</h2>
        <form action="add_todo.php" method="post">
            <input type="text" name="item" placeholder="New To-Do Item" required>
            <button type="submit">Add</button>
        </form>
        <ul>
            <?php
            include '/var/www/secure/db_config.php'; // Include the configuration file

            $result = $conn->query("SELECT * FROM todos");

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<li>" . ($row['status'] ? "<span class='completed'>" . $row['item'] . "</span>" : $row['item']) . "</li>";
                }
            } else {
                echo "<li>No items found</li>";
            }

            $conn->close();
            ?>
        </ul>
    </div>
</body>
</html>
