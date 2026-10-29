CREATE DATABASE IF NOT EXISTS dance_admission;
USE dance_admission;
CREATE TABLE dance_admission (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(40),
  style VARCHAR(15),
  level VARCHAR(10),
  monthly_fee INT
);
