# HF_project_code
This repository contains the code for HF research study code.

----------------------------------------------------------------------------------------------------
Advanced_Therapy_Candidates_Cohort.ipynb: Filtered the whole dataset to data of patients who are potential candidates for advanced therapy (VAD). 

Cohort_Mortality_Admissions_baseline.ipynb: Examine the mortality rate and readmission rate of the cohort. Especially 30-day readmission rate and all-time mortality rate vs. number of admission the patients had. Still having trouble with the attribute "FOLLOWUP_DAYS" in order to compute 30-day/60-day/1-year mortality.

baseline_attributes_NA_filter.ipynb: Filtered attributes with large portion of missing valuesin baseline dataset. Decided to use 20% and 30% NA tolerance. Baseline dataset with 20% and 30% NA tolerance were saved separately. 

admission_attributes_NA_filter.ipynb: Filtered attributes with large portion of missing valuesin admission dataset. There was no difference between 20% and 30% NA tolerance. Admission dataset with 20/30% NA tolerance were saved. 

Baseline_risk_stratification.ipynb: Attemped to predict 30-day readmission and all-time mortality using only static features. Poor performance. 

