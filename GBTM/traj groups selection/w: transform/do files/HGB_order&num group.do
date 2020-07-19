import excel "combined gbtm data.xlsx", sheet("Sheet 1") firstrow clear
 

 
 * 6 groups
 
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 3 3 3)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 3 2 3)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 2 2 3)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 2 2 2)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 2 3 2 2 2)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 2 3 2 2 1)
c
 
trajplot, xtitle(Time) ytitle(HGB) xlabel(0(1)15) ylabel(8(1)16)
 
 
 * 5 groups
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 3 3)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 2 3)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 2 2)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 2 1)

trajplot, xtitle(Time) ytitle(HGB) xlabel(0(1)15) ylabel(8(1)16)


* 4 groups
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 3)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3 2)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 2 2)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 1 2)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 1 1)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 2 1 1)

trajplot, xtitle(Time) ytitle(HGB) xlabel(0(1)15) ylabel(8(1)16)

* 3 groups
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 3)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 2)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 3 1)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 2 1)

trajplot, xtitle(Time) ytitle(HGB) xlabel(0(1)15) ylabel(8(1)16)
