import excel "combined gbtm data.xlsx", sheet("Sheet 1") firstrow clear

* 6 groups
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 3 3 3)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 3 2 3)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 3 2 2)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 3 1 2)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 3 1 1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 3 3 3 1 1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 2 3 3 1 1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(2 1 3 3 1 1)
trajplot, xtitle(Time) ytitle(HCT) xlabel(0(1)15) ylabel(20(10)50)


* 5 groups
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 3 3)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 2 3)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 2 2)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 2 1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 2 3 2 1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 1 3 2 1)
trajplot, xtitle(Time) ytitle(HCT) xlabel(0(1)15) ylabel(20(10)50)


* 4 groups
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 3)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 2)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3 1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 2 1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 2 2 1)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 2 1 1)
trajplot, xtitle(Time) ytitle(HCT) xlabel(0(1)15) ylabel(20(10)50)


* 3 groups
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 3 3)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 2 3)
traj, var(HCT_*) indep(T_*) model(cnorm) min(9.5) max(76.5) order(3 2 2)

trajplot, xtitle(Time) ytitle(HCT) xlabel(0(1)15) ylabel(20(10)50)
