import excel "/Users/jinchenxie/Desktop/HF_Research/datasets/processed/GBTM_data/labs_labels_tvarycov.xlsx", sheet("Sheet 1") firstrow clear
* Univariate model

traj, var(EGFR_*) indep(T_*) model(cnorm) min(1) max(150) order(2 3 2 1 0) tcov(POST_VAD_* POST_HTX_*) risk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)
traj, var(N_A_*) indep(T_*) model(cnorm) min(100) max(175) order(2 2 2 2 0) tcov(POST_VAD_* POST_HTX_*) risk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)
traj, var(HGB_*) indep(T_*) model(cnorm) min(2) max(25) order(1 3 3 1 1) tcov(POST_VAD_* POST_HTX_*) risk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)
traj, var(WBC_*) indep(T_*) model(cnorm) min(0) max(25) order(0 3 3 3 3) tcov(POST_VAD_*) risk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)

** WBC with both POST_VAD and POST_HTX crashed the program everytime.

traj, var(K_*) indep(T_*) model(cnorm) min(1.5) max(7.0) order(0 1 0 1 1) tcov(POST_VAD_* POST_HTX_*) risk(AGE_ADMISSION FEMALE TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE)

** K with ACE_ARB_00 and CCI_CAD has " variance matrix is nonsymmetric or highly singular"\

traj, var(PLATELETS_*) indep(T_*) model(cnorm) min(10) max(600) order(1 0 0 0 2) tcov(POST_VAD_* POST_HTX_*) risk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)

traj, var(GLUCOSE_*) indep(T_*) model(cnorm) min(1) max(500) order(3 0 3 3 2) risk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00)





** multi-traj model 
*** full model with 

traj, multgroups(5) var1(WBC_*) indep1(T_*) model1(cnorm) min1(0) max1(50) order1(0 3 3 3 3) tcov1(POST_VAD_*) var2(HGB_*) indep2(T_*) model2(cnorm) min2(2) max2(25) order2(2 3 3 1 1) tcov2(POST_VAD_*) var3(EGFR_*) indep3(T_*) model3(cnorm) min3(1) max3(200) order3(2 3 2 1 0) tcov3(POST_VAD_*) var4(N_A_*) indep4(T_*) model4(cnorm) min4(100) max4(175) order4(2 3 2 2 0) tcov4(POST_VAD_*) var5(PLATELETS_*) indep5(T_*) model5(cnorm) min5(10) max5(600) order5(1 0 0 0 2) tcov5(POST_VAD_*) var6(K_*) indep6(T_*) model6(cnorm) min6(1.5) max6(7.0) order6(0 1 0 1 1) tcov6(POST_VAD_*) multrisk(AGE_ADMISSION FEMALE BP_DIASTOLIC TOBACCO_Never INSUR_Commercial HTN_HST COPD_HST CKD_HST CAD_HST CCI_PERIPHERAL_VASC CCI_RENAL_DISEASE ACE_ARB_00) probupdates




** results saving
export delimited using "/Users/jinchenxie/Desktop/HF_Research/Weekly Progress/week 16/multitraj_1.csv", replace
