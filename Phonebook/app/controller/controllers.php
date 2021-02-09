<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of controllers
 *
 * @author abiga
 */
require_once '../model/AccountUser/login.php';
class controllers {
    public $model;
    public function __construct() {
        $this->model=new login;      
    }
    public function call_login() {
        $res=$this->model->checklogin();
    }
}
