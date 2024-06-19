******--------------------------------------------------------------------------------------------------------*
|               	                 SAS Communities Post                      	        			 	 |
|	                 	SAS Studio + GitHub Integrations using ACS Data                       			 |
*--------------------------------------------------------------------------------------------------------*;
libname 	ipums "~/LaborSupply";
options 	orientation=landscape mlogic symbolgen pageno=1 error=3;

title1 		"SAS Communities Post";
title2 		"SAS Studio + GitHub Integrations using ACS Data";


************************************************  Summarize the Data;
ods noproctitle;

/*** Analyze categorical variables ***/
title "Frequencies for Categorical Variables";

proc freq data=IPUMS.ACS_2015_2022;
	tables State_Name YearQuarter Race_Ethnic EDUC_LTD Child_Status / 
		plots=(freqplot);
run;

/*** Analyze numeric variables ***/
title "Descriptive Statistics for Numeric Variables";

proc means data=IPUMS.ACS_2015_2022 n nmiss min mean median max std;
	var Unemp in_LF WTFINL;
run;

title;

proc univariate data=IPUMS.ACS_2015_2022 noprint;
	histogram Unemp in_LF WTFINL;
run;