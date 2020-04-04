## READING DATA AND FORMATTING
pc<-read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = FALSE)

pc$Date<-as.Date(pc$Date , format = "%d/%m/%Y")
pc<-pc[pc$Date %in% c(as.Date("2007-02-01"):as.Date("2007-02-02")) , ]

a<-paste(pc$Date , pc$Time)
b<-strptime(a,format="%Y-%m-%d %H:%M:%S", tz = "")
pc$Time<-b
## END OF READING DATA AND FORMATTING

png("plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,2))

with (pc, plot(Time,Global_active_power , pch=".", type="o" , cex.lab=1 , ylab = "Global Active Power" , xlab=""))

with(pc,plot(Time,Voltage , type="l", pch='.'  , cex.lab=1, ylab="Voltage" , xlab="datetime"))

with(pc, plot(Time,Sub_metering_1 , type="l", xlab = "", ylab="Energy Sub metering", cex.lab=1))
with(pc,lines(Time,Sub_metering_2 , col="Red"))
with(pc,lines(Time,Sub_metering_3 , col="Blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , pch="_" , col=c("black","red","blue") , cex=1, bty="n")

with (pc, plot(Time,Global_reactive_power , pch=".", type="o" , cex.lab=1 , ylab = "Global Reactive Power" , xlab="datetime"))
dev.off() 
