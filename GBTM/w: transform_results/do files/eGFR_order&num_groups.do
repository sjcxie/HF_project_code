import excel "combined gbtm data v1.xlsx", sheet("Sheet 1") firstrow clear


* 6 groups
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 3 3 3)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 3 3 2)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 2 3 2)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 2 2 2)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 2 2 1)

trajplot, xtitle(Time) ytitle(sqrt(eGFR)) xlabel(0(1)15) ylabel(2(1)11) ci



* 5 groups
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 3 3)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 2 3)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 2 2)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 2 1)

trajplot, xtitle(Time) ytitle(sqrt(eGFR)) xlabel(0(1)15) ylabel(2(1)10) ci



* 4 groups
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3 3)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 2 3)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 2 2)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 2 1)

trajplot, xtitle(Time) ytitle(sqrt(eGFR)) xlabel(0(1)15) ylabel(2(1)10) ci


* 3 groups
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 3)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1.3) max(12.3) order(3 3 2)

trajplot, xtitle(Time) ytitle(sqrt(eGFR)) xlabel(0(1)15) ylabel(2(1)10) ci
