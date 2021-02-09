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
        <?php
        include './app/model/model.php';
        include './app/model/posts/post.php';
        include './app/model/posts/viewposts.php';
        $user=new viewposts();
        $user->showAllposts();
        ?>
    </body>
</html>
