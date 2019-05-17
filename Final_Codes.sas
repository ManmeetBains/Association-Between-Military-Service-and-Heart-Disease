***********************************************************************************
* FILE NAME:     CAPSTONE PROJECT                                                                                                        *
* DESCRIPTION:   An Investigation of The Association Between Military Service and                             *
*                                    Heart Disease: A Trend Analysis                                                                          *
*                                                                                                                                                                  *
* REFERENCES:                                                                                                                                           *
* DATA       BRFSS DATA FROM 2011-2017                                                                                                 *
* TEAM      Manmeet Bains, Kara Lena & AK                                                                                                                                                 *
*                                                                                                                                                                  *
* UPDATED - 04/27/2019                                                          													             *
***********************************************************************************;


**************************  Creating SAS Data Library Project *****************************;

LIBNAME PROJECT  'C:\Users\Manmeet Bains\Desktop\capstone\Data';
run;


********************************  Subsetting Datasets **********************************;

******************************** SUBSETTING BRFSS 2011*******************************;
DATA NEW11;
SET PROJECT.LLCP2011 (KEEP= IYEAR  EDUCA EMPLOY GENHLTH _INCOMG MARITAL SEX _RFSMOK3
_SMOKER3  USENOW3 VETERAN3 _AGE_G  _BMI5CAT CVDCRHD4 CVDINFR4 RACE2 _STATE 
ASTHMA3 CHCCOPD   DIABETE3 _LLCPWT);
RUN;

** Renaming variable race and employment to make variable names consistent over the years;
DATA NEW11;
SET NEW11     (RENAME=  (RACE2= _RACE CHCCOPD=CHCCOPD1 EMPLOY=EMPLOY1 ));
RUN;

** Creating New Variable for Chronic Disease ;
DATA NEW11;
SET NEW11;
CHRONIC_DISEASE = 0;
IF ASTHMA3=1 OR DIABETE3 =1 OR CHCCOPD1=1 THEN CHRONIC_DISEASE = 1 ;
RUN;

** Creating New Variable for MICHD as it is not present in years before 2015 ;
DATA NEW11;
SET NEW11;
_MICHD = 0;
IF CVDCRHD4=1 OR CVDINFR4 =1 THEN _MICHD = 1 ;
RUN;


***************************** SUBSETTING BRFSS 2012******************************;
DATA NEW12;
SET PROJECT.LLCP2012 (KEEP= IYEAR  EDUCA EMPLOY GENHLTH _INCOMG MARITAL SEX  USENOW3
VETERAN3 _AGE_G   _BMI5CAT _RFSMOK3 _SMOKER3 CVDCRHD4 CVDINFR4 RACE2 _STATE 
ASTHMA3 CHCCOPD1   DIABETE3 _LLCPWT);
RUN;

** Renaming variable race and employment to make variable names consistent over the years;
DATA NEW12;
SET NEW12 (RENAME=  (RACE2= _RACE EMPLOY=EMPLOY1));
RUN;

** Creating New Variable fOR Chronic Disease fOR 2012;
DATA NEW12;
SET NEW12;
CHRONIC_DISEASE =0;
IF ASTHMA3=1 OR DIABETE3 =1 OR CHCCOPD1=1 THEN CHRONIC_DISEASE = 1 ;
RUN;

** Creating New Variable for MICHD for 2012 as it is not present in years before 2015 ;
DATA NEW12;
SET NEW12;
_MICHD = 0;
IF CVDCRHD4=1 OR CVDINFR4 =1 THEN _MICHD = 1 ;
RUN;

***************************** SUBSETTING BRFSS 2013******************************;
DATA NEW13;
SET PROJECT.LLCP2013 (KEEP= IYEAR  EDUCA EMPLOY1  GENHLTH _INCOMG MARITAL SEX  USENOW3
VETERAN3 _RFSMOK3 _SMOKER3 _AGE_G   _BMI5CAT CVDCRHD4 CVDINFR4 _RACE _STATE  
ASTHMA3 CHCCOPD1    DIABETE3 _LLCPWT);
RUN;

