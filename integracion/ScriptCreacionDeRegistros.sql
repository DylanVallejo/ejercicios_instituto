--   INTEGRANTE 2 - INSERCION DE DATOS (DML)  Fernanda
USE Ventas;
GO

INSERT INTO Stores VALUES
    (1,'Hogar Centro Quito','0991111111','centro@hogar.ec','Av. Amazonas','Quito','EC','11111'),
    (2,'Hogar Norte Quito','0991111112','norte@hogar.ec','Av. Eloy Alfaro','Quito','EC','22222'),
    (3,'Hogar Sur Quito','0991111113','sur@hogar.ec','Av. 6 de diciembre','Quito','EC','33333'),
    (4,'Hogar Cuenca Centro','0991111114','cuenca@hogar.ec','Av. Cuenca','Cuenca','EC','44444'),
    (5,'Hogar Guayaquil Norte','0991111115','gye@hogar.ec','Av. Guayaquil','Guayaquil','EC','55555'),
    (6,'Hogar Manta','0991111116','manta@hogar.ec','Av. Manta','Manta','EC','66666'),
    (7,'Hogar Ambato','0991111117','ambato@hogar.ec',' Av.Ambato','Ambato','EC','77777'),
    (8,'Hogar Loja','0991111118','loja@hogar.ec','Av. Loja','Loja','EC','88888'),
    (9,'Hogar Machala','0991111119','machala@hogar.ec','Av. Machala','Machala','EC','99999'),
    (10,'Hogar Portoviejo','0991111120','portoviejo@hogar.ec','Av. Portoviejo','Portoviejo','EC','00000');

INSERT INTO Staffs VALUES
    (1,'Carlos','Benitez','carlos@hogar.ec','0992222221',1,1,NULL),
    (2,'Ana','Mendoza','ana@hogar.ec','0992222222',1,1,1),
    (3,'Luis','Paredes','luis@hogar.ec','0992222223',1,2,NULL),
    (4,'Maria','Ortega','maria@hogar.ec','0992222224',1,2,3),
    (5,'Pedro','Salazar','pedro@hogar.ec','0992222225',1,3,NULL),
    (6,'Sofa','Vera','sofia@hogar.ec','0992222226',1,3,5),
    (7,'Juan','Reyes','juan@hogar.ec','0992222227',1,4,NULL),
    (8,'Paula','Castillo','paula@hogar.ec','0992222228',1,4,7),
    (9,'Miguel','Ramos','miguel@hogar.ec','0992222229',1,5,NULL),
    (10,'Lucia','Navarro','lucia@hogar.ec','0992222230',1,5,9);

INSERT INTO SystemUser VALUES
    ('U1','admin','1234','ADMIN',1),
    ('U2','ventas_centro','1234','USER',2),
    ('U3','ventas_norte','1234','USER',3),
    ('U4','ventas_sur','1234','USER',4),
    ('U5','ventas_cuenca','1234','USER',5),
    ('U6','ventas_gye','1234','USER',6),
    ('U7','ventas_manta','1234','USER',7),
    ('U8','ventas_ambato','1234','USER',8),
    ('U9','ventas_loja','1234','USER',9),
    ('U10','ventas_machala','1234','USER',10);

INSERT INTO Customers VALUES
    (1,'Andres','Paredes','0993333331','andres@mail.ec','Av. Occidental','Quito','Pichincha','17001'),
    (2,'Maria','Torres','0993333332','maria@mail.ec','Av. De la Prensa','Quito','Pichincha','17002'),
    (3,'Jose','Ramirez','0993333333','jose@mail.ec','Av. Naciones Unidas','Quito','Pichincha','17003'),
    (4,'Patricia','Gomez','0993333334','patricia@mail.ec','Av. Solano','Cuenca','Azuay','01001'),
    (5,'Daniel','Lopez','0993333335','daniel@mail.ec','Av. Remigio Crespo','Cuenca','Azuay','01002'),
    (6,'Carla','Mora','0993333336','carla@mail.ec','Av. 9 de Octubre','Guayaquil','Guayas','09001'),
    (7,'Fernando','Vega','0993333337','fernando@mail.ec','Av. Samborondon','Guayaquil','Guayas','09002'),
    (8,'Rosa','Jimenez','0993333338','rosa@mail.ec','Av. America','Ambato','Tungurahua','18001'),
    (9,'Diego','Quishpe','0993333339','diego@mail.ec','Av. Universitaria','Loja','Loja','11001'),
    (10,'Elena','Zambrano','0993333340','elena@mail.ec','Av. Manabi','Portoviejo','Manabi','13001');

INSERT INTO Categories VALUES
    (1,'Muebles'),
    (2,'Electrodomesticos'),
    (3,'Cocina'),
    (4,'Dormitorio'),
    (5,'Sala'),
    (6,'Comedor'),
    (7,'Limpieza'),
    (8,'Oficina'),
    (9,'Decoracion'),
    (10,'Jardin');

