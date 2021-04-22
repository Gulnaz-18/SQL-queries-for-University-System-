SELECT 
    IId, IFName, ILName, COUNT(*) NoOfCoursesTaught
FROM
    coursestaught_info
GROUP BY IId; /* 2 A */
select CoName from coursestaught_info where IFname="Ahmed" and ILName="Sarhan"; /* 2 B */
select IFName,ILName,cid from coursestaught_info where cid="CSE4351" or cid="CSE4354" or cid="CSE5324"; /* 2 C */