** Creating New Variable for Chronic Disease for 2013 ;
DATA NEW13;
SET NEW13;
CHRONIC_DISEASE = 0;
 IF ASTHMA3=1 OR DIABETE3 =1 OR CHCCOPD1=1 THEN CHRONIC_DISEASE = 1 ;
RUN;

** Creating New Variable for MICHD for 2013 as it is not present in years before 2015 ;
DATA NEW13;
SET NEW13;
_MICHD = 0;
IF CVDCRHD4=1 OR CVDINFR4 =1 THEN _MICHD = 1 ;
RUN;



***************************** SUBSETTING BRFSS 2014******************************;
DATA NEW14;
SET PROJECT.LLCP2014 (KEEP= IYEAR  EDUCA EMPLOY1  GENHLTH _INCOMG MARITAL SEX _RFSMOK3
_SMOKER3 USENOW3 VETERAN3 _AGE_G   _BMI5CAT CVDCRHD4 CVDINFR4 _RACE _STATE  ASTHMA3
CHCCOPD1   DIABETE3 _LLCPWT);
RUN;

** Creating New Variable for Chronic Disease for 2014 ;
DATA NEW14;
SET NEW14;
CHRONIC_DISEASE = 0;
IF ASTHMA3=1 OR DIABETE3 =1 OR CHCCOPD1=1 THEN CHRONIC_DISEASE = 1 ;
RUN;

** Creating New Variable for MICHD for 2014 as it is not present in years before 2015 ;
DATA NEW14;
SET NEW14;
_MICHD = 0;
IF CVDCRHD4=1 OR CVDINFR4 =1 THEN _MICHD = 1 ;
RUN;


***************************** SUBSETTING BRFSS 2015******************************;
DATA NEW15;
SET PROJECT.LLCP2015 (keep= IYEAR  EDUCA EMPLOY1  GENHLTH _INCOMG MARITAL SEX _RFSMOK3
_SMOKER3 USENOW3 VETERAN3 _AGE_G  _BMI5CAT CVDCRHD4 CVDINFR4 _RACE _STATE  ASTHMA3 
CHCCOPD1    DIABETE3 _MICHD _LLCPWT);
RUN;

DATA NEW15;
SET NEW15;
CHRONIC_DISEASE = 0;
IF ASTHMA3=1 OR DIABETE3 =1 OR CHCCOPD1=1 THEN CHRONIC_DISEASE = 1 ;
RUN;


DATA NEW15;
SET NEW15;
IF _MICHD= (2) THEN _MICHD=0;
IF _MICHD =(1) THEN _MICHD=1;
RUN;


***************************** SUBSETTING BRFSS 2016******************************;
DATA NEW16;
SET PROJECT.LLCP2016 (KEEP= IYEAR  EDUCA EMPLOY1  GENHLTH _INCOMG MARITAL SEX  _RFSMOK3
_SMOKER3 USENOW3 VETERAN3 _AGE_G   _BMI5CAT CVDCRHD4 CVDINFR4 _RACE _STATE ASTHMA3 
CHCCOPD1    DIABETE3 _Michd _LLCPWT);
RUN;

DATA NEW16;
SET NEW16;
CHRONIC_DISEASE = 0;
IF ASTHMA3=1 OR DIABETE3 =1 OR CHCCOPD1=1 THEN CHRONIC_DISEASE = 1 ;
RUN;

DATA NEW16;
SET NEW16;
IF _MICHD= (2) THEN _MICHD=0;
IF _MICHD =(1) THEN _MICHD=1;
RUN;


***************************** SUBSETTING BRFSS 2017******************************;
DATA NEW17;
SET PROJECT.LLCP2017 (keep= IYEAR  EDUCA EMPLOY1  GENHLTH _INCOMG MARITAL SEX _RFSMOK3
_SMOKER3 USENOW3 VETERAN3 _AGE_G   _BMI5CAT CVDCRHD4 CVDINFR4 _RACE _STATE ASTHMA3 
CHCCOPD1    DIABETE3 _MICHD _LLCPWT);
RUN;

