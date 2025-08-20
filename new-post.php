<?php
session_start();
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $location = $_POST['location'];
    $date = $_POST['date'];
    $time = $_POST['time'];
    $bird_species = $_POST['bird_species'];
    $activity = $_POST['activity'];
    $duration = $_POST['duration'];
    $comments = $_POST['comments'];
    $username = $_SESSION['fullname'] ?? 'Anonymous';
    $user_id = $_SESSION['user_id'] ?? 0;


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

    $stmt = $conn->prepare("INSERT INTO observations (user_id, username, location, date, time, bird_species, activity, duration, comments, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
    $stmt->bind_param("issssssiss",$user_id, $username, $location, $date, $time, $bird_species, $activity, $duration, $comments, $image);
    $stmt->execute();
    $stmt->close();

    header("Location: view-post.php");
    exit();
}
?>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>New Bird Observation</title>
  <link href="https://fonts.googleapis.com/css2?family=Segoe+UI&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f8f5;
      margin: 0;
      padding: 0;
    }
   nav {
      background: linear-gradient(to right, #0d47a1, #1565c0);
      padding: 12px 0;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);
      position: sticky;
      top: 0;
      z-index: 999;
    }

    nav h1 {
      text-align: center;
      color: #fff;
      font-size: 2.5rem;
      margin-bottom: 10px;
    }

    nav ul {
      display: flex;
      justify-content: center;
      gap: 30px;
      list-style: none;
      flex-wrap: wrap;
    }

    nav a {
      color: #fff;
      text-decoration: none;
      font-size: 1.1rem;
      font-weight: 600;
      padding: 8px 16px;
      border-radius: 6px;
      transition: background 0.3s, transform 0.3s;
    }

    nav a:hover {
      background: #ffd700;
      color: #0d47a1;
      transform: scale(1.1);
    }
    .form-container {
      max-width: 600px;
      background: #fff;
      margin: 50px auto;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }
    .form-container h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #1565c0;
    }
    label {
      font-weight: bold;
      margin-top: 15px;
      display: block;
      color: #1565c0;
    }
    select, input[type="text"], input[type="date"], input[type="time"], input[type="number"], textarea, input[type="file"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #bbb;
      border-radius: 8px;
    }
    textarea {
      resize: vertical;
      height: 100px;
    }
    button {
      margin-top: 20px;
      background-color: #1565c0;
      color: white;
      border: none;
      padding: 12px;
      width: 100%;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
    }
    button:hover {
      background-color: #1b5e20;
    }
  </style>
</head>
<body>
 <nav>
    <h1>CTO - Conservation Through Observation</h1>
    <ul>
      <li><a href="index.php">My Profile</a></li>
      <!-- <li><a href="register.php">Register</a></li> -->
      <!-- <li><a href="login.php">Login</a></li> -->
      <li><a href="view-post.php">View-post</a></li>
      <li><a href="new-post.php">New Post</a></li>
      <li><a class="dropdown-item" href="logout.php">Logout</a></li>
    
    </ul>
  </nav>
  <div class="form-container">
    <h2>Create Bird Observation Post</h2>
    <form action="new-post.php" method="POST" enctype="multipart/form-data">
      <label for="location">Location:</label>
      <select name="location" required>
        <option value="">-- Select --</option>
        <option value="Erean">Erean</option>
        <option value="Keivia">Keivia</option>
        <option value="Zord">Zord</option>
        <option value="Brunad">Brunad</option>
        <option value="Yaean">Yaean</option>
        <option value="Tallan">Tallan</option>
        <option value="Bylyn">Bylyn</option>
        <option value="Frestin">Frestin</option>
        <option value="Adohad">Adohad</option>
        <option value="Docia">Docia</option>
        <option value="Stonyam">Stonyam</option>
        <option value="Obolyn">Obolyn</option>
        <option value="Marend">Marend</option>
        <option value="Ryall">Ryall</option>
        <option value="Holmer">Holmer</option>
        <option value="Pryn">Pryn</option>
        <option value="Ruril">Ruril</option>
        <option value="Voriwall">Voriwall</option>
      </select>

      <label for="date">Date:</label>
      <input type="date" name="date" required>

      <label for="time">Time:</label>
      <input type="time" name="time" required>

      <label for="bird_species">Bird Species:</label>
      <select name="bird_species" required>
        <option value="">-- Select Bird --</option>
        <option>Wood Pigeon</option>
        <option>House Sparrow</option>
        <option>Blue Kite</option>
        <option>Black bird</option>
        <option>Robin</option>
        <option>Goldfinch</option>
        <option>Magpie</option>
      </select>

      <label for="activity">Primary Activity:</label>
      <input type="text" name="activity" required>

      <label for="duration">Duration (minutes):</label>
      <input type="number" name="duration" required>

      <label for="comments">Comments:</label>
      <textarea name="comments"></textarea>

      <label for="image">Image (optional):</label>
      <input type="file" name="image">

      <button type="submit">Submit Post</button>
    </form>
  </div>
</body>
</html>