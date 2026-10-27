#!/bin/bash
# Crea usuarios y permisos leyendo las passwords desde variables de entorno
# (definidas en .env), para no dejar credenciales escritas en el repositorio.
set -euo pipefail

: "${BIBLIOTECARIO_PASSWORD:?Falta BIBLIOTECARIO_PASSWORD en .env}"
: "${ADMIN_USER_PASSWORD:?Falta ADMIN_USER_PASSWORD en .env}"

mysql --protocol=socket -uroot -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
USE biblioteca_universitaria;

-- 1. Crear usuario bibliotecario
CREATE USER IF NOT EXISTS 'bibliotecario_user'@'localhost' IDENTIFIED BY '${BIBLIOTECARIO_PASSWORD}';

-- 2. Permisos de Solo Lectura sobre catálogos
GRANT SELECT ON biblioteca_universitaria.LIBROS TO 'bibliotecario_user'@'localhost';
GRANT SELECT ON biblioteca_universitaria.AUTORES TO 'bibliotecario_user'@'localhost';
GRANT SELECT ON biblioteca_universitaria.EDITORIALES TO 'bibliotecario_user'@'localhost';

-- 3. Permisos de Lectura y Escritura sobre PRESTAMO
GRANT SELECT, INSERT, UPDATE, DELETE ON biblioteca_universitaria.PRESTAMO TO 'bibliotecario_user'@'localhost';

-- 4. Crear usuario administrador con todos los privilegios
CREATE USER IF NOT EXISTS 'admin_user'@'localhost' IDENTIFIED BY '${ADMIN_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON biblioteca_universitaria.* TO 'admin_user'@'localhost' WITH GRANT OPTION;

-- 5. Revocar permiso DELETE sobre PRESTAMO al bibliotecario
REVOKE DELETE ON biblioteca_universitaria.PRESTAMO FROM 'bibliotecario_user'@'localhost';

FLUSH PRIVILEGES;
EOSQL
