library(rvest)
library(httr)
library(tidyverse)
MMadness <- read_html("https://github.com/fivethirtyeight/data/blob/master/historical-ncaa-forecasts/historical-538-ncaa-tournament-model-results.csv")
table <- MMadness %>% html_nodes("td")
text <- table %>% html_text()
Year <- text[seq(from=2, to=1159, by=7)]
Round <- text[seq(from=3,to=1159,by=7)]
Favorite <- text[seq(from=4, to=1159, by=7)]
Underdog <- text[seq(from=5, to=1159,by=7)]
FavWinProb <- text[seq(from=6, to=1159, by=7)]
FavWinYes <- text[seq(from=7, to=1159, by=7)]


TournamentUpsets <- tibble(
  Year = Year,
  Round = Round,
  Favorite = Favorite,
  Underdog = Underdog,
  FavWinProb = FavWinProb,
  FavWinYes = FavWinYes
)

write.csv(TournamentUpsets,file="~/Documents/Creighton Docs/Spring 2019/MTH 365/data sets/marchmadness.csv")

