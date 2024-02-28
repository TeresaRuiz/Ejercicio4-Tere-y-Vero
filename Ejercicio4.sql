CREATE DATABASE IF NOT EXISTS ejercicio4;

USE ejercicio4;


DELIMITER $$
CREATE FUNCTION generar_uuid() RETURNS CHAR(36)
BEGIN
  DECLARE v_uuid VARCHAR(36);
  SET v_uuid = UUID();
  RETURN v_uuid;
END;
$$
DELIMITER ;



CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

INSERT INTO categorias (nombre_categoria) VALUES ('Electrónica');
INSERT INTO categorias (nombre_categoria) VALUES ('Ropa');
INSERT INTO categorias (nombre_categoria) VALUES ('Hogar');
INSERT INTO categorias (nombre_categoria) VALUES ('Alimentos');
INSERT INTO categorias (nombre_categoria) VALUES ('Juguetes');
INSERT INTO categorias (nombre_categoria) VALUES ('Libros');
INSERT INTO categorias (nombre_categoria) VALUES ('Muebles');
INSERT INTO categorias (nombre_categoria) VALUES ('Cosméticos');
INSERT INTO categorias (nombre_categoria) VALUES ('Deportes');
INSERT INTO categorias (nombre_categoria) VALUES ('Automóviles');

SELECT*FROM categorias;

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(50) NOT NULL,
    direccion_proveedor VARCHAR(50),
    telefono_proveedor VARCHAR(10)
);

INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor A', 'Calle 123', '1234567890');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor B', 'Avenida XYZ', '9876543210');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor C', 'Carrera 456', '4561237890');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor D', 'Plaza Principal', '7894561230');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor E', 'Avenida Central', '3216549870');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor F', 'Calle Secundaria', '6549873210');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor G', 'Bulevar Norte', '1472583690');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor H', 'Camino Real', '2583691470');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor I', 'Paseo Marítimo', '3691472580');
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor J', 'Ruta Escénica', '9638527410');

SELECT*FROM proveedores;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre_producto VARCHAR(50) NOT NULL,
    id_proveedor INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    descripcion_producto  VARCHAR(225),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (1, 'Televisión', 1, 1000.00, 'Televisión de 50 pulgadas');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (1, 'Computadora', 2, 1500.00, 'Computadora de gama alta');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (1, 'Tablet', 3, 500.00, 'Tablet de 10 pulgadas');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (2, 'Camisa', 4, 50.00, 'Camisa de tela suave');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (2, 'Pantalón', 5, 70.00, 'Pantalón de jeans');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (2, 'Zapato', 6, 100.00, 'Zapato de cuero');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (3, 'Sofá', 7, 1000.00, 'Sofá de cuero');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (3, 'Mesa', 8, 500.00, 'Mesa de madera');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (3, 'Silla', 9, 100.00, 'Silla de madera');
INSERT INTO productos (id_categoria, nombre_producto, id_proveedor, precio_unitario, descripcion_producto) VALUES (4, 'Arroz', 10, 5.00, 'Arroz blanco')

SELECT*FROM productos;

CREATE TABLE inventarios (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad_disponible INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (1, 10, '2021-01-01');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (2, 20, '2021-01-02');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (3, 5, '2021-01-03');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (4, 10, '2021-01-04');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (5, 20, '2021-01-05');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (6, 15, '2021-01-06');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (7, 10, '2021-01-07');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (8, 20, '2021-01-08');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (9, 15, '2021-01-09');
INSERT INTO inventarios (id_producto, cantidad_disponible, fecha_ingreso) VALUES (10, 10, '2021-01-10');

SELECT*FROM inventarios;

CREATE TABLE movimientos_inventario (
    id_movimiento_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_inventario INT NOT NULL,
    tipo_movimiento VARCHAR(20) NULL,
    cantidad INT NOT NULL,
    cantidad_disponible INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (id_inventario) REFERENCES inventarios(id_inventario)
);

INSERT INTO movimientos_inventario (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, cantidad_disponible, fecha_ingreso) VALUES (1, 1, 'Entrada', 10, 10, '2021-01-01');
INSERT INTO movimientos_inventario (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, cantidad_disponible, fecha_ingreso) VALUES (2, 2, 'Entrada', 20, 20, '2021-01-02');
INSERT INTO movimientos_inventario (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, cantidad_disponible, fecha_ingreso) VALUES (4, 4, 'Entrada', 10, 10, '2021-01-04');
INSERT INTO movimientos_inventario (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, cantidad_disponible, fecha_ingreso) VALUES (5, 5, 'Entrada', 20, 20, '2021-01-05');
INSERT INTO movimientos_inventario (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, cantidad_disponible, fecha_ingreso) VALUES (6, 6, 'Entrada', 15, 15, '2021-01-06');
INSERT INTO movimientos_inventario (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, cantidad_disponible, fecha_ingreso) VALUES (7, 7, 'Entrada', 10, 10, '2021-01-07');
INSERT INTO movimientos_inventario (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, cantidad_disponible, fecha_ingreso) VALUES (8, 8, 'Entrada', 20, 20, '2021-01-08');
INSERT INTO movimientos_inventario (id_movimiento_inventario, id_inventario, tipo_movimiento,cantidad,cantidad_disponible ,fecha_ingreso) VALUES (9 ,9 ,'Entrada' ,15 ,15 ,'2021-01-09');
INSERT INTO movimientos_inventario (id_movimiento_inventario,id_inventario,tipo_movimiento,cantidad,cantidad_disponible ,fecha_ingreso) VALUES (10 ,10 ,'Entrada' ,10 ,10 ,'2021-01-10');



DELIMITER $$
CREATE TRIGGER tr_movimiento_inventario_salida
AFTER INSERT ON movimientos_inventario
FOR EACH ROW
BEGIN
  UPDATE inventario
  SET cantidad_disponible = cantidad_disponible - NEW.cantidad
  WHERE id_inventario = NEW.id_inventario;
END;
$$
DELIMITER ;
