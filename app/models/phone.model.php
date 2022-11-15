<?php

class PhoneModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_phones;charset=utf8', 'root', '');
    }

    function getAll($select = null, $value=null, $sort = null, $order = null, $page = null){ 
        $query = "SELECT phones.* FROM phones ";
        if($select != null && $value != null){
            $query .= " WHERE $select = '$value' ";
        }
        if($sort != null && $order != null){
            $query .= "ORDER BY $sort $order ";
        }
        if($page != null ){
            $cant =10;
            $begin = ($page-1)*$cant;
            $query .= "LIMIT $begin, $cant ";
        }
        $query = $this->db->prepare($query);
        $query->execute();
        $phones = $query->fetchAll(PDO::FETCH_OBJ);
        return $phones;
        }

    public function getPhoneById($id) {
        $query = $this->db->prepare("SELECT phones.* FROM phones WHERE id = $id");
        $query->execute();
        $phone = $query->fetch(PDO::FETCH_OBJ);
        return $phone;
    }

    public function insertPhone($model, $memory, $display, $cpugpu, $camera, $id_brand, $img = null) {
        $query = $this->db->prepare("INSERT INTO phones (model, memory, display, cpugpu, camera, id_brand, img) VALUES (?, ?, ?, ?, ?,?,?)");
        $query->execute([$model, $memory, $display, $cpugpu, $camera, $id_brand, $img]);
        return $this->db->lastInsertId();
    }

    function deletePhone($id) {
        $phone = $this->getPhoneById($id);
        $query = $this->db->prepare('DELETE FROM phones WHERE id = ?');
        $query->execute([$phone->id]);
    }

    public function updatePhone($id, $model, $memory, $display, $cpugpu, $camera, $id_brand, $img=null) {
        $query = $this->db->prepare("UPDATE phones  SET img=?, model=?, memory=?, display=?, cpugpu=?, camera=?, id_brand=?  WHERE id = ?");
        $query->execute([$img, $model, $memory, $display, $cpugpu, $camera, $id_brand,$id]);
    }

}