


CREATE DATABASE bd_prueba;
USE bd_prueba;

CREATE TABLE "mascota" (
  "idmascota" int(11) NOT NULL,
  "nombre" varchar(45) NOT NULL,
  "tipo_mascota" int(11) NOT NULL,
  "propietario" int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE "propietario" (
  "idpropietario" int(11) NOT NULL,
  "nombre" varchar(45) NOT NULL,
  "direccion" varchar(45) NOT NULL,
  "telefono" varchar(10) NOT NULL,
  "correo" varchar(60) NOT NULL,
  "cometario" text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE "tipo_mascota" (
  "idtipo_mascota" int(11) NOT NULL,
  "descripcion" varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE "mascota"
  ADD PRIMARY KEY ("idmascota"),
  ADD KEY "propietario" ("propietario"),
  ADD KEY "tipo_mascota" ("tipo_mascota");

ALTER TABLE "propietario"
  ADD PRIMARY KEY ("idpropietario"); 

  ALTER TABLE "mascota"
  MODIFY "idmascota" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

  ALTER TABLE "propietario"
  MODIFY "idpropietario" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

  ALTER TABLE "tipo_mascota"
  MODIFY "idtipo_mascota" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

  ALTER TABLE "mascota"
  ADD CONSTRAINT "mascota_ibfk_1" FOREIGN KEY ("propietario") REFERENCES "propietario" ("idpropietario"),
  ADD CONSTRAINT "mascota_ibfk_2" FOREIGN KEY ("tipo_mascota") REFERENCES "tipo_mascota" ("idtipo_mascota");


INSERT INTO "mascota" ("idmascota", "nombre", "tipo_mascota", "propietario") VALUES
(1, 'Pikachu', 1, 2),
(2, 'Dragoon', 6, 3),
(3, 'SpiderFiera', 3, 1),
(4, 'Arcanine', 1, 4),
(5, 'Misifus', 1, NULL),
(6, 'Filemon', 3, NULL),
(7, 'Ayudante de santa', 2, NULL),
(8, 'Bola de nieve', 1, NULL),
(9, 'Ho oh', 8, 4);


/*
●1 Listar todas las mascotas.
●2 Listar las mascotas que no han sido adoptadas.
●3 Listar el número de mascotas por cada tipo de mascota.
●4 Listar los propietarios que tengan más de una mascota.
●5 Listar el número de mascotas por cada tipo de mascota y por cada propietario.
●6 Listas los propietarios que no tienen mascotas.
*/

/* CONSULTAS PRUEBA */

/* 1 */SELECT M.idmascota,M.nombre,P.nombre,TM.descripcion FROM mascota M LEFT JOIN tipo_mascota TM ON M.tipo_mascota=TM.idtipo_mascota LEFT JOIN propietario P ON P.idpropietario=M.propietario;

/* 2 */ SELECT M.idmascota,M.nombre,P.nombre,TM.descripcion FROM mascota M LEFT JOIN tipo_mascota TM ON M.tipo_mascota=TM.idtipo_mascota LEFT JOIN propietario P ON P.idpropietario=M.propietario WHERE P.nombre IS Null;

/* 3 */ SELECT TP.descripcion, COUNT(M.tipo_mascota) AS 'Cantidad' from mascota M LEFT JOIN tipo_mascota TP ON TP.idtipo_mascota=M.tipo_mascota GROUP BY M.tipo_mascota; 

/* 4 */ SELECT P.nombre,COUNT(M.propietario) AS 'Mascotas' FROM propietario P LEFT JOIN mascota M ON P.idpropietario=M.propietario GROUP BY M.propietario;

/* O_O */
/* 5 */SELECT idmascota from mascota,propietario,tipo_mascota; 

/* 6 */  SELECT * FROM propietario WHERE propietario.idpropietario NOT IN (SELECT propietario FROM mascota WHERE propietario IS NOT NULL);