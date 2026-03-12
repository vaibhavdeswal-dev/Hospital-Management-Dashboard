# Hospital Management & Revenue Analytics Dashboard



An end-to-end healthcare analytics pipeline — from raw CSV data to an interactive Power BI dashboard tracking patient operations, doctor performance, and hospital revenue.

---

## Dashboard Preview


| ![Home_Hospital_Dashboard](https://github.com/user-attachments/assets/0767b4ce-d3ae-4d43-a97e-8b0ebc42ae50)
 ![Hospital_Dashboard](https://github.com/user-attachments/assets/bbe888f7-7826-4bca-af01-5b50460ee27c)

---

## What This Project Does

Raw hospital data (10,000 patient records) is ingested into PostgreSQL via a staging ETL pipeline, cleaned and modeled using SQL Views, then visualized in Power BI. The dashboard surfaces KPIs across three domains:

- **Patient Operations** — admissions, diagnoses, room utilization, surgery rates
- **Doctor Performance** — workload by specialization and department
- **Revenue & Collections** — billing, payment modes, pending amounts, insurance gaps

---

## Dataset

**File:** `Hospital_Management_10k_Records.csv` &nbsp;|&nbsp; **Rows:** 10,000 &nbsp;|&nbsp; **Columns:** 35

| Category | Columns |
|---|---|
| Patient Info | `PatientID`, `PatientName`, `Age`, `Gender`, `City`, `State`, `RegistrationDate` |
| Doctor Info | `DoctorID`, `DoctorName`, `Specialization`, `Department`, `ConsultationFee` |
| Admission | `AdmissionDate`, `DischargeDate`, `RoomType`, `RoomNumber`, `BedNumber`, `AdmissionReason` |
| Clinical | `Diagnosis`, `TreatmentGiven`, `SurgeryRequired`, `SurgeryDate`, `FollowUpDate`, `Disease` |
| Billing | `TotalBillAmount`, `AmountPaid`, `PendingAmount`, `PaymentMode`, `InsuranceProvider` |

---

## Key Results

| Metric | Value |
|---|---|
| Total Patients | 10,000 |
| Average Patient Age | 45.69 |
| Total Doctors | 9,465 |
| Total Billed | $1.03 Billion |
| Amount Collected | $510.23 Million |
| **Amount Pending** | **$523.18 Million (50.7%)** |

> **Revenue leakage of 50.7%** was identified as the primary financial risk — driving a recommendation to improve insurance follow-ups and collection workflows.

---

## Technical Highlights

**ETL Pipeline**
Staged raw CSV into PostgreSQL using staging tables with explicit type-casting on dates, UUIDs, and numeric fields to guarantee 100% data integrity across all 10,000 records.

**SQL Views for KPIs**
Pre-aggregated views were built for every dashboard metric — reducing Power BI query load and improving refresh speeds significantly.

**Financial Risk Finding**
$523M in pending payments identified across payment modes (Card, UPI, Insurance, Cash). Insurance-linked records showed the highest pending ratios.

**Operational Finding**
ICU and Private room types account for ~70% of total revenue, enabling hospital leadership to make informed decisions on bed allocation and resource prioritization.

---

## Tech Stack

| Tool | Purpose |
|---|---|
| PostgreSQL | Data storage, ETL, KPI views |
| SQL | Staging, transformation, aggregation |
| Power BI Desktop | Dashboard & visualization |
| CSV | Source data format |

---

## Project Structure

```
hospital-analytics/
├── data/
│   └── Hospital_Management_10k_Records.csv
├── sql/
│   ├── 01_staging.sql          # Raw data load
│   ├── 02_transformations.sql  # Cleaning & type-casting
│   └── 03_views.sql            # KPI views for Power BI
├── powerbi/
│   └── hospital_dashboard.pbix
├── assets/
│   ├── dashboard_home.png
│   └── dashboard_analytics.png
└── README.md
```

---


