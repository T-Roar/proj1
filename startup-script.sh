#!/bin/bash

# Write the HTML code to separate files
cat > /var/www/html/index.html << EOL
<!DOCTYPE html>
<html>
  <head>
    <title>Vimooz - Register or Login</title>
    <style>
        form {
          display: flex;
          flex-direction: column;
          align-items: center;
        }
        label {
          display: flex;
          flex-direction: column;
          align-items: flex-start;
          margin-bottom: 10px;
        }
        input {
          width: 100%;
          padding: 5px;
          margin-top: 5px;
          margin-bottom: 15px;
          border: 1px solid #ccc;
          border-radius: 3px;
        }
        button[type="submit"] {
          margin-top: 20px;
          padding: 10px;
          border: none;
          border-radius: 3px;
          background-color: #4CAF50;
          color: white;
          font-size: 16px;
          cursor: pointer;
        }
      </style>
      
  </head>
  <body>
    <h3>Welcome to Vimooz</h3>
    <br>
    <p><a href="/page2">Register or Login</a></p>
  </body>
</html>
EOL

cat > /var/www/html/login.html << EOL
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Vimooz-Login Page</title>
    <style>
      form {
        display: flex;
        flex-direction: column;
        align-items: left;
      }
      label {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin-bottom: 10px;
      }
      input {
        width: 50%;
        padding: 5px;
        margin-top: 5px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 2px;
      }
      button[type="submit"] {
        margin-top: 20px;
        padding: 10px;
        border: none;
        border-radius: 3px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <h1>Vimooz Login</h1>
    <form action="/login" method="post">
        <br>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
      <div>
        <input type="checkbox" id="rememberMe" name="rememberMe">
        <label for="rememberMe">Remember me</label>
      </div>
      <button type="submit">Sign In</button>
    </form>
    <p>New User? <a href="/register">Register Here</a></p>
  </body>
</html>
EOL

cat > /var/www/html/logout.html << EOL
<!DOCTYPE html>
<html>
  <head>
    <title>Vimooz - Logout</title>
  </head>
  <body>
    <h2>You are logged out</h2>
    <button onclick="window.history.back()">Back</button>
    <br>
    <br>
    <form action="/login" method="get">
      <button type="submit">Log back in</button>
    </form>
  </body>
</html>
EOL

cat > /var/www/html/register.html << EOL
<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <style>
    form {
      display: flex;
      flex-direction: column;
      align-items: left;
    }
    label {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      margin-bottom: 10px;
    }
    input {
      width: 60%;
      padding: 5px;
      margin-top: 5px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }
    button[type="submit"] {
      margin-top: 20px;
      padding: 10px;
      border: none;
      border-radius: 3px;
      background-color: #4CAF50;
      color: white;
      font-size: 16px;
      cursor: pointer;
    }
  </style>
</head>
<body>
<button onclick="window.history.back()">Back</button>
<h1>Register</h1>
  <form action="/register" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" minlength="6" required><br><br>
    <label for="firstname">First Name:</label>
    <input type="text" id="firstname" name="firstname" required><br><br>
    <label for="lastname">Last Name:</label>
    <input type="text" id="lastname" name="lastname" required><br><br>
    <input type="submit" value="Register">
  </form>
</body>
</html>
EOL

# Set the file permission to make it executable
chmod +x login.html