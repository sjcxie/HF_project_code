 /*To creat the hold out the hold out sample the samples was divided into the 5 quintiles (quint) of random draws from a (0,1) uniform distribution (u).
The keep variables were created as follows: */


clear all
set type double
set more off


net from http://www.andrew.cmu.edu/user/bjones/traj
net install traj, replace

cd "/Users/sameerakodi/Desktop/SUMMER/Research/"



*import excel "/Users/sameerakodi/Dropbox/Rema_IS/Feb2020/Feb2020.xlsx", sheet("Sheet1") firstrow clear
import delimited "/Users/sameerakodi/Desktop/SUMMER/Research/DATA/col2020_final.csv"

destring , replace force

gen binary_los = 0

replace binary_los = 0 if correctedlosdays <= 9
replace binary_los = 1 if correctedlosdays > 9

gen anycomplication_new = 0 

replace anycomplication_new = 1 if anycomplication == 1|anycomplication == 2|anycomplication == 3



******************************************************************************************************************************************************************************************************************************************



xtile quint = uniform(), nquantiles(5)


*drop keep1-keep5
gen keep1=1
replace keep1=0 if quint>1
gen keep2=1
replace keep2=0 if quint<2|quint>2
gen keep3=1
replace keep3=0 if quint<3|quint>3
gen keep4=1
replace keep4=0 if quint<4|quint>4
gen keep5=1
replace keep5=0 if quint<5  


*set more off
*traj, model(cnorm) min(0) max(100) var(med_sr_1hr1-med_sr_1hr48) indep(t1-t48) order(2,2,2,2,2) outcome(surv) omodel(logit) probupdates 
traj, model(cnorm) var(temp_0-temp_53) indep(time1-time54) order(3 3 1) min(90) max(105) risk(gender_binary ageatdischarge bmi tpt complicateddiabetes complicatedhtn chronicpulmonarydisease chf hypothyroidism metastaticcancer rheumatoiddisease) outcome(readmissionwithin30d) omodel(logit) probupdates
tabulate _traj_Group _traj_Group_T12,row
tabulate _traj_Group _traj_Group_T18,row
tabulate _traj_Group _traj_Group_T24,row
tabulate _traj_Group _traj_Group_T30,row
tabulate _traj_Group _traj_Group_T36,row
tabulate _traj_Group _traj_Group_T42,row
tabulate _traj_Group _traj_Group_T48,row
tabulate _traj_Group _traj_Group_T53,row
sort _traj_Group,
*by _traj_Group: sum surv
by _traj_Group: sum readmissionwithin30d

*by _traj_Group: sum readmissionwithin30d if keep1 == 1
*by _traj_Group: sum readmissionwithin30d if keep2 == 1
*by _traj_Group: sum readmissionwithin30d if keep3 == 1
*by _traj_Group: sum readmissionwithin30d if keep4 == 1
*by _traj_Group: sum readmissionwithin30d if keep5 == 1

*gen predicted_readmission = 0

trajplot, xtitle("time") ytitle("temperature") ci
graph export "/RESULTS/PREDICTIONS/temp_pred_all.png", replace

export delimited using "/Users/sameerakodi/Desktop/SUMMER/Research/DATA/PREDICTION/all.csv", replace


*traj, model(cnorm) min(0) max(100) var(med_sr_1hr1-med_sr_1hr48) indep(t1-t48) order(2,2,2,2,2) probupdates outcome(surv) omodel(logit) outofsample(keep1) 
traj, model(cnorm) var(temp_0-temp_53) indep(time1-time54) order(3 3 1) min(90) max(105) risk(gender_binary ageatdischarge bmi tpt complicateddiabetes complicatedhtn chronicpulmonarydisease chf hypothyroidism metastaticcancer rheumatoiddisease) outcome(readmissionwithin30d) omodel(logit) probupdates outofsample(keep1) 
sort keep1
by keep1: tabulate _traj_Group _traj_Group_T12,row
by keep1: tabulate _traj_Group _traj_Group_T18,row
by keep1: tabulate _traj_Group _traj_Group_T24,row
by keep1: tabulate _traj_Group _traj_Group_T30,row
by keep1: tabulate _traj_Group _traj_Group_T36,row
by keep1: tabulate _traj_Group _traj_Group_T42,row
by keep1: tabulate _traj_Group _traj_Group_T48,row
by keep1: tabulate _traj_Group _traj_Group_T53,row

