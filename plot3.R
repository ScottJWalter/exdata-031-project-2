# plot3.R
#
# Q:  Of the four types of sources indicated by the type (point, 
#     nonpoint, onroad, nonroad) variable, which of these four 
#     sources have seen decreases in emissions from 1999–2008 
#     for Baltimore City? Which have seen increases in emissions 
#     from 1999–2008? Use the ggplot2 plotting system to make 
#     a plot answer this question.

# Load Data Set
#
source("load_data_set.R")

library(ggplot2)

# Subset the data set, extracting only Baltimore City data
#
d.NEI.subset <- d.NEI[ d.NEI$fips == "24510", ]

# Aggregate total emissions by both year and type
#
totalByYearAndType <- aggregate( Emissions ~ year + type, d.NEI.subset, sum )

# Plot it
#
png( "plot3.png" )

print(ggplot( d.NEI.subset, aes( factor(year), Emissions, fill = type ) ) +
    geom_bar( stat = "identity" ) +
    theme_bw() +
    guides( fill = FALSE ) +
    facet_grid( . ~ type, scales = "free", space = "free" ) +
    labs( x = "Year"
			, y = expression( "Total PM"[2.5]*" Emission (Tons)" ) 
			) +
    labs( title = expression( "PM"[2.5]*" Emissions in Baltimore City, MD" ) )
    )

dev.off()
