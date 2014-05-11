plot3 <- function()
{
        d = read.table("household_power_consumption.txt", sep=";",header=TRUE)
        d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
        a <- d[d$Date >="2007-02-01" & d$Date <="2007-02-02",]
        a$DateTime <- paste(a$Date,a$Time)
        a$DateTime <- strptime(a$DateTime,"%Y-%m-%d %H:%M:%S")        
        a$Sub_metering_1 <- as.numeric(as.character(a$Sub_metering_1))
        a$Sub_metering_2 <- as.numeric(as.character(a$Sub_metering_2))
        a$Sub_metering_3 <- as.numeric(as.character(a$Sub_metering_3))
        png(filename = "plot3.png", width = 480, height = 480)
        with(a,plot(a$DateTime, a$Sub_metering_1, type='l',xlab="",ylab="Energy sub metering",ylim=range(a$Sub_metering_1,a$Sub_metering_2,a$Sub_metering_3)))
        with(a,lines(a$DateTime, a$Sub_metering_2, type='l', col='red'))
        with(a,lines(a$DateTime, a$Sub_metering_3, type='l', col='blue'))
        with(a,legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))        
        dev.off()
        
}