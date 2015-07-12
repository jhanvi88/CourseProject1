setwd("~/Desktop/Exploratory Data Coursera Class")
d <- read.table('household_power_consumption.txt',sep=";", header=TRUE)             

summary(d)
str(d)
head(d)

## Subsetting the dates Feb 1, 2 and 3, 2007 into a separate dataframe
## Thurs, Fri, Sat
d$Date1 <- as.Date(d$Date, format="%d/%m/%Y")
d1 <- subset(d, Date1 > '2007-01-31' & Date1 < '2007-02-04')
table(d1$Date1) ## to check if it came out correctly

## Adjust time variable
## Thurs, Fri, Sat
d1$DateTime <- paste(d1[,1], d1[,2], sep=" ")
d1$Time1 <- strptime(d1$DateTime, format="%d/%m/%Y %H:%M:%S")
head(d1) ## to check if it came out correctly

## Replace ? with NAs 
str(d$Global_active_power)
d$Global_active_power[d$Global_active_power == '?'] <- NA
d1$Global_active_power[d1$Global_active_power == '?'] <- NA
summary(d$Global_active_power)

## Convert Global Active Power from factor to character then numeric to run histogram
d$Global_active_power2 <- as.character(d$Global_active_power)
d$Global_active_power1 <- as.numeric(d$Global_active_power2)
d1$Global_active_power2 <- as.character(d1$Global_active_power)
d1$Global_active_power1 <- as.numeric(d1$Global_active_power2)

## Plot 2 line graph of global active power and three days
plot(d1$Time1, d1$Global_active_power1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
