import excel "combined gbtm data v2.xlsx", sheet("Sheet 1") firstrow clear
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(40) order(2 0 3 3 3 3)
gen bic = e(BIC_n_subjects)
export excel patientsid _traj_ProbG1 _traj_ProbG2 _traj_ProbG3 _traj_ProbG4 _traj_Group bic using "/Users/jinchenxie/Desktop/trial save.xlsx", sheetreplace firstrow(variables) keepcellfmt
drop bic




                
