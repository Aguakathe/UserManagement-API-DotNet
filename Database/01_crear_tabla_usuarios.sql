=====================================================================
--01 - CREAR TABLA Usuarios (instalación desde cero)
-- Úsalo SOLO si la tabla Usuarios todavía NO existe.
-- Si ya existe, usa el script 02_actualizar_tabla_usuarios.sql
-- =====================================================================

-- Cambia TU_BASE_DATOS por el nombre configurado en appsettings.json
-- CREATE DATABASE IF NOT EXISTS TU_BASE_DATOS;
USE TU_BASE_DATOS;

CREATE TABLE IF NOT EXISTS Usuarios (
    Id              INT          NOT NULL AUTO_INCREMENT,
    Nombre          VARCHAR(100) NOT NULL,
    Apellido        VARCHAR(100) NOT NULL,
    Correo          VARCHAR(150) NOT NULL,
    PasswordHash    LONGTEXT     NOT NULL,
    FechaNacimiento DATE         NOT NULL,
    Universidad     VARCHAR(150) NOT NULL,
    Semestre        INT          NOT NULL,
    Activo          TINYINT(1)   NOT NULL DEFAULT 1,
    FechaCreacion   DATETIME(6)  NOT NULL,
    CONSTRAINT PK_Usuarios PRIMARY KEY (Id),
    CONSTRAINT UQ_Usuarios_Correo UNIQUE (Correo),
    CONSTRAINT CK_Usuarios_Semestre CHECK (Semestre BETWEEN 1 AND 10)
    );