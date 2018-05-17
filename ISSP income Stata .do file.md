/*This code is created by Kamila Kolpashnikova kolpashnikova@alumni.ubc.ca*/

/*First, you need to recode country names in ISSP 2002 to fit the ISO 3166
the following code is using your 2002 ISSP*/

recode COUNTRY (1 = 36 Australia) (2= 276 Germany) ///
	(3 = 276 Germany)(4 = 826  UK) (5=826 UK) ///
	(6=840 US) (7=40 Austria) (8=348 Hungary) ///
	(10=372 Ireland)(11=528 Netherlands)(12=578 Norway) ///
	(13=752 Sweden) (14=203 Czech) (15=705 Slovenia) ///
	(16=616 Poland) (17=100 Bulgaria)(18=643 Russia) ///
	(19=554 NewZealand)(21=608 Philippines) ///
	(22=376 Israel)(24=392 Japan) (25=724 Spain) ///
	(26=428 Latvia)(27=703 Slovak) (28=250 France) ///
	(29=196 Cyprus)(30=620 Portugal)(31=152 Chile) ///
	(32=208 Denmark)(33=756 Switzerland) ///
	(34=56 Belgium)(35=76 Brazil)(37=246 Finland) ///
	(38=484 Mexico)(39=158 Taiwan), gen(Country) 
  
  ********************************************************************************
*** recoding the income variables in ISSP 2002
********************************************************************************

gen PersInc = .
replace PersInc=v249*0.543312019/12 if Country==36 & v249!=999997 & v249!=999998 & v249!=999999 /*Australia*/
replace PersInc=v249*0.941130411 if Country==40 & v249!=999997 & v249!=999998 & v249!=999999 /*Austria*/
replace PersInc=v249*0.481469445 if Country==100 & v249!=999997 & v249!=999998 & v249!=999999 /*Bulgaria*/
replace PersInc=v249*0.001451512 if Country==152 & v249!=999996 & v249!=999997 & v249!=999998 & v249!=999999 /*Chile*/
replace PersInc=1000000*0.001451512 if Country==152 & v249==999996 & v249!=999997 & v249!=999998 & v249!=999999 /*Chile*/
replace PersInc=v249*0.03054506 if Country==203 & v249!=999997 & v249!=999998 & v249!=999999 /*Czech Republic*/
replace PersInc=v249*0.126667033/12 if Country==208 & v249!=999997 & v249!=999998 & v249!=999999 /*Denmark*/
replace PersInc=v249*0.941130411 if Country==246 & v249!=999997 & v249!=999998 & v249!=999999 /*Finland --  it only contains information for one person, drop from the analysis*/
replace PersInc=v249*0.941130411 if Country==250 & v249!=999997 & v249!=999998 & v249!=999999 /*France*/
replace PersInc=v249*0.941130411 if Country==276 & v249!=999997 & v249!=999998 & v249!=999999 /*Germany*/
replace PersInc=v249*1.498749294/12 if Country==826 & v249!=999999 & v249!=999997 & v249!=999998 /*UK*/
replace PersInc=v249*0.003877672 if Country==348 & v249!=999997 & v249!=999998 & v249!=999999 /*Hungary*/
replace PersInc=v249*0.941130411 if Country==372 & v249!=999997 & v249!=999998 & v249!=999999 /*Ireland*/
replace PersInc=v249*0.211067315 if Country==376 & v249!=999997 & v249!=999998 & v249!=999999 /*Israel*/
replace PersInc=v249*1000*0.007975244/12 if Country==392 & v249!=999997 & v249!=999998 & v249!=999999 /*Japan*/
replace PersInc=v249*1.136871353 if Country==428 & v249!=999997 & v249!=999998 & v249!=999999 /*Latvia*/
replace PersInc=v249*0.103563002 if Country==484 & v249!=999997 & v249!=999998 & v249!=999999 /*Mexico*/
replace PersInc=v249*0.941130411 if Country==528 & v249!=0 & v249!=999997 & v249!=999998 & v249!=999999 /*Netherlands*/
replace PersInc=v249*0.941130411 if Country==528 & v249!=999997 & v249!=999998 & v249!=999999 /*Netherlands*/
replace PersInc=v249*0.125253968/12 if Country==578 & v249!=999996 & v249!=999997 & v249!=999998 & v249!=999999 /*Norway*/
replace PersInc=1000000*0.125253968/12 if Country==578 & v249==999996 & v249!=999997 & v249!=999998 & v249!=999999 /*Norway*/
replace PersInc=v249*0.0188 if Country==608 & v249!=999997 & v249!=999998 & v249!=999999 /*Philippines*/
replace PersInc=v249*0.245096057 if Country==616 & v249!=999997 & v249!=999998 & v249!=999999 /*Poland*/
replace PersInc=v249*0.941130411 if Country==620 & v249!=999997 & v249!=999998 & v249!=999999 /*Portugal*/
replace PersInc=v249*0.03189947 if Country==643 & v249!=999997 & v249!=999998 & v249!=999999 /*Russia -- there are many zero observations*/
replace PersInc=v249*0.664640841 if Country==703 & v249!=999997 & v249!=999998 & v249!=999999 /*Slovakia*/
replace PersInc=v249*0.00388742 if Country==705 & v249!=999997 & v249!=999998 & v249!=999999 /*Slovenia*/
replace PersInc=v249*0.941130411 if Country==724 & v249!=999997 & v249!=999998 & v249!=999999 /*Spain*/
replace PersInc=v249*0.10269974 if Country==752 & v249!=999997 & v249!=999998 & v249!=999999 /*Sweden*/
replace PersInc=v249*0.641598556 if Country==756 & v249!=999997 & v249!=999998 & v249!=999999 /*Switzerland*/
replace PersInc=v249*0.028860029 if Country==158 & v249!=999997 & v249!=999998 & v249!=999999 /*Taiwan*/
replace PersInc=v249/12 if Country==840 & v249!=999996 & v249!=999997 & v249!=999998 & v249!=999999 /*US*/
replace PersInc=110000/12 if Country==840 & v249==999996 & v249!=999997 & v249!=999998 & v249!=999999 /*US*/
replace PersInc=v249*0.941130411 if Country==56 & v249!=999997 & v249!=999998 & v249!=999999 /*Belgium*/
*check the consistency with other official statistics on average income



