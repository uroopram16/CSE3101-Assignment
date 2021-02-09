<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of userview
 *
 * @author abiga
 */
class viewposts extends post{
    public function showAllposts() {
        $datas=$this->getAllPost();
        foreach($datas as $posts){
            echo "<br>".$posts['first_name']." ";
            echo $posts['last_name']."<br>";
            echo "<br>".$posts['message']."<br>";
            $datas2=$this->getAllComments($posts['message']);
            foreach((array)$datas2 as $comment){
                echo "<br>".$comment['first_name'];
                echo " ".$comment['last_name'];
                echo "<br>".$comment['comment'];
                echo "<br>";
            }
        echo '<br>';
        }
    }
    //put your code here
}
