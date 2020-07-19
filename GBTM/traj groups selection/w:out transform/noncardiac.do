import excel "flags gbtm data.xlsx", sheet("Sheet 1") firstrow clear
traj, var(NONCARDIACFLAG_*) indep(T_*) model(logit) order(3 3 3 3 3)
traj, var(NONCARDIACFLAG_*) indep(T_*) model(logit) order(2 3 3 3 3)
traj, var(NONCARDIACFLAG_*) indep(T_*) model(logit) order(1 3 3 3 2)
trajplot, xtitle(Time) ytitle(prevalance) ci

traj, var(NONCARDIACFLAG_*) indep(T_*) model(logit) order(3 3 3 3)
traj, var(NONCARDIACFLAG_*) indep(T_*) model(logit) order(3 3 2 3)
trajplot, xtitle(Time) ytitle(prevalance) ci
traj, var(NONCARDIACFLAG_*) indep(T_*) model(logit) order(3 3 3)
trajplot, xtitle(Time) ytitle(prevalance) ci
