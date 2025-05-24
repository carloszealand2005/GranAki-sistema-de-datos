-- Script semana 07 base de datos avanzada
----SENTENCIAS DDL para crear:
-- Tabla Departamento
CREATE TABLE Departamento (
    id_departamento NUMBER PRIMARY KEY,
    nombre_departamento VARCHAR(50) NOT NULL
);



-- Tabla GranAki (tienda)
CREATE TABLE GranAki (
    id_tienda NUMBER PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    manager VARCHAR(30) NOT NULL,
    fecha_apertura DATE NOT NULL,
    horario VARCHAR(50)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    id_empleado NUMBER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_departamento NUMBER,
    email VARCHAR(30),
    fecha_ingreso DATE,
    direccion VARCHAR(50),
    sueldo DECIMAL(8,2) CHECK (sueldo >= 200),
    id_tienda NUMBER,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
    FOREIGN KEY (id_tienda) REFERENCES GranAki(id_tienda)
);

-- Tabla CategoriaProducto
CREATE TABLE CategoriaProducto (
    id_categoria NUMBER PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto NUMBER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria NUMBER,
    precio_unitario DECIMAL(6,2) NOT NULL,
    stock INT CHECK (stock >= 0),
    fecha_expiracion DATE,
    id_tienda NUMBER, -- ID de la tienda al que pertenece este producto
    FOREIGN KEY (categoria) REFERENCES CategoriaProducto(id_categoria),
    FOREIGN KEY (id_tienda) REFERENCES GranAki(id_tienda)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente NUMBER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(35)
);

-- Tabla MetodoPago
CREATE TABLE MetodoPago (
    id_metodo NUMBER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

-- Tabla Transaccion
CREATE TABLE Transaccion (
    id_transaccion NUMBER PRIMARY KEY,
    fecha TIMESTAMP NOT NULL,
    total DECIMAL(6,2) NOT NULL check (total >= 0),
    id_metodo NUMBER,
    id_cliente NUMBER,
    id_tienda NUMBER,
    FOREIGN KEY (id_metodo) REFERENCES MetodoPago(id_metodo),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_tienda) REFERENCES GranAki(id_tienda)
);

-- Tabla DetalleTransaccion
CREATE TABLE DetalleTransaccion (
    id_producto NUMBER NOT NULL,
    id_transaccion NUMBER NOT NULL,
    cantidad NUMBER NOT NULL check (cantidad >= 0),
    subtotal DECIMAL(6,2) NOT NULL check (subtotal >= 0),
    PRIMARY KEY (id_producto, id_transaccion),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_transaccion) REFERENCES Transaccion(id_transaccion)
);

----------------- Diccionario de datos:----------------


-----------DEPARTAMENTO
COMMENT ON TABLE Departamento IS 'Almacena los distintos departamentos a los que puede pertenecer un empleado.';

COMMENT ON COLUMN Departamento.id_departamento IS 'Identificador único del departamento.';
COMMENT ON COLUMN Departamento.nombre_departamento IS 'Nombre del departamento.';

----------GRAN AKI
COMMENT ON TABLE GranAki IS 'Contiene información sobre cada tienda de la red Gran Aki.';

COMMENT ON COLUMN GranAki.id_tienda IS 'Identificador único de cada tienda.';
COMMENT ON COLUMN GranAki.nombre IS 'Nombre de la tienda.';
COMMENT ON COLUMN GranAki.direccion IS 'Dirección exacta de la tienda.';
COMMENT ON COLUMN GranAki.ciudad IS 'Ciudad donde se encuentra ubicada la tienda.';
COMMENT ON COLUMN GranAki.manager IS 'Nombre del gerente a cargo de la tienda.';
COMMENT ON COLUMN GranAki.fecha_apertura IS 'Fecha en que la tienda fue inaugurada.';
COMMENT ON COLUMN GranAki.horario IS 'Horario de atención al público.';


---------EMPLEADO:
COMMENT ON TABLE Empleado IS 'Contiene la información personal y laboral de los empleados.';