gen HhldInc = .
replace HhldInc=v250*0.543312019/12 if Country==36 & v250!=999997 & v250!=999998 & v250!=999999 /*Australia*/
replace HhldInc=v250*0.941130411 if Country==40 & v250!=999997 & v250!=999998 & v250!=999999 /*Austria*/
replace HhldInc=v250*0.481469445 if Country==100 & v250!=999997 & v250!=999998 & v250!=999999 /*Bulgaria*/
replace HhldInc=v250*0.001451512 if Country==152 & v250!=999996 & v250!=999997 & v250!=999998 & v250!=999999 /*Chile*/
replace HhldInc=1000000*0.001451512 if Country==152 & v250==999996 & v250!=999997 & v250!=999998 & v250!=999999 /*Chile*/
replace HhldInc=v250*0.03054506 if Country==203 & v250!=999997 & v250!=999998 & v250!=999999 /*Czech Republic*/
replace HhldInc=v250*0.126667033/12 if Country==208 & v250!=999997 & v250!=999998 & v250!=999999 /*Denmark*/
replace HhldInc=v250*0.941130411 if Country==246 & v250!=999997 & v250!=999998 & v250!=999999 /*Finland --  it only contains information for one person, drop from the analysis*/
replace HhldInc=v250*0.941130411 if Country==250 & v250!=999997 & v250!=999998 & v250!=999999 /*France*/
replace HhldInc=v250*0.941130411 if Country==276 & v250!=999997 & v250!=999998 & v250!=999999 /*Germany*/
replace HhldInc=v250*1.498749294/12 if Country==826 & v250!=999997 & v250!=999998 & v250!=999999 /*UK*/
replace HhldInc=v250*0.003877672 if Country==348 & v250!=999997 & v250!=999998 & v250!=999999 /*Hungary*/
replace HhldInc=v250*0.941130411 if Country==372 & v250!=999997 & v250!=999998 & v250!=999999 /*Ireland*/
replace HhldInc=v250*0.211067315 if Country==376 & v250!=999997 & v250!=999998 & v250!=999999 /*Israel*/
replace HhldInc=v250*1000*0.007975244/12 if Country==392 & v250!=999997 & v250!=999998 & v250!=999999 /*Japan*/
replace HhldInc=v250*1.136871353 if Country==428 & v250!=999997 & v250!=999998 & v250!=999999 /*Latvia*/
replace HhldInc=v250*0.103563002 if Country==484 & v250!=999997 & v250!=999998 & v250!=999999 /*Mexico*/
replace HhldInc=v250*0.941130411 if Country==528 & v249!=0 & v250!=999997 & v250!=999998 & v250!=999999 /*Netherlands*/
replace HhldInc=v250*0.941130411/12 if Country==528 & v250!=999997 & v250!=999998 & v250!=999999 /*Netherlands --  there are no observations for personal income*/
replace HhldInc=v250*0.125253968/12 if Country==578 & v250!=999996 & v250!=999997 & v250!=999998 & v250!=999999 /*Norway*/
replace HhldInc=1000000*0.125253968/12 if Country==578 & v250==999996 & v250!=999997 & v250!=999998 & v250!=999999 /*Norway*/
replace HhldInc=v250*0.0188 if Country==608 & v250!=999997 & v250!=999998 & v250!=999999 /*Philippines*/
replace HhldInc=v250*0.245096057 if Country==616 & v250!=999997 & v250!=999998 & v250!=999999 /*Poland*/
replace HhldInc=v250*0.941130411 if Country==620 & v250!=999997 & v250!=999998 & v250!=999999 /*Portugal*/
replace HhldInc=v250*0.03189947 if Country==643 & v250!=999997 & v250!=999998 & v250!=999999 /*Russia -- there are many zero observations*/
replace HhldInc=v250*0.664640841 if Country==703 & v250!=999997 & v250!=999998 & v250!=999999 /*Slovakia*/
replace HhldInc=v250*0.00388742 if Country==705 & v250!=999997 & v250!=999998 & v250!=999999 /*Slovenia*/
replace HhldInc=v250*0.941130411 if Country==724 & v250!=999997 & v250!=999998 & v250!=999999 /*Spain*/
replace HhldInc=v250*0.10269974 if Country==752 & v250!=999997 & v250!=999998 & v250!=999999 /*Sweden*/
replace HhldInc=v250*0.641598556 if Country==756 & v250!=999997 & v250!=999998 & v250!=999999 /*Switzerland*/
replace HhldInc=v250*0.028860029 if Country==158 & v250!=999997 & v250!=999998 & v250!=999999 /*Taiwan*/
replace HhldInc=v250/12 if Country==840 & v250!=999996 & v250!=999997 & v250!=999998 & v250!=999999 /*US*/
replace HhldInc=110000/12 if Country==840 & v250==999996 & v250!=999997 & v250!=999998 & v250!=999999 /*US*/
replace HhldInc=v250*0.941130411 if Country==56 & v250!=999997 & v250!=999998 & v250!=999999 /*Belgium*/
*check the consistency with other official statistics on average income


