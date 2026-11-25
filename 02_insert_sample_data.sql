-- Sample data for StudentDB
-- Run after 01_create_tables.sql

USE StudentDB;

INSERT INTO Department (department_id, department_name, building) VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Data Science', 'Block B'),
(3, 'Cyber Security', 'Block C');

INSERT INTO Student
(student_id, student_name, email, gender, admission_year, department_id) VALUES
(1001, 'Rohan Dey', 'rohan@gmail.com', 'Male', 2024, 1),
(1002, 'Aritra Sen', 'aritra@gmail.com', 'Male', 2024, 1),
(1003, 'Priya Das', 'priya@gmail.com', 'Female', 2024, 2),
(1004, 'Sounab Santra', 'sounab@gmail.com', 'Male', 2023, 3),
(1005, 'Sneha Roy', 'sneha@gmail.com', 'Female', 2025, 2);

INSERT INTO Course (course_id, course_name, credits, department_id) VALUES
('C101', 'Database Management System', 4, 1),
('C102', 'Computer Networks', 3, 1),
('DS101', 'Python Programming', 4, 2),
('CS101', 'Cyber Security Fundamentals', 3, 3);

INSERT INTO Enrollment
(enrollment_id, student_id, course_id, semester, marks, grade) VALUES
(1, 1001, 'C101', 5, 88, 'A'),
(2, 1002, 'C101', 5, 91, 'A+'),
(3, 1002, 'C102', 5, 82, 'A'),
(4, 1003, 'C101', 5, 85, 'A'),
(5, 1003, 'DS101', 5, 76, 'B'),
(6, 1004, 'CS101', 5, 79, 'B'),
(7, 1005, 'DS101', 5, 68, 'C');

INSERT INTO Fee_Payment
(payment_id, student_id, amount, payment_date, payment_status) VALUES
(501, 1001, 25000.00, '2026-01-10', 'Paid'),
(502, 1002, 25000.00, '2026-01-12', 'Paid'),
(503, 1003, 22000.00, '2026-01-15', 'Pending'),
(504, 1004, 24000.00, '2026-01-18', 'Paid'),
(505, 1005, 22000.00, '2026-01-20', 'Pending');

-- Verify inserted records
SELECT * FROM Department;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Fee_Payment;
