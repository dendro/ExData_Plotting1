## I'm using a truncated csv, containing only the relevant values for the dates
## gawk -F";" 'NR==1 {print > "h_c_s.csv"};$1 == "1/2/2007" || $1 == "2/2/2007" {print > "h_c_s.csv"}' household_power_consumption.txt
x <- read.csv("h_c_s.csv", sep=";") #reading the data
png(file="plot1.png")
with (x, hist(Global_active_power, xlab="Global Active Power (kilowatts)", 
              col="red", main="Global Active Power"))
dev.off()
