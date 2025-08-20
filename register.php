<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Register - CTO</title>
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

    .container {
      max-width: 500px;
      margin: 60px auto;
      padding: 30px;
      background: white;
      border-radius: 16px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      text-align: center;
    }

    .container h2 {
      color: #0d47a1;
      margin-bottom: 20px;
      font-size: 2rem;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 18px;
    }

    input[type="text"],
    input[type="email"],
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

    .login-link {
      margin-top: 15px;
      font-size: 0.95rem;
    }

    .login-link a {
      color: #0d47a1;
      text-decoration: none;
      font-weight: bold;
    }

    .login-link a:hover {
      text-decoration: underline;
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
  <!-- <nav> -->
    <!-- <h1>CTO - Conservation Through Observation</h1> -->
    <!-- <ul> -->
      <!-- <li><a href="index.php">Home</a></li> -->
      <!-- <li><a href="register.php"></a></li> -->
      <!-- <li><a href="login.php">Login</a></li> -->
      <!-- <li><a href="message-board.php">Message Board</a></li> -->
      <!-- <li><a href="new-post.php">New Post</a></li> -->
      
    <!-- </ul> -->
  <!-- </nav> -->

  <!-- Registration Form -->
  <div class="container">
    <h2>Create Your CTO Account</h2>
    <form action="submit-registration.php" method="POST">
      <input type="text" name="fullname" placeholder="Full Name" required />
      <input type="email" name="email" placeholder="Email Address" required />
      <input type="text" name="username" placeholder="Username" required />
      <input type="password" name="password" placeholder="Password" required />
      <input type="password" name="confirm_password" placeholder="Confirm Password" required />
      <button type="submit">Register</button>
    </form>
    <div class="login-link">
      Already have an account? <a href="login.php">Login here</a>.
    </div>
  </div>

  <!-- Footer -->
  <!-- <footer>
    &copy; 2025 CTO. All rights reserved. Join us in protecting wildlife through community observation.
  </footer> -->

</body>
</html>
