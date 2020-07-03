
#* @filter cors
cors <- function(res) {
    res$setHeader("Access-Control-Allow-Origin", "*")
    plumber::forward()
}

#* Absolute Risk
#* @param id
#* @param age
#* @param biopsies
#* @param hyperplasia
#* @param menstruation
#* @param first_birth
#* @param relatives
#* @param race
#* @param Raw_Ind
#* @param Avg_white
#* @get /absolute.risk
function(id=0, age=35, biopsies=0, hyperplasia=0, menstruation=16, first_birth=22, relatives=0, race=1, Raw_Ind=1, Avg_White=0) {        
    source("../R/recode.check.R")
    source("../R/relative.risk.R")
    source("../R/absolute.risk.R")
    #attach(file.path("..","data",data))
    # Not sure how to switch the data input based on the 
    # data variable passed in
    input_df <- data.frame(ID=id,
                             T1=as.numeric(age),
                             T2=as.numeric(age)+5,
                             N_Biop=as.integer(biopsies),
                             HypPlas=ifelse(as.integer(biopsies) == 0 |
                                              as.integer(biopsies) == 99,
                                            99,as.integer(hyperplasia)),
                             AgeMen=as.numeric(menstruation),
                             Age1st=as.numeric(first_birth),
                             N_Rels=as.numeric(relatives),
                             Race =as.integer(race))

    list(method=jsonlite::unbox("absolute.risk"),data=jsonlite::unbox(absolute.risk(input_df, Raw_Ind, Avg_White)))
}
#* Relative Risk 
#* @param id
#* @param age
#* @param biopsies
#* @param hyperplasia
#* @param menstruation
#* @param first_birth
#* @param relatives
#* @param race
#* @param Raw_Ind
#* @get /relative.risk
function(id=0, age=35, biopsies=0, hyperplasia=0, menstruation=16, first_birth=22, relatives=0, race=1, Raw_Ind=1) {    
    source("../R/recode.check.R")        
    source("../R/relative.risk.R")
    
    input_df <- data.frame(ID=id,
                             T1=as.numeric(age),
                             T2=as.numeric(age)+5,
                             N_Biop=as.integer(biopsies),
                             HypPlas=ifelse(as.integer(biopsies) == 0 |
                                              as.integer(biopsies) == 99,
                                            99,as.integer(hyperplasia)),
                             AgeMen=as.numeric(menstruation),
                             Age1st=as.numeric(first_birth),
                             N_Rels=as.numeric(relatives),
                             Race =as.integer(race))


    list(method=jsonlite::unbox("relative.risk"),data=jsonlite::unbox(relative.risk(input_df, Raw_Ind)))
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

#* @get /version
#* @serializer unboxedJSON
function() {
    v <- "1.0"
    list(version=jsonlite::unbox(v))
}