DATA NEW17;
SET NEW17;
CHRONIC_DISEASE = 0;
IF ASTHMA3=1 OR DIABETE3 =1 OR CHCCOPD1=1 THEN CHRONIC_DISEASE = 1 ;
RUN;

DATA NEW17;
SET NEW17;
IF _MICHD= (2) THEN _MICHD=0;
IF _MICHD =(1) THEN _MICHD=1;
RUN;

********************************** Data combind using this code*************************;
DATA COMBINED;
SET NEW11 NEW12 NEW13 NEW14 NEW15 NEW16 NEW17; 
RUN;


PROC CONTENTS DATA=PROJECT.COMBINED;
TITLE ' CHARACTERISTICS OF THE COMBINED DATASET';
RUN;

***********  MAKING A PERMANENT COPY OF COMBINED DATASET IN PROJECT LIBRARY**********;
DATA PROJECT.COMBINED; 
SET WORK.COMBINED;
RUN;


*********************Start From Here after Loading the Project Directory *********************;
****************Removing Missing Values For Complete Case Analysis**************************;
data work.Combined; set project.Combined; RUN;

PROC CONTENTS DATA=WORK.COMBINED;
RUN;


data Combined;
  set Combined(rename=  (_RACE= RACE EMPLOY1=EMP_STATUS _STATE = STATE_FIPS USENOW3 = TOBACCO_USE
VETERAN3 = VETERAN _AGE_G = AGE_CAT _BMI5CAT= BMI _INCOMG = INCOME _MICHD = MICHD _RFSMOK3= SMOKER_STATUS
_SMOKER3 = SMOKER_LEVEL ASTHMA3= ASTHMA CHCCOPD1=COPD CVDCRHD4= CHD CVDINFR4 =MI DIABETE3=DIABETE ));
RUN;

proc means data=WORK.combined  nmiss N ; run;


data work.combined;
set work.combined;

if BMI = '.' then delete;
RUN;

data work.combined;
set work.combined;
if educa = '.' then delete; 
if EMP_STATUS = '.' then delete;
if genhlth = '.' then delete;
if marital = '.' then delete;
if VETERAN = '.' then delete;
if MICHD = '.' then delete;
if RACE = '.' then delete;
if TOBACCO_USE = '.' then delete;
if diabete ='.' then delete;
if COPD ='.' then delete;
if ASTHMA ='.' then delete;
if MI ='.' then delete;
RUN;


PROC MEANS DATA=WORK.COMBINED NMISS MIN MAX N;
RUN;
*******************removing Uneccessary Levels Such as 9's **********;


data work.combined;
set work.combined;

if INCOME = '9' then delete; 
if EMP_STATUS= '9' then delete;
if marital = '9' then delete;
if race = '9' then delete;
if sex = '9' then delete;
if SMOKER_LEVEL ='9' then delete;
if educa ='9' then delete;
if genhlth ='9' then delete;
if TOBACCO_USE ='9' then delete;
if veteran='9' then delete;
RUN;


data work.combined;
set work.combined;
if genhlth ='7' then delete;
if tobacco_use ='7' then delete;
if veteran ='7' then delete;
RUN;



PROC CONTENTS DATA=WORK.COMBINED1;RUN;

PROC FREQ DATA=WORK.COMBINED;
TABLES IYEAR  EDUCA EMP_STATUS  GENHLTH INCOME MARITAL SEX SMOKER_STATUS
SMOKER_LEVEL TOBACCO_USE VETERAN AGE_CAT  BMI CHD MI RACE STATE_FIPS ASTHMA
 COPD    DIABETE MICHD cHRONIC_DISEASE; RUN;


*********************** NEW STATE VARIABLE***************************;
data work.combined1;
set Work.combined;
LENGTH STATE $20;

