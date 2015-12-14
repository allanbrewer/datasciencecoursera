## Check if data is in working directory
if (file.exists("./household_power_consumption.txt")) {

#######################################
### Step 1: Read the subset of the data base that containes the desidered dates
#######################################

## Read the first rows to a data frame
power.data <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), nrows = 1, skip = 0)
## Transforma date and times to Posixct class
power.data[,1] <- as.Date(power.data[,1], format = "%d/%m/%Y")
power.data[,2] <- as.POSIXct(paste(power.data$Date, power.data$Time), tz = "UTC")
## Set date from where to start reading
start.date <- as.POSIXct("2007-02-01 00:00:00", tz = "UTC")
start.date <- unclass(start.date)[1]
## Determine number of rows to skip from first date until February 01, 2007 
skip.rows <- ((start.date-unclass(power.data[1,2])[1])/60)+1
## Set number of rows to read. 2 complete days minute by minute
num.rows <- 24*60*2
## Set vector with variable names
names <- names(power.data)
## Read subset of data
power.data <- read.table(file = "~/Dropbox/DataCourseta/household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), nrows = num.rows, skip = skip.rows)
## Asign variable names
names(power.data) <- names
## Transforma date and times to Posixct class
power.data[,1] <- as.Date(power.data[,1], format = "%d/%m/%Y")
power.data[,2] <- as.POSIXct(paste(power.data$Date, power.data$Time), tz = "UTC")
## Remove unused variables
rm(names, num.rows, skip.rows, start.date)

#######################################
### Step 2: Create Plot and writte into .png file.
#######################################

## Open png Graphics Device with width and height of 480 px
png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
## Create plot in current graphic device, label axis and main title
plot(power.data$Time, power.data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub metering", main = "")
lines(power.data$Time, power.data$Sub_metering_1, col = "black")
lines(power.data$Time, power.data$Sub_metering_2, col = "red")
lines(power.data$Time, power.data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
## Turn off graphic device
dev.off()

} else {stop("Data not in working directory please copy or download data from this website https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")}