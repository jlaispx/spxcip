SELECT *
FROM yearstudents AS ys, student AS s, homeroom AS h, cip_year AS yr, teacherhomeroom AS th
WHERE ys.studentid = s.studentid 
AND ys.homeroomid = h.homeroomId
AND ys.yearid = yr.yearId
AND ys.homeroomid = th.homeroomId
AND ys.yearid = th.yearId
AND th.userId = 1 AND yr.YEAR = "2019"