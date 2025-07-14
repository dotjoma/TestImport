-- 1. Create the database if it doesn't exist
-- UPDATED!
CREATE DATABASE IF NOT EXISTS import_from_github;
USE import_from_github;

-- 2. Create `users` table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'customer') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create `products` table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create `patients` table
CREATE TABLE IF NOT EXISTS patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    contact_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Insert seed data into `users`
INSERT IGNORE INTO users (id, name, email, password, role, created_at) VALUES
(1, 'Admin User', 'admin@example.com', '$2y$10$hashedpassword', 'admin', NOW()),
(2, 'You should not see this.', 'admin1@example.com', '$2y$10$hashedpassword', 'admin', NOW()),
(3, 'John Doe', 'john@example.com', '$2y$10$hashedpassword', 'customer', NOW());

-- 6. Insert seed data into `products`
INSERT IGNORE INTO products (id, name, description, price, stock, created_at) VALUES
(1, 'Milk Tea', 'Delicious brown sugar milk tea', 120.00, 50, NOW()),
(2, 'Burger', 'Juicy grilled beef burger', 150.00, 30, NOW());

-- 7. Insert seed data into `patients`
INSERT IGNORE INTO patients (id, full_name, birthdate, gender, contact_number, created_at) VALUES
(1, 'Maria Lopez', '1990-05-14', 'Female', '09171234567', NOW()),
(2, 'Carlos Dela Cruz', '1985-11-23', 'Male', '09181234567', NOW());
