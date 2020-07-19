import excel "combined gbtm data v1.xlsx", sheet("Sheet 1") firstrow clear

* 6 groups

traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 3 3 3 3 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 3 2 3 3 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 3 2 3 2 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 2 2 3 2 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 2 2 3 2 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 2 2 3 1 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 1 2 3 1 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 1 2 3 0 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 1 1 3 0 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 1 1 2 0 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 0 1 2 0 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 0 1 1 0 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 0 1 1 0 1)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 0 1 1 0 1)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 0 1 1 0 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(1 0 1 1 0 0)

trajplot, xtitle(Time) ytitle(sqrt(platelets)) xlabel(0(1)15) ylabel(5(10)20)



* 5 groups
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 3 3 3 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 3 3 3 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 2 3 3 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 2 3 3 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 3 3 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 3 3 1)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 3 3 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 3 2 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 2 2 0)

trajplot, xtitle(Time) ytitle(sqrt(platelets)) xlabel(0(1)15) ylabel(10(10)20)



* 4 groups
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 3 3 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 3 3 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 2 3 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 2 3 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 2 3 1)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 2 3 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 3 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 2 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 1 0)

trajplot, xtitle(Time) ytitle(sqrt(platelets)) xlabel(0(1)15) ylabel(10(10)20)



* 3 groups
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(3 3 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 3 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 3 2)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 3 1)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 3 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 2 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(3.5) max(24.5) order(2 1 0)

trajplot, xtitle(Time) ytitle(sqrt(platelets)) xlabel(0(1)15) ylabel(10(10)20)
