import excel "combined gbtm data v2.xlsx", sheet("Sheet 1") firstrow clear

traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 3 3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 2 3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 1 3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 1 3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 0 3 3 3 3)
trajplot, xtitle(Time) ytitle(WBC) ylabel(5(5)20) ci

traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 2 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 2 2 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 2 2 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 1 2 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(1 0 2 3 3)
trajplot, xtitle(Time) ytitle(WBC) ylabel(5(5)20) ci

traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 2 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 2 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(1 2 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 2 2 3)
trajplot, xtitle(Time) ytitle(WBC) ylabel(5(5)20) ci

traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(1 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 1 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 0 3)
trajplot, xtitle(Time) ytitle(WBC) ylabel(5(5)20) ci
