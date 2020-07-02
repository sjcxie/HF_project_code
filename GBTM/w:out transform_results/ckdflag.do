traj, var(CKDFLAG_*) indep(T_*) model(logit) order(2 2 0 2 0)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(2 2 0 3 2)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(3 3 3 3)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(2 2 2 3)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(1 2 2 3)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(0 2 2 3)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(0 2 2 2)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(0 2 2 3)
trajplot, xtitle(Time) ytitle(prevalance) ci


traj, var(CKDFLAG_*) indep(T_*) model(logit) order(3 3 3)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(2 2 3)
traj, var(CKDFLAG_*) indep(T_*) model(logit) order(2 2 2)
trajplot, xtitle(Time) ytitle(prevalance) ci
