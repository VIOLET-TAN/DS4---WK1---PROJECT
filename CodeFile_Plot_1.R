##CODE FILE - PLOT1
###READING THE DATASET OF POWER COSUMPTION

###housepower <- read.delim(file.choose(), header = T, sep = ";")
housepower <- read.table("./household_power_consumption.txt", header = TRUE, sep = "\t")

names(housepower) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Submetering_3")

###oppower <- subset(house_power, house_power$Date == "1/2/2007" | house_power$Date =="2/2/2007" )

oppower <- subset(housepower, Date %in% c("1/2/2007", "2/2/2007") )
oppower$Date <- as.Date(oppower$Date, format = "%d/%m/%y")
                         
###CALLING THE HISTGRAM PLOTTING FUNCTION

###hist(as.numeric(as.character(oppower$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power(kilowatts", ylab = "Frequency",
     col = "red")))
hist(as.numeric(as.character(oppower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

###SAVE THE PLOT AS PNG FORMAT AS plot1.png

png(oppower, width = 480, height = 480)
dev.off()
 
