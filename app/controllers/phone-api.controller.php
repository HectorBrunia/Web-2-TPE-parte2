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
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getPhones($params = null) {
        $columns = array('id','model','img','memory','display','cpugpu','camera','id_brand');
        $select = $_GET["select"] ?? null;
        $value = $_GET["value"] ?? null;
        $sort = $_GET["sort"] ?? null;
        $order = $_GET["order"] ?? null; 
        $page= $_GET["page"] ?? null;
           
        if((in_array($select, $columns) || $select==null) && (in_array($sort, $columns)|| $sort==null)){
            $phones = $this->model->getAll($select, $value, $sort, $order, $page);
            if ($phones)
                $this->view->response($phones,200);
            else 
                $this->view->response("no se encontraron telefonos", 404);
        }else{
            $this->view->response("la columna por la que quiere filtrar/ ordenar no existe", 400);
        }
    }

    public function getPhone($params = null) {
        $id = $params[':ID'];
        $phone = $this->model->getPhoneById($id);
        if ($phone)
            $this->view->response($phone,200);
        else 
            $this->view->response("El telefono con el id=$id no existe", 404);
    }

    public function deletePhone($params = null) {
        $id = $params[':ID'];
        $phone = $this->model->getPhoneById($id);
        if ($phone) {
            $this->model->deletePhone($id);
            $this->view->response($phone,200);
        } else 
            $this->view->response("El telefono con el id=$id no existe", 404);
    }

    public function insertPhone() {
        $phone = $this->getData();
        if (empty($phone->model) || empty($phone->memory) || empty($phone->display)|| empty($phone->cpugpu)|| empty($phone->camera)|| empty($phone->id_brand)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insertPhone($phone->model, $phone->memory, $phone->display,$phone->cpugpu,$phone->camera,$phone->id_brand);
            $phone = $this->model->getPhoneById($id);
            $this->view->response($phone, 201);
        }
    }
    public function updatePhone($params = null) {
        $id = $params[':ID'];
        $phone = $this->model->getPhoneById($id);
        if ($phone){
            $phone = $this->getData();
            if (empty($phone->model) || empty($phone->memory) || empty($phone->display)|| empty($phone->cpugpu)|| empty($phone->camera)|| empty($phone->id_brand)) {
                $this->view->response("Complete los datos", 400);
            } else {
                $this->model->updatePhone($id, $phone->model, $phone->memory, $phone->display,$phone->cpugpu,$phone->camera,$phone->id_brand);
                $phone = $this->model->getPhoneById($id);
                $this->view->response($phone, 201);
            }
        }
        else 
            $this->view->response("El telefono con el id=$id no existe", 404);
    }
}