INSERT INTO Brands VALUES
    (1,'Indurama'),
    (2,'Mabe'),
    (3,'Fiberglass Ecuador'),
    (4,'Colineal'),
    (5,'Artefacta'),
    (6,'Comandato'),
    (7,'Samsung'),
    (8,'LG'),
    (9,'Whirlpool'),
    (10,'Electrolux');

INSERT INTO Products VALUES
    (1,'Refrigeradora No Frost 14 pies',1,2,2024,650.00),
    (2,'Cocina a gas 4 quemadores',2,3,2024,480.00),
    (3,'Juego de comedor 6 puestos',4,6,2024,890.00),
    (4,'Sofa seccional en L',4,5,2024,1150.00),
    (5,'Cama matrimonial con cabecera',3,4,2024,720.00),
    (6,'Lavadora automatica 18 kg',9,2,2024,830.00),
    (7,'Escritorio de oficina con cajones',4,8,2024,310.00),
    (8,'Horno microondas digital',7,3,2024,260.00),
    (9,'Juego de sala completo',4,5,2024,1350.00),
    (10,'Refrigeradora side by side',10,2,2024,1400.00);

INSERT INTO Stocks VALUES
    (1,1,60),(1,2,55),(1,3,40),(1,4,35),(1,5,50),(1,6,45),(1,7,70),(1,8,65),(1,9,30),(1,10,25),
    (2,1,50),(2,2,48),(2,3,35),(2,4,30),(2,5,42),(2,6,38),(2,7,60),(2,8,55),(2,9,28),(2,10,22),
    (3,1,45),(3,2,42),(3,3,30),(3,4,28),(3,5,38),(3,6,35),(3,7,55),(3,8,50),(3,9,26),(3,10,20),
    (4,1,40),(4,2,38),(4,3,28),(4,4,25),(4,5,35),(4,6,32),(4,7,50),(4,8,45),(4,9,24),(4,10,18),
    (5,1,55),(5,2,50),(5,3,38),(5,4,34),(5,5,45),(5,6,40),(5,7,65),(5,8,60),(5,9,32),(5,10,26),
    (6,1,48),(6,2,45),(6,3,33),(6,4,30),(6,5,40),(6,6,36),(6,7,58),(6,8,52),(6,9,29),(6,10,23),
    (7,1,42),(7,2,40),(7,3,30),(7,4,27),(7,5,37),(7,6,34),(7,7,54),(7,8,49),(7,9,25),(7,10,20),
    (8,1,38),(8,2,35),(8,3,28),(8,4,24),(8,5,34),(8,6,30),(8,7,50),(8,8,45),(8,9,23),(8,10,18),
    (9,1,46),(9,2,43),(9,3,32),(9,4,29),(9,5,39),(9,6,36),(9,7,57),(9,8,51),(9,9,27),(9,10,22),
    (10,1,44),(10,2,41),(10,3,31),(10,4,28),(10,5,38),(10,6,35),(10,7,56),(10,8,50),(10,9,26),(10,10,21);

INSERT INTO Orders VALUES
    (1,1,1,'2025-01-05','2025-01-10','2025-01-08',1,1),
    (2,2,1,'2025-01-06','2025-01-11','2025-01-09',1,2),
    (3,3,1,'2025-01-07','2025-01-12','2025-01-10',2,3),
    (4,4,1,'2025-01-08','2025-01-13','2025-01-11',2,4),
    (5,5,1,'2025-01-09','2025-01-14','2025-01-12',3,5),
    (6,6,1,'2025-01-10','2025-01-15','2025-01-13',3,6),
    (7,7,1,'2025-01-11','2025-01-16','2025-01-14',4,7),
    (8,8,1,'2025-01-12','2025-01-17','2025-01-15',4,8),
    (9,9,1,'2025-01-13','2025-01-18','2025-01-16',5,9),
    (10,10,1,'2025-01-14','2025-01-19','2025-01-17',5,10);

INSERT INTO Order_items VALUES
    (1,1,1,2,650,0.05),(1,2,8,1,260,0.00),
    (2,1,2,1,480,0.00),(2,2,7,2,310,0.05),
    (3,1,3,1,890,0.10),(3,2,5,1,720,0.00),
    (4,1,4,1,1150,0.05),(4,2,8,1,260,0.00),
    (5,1,6,1,830,0.00),(5,2,7,1,310,0.00),
    (6,1,1,1,650,0.00),(6,2,2,1,480,0.00),
    (7,1,9,1,1350,0.05),(7,2,8,1,260,0.00),
    (8,1,10,1,1400,0.10),(8,2,5,1,720,0.00),
    (9,1,4,1,1150,0.00),(9,2,7,1,310,0.00),
    (10,1,6,1,830,0.05),(10,2,3,1,890,0.00);
GO