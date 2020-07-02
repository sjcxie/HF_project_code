 import excel "combined gbtm data v1.xlsx", sheet("Sheet 1") firstrow clear
 
* 6 groups
 
 
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 3 3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 2 3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 2 3 3 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 2 2 3 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 2 2 3 1 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 2 2 2 1 3)

* all orders are statistically significant
trajplot, xtitle(Time) ytitle(sqrt(WBC)) xlabel(0(1)15) ylabel(2(1)5) ci
 
* 5 groups
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 2 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 3 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 2 2 3)

* all orders are statistically significant
trajplot, xtitle(Time) ytitle(sqrt(WBC)) xlabel(0(1)15) ylabel(2(1)5) ci


* 4 groups
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 1 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 0 3)

* all orders are statistically significant 
trajplot, xtitle(Time) ytitle(sqrt(WBC)) xlabel(0(1)15) ylabel(2(1)5) ci


* 3 groups
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(3 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 3 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 3)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(2 2 2)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(1 2 2)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(6.4) order(0 2 2)

* all orders are statistically significant
trajplot, xtitle(Time) ytitle(sqrt(WBC)) xlabel(0(1)15) ylabel(2(1)5) ci
