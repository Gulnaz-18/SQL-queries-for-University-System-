CREATE TABLE INSTRUCTOR (
    InstructorID VARCHAR(100) PRIMARY KEY,
    FName VARCHAR(100),
    LName VARCHAR(100),
    StartDate DATE,
    Degree VARCHAR(100),
    `Rank` VARCHAR(100),
    Type VARCHAR(100)
);/* Rank is a key word used the `` to force sql intellisense to recognize it as a column name. */
CREATE TABLE TT (
    InstructorID VARCHAR(100) PRIMARY KEY,
    NoOfPhDStudents INT,
    FOREIGN KEY (InstructorID)
        REFERENCES INSTRUCTOR (InstructorID)
);
CREATE TABLE PHDSTUDENT (
    StudentID VARCHAR(100) PRIMARY KEY,
    FName VARCHAR(100),
    LName VARCHAR(100),
    StSem VARCHAR(100),
    StYear VARCHAR(100),
    Supervisor VARCHAR(100)
);
CREATE TABLE GTA (
    SectionID VARCHAR(100),
    MonthlyPay DOUBLE,
    StudentID VARCHAR(100) PRIMARY KEY,
    FOREIGN KEY (StudentID)
        REFERENCES PHDSTUDENT (StudentID)
);
CREATE TABLE GRA (
    StudentID VARCHAR(100) PRIMARY KEY,
    Funding VARCHAR(100),
    MonthlyPay DOUBLE,
    FOREIGN KEY (StudentID)
        REFERENCES PHDSTUDENT (StudentID)
);
CREATE TABLE SELFSUPPORT (
    StudentID VARCHAR(100) PRIMARY KEY,
    FOREIGN KEY (StudentID)
        REFERENCES PHDSTUDENT (StudentID)
);
CREATE TABLE SCHOLARSHIPSUPPORT (
    StudentID VARCHAR(100) PRIMARY KEY,
    Type VARCHAR(100),
    Source VARCHAR(100),
    FOREIGN KEY (StudentID)
        REFERENCES PHDSTUDENT (StudentID)
);
CREATE TABLE COURSE (
    CourseID VARCHAR(100) PRIMARY KEY,
    CName VARCHAR(100)
);
CREATE TABLE SECTION (
    SectionID VARCHAR(100) PRIMARY KEY,
    CourseID VARCHAR(100),
    FOREIGN KEY (CourseID)
        REFERENCES COURSE (CourseID)
);

alter table GTA add constraint foreign key(SectionID) references SECTION(SectionID);/* Adding the constraint for GTA to Section now that the SECTION Table has been made by altering the GTA table */

CREATE TABLE COURSESTAUGHT (
    CourseID VARCHAR(100),
    InstructorID VARCHAR(100),
    PRIMARY KEY (CourseID , InstructorID),
    FOREIGN KEY (CourseID)
        REFERENCES COURSE (CourseID),
    FOREIGN KEY (InstructorID)
        REFERENCES INSTRUCTOR (InstructorID)
);
CREATE TABLE MILESTONE (
    MId VARCHAR(100) PRIMARY KEY,
    MName VARCHAR(100)
);
CREATE TABLE MILESTONEPASSED (
    StudentID VARCHAR(100),
    MId VARCHAR(100),
    PRIMARY KEY (StudentID , MId),
    FOREIGN KEY (StudentID)
        REFERENCES PHDSTUDENT (StudentID),
    FOREIGN KEY (MId)
        REFERENCES MILESTONE (MId),
    PassDate DATE
);
CREATE TABLE GRANTS (
    AccountNo VARCHAR(100) PRIMARY KEY,
    Type VARCHAR(100),
    GrantTitle VARCHAR(100),
    Source VARCHAR(100),
    StDate DATE,
    EndDate DATE,
    StAmount DOUBLE,
    CurrBalance DOUBLE
);
CREATE TABLE GRANTSASSOCIATED (
    AccountNo VARCHAR(100),
    InstructorID VARCHAR(100),
    PRIMARY KEY (AccountNo , InstructorID),
    PIType VARCHAR(100),
    FOREIGN KEY (AccountNo)
        REFERENCES GRANTS (AccountNo),
    FOREIGN KEY (InstructorID)
        REFERENCES INSTRUCTOR (InstructorID)
);
CREATE TABLE PHDCOMMITTEE (
    StudentID VARCHAR(100),
    InstructorID VARCHAR(100),
    PRIMARY KEY (StudentID , InstructorID),
    FOREIGN KEY (StudentID)
        REFERENCES PHDSTUDENT (StudentID),
    FOREIGN KEY (InstructorID)
        REFERENCES INSTRUCTOR (InstructorID)
);

