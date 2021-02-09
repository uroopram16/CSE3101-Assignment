<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <nav><a href="login_view.php">Login</a></nav>
        <h1>Login Page</h1>
        <form action="dashboard.php" method="POST">
            <input name="email" placeholder="email address" type="text">
            <label>Password<input name="password" type="password"></label>
            <button type="submit">Login</button>
        </form>
        <?php
        // put your code here
        ?>
    </body>
</html>
