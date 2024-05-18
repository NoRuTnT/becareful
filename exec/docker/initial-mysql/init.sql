DROP USER IF EXISTS 'becareful'@'%';
CREATE USER 'becareful'@'%' IDENTIFIED BY 'becareful123';
GRANT CREATE ON *.* TO 'becareful'@'%';

CREATE DATABASE IF NOT EXISTS becareful CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS becareful_test CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS becareful_temp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


GRANT ALL PRIVILEGES ON `becareful`.* TO 'tfeo'@'%';
GRANT ALL PRIVILEGES ON `becareful_test`.* TO 'tfeo'@'%';
GRANT ALL PRIVILEGES ON `becareful_temp`.* TO 'tfeo'@'%';

FLUSH PRIVILEGES;

-- create schema

USE becareful_temp;