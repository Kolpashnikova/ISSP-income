********************************************************************************
*** breaking the income into quantiles for each country and year
********************************************************************************

foreach i in 36 40 100 152 203 208 250 276 826 348 376 392 428 ///
	484 578 608 616 620 643 703 705 724 752 756 158 840 56 {
	   xtile xtile`i'_2002 = PersInc if Country == `i' & ///
			Year ==2002 [pw=Weight], n(4)
	   xtile xtile`i'_2012 = PersInc if Country == `i' & ///
			Year ==2012 [pw=Weight], n(4)
}

gen Quantiles = .

foreach i in 36 40 100 152 203 208 250 276 826 348 376 392 428 ///
	484 578 608 616 620 643 703 705 724 752 756 158 840 56 {
	   replace Quantiles = xtile`i'_2002 if Country == `i' & ///
			Year ==2002
	   replace Quantiles = xtile`i'_2012 if Country == `i' & ///
			Year ==2012
}

**********************************************************************************
*** code by Kamila Kolpashnikova *************************************************
**********************************************************************************