if STATE_FIPS in (1) then STATE = "Alabama"; 
if STATE_FIPS in (2) then STATE = "Alaska"; 
if STATE_FIPS in (4) then STATE = "Arizona"; 
if STATE_FIPS in (5) then STATE = "Arkansas"; 
if STATE_FIPS in (6) then STATE = "California"; 
if STATE_FIPS in (8) then STATE = "Colorado"; 
if STATE_FIPS in (9) then STATE = "Connecticut"; 
if STATE_FIPS in (10) then STATE = "Delaware"; 
if STATE_FIPS in (11) then STATE = "District of Columbia"; 
if STATE_FIPS in (12) then STATE = "Florida"; 
if STATE_FIPS in (13) then STATE = "Georgia"; 
if STATE_FIPS in (15) then STATE = "Hawaii"; 
if STATE_FIPS in (16) then STATE = "Idaho"; 
if STATE_FIPS in (17) then STATE = "Illinois"; 
if STATE_FIPS in (18) then STATE = "Indiana"; 
if STATE_FIPS in (19) then STATE = "Iowa"; 
if STATE_FIPS in (20) then STATE = "Kansas"; 
if STATE_FIPS in (21) then STATE = "Kentucky"; 
if STATE_FIPS in (22) then STATE = "Louisiana"; 
if STATE_FIPS in (23) then STATE = "Maine"; 
if STATE_FIPS in (24) then STATE = "Maryland"; 
if STATE_FIPS in (25) then STATE = "Massachusetts"; 
if STATE_FIPS in (26) then STATE = "Michigan"; 
if STATE_FIPS in (27) then STATE = "Minnesota"; 
if STATE_FIPS in (28) then STATE = "Mississippi"; 
if STATE_FIPS in (29) then STATE = "Missouri"; 
if STATE_FIPS in (30) then STATE = "Montana"; 
if STATE_FIPS in (31) then STATE = "Nebraska";
if STATE_FIPS in (32) then STATE = "Nevada";
if STATE_FIPS in (33) then STATE = "New Hampshire";
if STATE_FIPS in (34) then STATE = "New Jersey";
if STATE_FIPS in (35) then STATE = "New Mexico";
if STATE_FIPS in (36) then STATE = "New York";
if STATE_FIPS in (37) then STATE = "North Carolina";
if STATE_FIPS in (38) then STATE = "North Dakota";
if STATE_FIPS in (39) then STATE = "Ohio";
if STATE_FIPS in (40) then STATE = "Oklahoma";
if STATE_FIPS in (41) then STATE = "Oregon";
if STATE_FIPS in (42) then STATE = "Pennsylvania";
if STATE_FIPS in (44) then STATE = "Rhode Island";
if STATE_FIPS in (45) then STATE = "South Carolina";
if STATE_FIPS in (46) then STATE = "South Dakota";
if STATE_FIPS in (47) then STATE = "Tennessee";
if STATE_FIPS in (48) then STATE = "Texas";
if STATE_FIPS in (49) then STATE = "Utah";
if STATE_FIPS in (50) then STATE = "Vermont";
if STATE_FIPS in (51) then STATE = "Virginia";
if STATE_FIPS in (53) then STATE = "Washington";
if STATE_FIPS in (54) then STATE = "West Virginia";
if STATE_FIPS in (55) then STATE = "Wisconsin";
if STATE_FIPS in (56) then STATE = "Wyoming";
if STATE_FIPS in (66) then STATE = "Guam";
if STATE_FIPS in (72) then STATE = "Puerto Rico";
if STATE_FIPS in (78) then STATE = "Virgin Islands";
RUN;


DATA WORK.Combined;
LENGTH REGION $20;
SET WORK.Combined1;

