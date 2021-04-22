CREATE VIEW COURSESTAUGHT_INFO AS
    SELECT 
        I.InstructorID AS IId,
        I.FName AS IFName,
        I.LName AS ILName,
        C.CourseId AS CId,
        C.CName AS CoName
    FROM
        Instructor I,
        course C;
        