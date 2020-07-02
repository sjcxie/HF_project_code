import excel "/Users/jinchenxie/Desktop/datasets/processed/GBTM_data/combined gbtm data v3.xlsx", sheet("Sheet 1") firstrow clear
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 2 2 3) risk(BMI)
