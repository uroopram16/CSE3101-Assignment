<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of login
 *
 * @author abiga
 */
class login extends model{
    public function checklogin() {
        if(isset($_REQUEST['email']) && isset($_REQUEST['password'])){
            $email=$_REQUEST['email'];
            $password=$_REQUEST['password'];
            
            $quer="SELECT * FROM accounts where email='$email' and password='$password'";
            $res=mysqli_query($this->connect(),$quer);
            $rowcount= mysqli_num_rows($res);
            
            if($rowcount == 1){
                $_SESSION['email']=$email;
            }
            else{
                $_SESSION['no']="You have entered an invalid email OR password<br>Don't have an account, Sign up now";
            }
        }
        
    }
    //put your code here
}