COMMENT ON COLUMN Empleado.id_empleado IS 'Identificador único del empleado.';
COMMENT ON COLUMN Empleado.nombre IS 'Nombre completo del empleado.';
COMMENT ON COLUMN Empleado.id_departamento IS 'Departamento al que pertenece el empleado (clave foránea).';
COMMENT ON COLUMN Empleado.email IS 'Correo electrónico del empleado.';
COMMENT ON COLUMN Empleado.fecha_ingreso IS 'Fecha en que el empleado ingresó a trabajar.';
COMMENT ON COLUMN Empleado.direccion IS 'Dirección de residencia del empleado.';
COMMENT ON COLUMN Empleado.sueldo IS 'Sueldo mensual del empleado.';
COMMENT ON COLUMN Empleado.id_tienda IS 'Tienda en la que labora el empleado (clave foránea).';


----------CATEGORIA PRODUCTO
COMMENT ON TABLE CategoriaProducto IS 'Lista de categorías en las que se agrupan los productos.';

COMMENT ON COLUMN CategoriaProducto.id_categoria IS 'Identificador único de la categoría.';
COMMENT ON COLUMN CategoriaProducto.categoria IS 'Nombre de la categoría.';



------------PRODUCTO:
COMMENT ON TABLE Producto IS 'Registra todos los productos disponibles para la venta en las tiendas.';

COMMENT ON COLUMN Producto.id_producto IS 'Identificador único del producto.';
COMMENT ON COLUMN Producto.nombre IS 'Nombre del producto.';
COMMENT ON COLUMN Producto.categoria IS 'Categoría a la que pertenece el producto (clave foránea).';
COMMENT ON COLUMN Producto.precio_unitario IS 'Precio de venta por unidad del producto.';
COMMENT ON COLUMN Producto.stock IS 'Cantidad disponible del producto en inventario.';
COMMENT ON COLUMN Producto.fecha_expiracion IS 'Fecha de vencimiento del producto, si aplica.';
COMMENT ON COLUMN Producto.id_tienda IS 'Tienda donde se encuentra el producto (clave foránea).';


---------CLIENTE:
COMMENT ON TABLE Cliente IS 'Contiene los datos de los clientes registrados en la red de tiendas.';

COMMENT ON COLUMN Cliente.id_cliente IS 'Identificador único del cliente.';
COMMENT ON COLUMN Cliente.nombre IS 'Nombre completo del cliente.';
COMMENT ON COLUMN Cliente.telefono IS 'Número de teléfono del cliente.';
COMMENT ON COLUMN Cliente.email IS 'Correo electrónico del cliente.';

---------METODO PAGO:
COMMENT ON TABLE MetodoPago IS 'Define los distintos métodos de pago disponibles en las tiendas.';

COMMENT ON COLUMN MetodoPago.id_metodo IS 'Identificador único del método de pago.';
COMMENT ON COLUMN MetodoPago.nombre IS 'Nombre del método de pago (Ej: Efectivo, Tarjeta).';
COMMENT ON COLUMN MetodoPago.descripcion IS 'Descripción adicional del método de pago.';


-------------TRANSACCION:
COMMENT ON TABLE Transaccion IS 'Registra las transacciones de compra realizadas por los clientes.';

COMMENT ON COLUMN Transaccion.id_transaccion IS 'Identificador único de la transacción.';
COMMENT ON COLUMN Transaccion.fecha IS 'Fecha y hora en la que se realizó la transacción.';
COMMENT ON COLUMN Transaccion.total IS 'Monto total pagado en la transacción.';
COMMENT ON COLUMN Transaccion.id_metodo IS 'Método de pago utilizado (clave foránea).';
COMMENT ON COLUMN Transaccion.id_cliente IS 'Cliente que realizó la compra (clave foránea).';
COMMENT ON COLUMN Transaccion.id_tienda IS 'Tienda en la que se realizó la transacción (clave foránea).';

-------------DETALLE TRANSACCION
COMMENT ON TABLE DetalleTransaccion IS 'Representa el detalle de productos incluidos en una transacción. Tiene una llave primaria compuesta (producto & transaccion)';

COMMENT ON COLUMN DetalleTransaccion.id_producto IS 'Producto incluido en la transacción (clave foránea).';
COMMENT ON COLUMN DetalleTransaccion.id_transaccion IS 'Transacción a la que pertenece el detalle (clave foránea).';
COMMENT ON COLUMN DetalleTransaccion.cantidad IS 'Cantidad de unidades del producto vendidas.';
COMMENT ON COLUMN DetalleTransaccion.subtotal IS 'Subtotal correspondiente al producto (precio * cantidad).';



