create table INSTRUCTOR(InstructorID varchar(100) primary key,FName varchar(100),LName varchar(100),StartDate date,Degree varchar(100),`Rank` varchar(100),Type varchar(100)); /* Rank is a key word used the `` to force sql intellisense to recognize it as a column name. */
create table TT(InstructorID varchar(100) primary key,NoOfPhDStudents int, foreign key (InstructorID) references INSTRUCTOR(InstructorID));
create table PHDSTUDENT(StudentID varchar(100) primary key,FName varchar(100),LName varchar(100),StSem varchar(100),StYear varchar(100),Supervisor varchar(100));

create table GTA (
	SectionID varchar(100),
		MonthlyPay double not null,
		StudentID varchar(100) primary key, 
        foreign key (StudentID) references PHDSTUDENT(StudentID));
create table GRA (
	StudentID varchar(100) primary key,
	Funding varchar(100),MonthlyPay double not null,foreign key (StudentID) references PHDSTUDENT(StudentID));
create table SELFSUPPORT(StudentID varchar(100) primary key,foreign key (StudentID) references PHDSTUDENT(StudentID));


create table SCHOLARSHIPSUPPORT(StudentID varchar(100) primary key,Type varchar(100),Source varchar(100),foreign key (StudentID) references PHDSTUDENT(StudentID));
create table COURSE(CourseID varchar(100) primary key,CName varchar(100));
create table SECTION(SectionID varchar(100) primary key,CourseID varchar(100),foreign key (CourseID) references COURSE(CourseID));

alter table GTA add constraint foreign key(SectionID) references SECTION(SectionID); /* Adding the constraint for GTA to Section now that the SECTION Table has been made by altering the GTA table */

create table COURSESTAUGHT(CourseID varchar(100),InstructorID varchar(100),primary key (CourseID,InstructorID),foreign key (CourseID) references COURSE(CourseID),foreign key (InstructorID) references INSTRUCTOR(InstructorID));
create table MILESTONE(MId varchar(100) primary key,MName varchar(100));
create table MILESTONEPASSED(StudentID varchar(100),MId varchar(100), primary key (StudentID,MId), foreign key (StudentID) references PHDSTUDENT(StudentID), foreign key (MId) references MILESTONE(MId),PassDate date);
create table GRANTS(AccountNo varchar(100) primary key,Type varchar(100),GrantTitle varchar(100),Source varchar(100),StDate date,EndDate date,StAmount double,CurrBalance double);
create table GRANTSASSOCIATED(AccountNo varchar(100),InstructorID varchar(100),primary key(AccountNo,InstructorID),PIType varchar(100),foreign key (AccountNo) references GRANTS(AccountNo),foreign key (InstructorID) references INSTRUCTOR(InstructorID)); 
create table PHDCOMMITTEE(StudentID varchar(100),InstructorID varchar(100),primary key(StudentID,InstructorID),foreign key (StudentID) references PHDSTUDENT(StudentID),foreign key (InstructorID) references INSTRUCTOR(InstructorID));



