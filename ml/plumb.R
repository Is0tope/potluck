library(plumber)

library(tidyverse)
library(data.table)
library(recommenderlab)
library(jsonlite)

# load("recommender")

pr <- plumber::plumb("api.R")

pr$run()
