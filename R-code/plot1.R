plot1 <- function()
{
        d = read.table("household_power_consumption.txt", sep=";",header=TRUE)
        d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
        a <- d[d$Date >="2007-02-01" & d$Date <="2007-02-02",]
        a$Global_active_power <- as.numeric(as.character(a$Global_active_power))
        png(filename = "plot1.png", width = 480, height = 480)
        hist(a$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
        dev.off()
        
}