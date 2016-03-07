## This function graphs and saves of 4 different energy-related graphs
## for the first two days of February 2007.
plot4 <- function() {
  
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
 
  ## This sets up having multiple figures in one plot.
  ## The four figures are added by rows.
  par(mfrow = c(2,2), xpd = TRUE)
  
  with(pwrData, {
    ## Draw the plot of time vs global active power with appropriate options.
    plot(times, Global_active_power, type = "l",
         main = "",
         xlab = "",
         ylab = "Global Active Power (kilowatts)")
    
    ## Draw the plot of voltage over time with appropriate options.
    plot(times, Voltage, type = "l",
         main = "",
         xlab = "datetime",
         ylab = "Voltage")
    
    ## Draw the plot of the three sub meterings over time.
    plot(times, pwrData$Sub_metering_1, type = "l", col = "black", main = "",
         xlab = "", ylab = "Energy sub metering")
    lines(times, pwrData$Sub_metering_2, col = "red")
    lines(times, pwrData$Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lwd = 2, inset = 0, bty = "n")
    
    ## Draw the plot of time vs global reactive power with appropriate options.
    plot(times, Global_reactive_power, type = "l",
         main = "",
         xlab = "datetime",
         ylab = "Global_reactive_power")
    
  })
  
  ## Save the plot to the appropriate file.
  dev.copy(png,'plot4.png')
  dev.off()
}