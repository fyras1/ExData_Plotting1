## READING DATA AND FORMATTING
pc<-read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = FALSE)

pc$Date<-as.Date(pc$Date , format = "%d/%m/%Y")
pc<-pc[pc$Date %in% c(as.Date("2007-02-01"):as.Date("2007-02-02")) , ]

a<-paste(pc$Date , pc$Time) 
b<-strptime(a,format="%Y-%m-%d %H:%M:%S", tz = "")
pc$Time<-b
## END OF READING DATA AND FORMATTING

png("plot3.png")
with(pc, plot(Time,Sub_metering_1 , type="l", xlab = "", ylab="Energy Sub metering"))
with(pc,lines(Time,Sub_metering_2 , col="Red"))
with(pc,lines(Time,Sub_metering_3 , col="Blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , pch="_" , col=c("black","red","blue"))
dev.off()