sort _traj_Group
*by _traj_Group: sum surv if keep1==0
*by _traj_Group: sum surv if keep1==1

by _traj_Group: sum readmissionwithin30d if keep1 == 0
by _traj_Group: sum readmissionwithin30d if keep1 == 1

trajplot, xtitle("time") ytitle("temperature") ci
graph export "/RESULTS/PREDICTIONS/temp_pred_keep1.png", replace

export delimited using "/Users/sameerakodi/Desktop/SUMMER/Research/DATA/PREDICTION/outofsamplekeep1.csv", replace

*traj, model(cnorm) min(0) max(100) var(med_sr_1hr1-med_sr_1hr48) indep(t1-t48) order(2,2,2,2,2) probupdates outcome(surv) omodel(logit) outofsample(keep2) 
traj, model(cnorm) var(temp_0-temp_53) indep(time1-time54) order(3 3 1) min(90) max(105) risk(gender_binary ageatdischarge bmi tpt complicateddiabetes complicatedhtn chronicpulmonarydisease chf hypothyroidism metastaticcancer rheumatoiddisease) outcome(readmissionwithin30d) omodel(logit) probupdates outofsample(keep2) 
sort keep2
by keep2: tabulate _traj_Group _traj_Group_T12,row
by keep2: tabulate _traj_Group _traj_Group_T18,row
by keep2: tabulate _traj_Group _traj_Group_T24,row
by keep2: tabulate _traj_Group _traj_Group_T30,row
by keep2: tabulate _traj_Group _traj_Group_T36,row
by keep2: tabulate _traj_Group _traj_Group_T42,row
by keep2: tabulate _traj_Group _traj_Group_T48,row
by keep2: tabulate _traj_Group _traj_Group_T53,row
sort _traj_Group


*by _traj_Group: sum surv if keep2==0
*by _traj_Group: sum surv if keep2==1

by _traj_Group: sum readmissionwithin30d if keep2 == 0
by _traj_Group: sum readmissionwithin30d if keep2 == 1

trajplot, xtitle("time") ytitle("temperature") ci
graph export "/RESULTS/PREDICTIONS/temp_pred_keep2.png", replace

export delimited using "/Users/sameerakodi/Desktop/SUMMER/Research/DATA/PREDICTION/outofsamplekeep2.csv", replace

*traj, model(cnorm) min(0) max(100) var(med_sr_1hr1-med_sr_1hr48) indep(t1-t48) order(2,2,2,2,2) probupdates outcome(surv) omodel(logit) outofsample(keep3) 
traj, model(cnorm) var(temp_0-temp_53) indep(time1-time54) order(3 3 1) min(90) max(105) risk(gender_binary ageatdischarge bmi tpt complicateddiabetes complicatedhtn chronicpulmonarydisease chf hypothyroidism metastaticcancer rheumatoiddisease) outcome(readmissionwithin30d) omodel(logit) probupdates outofsample(keep3) 
sort keep3
by keep3: tabulate _traj_Group _traj_Group_T12,row
by keep3: tabulate _traj_Group _traj_Group_T18,row
by keep3: tabulate _traj_Group _traj_Group_T24,row
by keep3: tabulate _traj_Group _traj_Group_T30,row
by keep3: tabulate _traj_Group _traj_Group_T36,row
by keep3: tabulate _traj_Group _traj_Group_T42,row
by keep3: tabulate _traj_Group _traj_Group_T48,row
by keep3: tabulate _traj_Group _traj_Group_T53,row
sort _traj_Group

*by _traj_Group: sum surv if keep3==0
by _traj_Group: sum readmissionwithin30d if keep3==0
by _traj_Group: sum readmissionwithin30d if keep3==1

trajplot, xtitle("time") ytitle("temperature") ci
graph export "/RESULTS/PREDICTIONS/temp_pred_keep3.png", replace

