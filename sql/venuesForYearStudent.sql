SELECT syp.studentYearProviderId, syp.providerId, p.providerName, p.location FROM studentyearprovider AS syp, cip_provider AS p, yearstudents AS ys, student AS s WHERE syp.providerId = p.providerId AND syp.yearStudentId = ys.yearstudentId AND ys.studentid = s.studentid AND syp.yearStudentId = 3