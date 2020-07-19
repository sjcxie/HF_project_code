import excel "combined gbtm data v1.xlsx", sheet("Sheet 1") firstrow clear


* 6 groups
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 3 3 3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 2 3 3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 2 2 3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 2 2 2 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 2 2 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 2 2 3 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 1 2 3 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 1 1 3 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 1 0 3 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 1 1 0 3 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 1 0 0 3 2)

trajplot, xtitle(Time) ytitle(sqrt(K)) xlabel(0(1)15) ylabel(1.8(1)2.8)



* 5 groups
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 3 3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 3 3 2 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 2 3 2 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 2 2 2 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 2 1 2 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 1 2 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 1 1 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 1 1 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(1 2 1 1 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(0 2 1 1 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(0 2 1 0 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(0 2 0 0 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(0 1 0 0 2)

trajplot, xtitle(Time) ytitle(sqrt(K)) xlabel(0(1)15) ylabel(1.8(1)2.8)



* 4 groups
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 1 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 2 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 2 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 1 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 1 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 1 1 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(1 1 1 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(0 1 1 2)

trajplot, xtitle(Time) ytitle(sqrt(K)) xlabel(0(1)15) ylabel(1.8(1)2.8)


* 3 groups

traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 2 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 1 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 1 2)
traj, var(K_*) indep(T_*) model(cnorm) min(1.2) max(3) order(2 1 1)

trajplot, xtitle(Time) ytitle(sqrt(K)) xlabel(0(1)15) ylabel(1.8(1)2.8)

