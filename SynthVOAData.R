setwd("/home/decc/NEED/data_synthesis/")
data = read.csv("PUF_2014_IncDummyVOA.csv")
head(data)
library(synthpop)
names(data)
summary(data)


#get rid of invalid gas/elec
#NB might want to think about obs that might scew modelling
dataV <- data[ which(data$Gcons2012Valid=='V' 
                         & data$Econs2012Valid=='V'), ]

#set a random seed to allow recreatable results
my.seed=16486374

#select order and which variables to be synthesized
visit.sequence <- c(51, 52, 53, 54, 55, 56, 57, 60)
method.ini <- c("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "ctree", "ctree", "ctree", "ctree", "ctree", "ctree", "ctree", "", "", "ctree")
sds.selection <-syn(dataV, visit.sequence, seed = my.seed, method = method.ini, drop.net.used = FALSE)

#nest step is to have a look at what the above steop creates,
#and see page 16 of documentation for comparrison code
