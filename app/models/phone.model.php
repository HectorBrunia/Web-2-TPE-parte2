<?php

class PhoneModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_phones;charset=utf8', 'root', '');
    }

    function getAll($select = null, $valor=null, $sort = null, $order = null, $begin = null, $end = null){ 
        $query = "SELECT phones.* FROM phones";

        if($select != null && $valor != null){
            $query = "SELECT phones.* FROM phones WHERE $select = '$valor' ";
        }
        //Traer datos ordenados
        if(isset($select) && $sort != null && $order != null){
            $query = "SELECT $select FROM phones ORDER BY $sort $order";
        }
        //Traer datos paginados sin ordenar
        if(isset($select) && $begin != null && $end != null){
            $query = "SELECT $select FROM phones LIMIT $begin, $end";
        }
        //datos paginados ordenados
        if($select != null && $sort != null && $order != null && $begin != null && $end != null ){
            $query = "SELECT $select FROM phones ORDER BY $sort $order LIMIT $begin, $end";
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

    public function updatePhone($id, $model, $memory, $display, $cpugpu, $camera, $id_brand, $img=null) {
        $phone = $this->getPhoneById($id);
        unlink($phone->img);
        $pathImg = null;
        if ($img){
            $pathImg = $this->uploadImage($img);
            unlink($phone->img);
        }
        $query = $this->db->prepare("UPDATE phones  SET img=?, model=?, memory=?, display=?, cpugpu=?, camera=?, id_brand=?  WHERE id = ?");
        $query->execute([$pathImg, $model, $memory, $display, $cpugpu, $camera, $id_brand,$id]);
    }

    function deletePhone($id) {
        $phone = $this->getPhoneById($id);
        $query = $this->db->prepare('DELETE FROM phones WHERE phones . id = ?');
        $query->execute([$phone->id]);
    }

}