if STATE_FIPS IN (9,23,25,33,44,50,34,36,42) then REGION = 'NORTHEAST';*;
if STATE_FIPS in (18,17,26,39,55,19,20,27,29,31,38,46) then REGION ='MIDWEST' ; *;
if STATE_FIPS in (10,11,12,13,24,37,45,51,54,1,21,28,47,5,22,40,48) then REGION =' SOUTH'; *;
if STATE_FIPS in (4,8,16,35,30,49,32,56,2,6,15,41,53) then REGION = 'WEST'; *WEST;
if STATE_FIPS in (66,72,78) then REGION = ' U.S. sovereignty';*Outlying area under;
RUN;


DATA WORK.Combined;
SET WORK.Combined;
YEAR = INPUT(IYEAR,8.); RUN;
************************************************** YEAR VARIABLE*****************************;
DATA WORK.Combined;
set Work.Combined
(where=(
	(YEAR in (2011,2012,2013,2014,2015,2016,2017,2018)) 
));
if YEAR in (2011) then YEAR = 2011; 
if YEAR in (2012) then YEAR = 2012; 
if YEAR in (2013) then YEAR = 2013; 
if YEAR in (2014) then YEAR = 2014; 
if YEAR in (2015) then YEAR = 2015; 
if YEAR in (2016) then YEAR = 2016; 
if YEAR in (2017,2018) then YEAR = 2017; 
RUN;

proc freq data=combined; RUN;


data project.FINAL;
set combined ( keep = GENHLTH TOBACCO_USE VETERAN EDUCA SMOKER_LEVEL SMOKER_STATUS INCOME
EMP_STATUS MARITAL RACE SEX  YEAR REGION CHRONIC_DISEASE MICHD   BMI AGE_CAT  _LLCPWT); RUN;

proc freq data= project.A1; RUN;


***************************************Setting varibale levels*****************************************;

DATA WORK.FINAL; SET PROJECT.FINAL; RUN;

data work.FINAL;
set Work.FINAL
(where=(
	(MARITAL in (1,2,3,4,5,6)) 
));
if MARITAL in (1) then MARITAL = 1; *MARRIED;
if MARITAL in (2) then MARITAL = 2; *DIVORCED;
if MARITAL in (3) then MARITAL = 3; *WIDOWED;
if MARITAL in (4) then MARITAL = 4; *SEPERATED;
if MARITAL in (5,6) then MARITAL = 5; *NOT MARRIED;
RUN;


**EMPLOY STATUS VARIABLE****;

data work.FINAL1;
set Work.FINAL
(where=(
	(EMP_STATUS in (1,2,3,4,5,6,7,8)) 
));
if EMP_STATUS in (1) then EMP_STATUS = 1; *Employed by Wages;
if EMP_STATUS in (2) then EMP_STATUS = 2; *Self Employed;
if EMP_STATUS in (3,4) then EMP_STATUS = 3; *Out of Work;
if EMP_STATUS in (5) then EMP_STATUS = 5; *homeMaker;
if EMP_STATUS in (6) then EMP_STATUS = 6; *Student;
if EMP_STATUS in (7) then EMP_STATUS = 7; *Retired;
if EMP_STATUS in (8) then EMP_STATUS = 8; *Unable to work;

RUN;

** EDUCA VARIABLE*****************************;
data work.FINAL1;
set Work.FINAL1
(where=(
	(EDUCA in (1,2,3,4,5,6)) 
));
if EDUCA in (1,2,3) then EDUCA = 1; *DID NOT GRADUATED HIGH SCHOOL;
if EDUCA in (4) then EDUCA = 2; *GRADUATED HIGH SCHOOL;
if EDUCA in (5) then EDUCA = 3; *SOME COLLEGE;
if EDUCA in (6) then EDUCA = 4; * COLLEGE GRADUATE;

RUN;


DATA PROJECT.FINAL; SET WORK.FINAL;RUN;

data work.FINAL1;
set work.FINAL1
(where=(
	(tobacco_use in (1,2,3)) 
));
if tobacco_use in (1,2) then tobacco_use = 1; *yes;
if tobacco_use in (3) then tobacco_use = 2; *No;
RUN;

