



************************************************************************
import excel "/Users/jinchenxie/Desktop/datasets/processed/GBTM_data/combined 7 labs_labels.xlsx", sheet("Sheet 1") firstrow clear

* with labels
import excel 
"/Users/jinchenxie/Desktop/datasets/processed/GBTM_data/combined 7 labs_labels.xlsx", sheet("Sheet 1") firstrow clear

* with labels and time-varying covariates and baseline covariates
import excel "/Users/jinchenxie/Desktop/HF_Research/datasets/processed/GBTM_data/labs_labels_tvarycov.xlsx", sheet("Sheet 1") firstrow clear

************************************************************************
* univariate

** 5 groups
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(2 3 3 1 1)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(150) order(2 3 2 1 0)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(25) order(0 3 3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(7.0) order(0 1 0 1 1)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(2 3 2 2 0)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(10) max(600) order(1 0 0 0 2)
traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1) max(500) order(3 0 3 3 2)


trajplot, xtitle(Time) ytitle(HGB) ylabel(9(1)15) ci
trajplot, xtitle(Time) ytitle(eGFR) ylabel(30(30)120) ci
trajplot, xtitle(Time) ytitle(WBC) ylabel(4(3.5)21.5) ci
trajplot, xtitle(Time) ytitle(K) ylabel(3.5 4.6 5.5) ci
trajplot, xtitle(Time) ytitle(NA) ylabel(125(10)145) ci

** 4 groups
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(3 0 2 1)
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(150) order(2 3 1 0)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(25) order(0 3 3 3)
traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(7.0) order(0 0 1 3)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(2 2 2 3)
traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(10) max(600) order(0 0 0 2)

** with covariates
traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(150) order(2 3 2 1 0) tcov(POST_VAD_* POST_HTX_*) risk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(2 3 2 2 0) tcov(POST_VAD_* POST_HTX_*) risk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)

************************************************************************
* Joint Trajectories

** EGFR and Sodium
*** Using selected orders
traj, multgroups(5) var1(EGFR_*) indep1(T_*) model1(cnorm) min1(1) max1(400) order1(2 3 2 1 0) var2(N_A_*) indep2(T_*) model2(cnorm) min2(100) max2(175) order2(2 3 2 2 0) 


*** using new orders
traj, multgroups(5) var1(EGFR_*) indep1(T_*) model1(cnorm) min1(1) max1(400) order1(2 2 2 1 0) var2(N_A_*) indep2(T_*) model2(cnorm) min2(100) max2(175) order2(3 2 2 1 2) 

multtrajplot, xtitle(Time) ytitle1(EGFR) ytitle2(NA) ylabel1(30(30)120) ylabel2(130(5)140)
graph display, ysize(12) xsize(20)

************************************************************************
* multinomial

** use the univariate orders selected

*** 6 labs (without glucose)
traj, multgroups(5) var1(WBC_*) indep1(T_*) model1(cnorm) min1(0) max1(50) order1(0 3 3 3 3) 
var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(2 3 3 1 1) 
var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(400) order3(2 3 2 1 0) 
var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(2 3 2 2 0) 
var5(PLATELETS_*) indep5(T_*) model5(cnorm) min5(10) max5(950) order5(1 0 0 0 2) 
var6(K_*) indep6(T_*) model6(cnorm) min6(1.5) max6(7.0) order6(0 1 0 1 1)

traj, multgroups(5) var1(WBC_*) indep1(T_*) model1(cnorm) min1(0) max1(50) order1(0 3 3 3 3) var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(2 3 3 1 1) var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(200) order3(2 3 2 1 0) var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(2 3 2 2 0) var5(PLATELETS_*) indep5(T_*) model5(cnorm) min5(10) max5(600) order5(1 0 0 0 2) var6(K_*) indep6(T_*) model6(cnorm) min6(1.5) max6(7.0) order6(0 1 0 1 1)

*** 6 labs (without platelets)

traj, multgroups(5) var1(WBC_*) indep1(T_*) model1(cnorm) min1(0) max1(50) order1(0 3 3 3 3) 
var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(2 3 3 1 1) 
var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(200) order3(2 3 2 1 0) 
var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(2 3 2 2 0) 
var5(GLUCOSE_*) indep5(T_*) model5(cnorm) min5(1) max5(500) order5(3 0 3 3 2) 
var6(K_*) indep6(T_*) model6(cnorm) min6(1.5) max6(7.0) order6(0 1 0 1 1)

