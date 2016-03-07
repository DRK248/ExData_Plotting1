## This function plots and saves a histogram of global active power
## for the first two days of February 2007.
plot1 <- function() {
  
  ## Read in the rows corresponding to February 1-2, 2007.
  pwrData <- read.table("household_power_consumption.txt", sep = ";",
               quote = "", na.strings = "?", skip = 66637, nrows = 2880,
               col.names = c("Date", "Time", "Global_active_power",
                            "Global_reactive_power", "Voltage",
                            "Global_intensity", "Sub_metering_1",
                            "Sub_metering_2", "Sub_metering_3"))

  ## Plot the frequencies of global active power levels for those days.
  hist(pwrData$Global_active_power, col = "red",
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)",
        ylab = "Frequency")

  ## Save the plot to the appropriate file.
  dev.copy(png,'plot1.png')
  dev.off()
}