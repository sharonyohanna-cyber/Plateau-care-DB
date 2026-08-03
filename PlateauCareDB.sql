DROP DATABASE IF EXISTS PlateauCareDB;


CREATE DATABASE PlateauCareDB;

USE PlateauCareDB;


CREATE TABLE LGAs (

LGAID INT AUTO_INCREMENT PRIMARY KEY,

LGAName VARCHAR(50) NOT NULL UNIQUE

);


CREATE TABLE Departments (

DepartmentID INT AUTO_INCREMENT PRIMARY KEY,

DepartmentName VARCHAR(100) NOT NULL UNIQUE,

DepartmentHead VARCHAR(100)

);


CREATE TABLE Diagnoses (

DiagnosisID INT AUTO_INCREMENT PRIMARY KEY,

DiagnosisName VARCHAR(100) NOT NULL UNIQUE

);


CREATE TABLE Patients (

PatientID INT AUTO_INCREMENT PRIMARY KEY,

FirstName VARCHAR(50) NOT NULL,

LastName VARCHAR(50) NOT NULL,

Gender ENUM('Male','Female') NOT NULL,

DateOfBirth DATE NOT NULL,

Phone VARCHAR(15) UNIQUE,

Address VARCHAR(150),

LGAID INT NOT NULL,

RegistrationDate DATE NOT NULL,


FOREIGN KEY (LGAID)  
    REFERENCES LGAs(LGAID)  



);


CREATE TABLE Staff (

StaffID INT AUTO_INCREMENT PRIMARY KEY,

FirstName VARCHAR(50) NOT NULL,

LastName VARCHAR(50) NOT NULL,

Gender ENUM('Male','Female') NOT NULL,

Role VARCHAR(50) NOT NULL,

Phone VARCHAR(15) UNIQUE,

Email VARCHAR(100) UNIQUE,

HireDate DATE NOT NULL,

Salary DECIMAL(10,2),

DepartmentID INT NOT NULL,


FOREIGN KEY (DepartmentID)  
    REFERENCES Departments(DepartmentID)  



);


CREATE TABLE MedicalRecords (

RecordID INT AUTO_INCREMENT PRIMARY KEY,

PatientID INT UNIQUE NOT NULL,

BloodGroup VARCHAR(5),

Genotype VARCHAR(5),

Allergies VARCHAR(200),

ExistingConditions VARCHAR(200),


FOREIGN KEY (PatientID)  
    REFERENCES Patients(PatientID)  



);


CREATE TABLE PatientVisits (

VisitID INT AUTO_INCREMENT PRIMARY KEY,

PatientID INT NOT NULL,

StaffID INT NOT NULL,

DiagnosisID INT NOT NULL,

VisitDate DATE NOT NULL,

Complaint VARCHAR(255),

Notes TEXT,


FOREIGN KEY (PatientID)  
    REFERENCES Patients(PatientID),  

FOREIGN KEY (StaffID)  
    REFERENCES Staff(StaffID),  

FOREIGN KEY (DiagnosisID)  
    REFERENCES Diagnoses(DiagnosisID)  



);


CREATE TABLE Appointments (

AppointmentID INT AUTO_INCREMENT PRIMARY KEY,

PatientID INT NOT NULL,

StaffID INT NOT NULL,

AppointmentDate DATE NOT NULL,

AppointmentTime TIME NOT NULL,

Status ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',


FOREIGN KEY (PatientID)  
    REFERENCES Patients(PatientID),  

FOREIGN KEY (StaffID)  
    REFERENCES Staff(StaffID)  



);


INSERT INTO LGAs (LGAName)

VALUES

('Barkin Ladi'),

('Bassa'),

('Bokkos'),

('Jos East'),

('Jos North'),

('Jos South'),

('Kanam'),

('Kanke'),

('Langtang North'),

('Langtang South'),

('Mangu'),

('Mikang'),

('Pankshin'),

('Qua''an Pan'),

('Riyom'),

('Shendam'),

('Wase');


INSERT INTO Departments

(DepartmentName, DepartmentHead)

VALUES

('Emergency','Dr. Timothy Gyang'),

('Outpatient (OPD)','Dr. Sarah Pam'),

('Pediatrics','Dr. Daniel Dung'),

('Surgery','Dr. Musa Davou'),

('Maternity','Dr. Rebecca Bot'),

('Pharmacy','Pharm. Grace Luka'),

('Laboratory','Dr. Esther Dabit'),

('Radiology','Dr. Solomon Dakup'),

('Medical Records','Mr. Samuel Dashen'),

('Administration','Mrs. Ruth Mangvwat');


INSERT INTO Diagnoses

(DiagnosisName)

VALUES

('Malaria'),

('Typhoid Fever'),

('Hypertension'),

('Diabetes Mellitus'),

('Pneumonia'),

('Asthma'),

('Peptic Ulcer Disease'),

('Urinary Tract Infection'),

('Anaemia'),

('Gastroenteritis'),

('Tuberculosis'),

('COVID-19'),

('Dengue Fever'),

('Chickenpox'),

('Common Cold');


INSERT INTO Staff

(FirstName, LastName, Gender, Role, Phone, Email, HireDate, Salary, DepartmentID)

VALUES

('Timothy','Gyang','Male','Doctor','08030000001','timothy.gyang@plateaucare.ng','2022-01-15',450000,1),


('Sarah','Pam','Female','Doctor','08030000002','sarah.pam@plateaucare.ng','2021-03-10',450000,2),


('Grace','Luka','Female','Pharmacist','08030000003','grace.luka@plateaucare.ng','2020-09-08',350000,6),


('Samuel','Dashen','Male','Medical Records Officer','08030000004','samuel.dashen@plateaucare.ng','2023-02-15',220000,9),


('Ruth','Mangvwat','Female','Administrator','08030000005','ruth.mangvwat@plateaucare.ng','2020-11-01',400000,10);


INSERT INTO Patients

(FirstName, LastName, Gender, DateOfBirth, Phone, Address, LGAID, RegistrationDate)

VALUES

('Grace','Dung','Female','1998-04-12','08050000001','Rayfield, Jos',6,'2026-07-01'),


('Daniel','Pam','Male','1985-08-25','08050000002','Angwan Rukuba, Jos',5,'2026-07-02'),


('Rebecca','Dashe','Female','1992-11-16','08050000003','Barkin Ladi Town',1,'2026-07-03'),


('John','Luka','Male','2001-06-05','08050000004','Pankshin',13,'2026-07-03');


INSERT INTO MedicalRecords

(PatientID, BloodGroup, Genotype, Allergies, ExistingConditions)

VALUES

(1,'O+','AA','None','None'),

(2,'A+','AS','Penicillin','Asthma'),

(3,'B+','AA','Peanuts','Hypertension'),

(4,'AB+','AA','None','Diabetes');


INSERT INTO PatientVisits

(PatientID, StaffID, DiagnosisID, VisitDate, Complaint, Notes)

VALUES

(1,2,1,'2026-07-10','High fever and headache','Prescribed antimalarial medication'),


(2,1,3,'2026-07-11','Persistent headache','Blood pressure monitored'),


(3,2,8,'2026-07-12','Pain during urination','Antibiotics prescribed');


INSERT INTO Appointments

(PatientID, StaffID, AppointmentDate, AppointmentTime, Status)

VALUES

(1,2,'2026-08-10','09:00:00','Scheduled'),


(2,1,'2026-08-11','10:30:00','Scheduled'),


(3,2,'2026-08-12','11:00:00','Completed');


