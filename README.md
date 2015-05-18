JammerStats
=========
An R package to calculate total points and lead jammer percentage


install.packages("devtools")
devtools::install_github("skingan/JammerStats")
library(JammerStatsPackage)
JammerStats(data)

data frame must have columns:
jam # (1.1, 1.10, 2.23)
jammer
team
lead (0, 1)
points
