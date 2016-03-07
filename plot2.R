## This function graphs and saves a plot of global active power over time
## for the first two days of February 2007.
plot2 <- function() {
  
  ## Read in the rows corresponding to February 1-2, 2007.
  pwrData <- read.table("household_power_consumption.txt", sep = ";",
                        quote = "", na.strings = "?", skip = 66637, nrows = 2880,
                        col.names = c("Date", "Time", "Global_active_power",
                                      "Global_reactive_power", "Voltage",
                                      "Global_intensity", "Sub_metering_1",
                                      "Sub_metering_2", "Sub_metering_3"))

  ## Put together the times used as the x values for this plot.
  times <- strptime(paste(pwrData$Date, pwrData$Time),
                    format = "%d/%m/%Y %H:%M:%S")

  ## Draw the plot of time vs global active power with appropriate options.
  plot(times, pwrData$Global_active_power, type = "l",
       main = "",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  ## Save the plot to the appropriate file.
  dev.copy(png,'plot2.png')
  dev.off()
}