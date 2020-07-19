


* finalized

traj, multgroups(4) var1(WBC_*) indep1(T_*) model1(cnorm)  min1(0) max1(50) order1(0 2 0 2) var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(2 2 2 1) var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(200) order3(2 2 2 1) var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(3 3 2 1) var5(PLATELETS_*) indep5(T_*) model5(cnorm) min5(10) max5(750) order5(1 0 1 0)


multtrajplot, xtitle(Time) ytitle1(WBC) ytitle2(HGB) ytitle3(EGFR) ytitle4(NA) ytitle5(Platelets) ylabel1(4(3.5)21.5) ylabel2(8(1)16) ylabel3(30(30)120) ylabel4(125(10)145) ylabel5(150(100)450)
graph display, ysize(20) xsize(12)

drop bic
gen bic = e(BIC_n_subjects)
export excel patients_id _traj_ProbG1 _traj_ProbG2 _traj_ProbG3 _traj_ProbG4 _traj_Group bic using "/Users/jinchenxie/Desktop/trial save.xlsx", sheetreplace firstrow(variables) keepcellfmt
