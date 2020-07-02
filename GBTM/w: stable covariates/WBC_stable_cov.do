import excel "combined gbtm data v3.xlsx", sheet("Sheet 1") firstrow clear
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 3 3 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 2 3 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 1 3 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 0 3 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 0 2 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 0 2 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
trajplot, xtitle(Time) ytitle(WBC) ylabel(5(5)20) ci


traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 3 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 3 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 2 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(1 2 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 2 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
trajplot, xtitle(Time) ytitle(WBC) ylabel(5(5)20) ci

traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(3 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(1 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 3 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 2 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 1 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(0 0 3) risk(STATIC_1-STATIC_4 STATIC_6-STATIC_8)
trajplot, xtitle(Time) ytitle(WBC) ylabel(5(5)20) ci
