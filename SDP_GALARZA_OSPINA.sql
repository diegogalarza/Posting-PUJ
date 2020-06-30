--Authors Diego Galarza, Victor Ospina
-- Last modification date: 2018-10-29 00:52:13.064

-- tables
-- Table: ADMINISTRATOR
CREATE TABLE ADMINISTRATOR (
    admin_id int  NOT NULL,
    admin_pswr char(15)  NOT NULL,
    admin_info char(100)  NOT NULL,
    USER_user_id int  NOT NULL,
    CONSTRAINT ADMINISTRATOR_pk PRIMARY KEY (admin_id)
);

-- Table: COURSE
CREATE TABLE COURSE (
    course_id int  NOT NULL,
    course_name char(50)  NOT NULL,
    course_credits int  NOT NULL,
    course_info char(400)  NOT NULL,
    course_schedule char(100)  NOT NULL,
    MASTER_master_id int  NOT NULL,
    TEACHER_teacher_id int  NOT NULL,
    CONSTRAINT COURSE_pk PRIMARY KEY (course_id)
);

-- Table: FINANCING
CREATE TABLE FINANCING (
    financing_id int  NOT NULL,
    financing_info char(30)  NOT NULL,
    MASTER_master_id int  NOT NULL,
    CONSTRAINT FINANCING_pk PRIMARY KEY (financing_id)
);

-- Table: MASTER
CREATE TABLE MASTER (
    master_id int  NOT NULL,
    master_name char(30)  NOT NULL,
    master_info char(400)  NOT NULL,
    master_prerequisites char(50)  NOT NULL,
    CONSTRAINT MASTER_pk PRIMARY KEY (master_id)
);

-- Table: SCHOLARSHIPS
CREATE TABLE SCHOLARSHIPS (
    scholarship_id int  NOT NULL,
    scholarship_info char(30)  NOT NULL,
    MASTER_master_id int  NOT NULL,
    CONSTRAINT SCHOLARSHIPS_pk PRIMARY KEY (scholarship_id)
);

-- Table: STUDENT
CREATE TABLE STUDENT (
    student_id int  NOT NULL,
    student_pswr char(15)  NOT NULL,
    USER_user_id int  NOT NULL,
    CONSTRAINT STUDENT_pk PRIMARY KEY (student_id)
);

-- Table: STUDENT_THESIS
CREATE TABLE STUDENT_THESIS (
    thesis_id int  NOT NULL,
    thesis_title char(30)  NOT NULL,
    thesis_author char(30)  NOT NULL,
    thesis_abstract char(200)  NOT NULL,
    STUDENT_student_id int  NOT NULL,
    CONSTRAINT STUDENT_THESIS_pk PRIMARY KEY (thesis_id)
);

-- Table: STUDENTxCOURSE
CREATE TABLE STUDENTxCOURSE (
    studxcourse_id int  NOT NULL,
    COURSE_course_id int  NOT NULL,
    STUDENT_student_id int  NOT NULL,
    CONSTRAINT STUDENTxCOURSE_pk PRIMARY KEY (studxcourse_id)
);

-- Table: TEACHER
CREATE TABLE TEACHER (
    teacher_id int  NOT NULL,
    teacher_pswr char(15)  NOT NULL,
    teacher_info char(400)  NOT NULL,
    USER_user_id int  NOT NULL,
    STUDENT_THESIS_thesis_id int  NOT NULL,
    CONSTRAINT TEACHER_pk PRIMARY KEY (teacher_id)
);

-- Table: USER
CREATE TABLE "USER" (
    user_id int  NOT NULL,
    user_name char(30)  NOT NULL,
    user_email char(60)  NOT NULL,
    user_phone int  NOT NULL,
    CONSTRAINT USER_pk PRIMARY KEY (user_id)
);

-- foreign keys
-- Reference: ADMINISTRATOR_USER (table: ADMINISTRATOR)
ALTER TABLE ADMINISTRATOR ADD CONSTRAINT ADMINISTRATOR_USER
    FOREIGN KEY (USER_user_id)
    REFERENCES "USER" (user_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: COURSE_MASTER (table: COURSE)
ALTER TABLE COURSE ADD CONSTRAINT COURSE_MASTER
    FOREIGN KEY (MASTER_master_id)
    REFERENCES MASTER (master_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: COURSE_TEACHER (table: COURSE)
ALTER TABLE COURSE ADD CONSTRAINT COURSE_TEACHER
    FOREIGN KEY (TEACHER_teacher_id)
    REFERENCES TEACHER (teacher_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FINANCING_MASTER (table: FINANCING)
ALTER TABLE FINANCING ADD CONSTRAINT FINANCING_MASTER
    FOREIGN KEY (MASTER_master_id)
    REFERENCES MASTER (master_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SCHOLARSHIPS_MASTER (table: SCHOLARSHIPS)
ALTER TABLE SCHOLARSHIPS ADD CONSTRAINT SCHOLARSHIPS_MASTER
    FOREIGN KEY (MASTER_master_id)
    REFERENCES MASTER (master_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: STUDENT_THESIS_STUDENT (table: STUDENT_THESIS)
ALTER TABLE STUDENT_THESIS ADD CONSTRAINT STUDENT_THESIS_STUDENT
    FOREIGN KEY (STUDENT_student_id)
    REFERENCES STUDENT (student_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: STUDENT_USER (table: STUDENT)
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_USER
    FOREIGN KEY (USER_user_id)
    REFERENCES "USER" (user_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: STUDENTxCOURSE_COURSE (table: STUDENTxCOURSE)
ALTER TABLE STUDENTxCOURSE ADD CONSTRAINT STUDENTxCOURSE_COURSE
    FOREIGN KEY (COURSE_course_id)
    REFERENCES COURSE (course_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: STUDENTxCOURSE_STUDENT (table: STUDENTxCOURSE)
ALTER TABLE STUDENTxCOURSE ADD CONSTRAINT STUDENTxCOURSE_STUDENT
    FOREIGN KEY (STUDENT_student_id)
    REFERENCES STUDENT (student_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: TEACHER_THESIS (table: TEACHER)
ALTER TABLE TEACHER ADD CONSTRAINT TEACHER_THESIS
    FOREIGN KEY (STUDENT_THESIS_thesis_id)
    REFERENCES STUDENT_THESIS (thesis_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: TEACHER_USER (table: TEACHER)
ALTER TABLE TEACHER ADD CONSTRAINT TEACHER_USER
    FOREIGN KEY (USER_user_id)
    REFERENCES "USER" (user_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