/*next you need to do the same with ISSP 2012
don't forget to open your ISSP 2012 dataset for the following*/

gen Country=V4

********************************************************************************
*** income variables in ISSP 2012
********************************************************************************

gen PersInc = .
replace PersInc=AU_RINC*1.035409986 if Country==36 & AU_RINC<9999990 /*Australia*/
replace PersInc=AT_RINC*1.284861505 if Country==40 & AT_RINC<999990 /*Austria*/
replace PersInc=BG_RINC*0.65700864 if Country==100 & BG_RINC<999990 /*Bulgaria*/
replace PersInc=CL_RINC*0.00205562 if Country==152 & CL_RINC<9999990 /*Chile*/
replace PersInc=CZ_RINC*0.051079045 if Country==203 & CZ_RINC<999990 /*Czech Republic*/
replace PersInc=DK_RINC*0.172637746/12 if Country==208 & DK_RINC<999990 /*Denmark*/
replace PersInc=FI_RINC*1.284861505 if Country==246 & FI_RINC<999990 /*Finland --  it only contains information for one person, drop from the analysis*/
replace PersInc=FR_RINC*1.284861505 if Country==250 & FR_RINC<999990 /*France*/
replace PersInc=DE_RINC*1.284861505 if Country==276 & DE_RINC<999990 /*Germany*/
replace PersInc=GB_RINC*1.579661542 if Country==826 & ///
	GB_RINC<999990 /*UK*/
replace PersInc=HU_RINC*0.004442388 if Country==348 & HU_RINC<999990 /*Hungary*/
replace PersInc=IE_RINC*1.284861505/12 if Country==372 & IE_RINC<999990 /*Ireland*/
replace PersInc=IL_RINC*0.259341346 if Country==376 & IL_RINC<999990 /*Israel*/
replace PersInc=JP_RINC*0.012532827/12 if Country==392 & ///
	JP_RINC<99999992 /*Japan*/
replace PersInc=LV_RINC*1.28512735 if Country==428 & ///
	LV_RINC<999990 /*Latvia*/
replace PersInc=MX_RINC*0.075933269 if Country==484 & MX_RINC<999990 /*Mexico*/
replace PersInc=NL_RINC*1.284861505 if Country==528 & NL_RINC<999990 /*Netherlands*/
replace PersInc=NO_RINC*0.171895144/12 if Country==578 & NO_RINC<99999992 /*Norway*/
replace PersInc=PH_RINC*0.01913837 if Country==608 & PH_RINC<999990 /*Philippines*/
replace PersInc=PL_RINC*0.307074191 if Country==616 & ///
	PL_RINC<999990 /*Poland*/
