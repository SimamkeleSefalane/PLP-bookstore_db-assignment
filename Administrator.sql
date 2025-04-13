-- Create users --
CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'bookstore_analyst'@'localhost' IDENTIFIED BY 'analyst123';

-- Grant roles
GRANT ALL PRIVILEGES ON BookstoreDB.* TO 'bookstore_admin'@'localhost';
GRANT SELECT ON BookstoreDB.* TO 'bookstore_analyst'@'localhost';