SELECT ys.yearstudentId, s.studentId, s.StudentFirstName, s.StudentLastName, s.UserId, s.email, s.dob
FROM student AS s, yearstudents AS ys
WHERE s.studentid = ys.studentid AND yearid=1