##CODEFILE_PLOT_4
###READING DATASET AND SUBSET REQUIRED DATE OF 2007-2-1/2

hpower <- read.table(file.choose(), header = TRUE, sep = ";")
names(hpower) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Glonal_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
spower <- subset(hpower, Date %in% c("1/2/2007", "2/2/2007"))

###DEFINE DATE, TIME FORMAT
spower$Date <- as.Date(spower$Date, format="%d/%m/%Y")
dtime <- paste(as.Date(spower$Date), spower$Time)
spower$dtime <- as.POSIXct(dtime)

###USE PAR TO DEFINE PLOTTING AREAS
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

###PLOTTING IN FOUR AREAS
with(spower, {
  plot(Global_active_power~dtime, type = "l", ylab = "Global Active_Power (kilowatts)", xlab = "")
  plot(Voltage~dtime, type = "l", ylab = "Voltage", xlab = "")
  plot(Sub_metering_1~dtime, type = "l", xlab = "Time", ylab = "Global Active Power (Kilowatts)")
  lines(Sub_metering_2~dtime, col = "red") 
  lines(Sub_metering_3~dtime, col = "blue")
  plot(Global_reactive_power~dtime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "")
})