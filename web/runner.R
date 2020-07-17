library(plumber)
port <- Sys.getenv('PORT')
r <- plumb("api.R")  # Where 'plumber.R' is the location of the file shown above
r$run(
    host='0.0.0.0', 
    port=as.numeric(port)
)


