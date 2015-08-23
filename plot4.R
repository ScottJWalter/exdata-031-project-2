# plot4.R
#
# Q:  Across the United States, how have emissions from coal 
#     combustion-related sources changed from 1999–2008?

# Load Data Set
#
source("load_data_set.R")

library(ggplot2)

# Merge into a single data set
#
if( !exists( "d.Merged" ) ) { d.Merged <- merge( d.NEI, d.SCC, by = "SCC" ) }

# Extract a subset from the combined data of all records with
# a Short.Name of "coal"
#
d.Merged.subset <- d.Merged[ grepl( "coal", d.Merged$Short.Name, ignore.case = TRUE), ]

# Aggregate the results
#
totalByYear <- aggregate( Emissions ~ year, d.Merged.subset, sum )

# Plot it
#
png( "plot4.png" )

# Adjust to stop y-axis from showing scientific notation
#
options( scipen = 100 )

print(ggplot( totalByYear, aes( factor(year), Emissions ) ) +
	geom_bar( stat = "identity" ) +
	theme_bw() +  
	guides( fill = FALSE ) +
	xlab( "Year" ) +
	ylab( expression( 'Total PM'[2.5]*" Emissions (Tons)" ) ) +
	labs( title = "Total Emissions From Coal Sources" )
	)

dev.off()
