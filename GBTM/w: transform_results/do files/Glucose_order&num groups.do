import excel "combined gbtm data v1.xlsx", sheet("Sheet 1") firstrow clear


* 6 groups
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(3 3 3 3 3 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(3 3 3 3 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(2 3 3 3 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(2 2 3 3 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(1 2 3 3 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(1 2 3 2 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(1 1 3 2 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(0 1 3 2 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(0 1 3 1 2 3)
trajplot, xtitle(Time) ytitle(log10(glucose)) xlabel(0(1)15) ylabel(2(0.5)2.5) ci


* 5 groups

traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(3 3 3 3 3) 
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(2 3 3 3 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(1 3 3 3 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(1 2 3 3 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(1 2 3 2 3)
trajplot, xtitle(Time) ytitle(log10(glucose)) xlabel(0(1)15) ylabel(2(0.5)2.5)


* 4 groups

traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(3 3 3 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(3 3 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(3 3 1 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(2 3 1 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(1 3 1 3)
trajplot, xtitle(Time) ytitle(log10(glucose)) xlabel(0(1)15) ylabel(2(0.5)2.5)


* 3 groups
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(3 3 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(2 3 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(2 2 3)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1.3) max(2.8) order(2 1 3)
trajplot, xtitle(Time) ytitle(log10(glucose)) xlabel(0(1)15) ylabel(2(0.5)2.5)
