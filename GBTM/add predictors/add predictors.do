import excel "/Users/jinchenxie/Desktop/datasets/processed/GBTM_data/combined gbtm data v3.xlsx", sheet("Sheet 1") firstrow clear



* WBC predictors

traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 2 2 3) risk(FEMALE) refgroup(5)




* HGB predictors

traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 2 1) risk(BP_SYSTOLIC) refgroup(1)


* K predictors

traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(8.8) order(0 0 1 2) risk(BMI) refgroup(4)
traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(8.8) order(0 0 1 2) risk(CTB) refgroup(4)



* EGFR
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(194) order(3 3 2 1 1) risk(AGE_ADMISSION) refgroup(1)



* NA
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(AGE_ADMISSION ) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(RACE_White ) refgroup(3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(CTB ) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(timesadmission) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(BMI) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(BP_DIASTOLIC ) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(BP_SYSTOLIC  ) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(INSUR_Commercial ) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(INSUR_Medicare ) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(INSUR_Medicare ) refgroup(3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(INSUR_Commercial ) refgroup(3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1) risk(HTN_HST  ) refgroup(1)

traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(2 3 2 3) risk(AGE_ADMISSION) refgroup(1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(2 3 2 3) risk(RACE_White ) refgroup(1)


* Platelets
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(14) max(600) order(0 1 3 3 2) risk(FEMALE) refgroup(1)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(14) max(600) order(0 1 3 3 2) risk(AGE_ADMISSION ) refgroup(1)


* HCT
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 1 3 3 1 1) risk(RACE_White ) refgroup(1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 1 3 3 1 1) risk(AGE_ADMISSION) refgroup(2)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 1 3 3 1 1) risk(FEMALE) refgroup(2)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 1 3 3 1 1) risk(CTB) refgroup(2)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 1 3 3 1 1) risk(CTB) refgroup(1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 1 3 3 1 1) risk(timesadmission) refgroup(1)
