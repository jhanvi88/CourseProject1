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

## Plot 3 line graph of Energy sub metering with 3 colors and legend
## Get rid of ?s in all 3 sub-meterings
d1$Sub_metering_1[d1$Sub_metering_1 == '?'] <- NA
d1$Sub_metering_2[d1$Sub_metering_2 == '?'] <- NA
d1$Sub_metering_3[d1$Sub_metering_3 == '?'] <- NA
# Plot 3
plot(d1$Time1, d1$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="")
lines(d1$Time1, d1$Sub_metering_2, col = "red")
lines(d1$Time1, d1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub-metering_3"), cex = 0.8, col = c("black", "red", "blue"), lty = 1:1)
