# Absolute Risk Plumber Runner

This example runs the [plumber.io](https://www.rplumber.io/) package and loads an api for `absolute.risk`, `relative.risk`, `check.summary`, `risk.summary`.

## Steps

1. open `R` and run `install.packages("plumber")`
2. wait... the install took about 10 minutes
3. exit `R`
4. `cd web`
5. run `Rscript runner.R`
6. Open `http://localhost:8000/absolute.risk`
7. It will return response from shimmed absolute risk

## Issues

1. Not able to switch the input data types based on the data input.

## To Do

1. Add CORS and test over web
2. Make DockerFile
3. Deploy DockerFile
