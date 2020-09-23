##CODEFILE_PLOT_2
###READING DATASET AND SUBSET REQUIRED DATE OF 2007-2-1/2

hpower <- read.table(file.choose(), header = TRUE, sep = ";")
names(hpower) <- c("Date", "Time","Global_active_power", "Global_reactive_power","Voltage","Glonal_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
spower <- subset(hpower, Date %in% c("1/2/2007", "2/2/2007"))

###DEFINE DATE, TIME FORMAT
spower$Date <- as.Date(spower$Date, format="%d/%m/%Y")
dtime <- paste(as.Date(spower$Date), spower$Time)
spower$dtime <- as.POSIXct(dtime)

###CALLING BASIC PLOTTING 
###plot(spower$Time, as.numeric(as.character(spower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
with(spower, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})


###annotating the title
title(main = "Global Active Power _ Time")
dev.copy(png, file="plot2.png", height=480, width=480)
## png 
##   3
dev.off()
## png 
##   2

