El endpoint de la API es: http://localhost/tpe2/

Obtener por todos: http://localhost/tpe2/api/phones 

Obtener por ID: http://localhost/tpe2/api/phones/id 

ordenar por cualquier columna:
    .Orden ascendiente: http://localhost/tpe2/api/phones?sort=(nombre_de_la_columna)&order=asc
    .Orden descendiente: http://localhost/tpe2/api/phones?sort=(nombre_de_la_columna)&order=desc

Obtener lista paginada: http://localhost/tpe2/api/phones?page=1

Obtener lista filtrada por cualquier columna: http://localhost/tpe2/api/phones?select=(columna)&value=(valor)

Se pueden hacer distinas combinaciones como las siguientes:
    obtener la pagina 1 de los celulares cuyo id_brand sea 1 y que se orenen por modelo asendente:
    http://localhost/tpe2/api/phones?select=id_brand&value=1&sort=model&order=asc&page=1.
    obtener la pagina 1 de los celulares cuyo modelo se Moto edg 30:
    http://localhost/tpe2/api/phones?select=model&value=Moto edg 30&page=1.
    obtener todos lo celulares cuyo modelo se Moto edg 30 ordenados por memoria:
    http://localhost/tpe2/api/phones?select=model&value=Moto edg 30&sort=memory&order=acs.
    obtener la pagina 1 de todos los celulares ordenados por modelo:
    http://localhost/tpe2/api/phones?sort=model&order=asc&page=1.

Para agregar un objeto a imprimir: http://localhost/tpe2/api/phones
con un body como el siguiente:
{
    "model": "Moto edg 30",
    "memory": "RAM 8 GB /Int. Memory\t256 GB",
    "display": "OLED de 6,5\" FullHD+ con HDR10+144 Hz de tasa de refresco",
    "cpugpu": "Snapdragon 778/ Adreno 642L",
    "camera": "Principal de 50 Mpx (f/1,8)\r\nGran angular de 50 Mpx (f/2,2) y 114º\r\nProfundidad de 2 Mpx (f/2,4)",
    "id_brand": 1
}

para modificar un celular http://localhost/tpe2/api/phones/id
con un body como el siguiente:
{
    "model": "Moto edg 30",
    "memory": "RAM 8 GB /Int. Memory\t256 GB",
    "display": "OLED de 6,5\" FullHD+ con HDR10+144 Hz de tasa de refresco",
    "cpugpu": "Snapdragon 778/ Adreno 642L",
    "camera": "Principal de 50 Mpx (f/1,8)\r\nGran angular de 50 Mpx (f/2,2) y 114º\r\nProfundidad de 2 Mpx (f/2,4)",
    "id_brand": 1
}

para eliminar un celular: http://localhost/tpe2/api/phones/id 
