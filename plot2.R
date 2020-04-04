## READING DATA AND FORMATTING
pc<-read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = FALSE)

pc$Date<-as.Date(pc$Date , format = "%d/%m/%Y")
pc<-pc[pc$Date %in% c(as.Date("2007-02-01"):as.Date("2007-02-02")) , ]

a<-paste(pc$Date , pc$Time)
b<-strptime(a,format="%Y-%m-%d %H:%M:%S", tz = "")
pc$Time<-b
## END OF READING DATA AND FORMATTING

png("plot2.png", width = 480, height = 480, units = "px")
with (pc, plot(Time,Global_active_power , pch=".", type="o" , ylab = "Global Active Power (Kilowatts)" , xlab=""))
dev.off()