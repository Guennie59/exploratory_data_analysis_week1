plot4 <- function() {
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
##	change of all relevant data to numeric values
##
	power_con_sel$Global_active_power <- 
		as.numeric(as.character(power_con_sel$Global_active_power))
	power_con_sel$Global_reactive_power <- 
		as.numeric(as.character(power_con_sel$Global_reactive_power))
	power_con_sel$Voltage <- 
		as.numeric(as.character(power_con_sel$Voltage))
	power_con_sel$Sub_metering_1 <- 
		as.numeric(as.character(power_con_sel$Sub_metering_1))
	power_con_sel$Sub_metering_2 <- 
		as.numeric(as.character(power_con_sel$Sub_metering_2))
	power_con_sel$Sub_metering_3 <- 
		as.numeric(as.character(power_con_sel$Sub_metering_3))

##
##	Create an 2x2 area for the plots
##
	png(file="plot4.png")
	par(mfrow = c(2,2))
##
##	Plot 2 comes first
##
	plot(power_con_sel$Global_active_power, 
		type = 'l', xaxt = "n",
		ylab = "Global Active Power (kilowatts)", xlab = "")
	axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
##
##	Adding Voltage plot
##
	plot(power_con_sel$Voltage, 
		type = 'l', xaxt = "n",
		ylab = "Voltage", xlab = "datetime")
	axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
##
## 	now comes plot3
##
	plot(power_con_sel$Sub_metering_1, 
		type = 'l', xaxt = "n",
		ylab = "Energy sub metering", xlab = "")
	lines(power_con_sel$Sub_metering_2, type = 'l', col = "red")
	lines(power_con_sel$Sub_metering_3, type = 'l', col = "blue")
	axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
	legend("topright", legend = c("Sub_metering_1", 
		"Sub_metering_2" , 
		"Sub_metering_3"), 
		col = c("black", "red", "blue"), 
		lty = 1, bty = "n", xjust=1)
##
##	Plotting Global_reactive_power like the Voltage plot
##
	plot(power_con_sel$Global_reactive_power, 
		type = 'l', xaxt = "n",
		ylab = "Global_reactive_power", xlab = "datetime")
	axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
##
##	copy to png file with given width and height (is by chance default)
##
##	dev.copy(png,"plot4.png", width=480, height=480)
	dev.off()
##	
}