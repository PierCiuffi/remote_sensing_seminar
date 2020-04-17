#### R code for rs seminar

install.packages("raster")
library(raster)

setwd("/home/pierpaolo/Desktop/seminario_duccio_rocchini/p224r63/")   ### set the work directory

p224r63_2011 <- brick ("p224r63_2011_masked.grd")   ### import the image

### brick is used to import multilayer images

plot(p224r63_2011)

# B1: blue
# B2: green
# B3: red
# B4: NIR

cl <- colorRampPalette(c('black','grey','light grey'))(100) #
plot(p224r63_2011, col=cl)

par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) #
plot(p224r63_2011$B1_sre, col=clb)

clc <- colorRampPalette(c('dark green','green','light green'))(100) #
plot(p224r63_2011$B2_sre, col=clc)


cld <- colorRampPalette(c('dark red','red','pink'))(100) #
plot(p224r63_2011$B3_sre, col=cld)

cle <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(p224r63_2011$B4_sre, col=cle)

dev.off()

#### RGB

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

#### Exercise> mount NIR ontop the G of RGB

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

### Import the 1988 image
p224r63_1988

p224r63_1988 <- brick ("p224r63_1988_masked.grd")

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")


### DVI for the two years > compare with a difference in time
### NIR - RED
### NDVI = (NIR - RED) / (NIR - RED)

dev.off()

dvi1988 <- p224r63_1988$B4_sre - p224r63_1988$B3_sre
dvi2011 <- p224r63_2011$B4_sre - p224r63_2011$B3_sre

par(mfrow=c(2,1))
cldvi <- colorRampPalette(c('red','orange','green'))(100) #
plot(dvi1988, col=cldvi)
plot(dvi2011, col=cldvi)

#####

dev.off()

dif <- dvi2011 - dvi1988
cldif <-colorRampPalette(c('blue','white','red'))(100) #
plot(difdvi, col=cldif)

####

library(RStoolbox)

###
p223r63_2011res <- aggregate(p223r63_2011, fact=10)

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p223r63_2011res, r=4, g=3, b=2, stretch="Lin")

p224r63_2011_pca <-rasterPCA(p223r63_2011res)

summary(p224r63_2011_pca$model)
plotRGB(p224r63_2011_pca$map, r=4, g=3, b=2, stretch="Lin")

plot(p224r63_2011_pca$map)

### land cover
p224r63_2011

p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=5)
class <- colorRampPalette (c('red','yellow','green','blue','white'))(100) #
plot(p224r63_2011c$map, col=class)


