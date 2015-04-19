##############################################
## Step #1 - Load Packages and Read the Data
##############################################

## Load the required packages
if (!require(dplyr)) { install.packages("dplyr") }
if (!require(ggplot2)) { install.packages("ggplot2") }

## Check if NEI already exists in the current environment
if (exists("nei")) {
        ## Check if dimensions are correct
        if (!(nrow(nei) == 6497651 & ncol(nei) == 6)) { 
                ## Read the National Emissions Inventory data set for 1999, 2002, 2005, 2008 if dimensions are incorrect
                nei	<- readRDS("summarySCC_PM25.rds") 
        }
} else {
        ## Read the National Emissions Inventory data set for 1999, 2002, 2005, 2008 if it does not exist
        nei	<- readRDS("summarySCC_PM25.rds")
}

## Check if SCC already exists in the current environment
if (exists("scc")) {
        ## Check if dimensions are correct
        if (!(nrow(scc) == 11717 & ncol(scc) == 15)) { 
                ## Read the Source Classification Code Table if dimensions are incorrect
                scc	<- readRDS("Source_Classification_Code.rds") 
        }
} else {
        ## Read the Source Classification Code Table if it does not exist
        scc	<- readRDS("Source_Classification_Code.rds")
}

##############################################
## Step #2 - Manipulate and modify the data as needed
##############################################

## Make nei and scc a data frame that can be manipulated with dplyr
nei <- tbl_df(nei)
scc <- tbl_df(scc)

## Determine de SCC code for Coal Combultion Related Sources
## SCC with the word Coal on its description
coal.rows <- grep("[C|c]oal" , scc$SCC.Level.Three)
## Extract SCC code
scc.codes <- as.vector(scc[coal.rows,1][[1]])

## Filter NEI data set by SCC codes for coal
nei.coal <- filter(nei, SCC %in% scc.codes)

## Group and Summarize the grouped data by adding all of the Emissions per year
nei.coal.year.sum <- summarise(group_by(nei.coal, year), total_emissions = sum(Emissions))

##############################################
## Step #3 - Create the plot to PNG
##############################################

## Open png Graphics Device with width and height of 480 px
png(file = "plot4.png", width = 600, height = 600, units = "px", bg = "transparent")
## Create the plot in current graphic device
plot4 <- ggplot(nei.coal.year.sum, aes(year, total_emissions))
plot4 <- plot4 + labs(title = "Emissions from Coal Combustion Sources per Year", x = "Years", y = "Total Emissions (tons)")
plot4 <- plot4 + geom_point(col = "gray22", size = 4) + geom_line(col = "steelblue3", size = 1.5)
plot4 <- plot4 + geom_smooth(col = "firebrick2", method = "lm", se = FALSE)
print(plot4)
## Turn off graphic device
dev.off()