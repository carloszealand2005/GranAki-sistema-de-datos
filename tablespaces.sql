-- Crear los tablespaces para almacenar la información del sistema 'Gran Aki'
--Tablspace para la información:
CREATE TABLESPACE GRANAKI_TBS_DATA
DATAFILE 'C:\Users\V I C T U S\OneDrive\Desktop\Semana 07 base de datos\tablespaces\tbs_data01.dbf' SIZE 50M
AUTOEXTEND ON NEXT 10M;

--Tablespace para los índices
CREATE TABLESPACE GRANAKI_TBS_INDEX
DATAFILE 'C:\Users\V I C T U S\OneDrive\Desktop\Semana 07 base de datos\tablespaces\tbs_index01.dbf' SIZE 20M
AUTOEXTEND ON NEXT 5M;

--Crear el usuario que manegará este sistema de base de datos
CREATE USER granaki_user IDENTIFIED BY granaki
DEFAULT TABLESPACE GRANAKI_TBS_DATA
TEMPORARY TABLESPACE TEMP;

--Asignarle los tablespace al usuario y darle permsisos
ALTER USER granaki_user QUOTA UNLIMITED ON GRANAKI_TBS_DATA;
ALTER USER granaki_user QUOTA UNLIMITED ON GRANAKI_TBS_INDEX;
GRANT CONNECT, RESOURCE TO granaki_user;
