#
#  plot2.R
#
#   plot: Global Active Power 
#

#  Note:
#   1. only use data from the dates 2007-02-01 and 2007-02-02
#   2. missing values are coded as ? in this dataset
#   3. plot and save it to a PNG file with resolution of 480 x 480 pixels
#

data.file <- "household_power_consumption.txt";
# load and subset data into R
hpc <- subset(read.csv(data.file, 
                header = T, 
                sep = ';', 
                stringsAsFactors = F, 
                na.string='?'), Date %in% c('1/2/2007', '2/2/2007'))

# covert date and time variables into date_time varaible with approriate class
hpc$Date_time <- strptime(paste(hpc$Date, hpc$Time), '%d/%m/%Y %H:%M:%S')

# plot histogram and save it into a PNG file
png("plot2.png", width = 480, height = 480)

with(hpc, 
     plot(Date_time,
          Global_active_power,
          col = 'black', 
          type = 'l',
          ylab = 'Global Active Power (kilowatts)',
          xlab = ''))

dev.off()
