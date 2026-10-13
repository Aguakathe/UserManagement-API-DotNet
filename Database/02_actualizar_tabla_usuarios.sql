-- =====================================================================
-- 02 - ACTUALIZAR TABLA Usuarios (punto 4.4 de la actividad)
-- Para bases de datos que YA tienen la tabla con Edad y RolId.
--   + FechaNacimiento (DATE)
--   + Universidad     (VARCHAR 150)
--   + Semestre        (INT, entre 1 y 10)
--   - Edad            (ahora se calcula a partir de FechaNacimiento)
--   - RolId           (ya no hace parte del registro)
-- =====================================================================

-- Cambia TU_BASE_DATOS por el nombre configurado en appsettings.json
USE TU_BASE_DATOS;

-- 1. Agregar las nuevas columnas
ALTER TABLE Usuarios
    ADD COLUMN FechaNacimiento DATE NULL AFTER PasswordHash,
    ADD COLUMN Universidad VARCHAR(150) NOT NULL DEFAULT '' AFTER FechaNacimiento,
    ADD COLUMN Semestre INT NOT NULL DEFAULT 1 AFTER Universidad;

-- 2. Usuarios existentes: fecha de nacimiento aproximada a partir de su Edad
--    (MySQL Workbench bloquea UPDATE sin llave primaria en el WHERE)
SET SQL_SAFE_UPDATES = 0;

UPDATE Usuarios
SET FechaNacimiento = DATE_SUB(CURDATE(), INTERVAL Edad YEAR)
WHERE FechaNacimiento IS NULL;

SET SQL_SAFE_UPDATES = 1;

-- 3. La fecha de nacimiento pasa a ser obligatoria
ALTER TABLE Usuarios
    MODIFY COLUMN FechaNacimiento DATE NOT NULL,
    ALTER COLUMN Universidad DROP DEFAULT,
    ALTER COLUMN Semestre DROP DEFAULT;

-- 4. Eliminar las columnas que ya no se usan
ALTER TABLE Usuarios
    DROP COLUMN Edad,
    DROP COLUMN RolId;

-- 5. Restringir el semestre a valores válidos
ALTER TABLE Usuarios
    ADD CONSTRAINT CK_Usuarios_Semestre CHECK (Semestre BETWEEN 1 AND 10);
