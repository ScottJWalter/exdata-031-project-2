# plot2.R
#
# Q:  Have total emissions from PM2.5 decreased in the Baltimore City, 
#     Maryland (fips == "24510") from 1999 to 2008? Use the base 
#     plotting system to make a plot answering this question.

# Load Data Set
#
source("load_data_set.R")

# Subset the data set, extracting only Baltimore City data
#
d.NEI.subset <- d.NEI[ d.NEI$fips == "24510", ]

# Now, aggregate yearly totals for this subset
#
totalByYear <- aggregate( Emissions ~ year, d.NEI.subset, sum )

# Plot it
#
png( 'plot2.png' )

barplot(height = totalByYear$Emissions
	, names.arg = totalByYear$year
	, xlab = "Year"
	, ylab = expression( 'Total PM'[2.5]*' Emission (tons)' )
	, main = expression( 'Total PM'[2.5]*' Emmissions In Baltimore City, MD' )
	)
	
dev.off()
