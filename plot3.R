## This function graphs and saves a plot of energy sub metering over time
## for the first two days of February 2007.
plot3 <- function() {
  
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
  
  ## Draw the plot with appropriate options. There are three sub meterings
  ## so two additional lines as well as a legend are needed.
  plot(times, pwrData$Sub_metering_1, type = "l", col = "black", main = "",
       xlab = "", ylab = "Energy sub metering")
  lines(times, pwrData$Sub_metering_2, col = "red")
  lines(times, pwrData$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lwd = 2)
  
  ## Save the plot to the appropriate file.
  dev.copy(png,'plot3.png')
  dev.off()
}