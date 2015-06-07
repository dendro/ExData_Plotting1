## sometimes its quicker to work with the data outside of R, so I downloaded the
## zip, extracted the household_power_consumption.txt and extracted the parts in
## a truncated csv, containing only the relevant values for the dates.
## I created the h_c_s.csv using git bash and the following single line command:
## gawk -F";" 'NR==1 {print > "h_c_s.csv"};$1 == "1/2/2007" || $1 == "2/2/2007" {print > "h_c_s.csv"}' household_power_consumption.txt

x <- read.csv("h_c_s.csv", sep=";") #reading the data with no conversions needed

## now convert dates and add a Datetime column with accorded values
x <- within(x, Datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S", tz="GMT"))
Sys.setlocale("LC_ALL", "English")

png(file="plot2.png")

with (x, plot(Datetime, Global_active_power, "l", ylab="Global Active Power (kilowatts)", xlab="",
             main=""))
dev.off()
