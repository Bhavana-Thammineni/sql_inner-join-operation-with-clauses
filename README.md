# sql_inner-join-operation-with-clauses
insert data in tables after making connection perform inner join operation with clauses

-- task connection between four tables
CREATE TABLE department_hospital(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(30) NOT NULL,
    specialization VARCHAR(30),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
CREATE TABLE patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(30) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F')),
    dob DATE
);
CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    patient_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

-- task insert data in tables after making connection perform inner join operation with clauses
INSERT INTO department_hospital VALUES
(1,'Cardiology'),
(2,'Neurology'),
(3,'Orthopedics');

INSERT INTO doctor (doctor_name, specialization, dept_id) VALUES
('Dr. Rao','Heart Specialist',1),
('Dr. Mehta','Brain Specialist',2),
('Dr. Kumar','Bone Specialist',3);

INSERT INTO patient (patient_name, gender, dob) VALUES
('Anil','M','1995-04-10'),
('Sita','F','1998-06-15'),
('Ravi','M','2000-01-20');

INSERT INTO appointment (doctor_id, patient_id, appointment_date, status) VALUES
(1,1,'2025-03-01','Confirmed'),
(1,2,'2025-03-02','Pending'),
(2,3,'2025-03-03','Confirmed'),
(3,1,'2025-03-04','Cancelled');

select * from department_hospital;
select * from doctor;
select*from patient;
select*from appointment;
-- inner
SELECT 
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.status
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN doctor d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Confirmed';
-- join
SELECT 
    p.patient_name,
    d.doctor_name,
    a.appointment_date
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN doctor d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date > '2025-03-02';
-- order by
SELECT 
    p.patient_name,
    d.doctor_name,
    a.appointment_date
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN doctor d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;
