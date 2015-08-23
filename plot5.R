# plot5.R
#
# Q:  How have emissions from motor vehicle sources changed 
#     from 1999-2008 in Baltimore City?

# Load Data Set
#
source("load_data_set.R")

library(ggplot2)

# Gather the subset of the NEI data which corresponds to vehicles
#
d.SCC.vehicles <- d.SCC[ grepl( "vehicle", d.SCC$SCC.Level.Two, ignore.case = TRUE ), ]$SCC
d.NEI.vehicles <- d.NEI[ d.NEI$SCC %in% d.SCC.vehicles, ]

# Extract subset of baltimore-only data
#
d.NEI.subset <- d.NEI.vehicles[ d.NEI.vehicles$fips == "24510", ]

png( "plot5.png" )

print(ggplot(d.NEI.subset, aes( factor(year), Emissions ) ) +
	geom_bar( stat = "identity" ) +
	theme_bw() +  
	guides( fill = FALSE ) +
	labs( x = "year", y = expression( "Total PM"[2.5]*" Emission (Tons)" ) ) + 
	labs( title = expression( "PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore" ) )
	)

dev.off()
