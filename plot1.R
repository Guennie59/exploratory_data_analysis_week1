plot1 <- function() {
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
	power_con_sel <- power_con[ which (power_con == "2007-02-01" | 
		power_con == "2007-02-02"),]
##
##	Generating the histogram with labels, headline and red color
##
	hist(as.numeric(as.character(power_con_sel$Global_active_power)), 
		xlab = "Global Active Power (kilowatts)", 
		main = "Global Active Power", col = "red")
##
##	copy to png file with given width and height (is by chance default)
##
	dev.copy(png,"plot1.png", width=480, height=480)
	dev.off()
}