SELECT DISTINCT
    s.FName, s.LName, g.GrantTitle
FROM
    phdstudent s,
    grants g,
    grantsassociated ga,
    instructor i,
    gra gr
WHERE
    gr.StudentID = s.StudentID
        AND s.Supervisor = ga.InstructorID
        AND ga.accountno = g.accountno;/* 3 i) */
SELECT 
    i1.FName,
    i1.LName,
    (SELECT 
            COUNT(*)
        FROM
            instructor i2,
            phdstudent s2
        WHERE
            s2.Supervisor = i2.InstructorID
                AND i2.InstructorID = i1.InstructorID) NoOfStudents
FROM
    instructor i1;/* 3 ii) */
SELECT 
    c1.courseID,
    c1.cName,
    (SELECT 
            COUNT(*)
        FROM
            section s2
        WHERE
            s2.CourseID = c1.courseID) NumCourses
FROM
    course c1
HAVING NumCourses > 2;/* 3 iii */
SELECT 
    gran.AccountNo,
    gran.Type,
    gran.GrantTitle,
    student.StudentID
FROM
    grants gran,
    grantsassociated granasoc,
    phdstudent student
WHERE
    StAmount > 400000
        AND gran.AccountNo = granasoc.AccountNo
        AND granasoc.InstructorID = student.Supervisor;/* 3 iv */
SELECT 
    i.FName, Lname, i.rank, i.type, c.courseid
FROM
    instructor i,
    coursestaught c
WHERE
    i.InstructorID = c.InstructorID AND FName LIKE "C%"; /*3 V*/
    
    SELECT
    SUM(MonthlyPay) AS "Total Monthly Pay",
    AVG(MonthlyPay) AS "Average Monthly Pay",
    MIN(MonthlyPay) AS "Minimum Monthly Pay",
    MAX(MonthlyPay) AS "Maximum monthly Pay"
FROM
    gra
WHERE
    MonthlyPay > 0; /* 3 VI*/
    
    SELECT
    c.CName,
    c.CourseID,
    s.SectionID
FROM
    course c,
    section s
WHERE
    CName LIKE "%Programming%"
    ORDER BY CourseID DESC; /* 3 VII*/
    
ALTER TABLE gra
ADD CONSTRAINT graID
FOREIGN KEY (StudentID)
REFERENCES phdstudent (StudentID) ON DELETE CASCADE; /* 3 VIII*/

INSERT INTO milestone
VALUES ('DR', 'Doctoral'), ('DR', 'PhD');

INSERT INTO gra
VALUES ('GU1810', 'DIT5', 4000);

INSERT INTO gta (MonthlyPay)
VALUES(NULL);
/* 3 IX*/

SELECT 
s.StudentID,
s.FName,
s.LName,
m.MName,
d.PassDate
FROM
phdstudent s,
milestone m,
milestonepassed d
WHERE 
d.StudentID=s.StudentID
AND m.Mid=d.Mid;/* 3 x*/

SELECT 
    i.FName,
    i.LName,
    n.NoOfPhdStudents
FROM
    instructor i,
    tt n
WHERE
    i.InstructorID = n.InstructorID AND StartDate > '1989-12-25'; /* 3 xi*/
    
  SELECT 
    p.FName,
    p.LName,
    p.StYear,
    m.MName
FROM
    phdstudent p,
    milestone m,
    milestonepassed pass
WHERE
    p.StudentID = pass.StudentID AND m.MId = pass.MId AND StYear >= 2017 AND pass.PassDate > '2018-05-01';  /* 3 xii*/
    
    SELECT DISTINCT
    i.FName,
    i.LName,
    i.StartDate,
    i.Degree
FROM
    instructor i
WHERE
    StartDate BETWEEN '1999-05-01' AND '2004-05-01'
ORDER BY
    StartDate;  /* 3 xiii*/
    
    SELECT 
    s.StudentID,
    s.FName,
    s.LName,
    m.MId
FROM
    phdstudent s,
    milestone m,
    milestonepassed pass,
    scholarshipsupport mav
WHERE
    m.MId = pass.MId AND pass.StudentID = s.StudentID AND mav.StudentID = s.StudentID AND Type = 'Maverick'; /* 3 xiv*/
    
    SELECT
    s.FName,
    sec.SectionID
FROM
    phdstudent s,
    section sec,
    gta g
WHERE
  s.StudentID = g.StudentID AND g.SectionID = sec.SectionID 
  ORDER BY FName ASC; /*3 XV*/
  
  SELECT
    s.FName,
    s1.SectionID
FROM
    phdstudent s,
    section s1,
    gta g
WHERE
    s.StudentID = g.StudentID AND g.SectionID = s1.SectionID
    ORDER BY FName ASC /*3 XVi*/
    





    
    