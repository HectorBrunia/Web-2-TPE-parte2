<?php
require_once './libs/Router.php';
require_once './app/controllers/phone-api.controller.php';

// crea el router
$router = new Router();

// defina la tabla de ruteo
$router->addRoute('phones', 'GET', 'PhoneApiController', 'getPhones');
$router->addRoute('phones/:ID', 'GET', 'PhoneApiController', 'getPhone');
$router->addRoute('phones/:ID', 'DELETE', 'PhoneApiController', 'deletePhone');
$router->addRoute('phones', 'POST', 'PhoneApiController', 'insertPhone'); 

// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
