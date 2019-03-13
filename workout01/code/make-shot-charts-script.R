######################

## Title: Make Shot Charts

## Description:
#   This script takes in the csv files in the data folder
#   and outputs the shot charts with court backgrounds found
#   in the images folder. This script should be run with 
#   ../code as the working directory and requires the ggplot
#   grid and jpeg packages to be installed, but not loaded.
#   It should also be run after make-shots-data-script so that
#   we have access to the shots-data.csv file.
#
## Inputs:
#   andre-iguodala.csv
#   draymond-green.csv
#   kevin-durant.csv
#   klay-thompson.csv
#   stephen-curry.csv
#
## Outputs: 
#   andre-iguodala-shot-chart.pdf 
#   draymond-green-shot-chart.pdf
#   kevin-durant-shot-chart.pdf
#   klay-thompson-shot-chart.pdf
#   stephen-curry-shot-chart.pdf
#   gsw-shot-charts.pdf
#   gsw-shot-charts.png
#
######################

#load packages

library(grid)
library(jpeg)
library(ggplot2)

# create column class vector for each "read" function

colclass <- c(
  rep("character",3),
  rep("integer",3), 
  rep("factor",3), 
  "integer", 
  "factor", 
  rep("integer",2),
  "factor",
  "integer"
)

# import data

shots <- read.csv(file = "../output/shots-data.csv",
         colClasses = colclass
         )

# get court background

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
  )

# make individual charts

thompson_shot_chart <- ggplot(data = shots[shots$name == "Klay Thompson",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()

iguodala_shot_chart <- ggplot(data = shots[shots$name == "Andre Iguodala",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()

green_shot_chart <- ggplot(data = shots[shots$name == "Draymond Green",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()

durant_shot_chart <- ggplot(data = shots[shots$name == "Kevin Durant",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()

curry_shot_chart <- ggplot(data = shots[shots$name == "Stephen Curry",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()

# faceted shot chart

shot_charts <- ggplot(data = shots) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Golden State Warriors (2016 season)') + 
  facet_wrap(~name) +
  theme_minimal() +
  theme(legend.position = "top")

# export shot charts

pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
thompson_shot_chart
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()

pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

# export faceted shot chart

pdf(file = "../images/gsw-shot-charts.pdf", width = 8, height = 7)
shot_charts
dev.off()

png(file = "../images/gsw-shot-charts.png", width = 8, height = 7, units = "in", res = 200)
shot_charts
dev.off()
