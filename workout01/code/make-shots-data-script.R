########################################################
## title: Data Preparation
## description: Prepares data and creates summary of individual and combined player data
## inputs: andre-iguodala.csv, draymond-green.csv, klay-thompson.csv, kevin-durant.csv, stephen-curry.csv
## outputs: shots-data.csv, shots-data-summary.csv, stephen-curry-summary.txt, andre-iguodala-summary.txt,
## klay-thompson-summary.txt, draymond-green-summary.txt, kevin-durant-summary.txt	stephen-curry-summary.txt
#########################################################

curry <- read.csv("./../data/stephen-curry.csv", stringsAsFactors=FALSE)
green <- read.csv("./../data/draymond-green.csv", stringsAsFactors=FALSE)
thompson <- read.csv("./../data/klay-thompson.csv", stringsAsFactors=FALSE)
durant <- read.csv("./../data/kevin-durant.csv", stringsAsFactors=FALSE)
iguodala <- read.csv("./../data/andre-iguodala.csv", stringsAsFactors=FALSE)

curry$name = "Stephen Curry"
green$name = "Draymond Green"
durant$name = "Kevin Durant"
thompson$name = "Klay Thompson"
iguodala$name = "Andre Iguodala"

curry$shot_made_flag[curry$shot_made_flag == "n"] = "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] = "shot_yes"

green$shot_made_flag[green$shot_made_flag == "n"] = "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] = "shot_yes"

durant$shot_made_flag[durant$shot_made_flag == "n"] = "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] = "shot_yes"

thompson$shot_made_flag[thompson$shot_made_flag == "n"] = "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] = "shot_yes"

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] = "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] = "shot_yes"

curry$minute = curry$period * 12 - curry$minutes_remaining
green$minute = green$period * 12 - green$minutes_remaining
durant$minute = durant$period * 12 - durant$minutes_remaining
thompson$minute = thompson$period * 12 - thompson$minutes_remaining
iguodala$minute = iguodala$period * 12 - iguodala$minutes_remaining

sink(file = "./../output/stephen-curry-summary.txt")
summary(curry)
sink()

sink(file = "./../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "./../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "./../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "./../output/kevin-durant-summary.txt")
summary(durant)
sink()

allPlayers <- rbind(curry,durant,green,iguodala,thompson)
write.csv(allPlayers, "./../data/shots-data.csv")

sink(file = "./../output/shots-data-summary.csv")
summary(allPlayers)
sink()
