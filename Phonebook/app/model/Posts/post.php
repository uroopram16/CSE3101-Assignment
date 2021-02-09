<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of user
 *
 * @author abiga
 */
class post extends model{
    public function getAllPost(){
        $sql="SELECT * FROM postview";
        $res= $this->connect()->query($sql);
        $numofrows=$res->num_rows;
        if($numofrows>0){
            while ($row=$res->fetch_assoc()){
                $record[]=$row;
            }
            return $record;
        }
    }
    public function getAllComments($str) {
        $sql="SELECT * FROM viewallpost where message= '".$str."'";
        $res= $this->connect()->query($sql);
        $numofrows=$res->num_rows;
        if($numofrows>0){
            while ($row=$res->fetch_assoc()){
                $record[]=$row;
            }
            return $record;
        }
    }
        
}

//put your code here
