---- Script para consultas

SELECT * FROM GranAki;
SELECT * FROM USER_OBJECTS;
INSERT INTO GranAki VALUES (1, 'Gran Aki 1', 'Juan de Alderete', 'Loja', 'Manager1', 
TO_DATE('2015-01-01', 'YYYY-MM-DD'),'8am-8pm LUNES-SABADO y 8am-4pm DOMINGO');

--Insertar departamentos de los empleados:
INSERT INTO Departamento (id_departamento, nombre_departamento) VALUES (1, 'Abastos');
INSERT INTO Departamento (id_departamento, nombre_departamento) VALUES (2, 'Mercancias');
INSERT INTO Departamento (id_departamento, nombre_departamento) VALUES (3, 'Perecibles');
INSERT INTO Departamento (id_departamento, nombre_departamento) VALUES (4, 'Principal'); -- Tiempo completo
INSERT INTO Departamento (id_departamento, nombre_departamento) VALUES (5, 'Horario Flexible');

---Insertar los empleados:
-- ABASTOS

SELECT e.* FROM empleado e;
INSERT INTO Empleado VALUES (1, 'JORGE NALVAY', 1, 'jorge.nalvay@granaki.com', TO_DATE('13-06-2022','DD-MM-YYYY'), 'Dirección 1', 475.50, 1);
INSERT INTO Empleado VALUES (2, 'SANTIAGO CANGO.', 1, 'santiago.cango@granaki.com', TO_DATE('22-03-2021','DD-MM-YYYY'), 'Dirección 2', 530.00, 1);
INSERT INTO Empleado VALUES (3, 'EDUARDO SÁNCHEZ', 1, 'eduardo.sanchez@granaki.com', TO_DATE('10-11-2019','DD-MM-YYYY'), 'Dirección 3', 600.00, 1);
INSERT INTO Empleado VALUES (4, 'LUIS CUEVA', 1, 'luis.cueva@granaki.com', TO_DATE('01-04-2017','DD-MM-YYYY'), 'Dirección 4', 410.25, 1);
INSERT INTO Empleado VALUES (5, 'PEDRO GORDILLO', 1, 'pedro.gordillo@granaki.com', TO_DATE('17-12-2020','DD-MM-YYYY'), 'Dirección 5', 580.75, 1);
INSERT INTO Empleado VALUES (6, 'JONATHAN MAURAD', 1, 'jonathan.maurad@granaki.com', TO_DATE('25-08-2018','DD-MM-YYYY'), 'Dirección 6', 495.00, 1);
INSERT INTO Empleado VALUES (7, 'JONATHAN JAPON', 1, 'jonathan.japon@granaki.com', TO_DATE('06-09-2023','DD-MM-YYYY'), 'Dirección 7', 455.80, 1);

-- MERCANCIAS
INSERT INTO Empleado VALUES (8, 'YADIRA TORRES', 2, 'yadira.torres@granaki.com', TO_DATE('04-05-2021','DD-MM-YYYY'), 'Dirección 8', 470.90, 1);
INSERT INTO Empleado VALUES (9, 'ADRIAN TUTIN', 2, 'adrian.tutin@granaki.com', TO_DATE('18-07-2019','DD-MM-YYYY'), 'Dirección 9', 510.50, 1);
INSERT INTO Empleado VALUES (10, 'KARLA HERRERA.', 2, 'karla.herrera@granaki.com', TO_DATE('22-01-2020','DD-MM-YYYY'), 'Dirección 10', 530.20, 1);
INSERT INTO Empleado VALUES (11, 'PABLO TAPIA', 2, 'pablo.tapia@granaki.com', TO_DATE('03-11-2016','DD-MM-YYYY'), 'Dirección 11', 560.00, 1);
INSERT INTO Empleado VALUES (12, 'DANNY SOTO', 2, 'danny.soto@granaki.com', TO_DATE('15-10-2022','DD-MM-YYYY'), 'Dirección 12', 470.00, 1);
INSERT INTO Empleado VALUES (13, 'RONALD ENCALADA', 2, 'ronald.encalada@granaki.com', TO_DATE('29-02-2020','DD-MM-YYYY'), 'Dirección 13', 540.00, 1);
INSERT INTO Empleado VALUES (14, 'BAGNER CAMPOVERDE', 2, 'bagner.campoverde@granaki.com', TO_DATE('08-03-2018','DD-MM-YYYY'), 'Dirección 14', 480.25, 1);
INSERT INTO Empleado VALUES (15, 'ALEXIA TORRES', 2, 'alexia.torres@granaki.com', TO_DATE('12-08-2023','DD-MM-YYYY'), 'Dirección 15', 515.00, 1);

-- PERECIBLES
INSERT INTO Empleado VALUES (16, 'BELEN SOLANO', 3, 'belen.solano@granaki.com', TO_DATE('01-09-2015','DD-MM-YYYY'), 'Dirección 16', 500.00, 1);
INSERT INTO Empleado VALUES (17, 'DIANA LUNA', 3, 'diana.luna@granaki.com', TO_DATE('20-04-2021','DD-MM-YYYY'), 'Dirección 17', 505.00, 1);
INSERT INTO Empleado VALUES (18, 'REBECA CAMACHO', 3, 'rebeca.camacho@granaki.com', TO_DATE('11-06-2020','DD-MM-YYYY'), 'Dirección 18', 520.00, 1);
INSERT INTO Empleado VALUES (19, 'CHRISTIAN CUMBICOS', 3, 'christian.cumbicos@granaki.com', TO_DATE('16-12-2019','DD-MM-YYYY'), 'Dirección 19', 530.00, 1);
INSERT INTO Empleado VALUES (20, 'ANGEL COLLAHUAZO', 3, 'angel.collahuazo@granaki.com', TO_DATE('24-10-2022','DD-MM-YYYY'), 'Dirección 20', 510.00, 1);

-- TIEMPO COMPLETO (principal)
INSERT INTO Empleado VALUES (21, 'DIANA SALGADO', 4, 'diana.salgado@granaki.com', TO_DATE('19-07-2018','DD-MM-YYYY'), 'Dirección 21', 700.00, 1);
INSERT INTO Empleado VALUES (22, 'MARITZA SANCHEZ', 4, 'maritza.sanchez@granaki.com', TO_DATE('23-05-2017','DD-MM-YYYY'), 'Dirección 22', 730.00, 1);
INSERT INTO Empleado VALUES (23, 'ANGEL ESCOBAR', 4, 'angel.escobar@granaki.com', TO_DATE('09-01-2016','DD-MM-YYYY'), 'Dirección 23', 740.00, 1);

-- HORARIO FLEXIBLE
INSERT INTO Empleado VALUES (24, 'TATIANA MOROCHO', 5, 'tatiana.morocho@granaki.com', TO_DATE('05-09-2020','DD-MM-YYYY'), 'Dirección 24', 520.00, 1);
