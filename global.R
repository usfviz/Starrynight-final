library(reshape)
library(networkD3)
library(utils)
library(dplyr)
library(knitr)
library(tidyr)
library(geosphere)
library(maps)
library(sp)
library(nycflights13)

# Clean data
raw_data <- read.csv("432303311_T_ONTIME.csv")
str(raw_data)
origin_dest <- raw_data[c('ORIGIN_CITY_NAME', 'DEST_CITY_NAME')]

origin_dest$ORIGIN_CITY_NAME <- as.character(origin_dest$ORIGIN_CITY_NAME)
origin_dest$DEST_CITY_NAME <- as.character(origin_dest$DEST_CITY_NAME)

# We are only interested in connection among cities, not flight direction
origin_dest$origin_city <- pmin(origin_dest$ORIGIN_CITY_NAME, origin_dest$DEST_CITY_NAME)
origin_dest$dest_city <- pmax(origin_dest$ORIGIN_CITY_NAME, origin_dest$DEST_CITY_NAME)
origin_dest <- origin_dest[, c("origin_city", "dest_city")]

# Count the number of flights among cities
origin_dest_agg <- origin_dest %>% group_by(origin_city, dest_city) %>% mutate(count = n())
origin_dest_agg <- unique(origin_dest_agg[, 1:3])

# Separate cities and states
origin_dest_agg <- separate(origin_dest_agg, origin_city, into = c("origin_city", "origin_state"), sep = ", ")
origin_dest_agg <- separate(origin_dest_agg, dest_city, into = c("dest_city", "dest_state"), sep = ", ")

# Carrior delay
carrier_delay <- read.csv("prob_delay.csv")
carrier_delay$carrier <- as.character(carrier_delay$carrier)

# data source2: airport
usairports <- filter(airports, lat < 48.5)
usairports <- filter(usairports, lon > -130)
