<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Login - CTO</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #e3f2fd, #ffffff);
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

    .container {
      max-width: 450px;
      margin: 60px auto;
      padding: 30px;
      background: white;
      border-radius: 16px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
      text-align: center;
    }

    .container h2 {
      color: #0d47a1;
      margin-bottom: 20px;
      font-size: 2.2rem;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 18px;
    }

    input[type="text"],
    input[type="password"] {
      padding: 12px;
      border: 2px solid #ccc;
      border-radius: 8px;
      font-size: 1rem;
      transition: border 0.3s ease;
    }

    input:focus {
      border-color: #0d47a1;
      outline: none;
    }

    button {
      background: #0d47a1;
      color: white;
      padding: 14px;
      font-size: 1rem;
      font-weight: bold;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.2s;
      box-shadow: 0 5px 12px rgba(0, 0, 0, 0.2);
    }

    button:hover {
      background: #ffd700;
      color: #0d47a1;
      transform: translateY(-2px);
    }

    .register-link {
      margin-top: 15px;
      font-size: 0.95rem;
    }

    .register-link a {
      color: #0d47a1;
      text-decoration: none;
      font-weight: bold;
    }

    .register-link a:hover {
      text-decoration: underline;
    }

    .hero-img {
      margin-top: 30px;
      width: 100%;
      max-width: 250px;
      border-radius: 20px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
      transition: transform 0.4s;
    }

    .hero-img:hover {
      transform: scale(1.05);
    }

    footer {
      background-color: #0d47a1;
      color: white;
      padding: 20px 0;
      text-align: center;
      margin-top: 50px;
      font-size: 0.95rem;
    }

    @media (max-width: 600px) {
      .container {
        margin: 30px 20px;
        padding: 20px;
      }
    }
  </style>
</head>
<body>

  <!-- Navigation -->
  <!-- <nav>
    <h1>CTO - Conservation Through Observation</h1>
    <ul>
      <li><a href="index.php">Home</a></li>
      <li><a href="register.php">Register</a></li>
      <li><a href="login.php">Login</a></li>
      <li><a href="message-board.php">Message Board</a></li>
      <li><a href="new-post.php">New Post</a></li>
      
    </ul>
  </nav> -->

  <!-- Login Form -->
  <div class="container">
    <h2>Login to Your Account</h2>
    <form action="submit-login.php" method="POST">
      <input type="text" name="username" placeholder="Username or Email" required />
      <input type="password" name="password" placeholder="Password" required />
      <button type="submit">Login</button>
    </form>
    <div class="register-link">
      Don't have an account? <a href="register.php">Register here</a>.
    </div>
    <img src="bird-img.jpg" alt="3D Bird" class="hero-img" />
  </div>

  <!-- Footer -->
  <!-- <footer>
    &copy; 2025 CTO. All rights reserved. Your gateway to nature and community.
  </footer> -->

</body>
</html>