export delimited using "/Users/sameerakodi/Desktop/SUMMER/Research/DATA/PREDICTION/outofsamplekeep3.csv", replace
/* by _traj_Group: sum surv if keep3==1
traj, model(cnorm) min(0) max(100) var(med_sr_1hr1-med_sr_1hr48) indep(t1-t48) order(2,2,2,2,2) outcome(surv) omodel(logit) probupdates outofsample(keep4) 
table _traj_Group _traj_Group_T12
table _traj_Group _traj_Group_T18
table _traj_Group _traj_Group_T24
table _traj_Group _traj_Group_T30
table _traj_Group _traj_Group_T36
sort _traj_Group
by _traj_Group: sum surv  */


*traj, model(cnorm) min(0) max(100) var(med_sr_1hr1-med_sr_1hr48) indep(t1-t48) order(2,2,2,2,2) probupdates outcome(surv) omodel(logit) outofsample(keep4) 
traj, model(cnorm) var(temp_0-temp_53) indep(time1-time54) order(3 3 1) min(90) max(105) risk(gender_binary ageatdischarge bmi tpt complicateddiabetes complicatedhtn chronicpulmonarydisease chf hypothyroidism metastaticcancer rheumatoiddisease) outcome(readmissionwithin30d) omodel(logit) probupdates outofsample(keep4)
sort keep4
by keep4: tabulate _traj_Group _traj_Group_T12,row
by keep4: tabulate _traj_Group _traj_Group_T18,row
by keep4: tabulate _traj_Group _traj_Group_T24,row
by keep4: tabulate _traj_Group _traj_Group_T30,row
by keep4: tabulate _traj_Group _traj_Group_T36,row
by keep4: tabulate _traj_Group _traj_Group_T42,row
by keep4: tabulate _traj_Group _traj_Group_T48,row
by keep4: tabulate _traj_Group _traj_Group_T53,row
sort _traj_Group

*by _traj_Group: sum surv if keep4==0
*by _traj_Group: sum surv if keep4==1

by _traj_Group: sum readmissionwithin30d if keep4==0
by _traj_Group: sum readmissionwithin30d if keep4==1

trajplot, xtitle("time") ytitle("temperature") ci
graph export "/RESULTS/PREDICTIONS/temp_pred_keep4.png", replace

export delimited using "/Users/sameerakodi/Desktop/SUMMER/Research/DATA/PREDICTION/outofsamplekeep4.csv", replace


*traj, model(cnorm) min(0) max(100) var(med_sr_1hr1-med_sr_1hr48) indep(t1-t48) order(2,2,2,2,2) probupdates outcome(surv) omodel(logit) outofsample(keep5) 
traj, model(cnorm) var(temp_0-temp_53) indep(time1-time54) order(3 3 1) min(90) max(105) risk(gender_binary ageatdischarge bmi tpt complicateddiabetes complicatedhtn chronicpulmonarydisease chf hypothyroidism metastaticcancer rheumatoiddisease) outcome(readmissionwithin30d) omodel(logit) probupdates outofsample(keep5)

sort keep5
by keep5: tabulate _traj_Group _traj_Group_T12,row
by keep5: tabulate _traj_Group _traj_Group_T18,row
by keep5: tabulate _traj_Group _traj_Group_T24,row
by keep5: tabulate _traj_Group _traj_Group_T30,row
by keep5: tabulate _traj_Group _traj_Group_T36,row
by keep5: tabulate _traj_Group _traj_Group_T42,row
by keep5: tabulate _traj_Group _traj_Group_T48,row
by keep5: tabulate _traj_Group _traj_Group_T53,row
sort _traj_Group
*by _traj_Group: sum surv if keep5==0
*by _traj_Group: sum surv if keep5==1

by _traj_Group: sum readmissionwithin30d if keep5==0
by _traj_Group: sum readmissionwithin30d if keep5==1

trajplot, xtitle("time") ytitle("temperature") ci
graph export "/RESULTS/PREDICTIONS/temp_pred_keep5.png", replace

export delimited using "/Users/sameerakodi/Desktop/SUMMER/Research/DATA/PREDICTION/outofsamplekeep5.csv", replace

*## READ THE PREDICTION PAPERS (SINGLE TRAJECTORY PAPERS : 
