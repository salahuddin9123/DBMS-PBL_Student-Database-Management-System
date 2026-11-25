-- Student Database Management System
-- DBMS PBL | MySQL
-- Run this file first in MySQL Workbench.

CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

-- Drop child tables first so the script can be rerun safely.
DROP TABLE IF EXISTS Fee_Payment;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    building VARCHAR(50)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    gender VARCHAR(10),
    admission_year INT,
    department_id INT,
    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Course (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    department_id INT,
    CONSTRAINT fk_course_department
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id VARCHAR(10),
    semester INT,
    marks DECIMAL(5,2),
    grade VARCHAR(2),
    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id) REFERENCES Student(student_id),
    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id) REFERENCES Course(course_id),
    CONSTRAINT uq_student_course_semester
        UNIQUE (student_id, course_id, semester),
    CONSTRAINT chk_marks CHECK (marks BETWEEN 0 AND 100)
);

CREATE TABLE Fee_Payment (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE,
    payment_status VARCHAR(20),
    CONSTRAINT fk_payment_student
        FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

SHOW TABLES;
