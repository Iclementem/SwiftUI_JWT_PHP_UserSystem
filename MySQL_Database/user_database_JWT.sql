-- Crea una nueva base de datos llamada 'user_database_JWT'
CREATE DATABASE user_database_JWT;

-- Usa la base de datos 'user_database_JWT'
USE user_database_JWT;

-- Crea una nueva tabla llamada 'users'
CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT, -- ID único del usuario
  username VARCHAR(255) NOT NULL, -- Nombre de usuario
  email VARCHAR(255) NOT NULL, -- Correo electrónico del usuario
  password VARCHAR(255) NOT NULL, -- Contraseña del usuario
  role VARCHAR(255) NOT NULL, -- Rol del usuario en la aplicación
  status ENUM('active', 'inactive') NOT NULL DEFAULT 'active', -- Estado del usuario
  token VARCHAR(255) DEFAULT NULL, -- Token JWT generado para el usuario
  PRIMARY KEY (id)
);

-- Agrega un índice único a la columna 'email' para evitar emails duplicados
ALTER TABLE users ADD UNIQUE INDEX idx_email (email);
