-- ==========================================
-- 1. SCHEMA DEFINITION (STAGING LAYER)
-- ==========================================
-- We start with TEXT types to ensure 100% data capture from the CSV.
DROP TABLE IF EXISTS hospital_records CASCADE;

CREATE TABLE hospital_records (
    PatientID TEXT, PatientName TEXT, Age TEXT, Gender TEXT, PhoneNumber TEXT, 
    Email TEXT, Address TEXT, City TEXT, State TEXT, RegistrationDate TEXT, 
    DoctorID TEXT, DoctorName TEXT, Specialization TEXT, Department TEXT, 
    DoctorPhone TEXT, ConsultationFee TEXT, AdmissionDate TEXT, DischargeDate TEXT, 
    RoomType TEXT, RoomNumber TEXT, BedNumber TEXT, AdmissionReason TEXT, 
    Diagnosis TEXT, TreatmentGiven TEXT, SurgeryRequired TEXT, SurgeryDate TEXT, 
    FollowUpDate TEXT, TotalBillAmount TEXT, AmountPaid TEXT, PendingAmount TEXT, 
    PaymentMode TEXT, BillingDate TEXT, InsuranceProvider TEXT, FeedbackRating TEXT, 
    Disease TEXT
);

-- [ACTION: PERFORM IMPORT HERE VIA pgAdmin GUI]

-- ==========================================
-- 2. DATA TRANSFORMATION (CLEANING LAYER)
-- ==========================================
-- Converting Text to optimized Data Types for Power BI calculations.
ALTER TABLE hospital_records 
    ALTER COLUMN TotalBillAmount TYPE NUMERIC(15,2) USING TotalBillAmount::numeric,
    ALTER COLUMN AmountPaid TYPE NUMERIC(15,2) USING AmountPaid::numeric,
    ALTER COLUMN PendingAmount TYPE NUMERIC(15,2) USING PendingAmount::numeric,
    ALTER COLUMN Age TYPE INT USING Age::integer,
    ALTER COLUMN RegistrationDate TYPE DATE USING TO_DATE(RegistrationDate, 'DD-MM-YYYY'),
    ALTER COLUMN BillingDate TYPE DATE USING TO_DATE(BillingDate, 'DD-MM-YYYY');

-- ==========================================
-- 3. ANALYTICS LAYER (GOLDEN VIEWS)
-- ==========================================
-- This view powers the high-level KPIs and Charts in the Dashboard.
CREATE OR REPLACE VIEW hospital_analytics_summary AS
SELECT 
    State,
    Disease,
    Specialization,
    PaymentMode,
    COUNT(PatientID) AS Total_Patients,
    SUM(TotalBillAmount) AS Total_Revenue,
    SUM(AmountPaid) AS Total_Received,
    SUM(PendingAmount) AS Total_Outstanding,
    ROUND(AVG(Age), 2) AS Average_Patient_Age
FROM hospital_records
GROUP BY State, Disease, Specialization, PaymentMode;