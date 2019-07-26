SELECT s.studentFirstName, s.studentLastName, a.* FROM achievements AS a, yearstudents AS ys, student AS s
WHERE a.yearStudentId = ys.yearstudentId AND ys.studentid = s.studentid