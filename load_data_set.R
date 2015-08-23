# load_data_set.R

# Working variables
#
origData <- "NEI_data.zip"
thePath <- './data'

if( !file.exists( thePath ) ) { dir.create( thePath ) }

if( !file.exists( file.path( thePath, origData ) ) )
{
    # Get data set
    #
    download.file( "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
                   , destfile = file.path( thePath, origData )
                   , method = "curl"
    )
}

if ( !file.exists( file.path( thePath, "Source_Classification_Code.rds" ) ) 
	|| !file.exists( file.path( thePath, "summarySCC_PM25" ) ) ) 
{ 
    unzip( zipfile = file.path( thePath, origData )
         , exdir = thePath
    )
}

if( !exists( "d.NEI" ) ) { d.NEI <- readRDS( file.path( thePath, "summarySCC_PM25.rds" ) ) }

if( !exists( "d.SCC" ) ) { d.SCC <- readRDS( file.path( thePath, "Source_Classification_Code.rds" ) ) }
