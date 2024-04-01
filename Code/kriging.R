#Kriging
install.packages("gstat")
library("gstat")   # geostatistics
library("mapview") # map plot
library("sf")      # spatial vector data
library("stars")   # spatial-temporal data
library("terra")   # raster data handling 
library("ggplot2") # plotting
library("dplyr")

# https://pages.cms.hu-berlin.de/EOL/gcg_quantitative-methods/Lab14_Kriging.html

ptsSF<-read_sf("/Users/coyoteobjective/Desktop/LASTSEMESTER/LASTSTUDIOBRUH/GISSUCCESFUL/FinalExports/pts_Extract_6318/PTS_6318.shp")
mapview(pts)
plot(pts)

pts<-read.csv("/Users/coyoteobjective/Desktop/LASTSEMESTER/LASTSTUDIOBRUH/GISSUCCESFUL/FinalExports/pts_Extract_6318/Pts_6318_table.csv")
head(pts)

#altering topo to new projected topo based on og and model
# extraction
pts$TrueTopo<-rowSums(pts[c("field_3","sampFULL_1")])


# removing control pts
ptsC<-pts %>%
  filter(layer!='CP')
head(ptsC)

ptsSF<-st_as_sf(ptsC, coords = c("Nad_11_631", "Nad_11_6_1"),
                                crs = "EPSG:6318")

crs(ptsSF)


mapview(ptsSF)

