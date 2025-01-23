library(tidyverse)
library(reticulate)

## Reticulate to start up your virtual python environment
vrt.env <- "rpython-virtualenv-coolingcenteropt"
use_virtualenv("rpython-virtualenv-coolingcenteropt")
## Install python libraries into virtual environment
python.packages <- c("scipy","spopt","geopandas","pulp","shapely","spaghetti")
virtualenv_install(vrt.env, python.packages)

