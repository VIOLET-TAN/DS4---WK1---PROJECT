##CODEFILE_PLOT_3
###READING DATASET AND SUBSET REQUIRED DATE OF 2007-2-1/2

hpower <- read.table(file.choose(), header = TRUE, sep = ";")
names(hpower) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Glonal_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
spower <- subset(hpower, Date %in% c("1/2/2007", "2/2/2007"))

###DEFINE DATE, TIME FORMAT
spower$Date <- as.Date(spower$Date, format="%d/%m/%Y")
dtime <- paste(as.Date(spower$Date), spower$Time)
spower$dtime <- as.POSIXct(dtime)

###CALLING BASIC PLOTTING 
with(spower, {
  plot(sub_metering_1~dtime, type = "l", 
       xlab = "Time", ylab = "Global Active Power (Kilowatts)")
  lines(sub_metering_2~dtime, col = "red") 
  lines(sub_metering_3~dtime, col = "blue") } )
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))