proc freq data=final1;
tables marital educa emp_status tobacco_use;run;

data project.final; set work.final1; run;


PROC FREQ DATA=PROJECT.FINAL;
TABLES GENHLTH TOBACCO_USE VETERAN EDUCA SMOKER_LEVEL SMOKER_STATUS INCOME
EMP_STATUS MARITAL RACE SEX  YEAR REGION CHRONIC_DISEASE MICHD STATE STATE_FIPS BMI AGE_CAT;
RUN;



proc export 
  data=Project.FINAL
  dbms=csv
  outfile="C:\Users\Manmeet Bains\Desktop\capstone\FINAL COPY\FINAL.csv" 
  replace;
RUN;



*************************** CHI SQUARE TESTS **************************;

data work.FINAL; set project.FINAL; RUN;

ods graphics on;
proc freq data=project.FINAL;  *table 1;
  tables (genhlth educa tobacco_use income emp_status marital race sex  
smoker_LEVEL year region chronic_disease michd STATE state_fips BMI AGE_cat smoker_status)*veteran / chisq ;
   title 'Univariate Associations of Characteristics of 2,559,476 BRFSS Study Respondents by Veteran Status';
RUN;
ods graphics off;

proc freq data=project.FINAL;  *table 2;
  tables (genhlth educa tobacco_use income emp_status marital race sex  
  region chronic_disease veteran   BMI AGE_cat smoker_status)*michd / chisq;
title 'Univariate Associations of Characteristics of 2,642,099 BRFSS Study Respondents by MICHD Status ';
RUN;


*Multicollinearity;
proc reg data=PROJECT.final;
  model michd=veteran genhlth educa tobacco_use income emp_status marital race sex  
 year  chronic_disease BMI AGE_cat smoker_status /  vif;
RUN;
quit;





ods pdf file = 'C:\Users\Manmeet Bains\Desktop\capstone\Results\Logistic_april_30.pdf' ;
ods graphics on;
proc logistic data=project.FINAL descending ;
  class 
  michd             (ref = '0') 
  veteran          (ref = '2') 
  sex                 (ref = '1') 
  genhlth          (ref = '1') 
  educa            (ref = '1') 
  tobacco_use   (ref = '2') 
  income          (ref = '1') 
  emp_status    (ref = '1')
  marital          (ref = '1') 
  race                  (ref = '1')  
  chronic_disease   (ref = '0') 
  BMI                  (ref = '2')  
  AGE_cat           (ref = '6')
  smoker_status (ref = '1')	
  REGION             (ref = 'SOUTH')/ param=reference;  

model michd=veteran sex genhlth educa tobacco_use income emp_status marital race   
  chronic_disease  REGION BMI AGE_cat smoker_status /  rl lackfit stb; 
RUN;
ods graphics off;
ods pdf close;

ods pdf file = 'C:\Users\Manmeet Bains\Desktop\capstone\Results\surveyLogistic_april_30.pdf' ;
ods graphics on;
proc surveylogistic data=project.FINAL  ;
weight _llcpwt;
  class  
  michd                                          (ref = '0') 
  veteran                                        (ref = '2') 
  sex                            (ref = '1') 
  genhlth                     (ref = '1') 
  educa                        (ref = '1') 
  tobacco_use                                     (ref = '2') 
  income                   (ref = '1') 
  emp_status           (ref = '1')
  marital                  (ref = '1') 
  race                      (ref = '1')  
  chronic_disease   (ref = '0') 
  BMI                      (ref = '2')  
  AGE_cat              (ref = '6')
  smoker_status    (ref = '1')	
  REGION             (ref = 'SOUTH')/ param=reference;  

model michd=veteran sex genhlth educa tobacco_use income emp_status marital race   
  chronic_disease  REGION BMI AGE_cat smoker_status / stb; 
RUN;
ods graphics off;
ods pdf close;

proc freq data=project.final;
tables state*michd; run;
































