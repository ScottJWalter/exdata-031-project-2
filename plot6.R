# plot6.R
#
# Q:  How have emissions from motor vehicle sources changed 
#     from 1999-2008 in Baltimore City?

# Load Data Set
#
source("load_data_set.R")

library(ggplot2)

# Gather the subset of the NEI data which corresponds to vehicles
d.SCC.vehicles <- d.SCC[ grepl( "vehicle", d.SCC$SCC.Level.Two, ignore.case = TRUE ), ]$SCC
d.NEI.vehicles <- d.NEI[ d.NEI$SCC %in% d.SCC.vehicles, ]

# Subset the vehicles NEI data by each city's fip and add city name.
d.NEI.24510 <- d.NEI.vehicles[ d.NEI.vehicles$fips == "24510", ]
d.NEI.24510$city <- 'Baltimore City'

d.NEI.06037 <- d.NEI.vehicles[ d.NEI.vehicles$fips == "06037", ]
d.NEI.06037$city <- 'Los Angeles County'

# Combine the two subsets with city name into one data frame
#
d.Merged <- rbind( d.NEI.24510, d.NEI.06037 )

# Plot it
#
png( "plot6.png" )

print( ggplot( d.Merged, aes( x = factor(year), y = Emissions, fill = city ) ) +
	geom_bar( aes( fill = year), stat = "identity" ) +
	facet_grid( scales = "free", space = "free", . ~ city ) +
	guides( fill = FALSE ) + 
	theme_bw() +
	labs( x = "Year", y = expression( "Total PM"[2.5]*" Emission" ) ) + 
	labs( title = expression( "PM"[2.5]*" Emissions In Baltimore City And Los Angeles County" ) )
	)

dev.off()
