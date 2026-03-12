CREATE TABLE users(
id INT AUTO_INCREMENT PRIMARY KEY ,
name VARCHAR(100) NOT NULL ,
email VARCHAR(50) unique NOT NULL ,
gender ENUM('Male' ,'Female' , 'Others'),
date_of_birth DATE ,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
USE startersql ;
SELECT * FROM users;