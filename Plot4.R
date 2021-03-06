hp=read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hp$date=as.Date(hp$Date,"%d/%m/%Y")
hp$time=strptime(hp$Time, "%H:%M:%S")
hpc=subset(hp, hp$date>="2007-02-01")
a=paste(hp$date, hp$Time)
t=as.POSIXct(a)
par(mar=c(4,4,2,1), mfrow=c(2,2), oma=c(0,0,2,0))
plot(t, hp$Global_active_power, type="l", xlab="", ylab="Global Active Power", main="")
plot(t, hp$Voltage, type="l", xlab="datetime", ylab="Voltage", main="")
plot(t, hp$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", main="")
lines(t, hp$Sub_metering_2, col="red")
lines(t, hp$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(t, hp$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", main="")
