library(tabulizer)
library(rJava)
library(dplyr)
library(miniUI)
library(gtools)
library(openxlsx)

## Function to scrape Official World Golf Ranking website for week 13 (week before masters)
get_wgr_data <- function(year = 2018){
  wgr_data_urls <- paste("http://dps.endavadigital.net/owgr/doc/content/archive/",
                         year,
                         "/owgr13f",
                          year,
                          ".pdf",
                         sep = "")
  first <- extract_tables(wgr_data_urls, encoding = "UTF-8")
  world_rank <- as.data.frame(do.call(rbind, first))
  world_rank <- world_rank %>% select(V1,V4,V10)
  remove <- c('This', 'Week')
  world_rank <- world_rank[ !grepl(paste(remove, collapse = "|"), world_rank$V1),]
  world_rank[world_rank==""] <- NA
  world_rank <- na.omit(world_rank)
  names(world_rank)[names(world_rank)=="V1"] <- "wgr"
  names(world_rank)[names(world_rank)=="V4"] <- "player_name"
  names(world_rank)[names(world_rank)=="V10"] <- "points_gained"
  world_rank$year <- year-1
  return(world_rank)
}
## WGR 2019
location <- "http://dps.endavadigital.net/owgr/doc/content/archive/2019/owgr13f2019.pdf"
first <- extract_tables(location, encoding = "UTF-8")
world_ranking19 <- as.data.frame(do.call(rbind, first))
world_ranking19 <- world_ranking19 %>% select(V1,V4,V10)
remove <- c('This', 'Week')
world_ranking19 <- world_ranking19[ !grepl(paste(remove, collapse = "|"), world_ranking19$V1),]
world_ranking19[world_ranking19==""] <- NA
world_ranking19 <- na.omit(world_ranking19)
names(world_ranking19)[names(world_ranking19)=="V1"] <- "wgr"
names(world_ranking19)[names(world_ranking19)=="V4"] <- "player_name"
names(world_ranking19)[names(world_ranking19)=="V10"] <- "points_gained"
world_ranking19$year <- 2018

## WGR 2017:2018
wgr_all <- lapply(2017:2018, get_wgr_data)
wrank_indx <- lengths(wgr_all)
world_ranking_1718 <- as.data.frame(do.call(rbind,lapply(wgr_all, `length<-`, max(wrank_indx))))

## WGR 2016
location <- "http://dps.endavadigital.net/owgr/doc/content/archive/2016/owgr13f2016-2.pdf"
first <- extract_tables(location, encoding = "UTF-8")
world_ranking16 <- as.data.frame(do.call(rbind, first))
world_ranking16 <- world_ranking16 %>% select(V1,V4,V10)
remove <- c('This', 'Week')
world_ranking16 <- world_ranking16[ !grepl(paste(remove, collapse = "|"), world_ranking16$V1),]
world_ranking16[world_ranking16==""] <- NA
world_ranking16 <- na.omit(world_ranking16)
names(world_ranking16)[names(world_ranking16)=="V1"] <- "wgr"
names(world_ranking16)[names(world_ranking16)=="V4"] <- "player_name"
names(world_ranking16)[names(world_ranking16)=="V10"] <- "points_gained"
world_ranking16$year <- 2015

## WGR 2009:2015
wgr_all <- lapply(2009:2015, get_wgr_data)
wrank_indx <- lengths(wgr_all)
world_ranking_0915 <- as.data.frame(do.call(rbind,lapply(wgr_all, `length<-`, max(wrank_indx))))

## WGR 2008
location <- "http://dps.endavadigital.net/owgr/doc/content/archive/2008/owgr12f2008.pdf"
first <- extract_tables(location, encoding = "UTF-8")
world_rank_08 <- as.data.frame(do.call(rbind, first))
world_rank_08 <- world_rank_08 %>% select(V1,V4,V10)
remove <- c('This', 'Week')
world_rank_08 <- world_rank_08[ !grepl(paste(remove, collapse = "|"), world_rank_08$V1),]
world_rank_08[world_rank_08==""] <- NA
world_rank_08 <- na.omit(world_rank_08)
names(world_rank_08)[names(world_rank_08)=="V1"] <- "wgr"
names(world_rank_08)[names(world_rank_08)=="V4"] <- "player_name"
names(world_rank_08)[names(world_rank_08)=="V10"] <- "points_gained"
world_rank_08$year <- 2007

## WGR 2007
location <- "http://dps.endavadigital.net/owgr/doc/content/archive/2007/owgr13f2007.pdf"
first <- extract_tables(location, encoding = "UTF-8")
first[[1]] <- cbind(first[[1]], newcolumn="yes")
world_rank <- as.data.frame(do.call(rbind, first))
world_rank <- world_rank %>% select(V1,V3,V9)
names(world_rank)[names(world_rank)=="V1"] <- "wgr"
names(world_rank)[names(world_rank)=="V3"] <- "player_name"
names(world_rank)[names(world_rank)=="V9"] <- "points_gained"
world_rank$year <- 2006
world_rank$points_gained <- sub("\\S+\\s+","", world_rank$points_gained)

## WGR 2006
location <- "http://dps.endavadigital.net/owgr/doc/content/archive/2006/owgr13f2006.pdf"
first <- extract_tables(location, encoding = "UTF-8")
first[[1]] <- cbind(first[[1]], newcolumn="yes")
world_rank_06 <- as.data.frame(do.call(rbind, first))
world_rank_06 <- world_rank_06 %>% select(V1,V3,V9)
names(world_rank_06)[names(world_rank_06)=="V1"] <- "wgr"
names(world_rank_06)[names(world_rank_06)=="V3"] <- "player_name"
names(world_rank_06)[names(world_rank_06)=="V9"] <- "points_gained"
world_rank_06$year <- 2005
world_rank_06$points_gained <- sub("\\S+\\s+","", world_rank_06$points_gained)

## WGR 2005
location <- "http://dps.endavadigital.net/owgr/doc/content/archive/2005/owgr13f2005.pdf"
first <- extract_tables(location, encoding = "UTF-8")
first[[1]] <- cbind(first[[1]], newcolumn="yes")
world_rank_05 <- as.data.frame(do.call(rbind, first))
world_rank_05 <- world_rank_05 %>% select(V1,V3,V9)
names(world_rank_05)[names(world_rank_05)=="V1"] <- "wgr"
names(world_rank_05)[names(world_rank_05)=="V3"] <- "player_name"
names(world_rank_05)[names(world_rank_05)=="V9"] <- "points_gained"
world_rank_05$year <- 2004
world_rank_05$points_gained <- sub("\\S+\\s+","", world_rank_05$points_gained)


## WGR 2005:2016
wgr_all_data <- rbind(world_ranking_0915, world_ranking16, world_ranking_1718, world_rank_08, world_rank, world_rank_06, world_rank_05)
wgr_all_data <- wgr_all_data %>% arrange(year)
write.csv(wgr_all_data, "wgr_golf_rank1.csv")

write.csv(world_ranking19, "wgr_2019.csv")




