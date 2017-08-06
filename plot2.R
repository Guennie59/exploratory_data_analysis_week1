plot2 <- function() {
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
##	change of Global_active_power to numeric value
##
	power_con_sel$Global_active_power <- 
		as.numeric(as.character(power_con_sel$Global_active_power))
##
##	Generating the plot without x-axis. Add a customized x-axis later
##
##
	plot(power_con_sel$Global_active_power, 
		type = 'l', xaxt = "n",
		ylab = "Global Active Power (kilowatts)", xlab = "")
	axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
##
##
##	copy to png file with given width and height (is by chance default)
##
	dev.copy(png,"plot2.png", width=480, height=480)
	dev.off()
##	
}