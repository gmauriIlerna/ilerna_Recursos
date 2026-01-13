<?php
    $pdo = new PDO("mysql:host=mysql;dbname=usersdb", "user", "1234");

    // CREATE
    if (isset($_POST['create'])) {
        $stmt = $pdo->prepare("INSERT INTO users (name, email) VALUES (?, ?)");
        $stmt->execute([$_POST['name'], $_POST['email']]);
    }

    // DELETE
    if (isset($_GET['delete'])) {
        $stmt = $pdo->prepare("DELETE FROM users WHERE id = ?");
        $stmt->execute([$_GET['delete']]);
    }

    // SELECT
    $users = $pdo->query("SELECT * FROM users")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
    <body>
        <h2>User CRUD</h2>

        <h3>Create User</h3>
        <form method="POST">
            <input type="text" name="name" placeholder="Name" required />
            <input type="email" name="email" placeholder="Email" required />
            <button name="create">Create</button>
        </form>

        <h3>Users</h3>
        <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        <?php foreach ($users as $u): ?>
            <tr>
                <td><?= $u['id'] ?></td>
                <td><?= $u['name'] ?></td>
                <td><?= $u['email'] ?></td>
                <td>
                    <a href="?delete=<?= $u['id'] ?>">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
        </table>
    </body>
</html>