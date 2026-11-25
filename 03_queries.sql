-- Query examples for Student Database Management System
USE StudentDB;

-- 1. Display all student records
SELECT * FROM Student;

-- 2. Search for a student by ID
SELECT * FROM Student WHERE student_id = 1001;

-- 3. Display students in a particular department
SELECT s.student_id, s.student_name, d.department_name
FROM Student s
JOIN Department d ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- 4. Display students in alphabetical order
SELECT student_id, student_name, email
FROM Student
ORDER BY student_name ASC;

-- 5. Count total students
SELECT COUNT(*) AS total_students FROM Student;

-- 6. Count students in each department (including departments with zero students)
SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM Department d
LEFT JOIN Student s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_name;

-- 7. Display course-wise average marks
SELECT c.course_name, AVG(e.marks) AS average_marks
FROM Course c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 8. Find the highest marks
SELECT MAX(marks) AS highest_marks FROM Enrollment;

-- 9. Find students whose marks are above the overall average
SELECT s.student_name, c.course_name, e.marks
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
JOIN Course c ON e.course_id = c.course_id
WHERE e.marks > (SELECT AVG(marks) FROM Enrollment);

-- 10. Display student, course, marks and grade
SELECT s.student_name, c.course_name, e.semester, e.marks, e.grade
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id
ORDER BY s.student_name, c.course_name;

-- 11. Display fee payment information
SELECT s.student_name, f.amount, f.payment_date, f.payment_status
FROM Student s
JOIN Fee_Payment f ON s.student_id = f.student_id
ORDER BY f.payment_date;

-- 12. Find pending fee payments
SELECT s.student_name, f.amount, f.payment_status
FROM Student s
JOIN Fee_Payment f ON s.student_id = f.student_id
WHERE f.payment_status = 'Pending';

-- 13. Total amount collected
SELECT SUM(amount) AS total_amount_collected
FROM Fee_Payment
WHERE payment_status = 'Paid';

-- 14. Find students with no enrollment records
SELECT s.student_id, s.student_name
FROM Student s
LEFT JOIN Enrollment e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 15. Find courses with at least two enrolled students
SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Course c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.student_id) >= 2;
