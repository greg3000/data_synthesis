setwd("/home/decc/NEED/data_synthesis/")
data = read.csv("PUF_2014_IncDummyVOA.csv")

library(synthpop)


#get rid of invalid gas/elec
#NB might want to think about obs that might scew modelling
dataV <- data[ which(data$Gcons2012Valid=='V' 
                     & data$Econs2012Valid=='V'), ]

#set a random seed to allow recreatable results
my.seed=16486374

#select order of vars to be synthesized
visit.sequence <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60) 
#alternative approach

method.ini <- c("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "ctree", "ctree", "ctree", "ctree", "ctree", "ctree", "ctree", "", "", "ctree")
#first run at synthesis - this is mainly done to create a predictor matrix to be edited



#run the prediction
sds.selection <-syn(dataV, visit.sequence, seed = my.seed, method = method.ini)


#see page 16 of documentation for comparrison code
#do i need to state that data are categorical?

compare.synds(sds.selection$syn, dataV)
summary(sds.selection)

#summarise the synthesied data
summary(sds.selection$syn)

#export the summarised data
synthVOA <- as.data.frame(sds.selection$syn)
write.csv(synthVOA, file = "synthVOA2.csv")
write.csv(sds.selection$syn, file = "synthVOAtemp.csv")

#add in a smaller dataset to check the output has worked (something that can be opened in excel)
#have a look at the predictor matrix
sds.selection$predictor.matrix

#export the prediction matrix
prdctmtrx <- as.data.frame(sds.selection$predictor.matrix)
write.csv(prdctmtrx, file = "prediction_matrix.csv")
