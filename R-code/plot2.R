plot2 <- function()
{
        d = read.table("household_power_consumption.txt", sep=";",header=TRUE)
        d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
        a <- d[d$Date >="2007-02-01" & d$Date <="2007-02-02",]
        a$Global_active_power <- as.numeric(as.character(a$Global_active_power))
        a$DateTime <- paste(a$Date,a$Time)
        a$DateTime <- strptime(a$DateTime,"%Y-%m-%d %H:%M:%S")        
        png(filename = "plot2.png", width = 480, height = 480)
        plot(a$DateTime,a$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        dev.off()
        
}