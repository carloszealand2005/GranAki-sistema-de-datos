------ Flujo de transacciones esenciales dentro de este sistema: 

----TRANSACCION CUANDO SE COMPRA UN PRODUCTO
DECLARE
    v_id_transaccion NUMBER := 1; --ID de esta transacción que se llevará a cabo 
    id_cliente NUMBER := 1; --Cliente de ejemplo: Carlos
    id_metodo_pago NUMBER := 1; --Metodo de pago: Efectivo
    id_tienda NUMBER := 1; --Gran Aki donde se está llevando a cabo la transacción
    
    --Definir los productos comprados:
    id_producto1 NUMBER := 1; --Jabón líquido
    id_producto2 NUMBER := 2; --Papel higiénico
    
BEGIN
    --Registrar transaccion de los productos comprados
    INSERT INTO Transaccion (id_transaccion, fecha, id_cliente, id_tienda, id_metodo, total)
    VALUES (v_id_transaccion, SYSDATE, id_cliente, id_tienda, id_metodo_pago, 25.00);  

    --Registrar todos los productos de esta transacción: 
    INSERT INTO DetalleTransaccion (id_transaccion, id_producto, cantidad, subtotal)
    VALUES (v_id_transaccion, id_producto1, 2, 20.00);

    INSERT INTO DetalleTransaccion (id_transaccion, id_producto, cantidad, subtotal)
    VALUES (v_id_transaccion, id_producto2, 1, 5.00);


    -- Actualizar el stock de los productos de esta transacción
    --En caso de no existir suficiente stock, hará rollback de todo esto y se cancelará la operacióm.
    UPDATE Producto SET stock = stock - 2 WHERE id_producto = id_producto1;
    UPDATE Producto SET stock = stock - 1 WHERE id_producto = id_producto2;



    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;


---CONFIRMACIONES
---Consultar el detalle transaccion que se llevó a cabo
SELECT * FROM DetalleTransaccion WHERE id_transaccion

---Seleccionar las transacciones y el GRAN AKI al que pertenencen 
SELECT t.fecha, t.total, ga.nombre FROM transaccion t
JOIN GranAki ga ON t.id_tienda = ga.id_tienda;



------SENTENCIAS VARIAS
---Consultar todos los productos de X gran aki
SELECT g.nombre, p.nombre, p.precio_unitario, p.stock, p.fecha_expiracion
FROM producto p
JOIN GranAki g ON p.id_tienda = g.id_tienda
WHERE g.id_tienda = 1;


---Consultar todos los empleados de X gran aki
SELECT g.nombre, e.nombre, e.email, e.fecha_ingreso, e.direccion, e.sueldo
FROM empleado e
JOIN GranAki g ON e.id_tienda = g.id_tienda
WHERE g.id_tienda = 1;

--Historial de transacciones de un cliente
SELECT c.nombre, t.id_transaccion, t.fecha, t.total
FROM transaccion t
JOIN cliente c ON t.id_cliente = c.id_cliente
WHERE c.id_cliente = 1;
