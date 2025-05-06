# 💼 Layoff Data Cleaning with SQL

This project focuses on **cleaning and preparing real-world layoff data** using SQL. The dataset includes company layoffs across industries, locations, and funding stages. The goal is to make the dataset analysis-ready by applying various **data transformation and cleaning techniques** in a SQL environment.

---

## 📌 Project Objectives

* 🧹 Remove duplicate records
* 🧪 Handle null and missing values
* 📐 Standardize inconsistent entries
* 🗃️ Remove unnecessary columns
* 🔁 Use staging tables for safe transformation

---

## 🛠️ Tools & Techniques Used

* **SQL (MySQL)**
* **CTEs (Common Table Expressions)**
* **Window Functions** (ROW\_NUMBER)
* **Data Staging Tables**
* **Filtering & Deduplication**

---

## 📊 Key Steps Performed

### 1. Data Import & Staging

* Created a staging table `layoffs_staging` to safely manipulate the data without affecting the original dataset.

### 2. Duplicate Detection

* Used `ROW_NUMBER()` with `PARTITION BY` to identify and filter out duplicate records.

### 3. Standardization

* Cleaned inconsistencies in column formats (e.g., company names, stage labels, etc.).

### 4. Null Value Handling

* Analyzed and handled missing values to ensure dataset completeness.

### 5. Column Cleanup

* Removed irrelevant or empty columns for a cleaner schema.

---

## 📁 Files Included

* `project_1.sql` – Main SQL file with all transformation logic

---

## 🚀 How to Use

1. Import your layoff dataset into a MySQL-compatible database.
2. Run `project_1.sql` step-by-step.
3. Use the cleaned table `layoffs_staging` for analysis or reporting.

---

## ✅ Outcome

At the end of this project, you will have a **clean, de-duplicated, and standardized dataset** ready for business analysis, dashboards, or further machine learning tasks.

---

## 🌐 Author

**\[Rabia Batool]**



---
