## READING DATA AND FORMATTING
pc<-read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";", header=T, stringsAsFactors = FALSE)

pc$Date<-as.Date(pc$Date , format = "%d/%m/%Y")
pc<-pc[pc$Date %in% c(as.Date("2007-02-01"):as.Date("2007-02-02")) , ]

a<-paste(pc$Date , pc$Time)
b<-strptime(a,format="%Y-%m-%d %H:%M:%S", tz = "")
pc$Time<-b
## END OF READING DATA AND FORMATTING

pc$Global_active_power<-as.numeric(pc$Global_active_power  )
png("plot1.png" ,width = 480, height=480, units="px")
with(pc, hist(Global_active_power , col="red" , xlab = "Global Active Power (Kilowatts)" , main = "Global Active Power"))
dev.off()