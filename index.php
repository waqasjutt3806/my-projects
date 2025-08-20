<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username']; // Logged in user ka naam
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>CTO - Community for Bird Enthusiasts</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #e1f5fe, #ffffff);
      color: #333;
    }

    nav {
      background: linear-gradient(to right, #0d47a1, #1565c0);
      padding: 20px 0;
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

    .hero {
      text-align: center;
      padding: 80px 20px 40px;
      background: linear-gradient(to bottom, #ffffff, #e3f2fd);
    }

    .hero h2 {
      font-size: 3rem;
      color: #0d47a1;
      margin-bottom: 20px;
    }

    .hero p {
      font-size: 1.2rem;
      max-width: 750px;
      margin: 0 auto 40px;
      color: #444;
    }

    .hero-img {
      width: 60%;
      max-width: 500px;
      border-radius: 20px;
      box-shadow: 0 30px 60px rgba(0, 0, 0, 0.3);
      transition: all 0.4s ease;
    }

    .hero-img:hover {
      transform: scale(1.03) translateY(-8px);
      box-shadow: 0 40px 80px rgba(0, 0, 0, 0.4);
    }

    .cta-buttons {
      margin-top: 40px;
    }

    .cta-buttons a {
      background: #0d47a1;
      color: #fff;
      padding: 14px 24px;
      border-radius: 8px;
      margin: 0 10px;
      text-decoration: none;
      font-weight: bold;
      transition: background 0.3s, transform 0.3s;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    .cta-buttons a:hover {
      background: #ffd700;
      color: #0d47a1;
      transform: translateY(-3px);
    }

    footer {
      background-color: #0d47a1;
      color: white;
      padding: 20px 0;
      text-align: center;
      margin-top: 50px;
      font-size: 0.95rem;
    }

    @media (max-width: 768px) {
      .hero h2 {
        font-size: 2rem;
      }

      .hero p {
        font-size: 1rem;
      }

      .hero-img {
        width: 90%;
      }

      nav ul {
        flex-direction: column;
        gap: 10px;
      }

      .cta-buttons a {
        display: block;
        margin: 10px auto;
      }
    }
  </style>
</head>
<body>

  <!-- Navigation -->
  <nav>
    <h1>CTO - Conservation Through Observation</h1>
    <p style="text-align: center; font-size: 1.2rem; margin-left: 1200px; color:white; ">
         👋 Welcome, <strong><?= htmlspecialchars($username) ?></strong>!
        </p>
    <ul>
      <li><a href="index.php">My Profile</a></li>
      <!-- <li><a href="register.php">Register</a></li> -->
      <!-- <li><a href="login.php">Login</a></li> -->
      <li><a href="view-post.php">View-post</a></li>
      <li><a href="new-post.php">New Post</a></li>
      <li><a class="dropdown-item" href="logout.php">Logout</a></li>
      

      
       <!-- New Button -->
    </ul>
  </nav>

  <!-- Hero Section -->
  <section class="hero">
    <h2>Welcome to CTO</h2>
    <p>
      A vibrant community for bird watchers and wildlife lovers. Discover rare birds, share sightings,
      and connect with nature in a whole new way.
    </p>

    <!-- Placeholder Bird Image (Replace with your own image path if needed) -->
    <img src="https://images.unsplash.com/photo-1508672019048-805c876b67e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
         alt="Beautiful Bird in 3D"
         class="hero-img">

    <div class="cta-buttons">
      <a href="register.php">Join Now</a>
      <a href="message-board.php">View Posts</a>
       <!-- New CTA Button -->
    </div>
  </section>

  <!-- Footer -->
  <footer>
    &copy; 2025 CTO. All rights reserved. Designed with care for nature and community.
  </footer>

</body>
</html>
