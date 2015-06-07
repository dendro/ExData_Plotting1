## sometimes its faster to work with the data outside of R, so I downloaded the
## zip, extracted the household_power_consumption.txt and extracted the parts in
## a truncated csv, containing only the relevant values for the dates.
## I created the h_c_s.csv using git bash and the following single line command:
## gawk -F";" 'NR==1 {print > "h_c_s.csv"};$1 == "1/2/2007" || $1 == "2/2/2007" {print > "h_c_s.csv"}' household_power_consumption.txt

x <- read.csv("h_c_s.csv", sep=";") #reading the data with no conversions needed

## now convert dates and add a Datetime column with accorded values
x <- within(x, Datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S", tz="GMT"))
Sys.setlocale("LC_ALL", "English")

png(file="plot3.png")

with(x, plot(Datetime, Sub_metering_1, "l", ylab="Energy sub metering", xlab="",
              main=""))
with(x, lines(Datetime, Sub_metering_2, "l", col="red"))
with(x, lines(Datetime, Sub_metering_3, "l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"), xjust=1)
dev.off()
