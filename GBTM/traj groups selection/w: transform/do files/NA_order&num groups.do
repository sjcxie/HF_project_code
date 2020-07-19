import excel "combined gbtm data.xlsx", sheet("Sheet 1") firstrow clear


* 6 groups
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 3 3 3 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 3 2 3 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 3 2 2 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 2 2 2 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 2 2 2 2)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 1 2 2 2)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 1 2 1 2)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 1 2 0 2)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 1 2 0 1)
trajplot, xtitle(Time) ytitle(NA) xlabel(0(1)15) ylabel(120(10)145)


* 5 groups
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 3 3 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 3 2 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 2 3 2 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 2)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 1 3 2 1)
trajplot, xtitle(Time) ytitle(NA) xlabel(0(1)15) ylabel(120(10)145)


* 4 groups
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 3 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 2 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(2 3 2 3)
trajplot, xtitle(Time) ytitle(NA) xlabel(0(1)15) ylabel(120(10)145)


* 3 groups
trajplot, xtitle(Time) ytitle(NA) xlabel(0(1)15) ylabel(120(10)145)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 3 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(180) order(3 2 3)
trajplot, xtitle(Time) ytitle(NA) xlabel(0(1)15) ylabel(120(10)145)
