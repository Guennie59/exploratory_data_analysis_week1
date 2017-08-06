plot3 <- function() {
##
##	read power consumption file
##	change date and time information to appropriate formats
##
	power_con <- read.csv("household_power_consumption.txt",sep = ";")
	power_con$Time <- format(strptime(power_con$Time, format="%H:%M:%S"), 
		"%H:%M:%S")
	power_con$Date <- as.Date(power_con$Date, format="%d/%m/%Y")
##
## 	selecting two relevant days 2007-02-01 and 2007-02-02
##
	power_con_sel <- power_con[ which (power_con$Date == "2007-02-01" | 
		power_con$Date == "2007-02-02"),]
##
##	change of Submetering data to numeric value
##
	power_con_sel$Sub_metering_1 <- 
		as.numeric(as.character(power_con_sel$Sub_metering_1))

	power_con_sel$Sub_metering_2 <- 
		as.numeric(as.character(power_con_sel$Sub_metering_2))

	power_con_sel$Sub_metering_3 <- 
		as.numeric(as.character(power_con_sel$Sub_metering_3))

##
##	Generating the plot without x-axis. Add a customized x-axis later
##	Plotting Sub_metering_1 directly and lines for 
##	Sub_metering_2 and ... _3 as separate lines with colors red and blue.
##	finally adding the legend.
##
	png(file="plot3.png")
	plot(power_con_sel$Sub_metering_1, 
		type = 'l', xaxt = "n",
		ylab = "Energy sub metering", xlab = "")
	axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
	lines(power_con_sel$Sub_metering_2, type = 'l', col = "red")
	lines(power_con_sel$Sub_metering_3, type = 'l', col = "blue")
	legend("topright", legend = c("Sub_metering_1", 
		"Sub_metering_2" , 
		"Sub_metering_3"), 
		col = c("black", "red", "blue"), 
		lty = 1)
##
##
##	copy to png file with given width and height (is by chance default)
##
##	dev.copy(png,"plot3.png", width=480, height=480)
	dev.off()
##	
}