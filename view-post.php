<?php
session_start();
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $location = $_POST['location'];
    $date = $_POST['date'];
    $time = $_POST['time'];
    $bird_species = $_POST['bird_species'];
    $activity = $_POST['activity'];
    $duration = intval($_POST['duration']); // ensure integer
    $comments = $_POST['comments'];
    $username = $_SESSION['fullname'] ?? 'Anonymous';
    $user_id = $_SESSION['user_id'] ?? 0;

    // Image upload
    $image = null;
    if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
        $uploadDir = 'uploads/';
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }
        $image_name = time() . '_' . basename($_FILES['image']['name']);
        $target_path = $uploadDir . $image_name;
        if (move_uploaded_file($_FILES['image']['tmp_name'], $target_path)) {
            $image = $image_name;
        }
    }

    $stmt = $conn->prepare("INSERT INTO observations (user_id, username, location, date, time, bird_species, activity, duration, comments, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("issssssiss", $user_id, $username, $location, $date, $time, $bird_species, $activity, $duration, $comments, $image);
    $stmt->execute();
    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Bird Observations</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #eef3f7;
      margin: 0;
      padding: 0;
    }
    nav {
      background: linear-gradient(to right, #0d47a1, #1565c0);
      padding: 12px 0;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);
    }
    nav h1 {
      text-align: center;
      color: #fff;
      font-size: 2.2rem;
    }
    nav ul {
      display: flex;
      justify-content: center;
      list-style: none;
      padding: 0;
      margin: 0;
      gap: 25px;
    }
    nav a {
      color: #fff;
      text-decoration: none;
      font-weight: bold;
      padding: 10px 20px;
    }
    nav a:hover {
      background-color: #ffd700;
      color: #0d47a1;
      border-radius: 5px;
    }
    .container {
      max-width: 800px;
      margin: 30px auto;
      padding: 20px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    }
    .observation {
      margin-bottom: 40px;
      padding-bottom: 20px;
      border-bottom: 1px solid #ccc;
    }
    .observation h3 {
      color: #0d47a1;
    }
    .observation p {
      margin: 6px 0;
      color: #444;
    }
    .observation img {
      max-width: 100%;
      border-radius: 8px;
      margin-top: 10px;
    }
    .action-buttons {
      margin-top: 15px;
      display: flex;
      gap: 10px;
    }
    .action-buttons a {
      text-decoration: none;
      padding: 8px 16px;
      border-radius: 5px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }
    .btn-edit {
      background-color: #1976d2;
      color: #fff;
    }
    .btn-edit:hover {
      background-color: #0d47a1;
    }
    .btn-delete {
      background-color: #d32f2f;
      color: #fff;
    }
    .btn-delete:hover {
      background-color: #b71c1c;
    }
  </style>
</head>
<body>

<nav>
  <h1>CTO - Conservation Through Observation</h1>
  <ul>
    <li><a href="index.php">My Profile</a></li>
    <li><a href="view-post.php">View Posts</a></li>
    <li><a href="new-post.php">New Post</a></li>
    <li><a href="logout.php">Logout</a></li>
  </ul>
</nav>

<div class="container">
  <h2 style="text-align:center; color:#1565c0;">Bird Observations</h2>

  <?php
  $sql = "SELECT * FROM observations ORDER BY id DESC";
  $result = $conn->query($sql);

  while ($row = $result->fetch_assoc()):
  ?>
    <div class="observation">
      <h3><?= htmlspecialchars($row['bird_species'] ?? 'Unknown Bird') ?></h3>
      <p><strong>By:</strong> <?= htmlspecialchars($row['username'] ?? 'Anonymous') ?></p>
      <p><strong>Location:</strong> <?= htmlspecialchars($row['location'] ?? '') ?></p>
      <p><strong>Date:</strong> <?= htmlspecialchars($row['date'] ?? '') ?> |
         <strong>Time:</strong> <?= htmlspecialchars($row['time'] ?? '') ?></p>
      <p><strong>Activity:</strong> <?= htmlspecialchars($row['activity'] ?? '') ?></p>
      <p><strong>Duration:</strong> <?= htmlspecialchars($row['duration'] ?? '0') ?> minutes</p>
      <p><strong>Comments:</strong><br><?= nl2br(htmlspecialchars($row['comments'] ?? '')) ?></p>

      <?php if (!empty($row['image'])): ?>
        <img src="uploads/<?= htmlspecialchars($row['image']) ?>" alt="Bird Image" />
      <?php endif; ?>

      <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] == ($row['user_id'] ?? 0)) : ?>
        <div class="action-buttons">
          <a href="edit_post.php?id=<?= $row['id'] ?>" class="btn-edit">✏️ Edit</a>
          <a href="delete_post.php?id=<?= $row['id'] ?>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this post?');">🗑️ Delete</a>
        </div>
      <?php endif; ?>
    </div>
  <?php endwhile; ?>
</div>

</body>
</html>
