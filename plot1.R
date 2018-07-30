#
#  plot1.R
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

# plot histogram and save it into a PNG file
png("plot1.png", width = 480, height = 480)

with(hpc, 
     hist(Global_active_power, 
          col = 'red', 
          main = 'Global Active Power', 
          xlab = 'Global Active Power (kilowatts)',
          ylab = 'Frequency'))

dev.off()
