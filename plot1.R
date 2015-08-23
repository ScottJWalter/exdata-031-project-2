# plot1.R
#
# Q:  Have total emissions from PM2.5 _decreased_ in the *United States* from 
#     1999 to 2008? Using the *base* plotting system, make a plot showing the 
#     total PM2.5 emission from all sources for each of the years 1999, 2002, 
#     2005, and 2008.

# Load Data Set
#
source("load_data_set.R")

# aggregate total emissions by year
#
totalByYear <- aggregate( Emissions ~ year, d.NEI, sum )

# plot it
#
png( 'plot1.png' )

# Adjust to stop y-axis from showing scientific notation
#
options( scipen = 100 )

barplot( height = totalByYear$Emissions
		, names.arg = totalByYear$year
		, xlab = "Year"
		, ylab = expression( 'Total PM'[2.5]*' Emission (tons)' )
		, main = expression( 'Total PM'[2.5]*' Emissions In the USA' )
		)
		
dev.off()
