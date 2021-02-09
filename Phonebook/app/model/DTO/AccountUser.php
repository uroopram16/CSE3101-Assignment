<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AccountUser
 *
 * @author abiga
 */
class AccountUser extends User{
    private $firstname;
    private $lastname;
    private $email;
    private $password;
    function set_firstname($firstname){
        $this->firstname = $firstname;
    }
    function set_lastname($lastname){
        $this->lastname = $lastname;
    }
    function set_email($email){
        $this->email = $email;
    }

    function set_password($password){
        $this->password = $password;
    }
    function get_firstname() {
        return $this->firstname;
    }
    function get_lastname() {
        return $this->lastname;
    }
    function get_email() {
        return $this->email;
    }
    function get_password() {
        return $this->password;
    }//put your code here
}
