<?php
require_once './app/models/phone.model.php';
require_once './app/views/api.view.php';

class PhoneApiController {
    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new PhoneModel();
        $this->view = new ApiView();
        
        // lee el body del request
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getPhones($params = null) {
        $columns = array('model' => 'model ',
        'img' => 'img ',
        'memory' => 'memory ',
        'display' => 'display ',
        'cpugpu' => 'cpugpu ',
        'camera' => 'camera ',
        'id_brand' => 'id_brand '
        );

        $select = $_GET["select"] ?? null;
        $valor = $_GET["valor"] ?? null;
        $sort = $_GET["sort"] ?? null;
        $order = $_GET["order"] ?? null; 
        $begin= $_GET["begin"] ?? null;
        $end = $_GET["end"] ?? null;

        $phones = $this->model->getAll($select, $valor, $sort, $order, $begin, $end);

        //Select de cualquier columna               
        if(in_array($select, $columns) || $select == "*"){
                $phones = $this->model->getAll($select);
        } //Datos ordenados de cualquier columna
        else if (in_array($select, $columns) || $select == "*" && isset($sort) && isset($order) && strtoupper($order) == "ASC" || strtoupper($order) == "DESC"){
            $phones = $this->model->getAll($select, $sort, $order);
        } //Datos paginados ordenados de cualquier columna
        else if ($sort && $begin >= "0" && $begin <= "9" && $end >= "0" && $end <= "9") {
            $phones = $this->model->getAll($select, $sort, $order, $begin, $end);
        } 
      
        $phones = $this->model->getAll($select, $valor, $sort, $order, $begin, $end);
    
        $this->view->response($phones);
    }

    public function getPhone($params = null) {
        // obtengo el id del arreglo de params
        $id = $params[':ID'];
        $phone = $this->model->getPhoneById($id);

        // si no existe devuelvo 404
        if ($phone)
            $this->view->response($phone);
        else 
            $this->view->response("La tarea con el id=$id no existe", 404);
    }

    public function deletePhone($params = null) {
        $id = $params[':ID'];

        $phone = $this->model->getPhoneById($id);
        if ($phone) {
            $this->model->deletePhone($id);
            $this->view->response($phone);
        } else 
            $this->view->response("El telefono con el id=$id no existe", 404);
    }

    public function insertPhone($params = null) {
        $phone = $this->getData();

        if (empty($phone->model) || empty($phone->memory) || empty($phone->display)|| empty($phone->cpugpu)|| empty($phone->camera)|| empty($phone->id_brand)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insertPhone($phone->model, $phone->memory, $phone->display,$phone->cpugpu,$phone->camera,$phone->id_brand);
            $phone = $this->model->getPhoneById($id);
            $this->view->response($phone, 201);
        }
    }

}
