
#* Absolute Risk 
#* @param data The template data name
#* @param Raw_Ind 
#* @param Avg_white
#* @get /absolute.risk
function(data="exampledata.rda", Raw_Ind=1, Avg_White=0) {
    # BrCa_1_AR.rda
    # BrCa_beta.rda
    # BrCa_lambda1.rda
    # BrCa_lambda2.rda
    # exampledata.rda
    source("../R/recode.check.R")
    source("../R/relative.risk.R")
    source("../R/absolute.risk.R")
    attach(file.path("..","data",data))
    # Not sure how to switch the data input based on the 
    # data variable passed in
    absolute.risk(exampledata, Raw_Ind, Avg_White)
}

#* Relative Risk 
#* @param data_name The template data name
#* @param Raw_Ind 
#* @get /relative.risk
function(data="exampledata.rda", Raw_Ind=1) {    
    source("../R/recode.check.R")        
    source("../R/relative.risk.R")
    attach(file.path("..","data",data))
    relative.risk(exampledata, Raw_Ind)
}

#* Check Summary
#* @param data_name The template data name
#* @param Raw_Ind 
#* @param Avg_white
#* @get /check.summary
function(data="exampledata.rda", Raw_Ind=1, Avg_White=0) {    
    source("../R/recode.check.R")
    source("../R/relative.risk.R")
    source("../R/absolute.risk.R")
    source("../R/check.summary.R")
    attach(file.path("..","data",data))
    check.summary(exampledata, Raw_Ind, Avg_White)
}

#* Risk Summary
#* @param data_name The template data name
#* @param Raw_Ind 
#* @get /risk.summary
function(data="exampledata.rda", Raw_Ind=1) {    
    source("../R/recode.check.R")
    source("../R/relative.risk.R")
    source("../R/absolute.risk.R")
    source("../R/risk.summary.R")
    attach(file.path("..","data",data))
    risk.summary(exampledata, Raw_Ind)
}