replace PersInc=PT_RINC*1.284861505 if Country==620 & PT_RINC<999990 /*Portugal*/
replace PersInc=RU_RINC*0.032425599 if Country==643 & RU_RINC<999990 /*Russia -- there are many zero observations*/
replace PersInc=SK_RINC*1.284861505 if Country==703 & SK_RINC<999990 /*Slovakia*/
replace PersInc=SI_RINC*1.284861505 if Country==705 & SI_RINC<999990 /*Slovenia*/
replace PersInc=ES_RINC*1.284861505 if Country==724 & ES_RINC<999990 /*Spain*/
replace PersInc=SE_RINC*0.147601127 if Country==752 & SE_RINC<999990 /*Sweden*/
replace PersInc=CH_RINC*1.066457357 if Country==756 & CH_RINC<999990 /*Switzerland*/
replace PersInc=TW_RINC*0.034424593 if Country==158 & TW_RINC<999990 /*Taiwan*/
replace PersInc=US_RINC/12 if Country==840 & US_RINC<999990 /*US*/
replace PersInc=BE_RINC*1.284861505 if Country==56 & BE_RINC<999990 /*Belgium*/
*check the consistency with other official statistics on average income



gen HhldInc = .
replace HhldInc=AU_INC*1.035409986 if Country==36 & AU_INC<9999990 /*Australia*/
replace HhldInc=AT_INC*1.284861505 if Country==40 & AT_INC<999990 /*Austria*/
replace HhldInc=BG_INC*0.65700864 if Country==100 & BG_INC<999990 /*Bulgaria*/
replace HhldInc=CL_INC*0.00205562 if Country==152 & CL_INC<9999990 /*Chile*/
replace HhldInc=CZ_INC*0.051079045 if Country==203 & CZ_INC<999990 /*Czech Republic*/
replace HhldInc=DK_INC*0.172637746/12 if Country==208 & DK_INC<999990 /*Denmark*/
replace HhldInc=FI_INC*1.284861505 if Country==246 & FI_INC<999990 /*Finland --  it only contains information for one person, drop from the analysis*/
replace HhldInc=FR_INC*1.284861505 if Country==250 & FR_INC<999990 /*France*/
replace HhldInc=DE_INC*1.284861505 if Country==276 & DE_INC<999990 /*Germany*/
replace HhldInc=GB_INC*1.579661542 if Country==826 & ///
	GB_INC<999990 /*UK*/
replace HhldInc=HU_INC*0.004442388 if Country==348 & HU_INC<999990 /*Hungary*/
replace HhldInc=IE_INC*1.284861505/12 if Country==372 & IE_INC<999990 /*Ireland*/
replace HhldInc=IL_INC*0.259341346 if Country==376 & IL_INC<999990 /*Israel*/
replace HhldInc=JP_INC*0.012532827/12 if Country==392 & ///
	JP_INC<99999992 /*Japan*/
replace HhldInc=LV_INC*1.28512735 if Country==428 & ///
	LV_INC<999990 /*Latvia*/
replace HhldInc=MX_INC*0.075933269 if Country==484 & MX_INC<999990 /*Mexico*/
replace HhldInc=NL_INC*1.284861505 if Country==528 & NL_INC<999990 /*Netherlands*/
replace HhldInc=NO_INC*0.171895144/12 if Country==578 & NO_INC<99999992 /*Norway*/
replace HhldInc=PH_INC*0.01913837 if Country==608 & PH_INC<999990 /*Philippines*/
replace HhldInc=PL_INC*0.307074191 if Country==616 & ///
	PL_INC<999990 /*Poland*/
replace HhldInc=PT_INC*1.284861505 if Country==620 & PT_INC<999990 /*Portugal*/
replace HhldInc=RU_INC*0.032425599 if Country==643 & RU_INC<999990 /*Russia -- there are many zero observations*/
replace HhldInc=SK_INC*1.284861505 if Country==703 & SK_INC<999990 /*Slovakia*/
replace HhldInc=SI_INC*1.284861505 if Country==705 & SI_INC<999990 /*Slovenia*/
replace HhldInc=ES_INC*1.284861505 if Country==724 & ES_INC<999990 /*Spain*/
replace HhldInc=SE_INC*0.147601127 if Country==752 & SE_INC<999990 /*Sweden*/
replace HhldInc=CH_INC*1.066457357 if Country==756 & CH_INC<999990 /*Switzerland*/
replace HhldInc=TW_INC*0.034424593 if Country==158 & TW_INC<999990 /*Taiwan*/
replace HhldInc=US_INC/12 if Country==840 & US_INC<999990 /*US*/
replace HhldInc=BE_INC*1.284861505 if Country==56 & BE_INC<999990 /*Belgium*/
*check the consistency with other official statistics on average income
