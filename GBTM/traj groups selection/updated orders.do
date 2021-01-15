drop bic
gen bic = e(BIC_n_subjects)
export excel patients_id _traj_ProbG1 _traj_ProbG2 _traj_ProbG3 _traj_ProbG4 _traj_Group bic using "/Users/jinchenxie/Desktop/trial save.xlsx", sheetreplace firstrow(variables) keepcellfmt


* WBC

traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(50) order(3 2 2 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(50) order(0 0 1 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(50) order(0 2 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(50) order(0 1 2)

trajplot, xtitle(Time) ytitle(WBC) ylabel(4(3.5)21.5) ci



* HGB

traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 2 2 3 1 1)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(2 0 2 1 1)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 1)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 2 1)

trajplot, xtitle(Time) ytitle(HGB) xlabel(0(1)15) ylabel(8(1)16) ci


* GLUCOSE (log Glucose)

traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1) max(3) order(0 0 1 1 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1) max(3) order(1 2 2 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1) max(3) order(2 0 1 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1) max(3) order(2 1 3)

trajplot, xtitle(Time) ytitle(log Glucose) xlabel(0(1)15) ylabel(2(0.3)2.3) ci

* eGFR

traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(200) order(3 3 2 2 3 3)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(200) order(2 3 2 1 1)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(200) order(3 3 2 2)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(200) order(3 2 1)

trajplot, xtitle(Time) ytitle(eGFR) xlabel(0(1)15) ylabel(30(30)120) ci

* NA

traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(3 1 0 2 1 0)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(3 2 0 2 0)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(2 1 2 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(3 2 3)

trajplot, xtitle(Time) ytitle(NA) ylabel(125(10)145) ci


* K
traj, var(K_*) indep(T_*) model(cnorm) min(1) max(9) order(0 2 1 2 2 1)
traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(8.8) order(2 0 2 0 1)
traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(8.8) order(0 1 0 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(8.8) order(1 0 2)

trajplot, xtitle(Time) ytitle(K) ylabel(3.5(1)5.5) ci

* Platelets

traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(10) max(750) order(0 1 2 2 0 1)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(10) max(750) order(0 0 0 1 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(10) max(750) order(0 0 2 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(10) max(750) order(0 1 0)

trajplot, xtitle(Time) ytitle(Platelets) ylabel(150(100)450) ci




traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(200) order(2 3 2 1 0)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(2 2 1 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1) max(500) order(3 0 3 3 2)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1) max(500) order(2 0 3 3 0)
trajplot, xtitle(Time) xlabel(0(1)10) ylabel(100(50)350) ci

traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(8) order(0 1 0 0 2)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(50) order(3 0 2 3 3)
