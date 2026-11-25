-- Basic INSERT, UPDATE and DELETE demonstrations
USE StudentDB;

-- INSERT: add a new student (use a unique ID and email)
-- INSERT INTO Student
-- (student_id, student_name, email, gender, admission_year, department_id)
-- VALUES (1006, 'Demo Student', 'demo.student@example.com', 'Other', 2026, 2);

-- UPDATE: change a student's email
-- UPDATE Student
-- SET email = 'rohan.updated@example.com'
-- WHERE student_id = 1001;

-- DELETE: delete a student safely.
-- First remove dependent records because foreign keys reference Student.
-- DELETE FROM Enrollment WHERE student_id = 1005;
-- DELETE FROM Fee_Payment WHERE student_id = 1005;
-- DELETE FROM Student WHERE student_id = 1005;

-- The statements above are comments for safety. Remove leading -- to execute.
