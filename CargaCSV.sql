USE `[db1]practica_3`;
#CARGAS MASIVAS
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Pais.csv'
	INTO TABLE PAIS
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
    (
    @var1,
    @var2)
    SET id_pais= if(@var1='',NULL,@var1),
    nombrePais=if(@var2='',NULL,@var2);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cliente.csv'
	INTO TABLE CLIENTE
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Vendedor.csv'
	INTO TABLE VENDEDOR
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Categoria.csv'
	INTO TABLE CATEGORIA
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;    
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Producto.csv'
	INTO TABLE PRODUCTO
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orden.csv'
	INTO TABLE ORDEN
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
(id_orden, linea_orden,@fecha_orden, id_cliente,id_vendedor,id_producto, cantidad)
set fecha_orden=str_to_date(@fecha_orden, '%d/%m/%Y');

#CONTEO DE CADA UNA DE LAS TABLAS CARGADAS.
SELECT COUNT(*) FROM PAIS;
SELECT COUNT(*) FROM CLIENTE;
SELECT COUNT(*) FROM VENDEDOR;
SELECT COUNT(*) FROM CATEGORIA;
SELECT COUNT(*) FROM PRODUCTO;
SELECT COUNT(*) FROM ORDEN;

    
	


