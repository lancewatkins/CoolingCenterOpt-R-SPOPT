
### Formating CSV Input Files for Cooling Center Optimization
### Lance Watkins 
### These files were produced in ArcPro by reprojecting point shapefiles to WGS84 and calculating lat (Y) and long(x) in degree decimals.
### This R code was used to further format the csv files prior to bringing them into generate_osrm_matricies.Rmd
### All input csv files for generate_osrm_matrices.Rmd should be formated as below before being used in the .Rmd file.
### Formatted CSV files should only contain the nessesary columns without extra information 
### All the demand point files should me merged into one demand point file.

library(dplyr)   # For data manipulation (e.g., mutate, bind_rows)
library(R.utils) # For the chunking function (used within safe_osrmTable)

working.dir <- "C:/Users/raelu/ASU Dropbox/Lance Watkins/ASU/projects/CoolingCenterSpatiaOptimization/data/CoolingCenterDashboard-testdata/reprojected data"
output.dir <- "C:/Users/raelu/ASU Dropbox/Lance Watkins/ASU/projects/CoolingCenterSpatiaOptimization/CoolingCenterOpt-R-SPOPT/data"

setwd(working.dir)
candidate_locs <- read.csv("candidate_locations_WGS84.csv")
existing_locs <- read.csv("existing_cooling_centers_WGS84.csv")
dp_homelessheatd <- read.csv("homeless_heatdeath_WGS84.csv")
dp_homelessoutrch <- read.csv("homeless_outreach_WGS84.csv")
dp_homelesspit <- read.csv("homeless_pit_WGS84.csv")
dp_ressample <- read.csv("residential_sample_WGS84.csv")

## Select the necessary Columns, rename them, merge them (if necessary), then save the resulting csv files to output.dir

candidate_locs <- candidate_locs[,c("FacilityID","POINT_X","POINT_Y","FullAddres")]
colnames(candidate_locs) <- c("id","longitude","latitude","address")
candidate_locs$type <- "candidate location"
write.csv(candidate_locs,paste0(output.dir,"/candidate_locations.csv"), row.names = FALSE)

existing_locs <- existing_locs[,c("Name","POINT_X","POINT_Y")]
colnames(existing_locs) <- c("id","longitude","latitude")
existing_locs$type <- "existing cooling center"
write.csv(existing_locs,paste0(output.dir,"/existing_cooling_centers.csv"), row.names = FALSE)

## The demand points need to formatted and merged together so they are in one file 

