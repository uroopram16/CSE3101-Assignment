<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of model
 *
 * @author abiga
 */
class model {
    private $dbhost;
    private $dbuser;
    private $dbpass;
    private $db;
    
    protected function connect() {
        $this->dbhost="localhost";
        $this->dbuser="root";
        $this->dbpass="";
        $this->db="inspogram";
        $conn= mysqli_connect($this->dbhost,$this->dbuser,$this->dbpass,$this->db);
        return $conn;
    }//put your code here
}
