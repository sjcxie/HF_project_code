import excel "/Users/jinchenxie/Desktop/datasets/processed/GBTM_data/combined gbtm stata data v2.xlsx", sheet("Sheet 1") firstrow clear

traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(50) order(0 2 2 3)

traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(2 0 2 1 1)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 1)

traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(200) order(2 3 2 1 1)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(200) order(3 3 2 2)

traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(3 2 0 2 0)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(2 1 2 3)

traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(8.8) order(0 1 0 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(8.8) order(1 0 2)

traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(10) max(750) order(0 0 2 2)
