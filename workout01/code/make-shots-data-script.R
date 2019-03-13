######################
#
## Title: Make Shots Data
#
## Description:
#   This script imports the raw .csv files for 
#   each player into data frames in R, does some manipulation,
#   creates text files containing the summary of each data frame,
#   then combines them into a single data frame to be exported 
#   along with its summary.
#
#   This script should be run with .../code/ as the working directory.
#
## Inputs:
#   andre-iguodala.csv
#   draymond-green.csv
#   kevin-durant.csv
#   klay-thompson.csv
#   stephen-curry.csv
#
## Outputs:
#   andre-iguodala-summary.txt
#   draymond-green-summary.txt
#   kevin-durant-summary.txt
#   klay-thompson-summary.txt
#   stephen-curry-summary.txt
#   shots-data.csv
#   shots-data-summary.txt
#
######################

# create column class vector for each "read" function

colclass <- c(
  rep("character",3),
  rep("integer",3), 
  rep("factor",3), 
  "integer", 
  "factor", 
  rep("integer",2)
  )

# import data

iguodala <- read.csv(
  file = "../data/andre-iguodala.csv", 
  colClasses = colclass
  )

green <- read.csv(
  file = "../data/draymond-green.csv",
  colClasses = colclass
  )

durant <- read.csv(
  file = "../data/kevin-durant.csv",
  colClasses = colclass
  )

thompson <- read.csv(
  file = "../data/klay-thompson.csv",
  colClasses = colclass
  )

curry <- read.csv(
  file = "../data/stephen-curry.csv",
  colClasses = colclass
  )

# add name column

iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
curry$name <- "Stephen Curry"
thompson$name <- "Klay Thompson"
durant$name <- "Kevin Durant"

# change shot_made_flag

levels(iguodala$shot_made_flag) <- c("shot_no","shot_yes")
levels(green$shot_made_flag) <- c("shot_no","shot_yes")
levels(curry$shot_made_flag) <- c("shot_no","shot_yes")
levels(thompson$shot_made_flag) <- c("shot_no","shot_yes")
levels(durant$shot_made_flag) <- c("shot_no","shot_yes")

# add minute variable

iguodala$minute <- iguodala$period*12 - iguodala$minutes_remaining
green$minute <- green$period*12 - green$minutes_remaining
curry$minute <- curry$period*12 - curry$minutes_remaining
thompson$minute <- thompson$period*12 - thompson$minutes_remaining
durant$minute <- durant$period*12 - durant$minutes_remaining

# create summary text files

sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

# stack into single data frame

shots <- rbind(iguodala, green, durant, thompson, curry)

# export into csv

write.csv(shots, file = "../output/shots-data.csv", quote = FALSE, row.names = FALSE)

# create summary text file

sink(file = "../output/shots-data-summary.txt")
summary(shots)
sink()