traj, multgroups(5) var1(WBC_*) indep1(T_*) model1(cnorm) min1(0) max1(50) order1(0 3 3 3 3) var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(2 3 3 1 1) var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(200) order3(2 3 2 1 0) var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(2 3 2 2 0) var5(GLUCOSE_*) indep5(T_*) model5(cnorm) min5(1) max5(500) order5(3 0 3 3 2) var6(K_*) indep6(T_*) model6(cnorm) min6(1.5) max6(7.0) order6(0 1 0 1 1)

multtrajplot, xtitle(Time) ytitle1(WBC) ytitle2(HGB) ytitle3(EGFR) ytitle4(NA) ytitle5(Glucose) ytitle6(K) ylabel1(7.5(3.5)14.5) ylabel2(9(1)13) ylabel3(30(30)90) ylabel4(130(5)140) ylabel5(150(50)200) ylabel6(4(0.5)4.5)

*** 5 labs (without platelets and glucose)


*** 4 labs (without platelets, glucose and potassium)

traj, multgroups(5) var1(WBC_*) indep1(T_*) model1(cnorm) min1(0) max1(50) order1(0 3 3 3 3) var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(2 3 3 1 1) var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(200) order3(2 3 2 1 0) var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(2 3 2 2 0)

** use significant estimates

traj, multgroups(5) var1(WBC_*) indep1(T_*) model1(cnorm) min1(0) max1(50) order1(0 2 0 0 3) var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(1 1 1 1 1) var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(200) order3(2 2 1 1 1) var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(2 2 1 1 0) var5(PLATELETS_*) indep5(T_*) model5(cnorm) min5(10) max5(600) order5(0 0 0 0 0) var6(K_*) indep6(T_*) model6(cnorm) min6(1.5) max6(8) order6(0 2 1 0 0)

multtrajplot, xtitle(Time) ytitle1(WBC) ytitle2(HGB) ytitle3(EGFR) ytitle4(NA) ytitle5(Platelets) ytitle6(K) ylabel1(7.5(3.5)14.5) ylabel2(9(1)13) ylabel3(30(30)90) ylabel4(130(5)140) ylabel5(150(100)300) ylabel6(3.5(0.5)4.5)

graph display, ysize(20) xsize(12)

************************************************************************
** time-varying covariates

traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(2 2 2 2 0) tcov(POST_VAD_* POST_HTX_*)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(25) order(0 3 3 3 3) tcov(POST_VAD_* POST_HTX_*)
traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(7.0) order(0 1 0 1 1) tcov(POST_VAD_* POST_HTX_*)

traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(150) order(2 3 2 1 0)  tcov(POST_VAD_* POST_HTX_* PCI_* IABP_* ABLATION_* ICD_IMPLANT_* BIV_ICD_IMPLANT_*) 

************************************************************************
** time-stable covariates

traj, multgroups(5) var1(WBC_*) indep1(T_*) model1(cnorm) min1(0) max1(50) order1(0 3 3 3 3) tcov1(POST_VAD_*) var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(2 3 3 1 1) tcov2(POST_VAD_*) var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(200) order3(2 3 2 1 0) tcov3(POST_VAD_*) var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(2 3 2 2 0) tcov4(POST_VAD_*) var5(PLATELETS_*) indep5(T_*) model5(cnorm) min5(10) max5(600) order5(1 0 0 0 2) tcov5(POST_VAD_*) var6(K_*) indep6(T_*) model6(cnorm) min6(1.5) max6(7.0) order6(0 1 0 1 1) tcov6(POST_VAD_*) multrisk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)

************************************************************************
** distal outcome 

*** two-step
traj, var(EGFR_*) indep(T_*) model(cnorm) max(150) order(2 3 2 1 0) outcome(CTB) omodel(logit) twostep
traj, multgroups(5) var1(EGFR_*) indep1(T_*) model1(cnorm) min1(1) max1(400) order1(2 3 2 1 0) var2(N_A_*) indep2(T_*) model2(cnorm) min2(100) max2(175) order2(2 3 2 2 0) outcome(CTB) omodel(logit) twostep


export excel patients_id _traj_Group _traj_Outcome using "/Users/jinchenxie/Desktop/trial save.xlsx", sheetreplace firstrow(variables) keepcellfmt

************************************************************************
** save info

gen bic = e(BIC_n_subjects)

export excel patients_id _traj_ProbG1 _traj_ProbG2 _traj_ProbG3 _traj_ProbG4 _traj_ProbG5 _traj_Group using "/Users/jinchenxie/Desktop/trial save.xlsx", sheetreplace firstrow(variables) keepcellfmt
