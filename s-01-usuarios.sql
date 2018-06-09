-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 09/06/2018
-- Descripción: Genera los usuarios administrador e invitado. Se crean roles y asignan permisos. 

CREATE USER LSSG_PROY_INVITADO;
CREATE USER LSSG_PROY_ADMIN;

CREATE ROL ROL_ADMIN; 
CREATE ROL ROL_INVITADO;

-- DAMOS PERMISOS A LOS ROLES
GRANT CREATE SESSION TO ROL_INVITADO;
GRANT ALL PRIVILEGES TO ROL_ADMIN;

-- ASIGNAR ROLES A USUARIOS
GRANT ROL_INVITADO TO LSSG_PROY_INVITADO;
GRANT ROL_ADMIN TO LSSG_PROY_ADMIN;




