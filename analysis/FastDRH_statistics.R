
# read csv files 
##### Bosutinib #####
Bosutinib_WT <- read.csv("./analysis/FastDRH_scores/Bosutinib_WT.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Bosutinib_1 <- read.csv("./analysis/FastDRH_scores/Bosutinib_1.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Bosutinib_2 <- read.csv("./analysis/FastDRH_scores/Bosutinib_2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Bosutinib_3 <- read.csv("./analysis/FastDRH_scores/Bosutinib_3.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Bosutinib_4 <- read.csv("./analysis/FastDRH_scores/Bosutinib_4.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

##### Saracatinib #####
Saracatinib_WT <- read.csv("./analysis/FastDRH_scores/Saracatinib_WT.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Saracatinib_1 <- read.csv("./analysis/FastDRH_scores/Saracatinib_1.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Saracatinib_2 <- read.csv("./analysis/FastDRH_scores/Saracatinib_2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Saracatinib_3 <- read.csv("./analysis/FastDRH_scores/Saracatinib_3.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Saracatinib_4 <- read.csv("./analysis/FastDRH_scores/Saracatinib_4.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

##### Ibrutinib #####
Ibrutinib_WT <- read.csv("./analysis/FastDRH_scores/Ibrutinib_WT.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Ibrutinib_1 <- read.csv("./analysis/FastDRH_scores/Ibrutinib_1.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Ibrutinib_2 <- read.csv("./analysis/FastDRH_scores/Ibrutinib_2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Ibrutinib_3 <- read.csv("./analysis/FastDRH_scores/Ibrutinib_3.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
Ibrutinib_4 <- read.csv("./analysis/FastDRH_scores/Ibrutinib_4.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

##### RL38 #####
RL38_WT <- read.csv("./analysis/FastDRH_scores/RL38_WT.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
RL38_1 <- read.csv("./analysis/FastDRH_scores/RL38_1.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
RL38_2 <- read.csv("./analysis/FastDRH_scores/RL38_2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
RL38_3 <- read.csv("./analysis/FastDRH_scores/RL38_3.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
RL38_4 <- read.csv("./analysis/FastDRH_scores/RL38_4.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)


# make vectors out of the values in column "Score" of the data frames above
##### Bosutinib #####
Bosutinib_WT <- Bosutinib_WT$Score
Bosutinib_1 <- Bosutinib_1$Score
Bosutinib_2 <- Bosutinib_2$Score
Bosutinib_3 <- Bosutinib_3$Score
Bosutinib_4 <- Bosutinib_4$Score

##### Saracatinib #####
Saracatinib_WT <- Saracatinib_WT$Score
Saracatinib_1 <- Saracatinib_1$Score
Saracatinib_2 <- Saracatinib_2$Score
Saracatinib_3 <- Saracatinib_3$Score
Saracatinib_4 <- Saracatinib_4$Score

##### Ibrutinib #####
Ibrutinib_WT <- Ibrutinib_WT$Score
Ibrutinib_1 <- Ibrutinib_1$Score
Ibrutinib_2 <- Ibrutinib_2$Score
Ibrutinib_3 <- Ibrutinib_3$Score
Ibrutinib_4 <- Ibrutinib_4$Score

##### RL38 #####
RL38_WT <- RL38_WT$Score
RL38_1 <- RL38_1$Score
RL38_2 <- RL38_2$Score
RL38_3 <- RL38_3$Score
RL38_4 <- RL38_4$Score


# Set up the color scheme for the boxplots
colors <- c("red", "orange", "yellow", "green", "blue")
# Create the boxplots figure
png("./analysis/FastDRH_scores/boxplots_final.png") # Set up the PNG file
par(mfrow = c(2, 2)) # Set up the plot grid
#rotate x-axis labels
par(las=2)
# create the boxplots
boxplot(Bosutinib_WT, Bosutinib_1, Bosutinib_2, Bosutinib_3, Bosutinib_4, col = colors, main = "Bosutinib",
names=c("WT", "1- R208H", "2- R391C", "3- A421V", "4- E527K"), ylab="Binding affinity score")
boxplot(Saracatinib_WT, Saracatinib_1, Saracatinib_2, Saracatinib_3, Saracatinib_4, col = colors, main = "Saracatinib",
names=c("WT", "1- R208H", "2- R391C", "3- A421V", "4- E527K"), ylab="Binding affinity score")
boxplot(Ibrutinib_WT, Ibrutinib_1, Ibrutinib_2, Ibrutinib_3, Ibrutinib_4, col = colors, main = "Ibrutinib",
names=c("WT", "1- R208H", "2- R391C", "3- A421V", "4- E527K"), ylab="Binding affinity score")
boxplot(RL38_WT, RL38_1, RL38_2, RL38_3, RL38_4, col = colors, main = "RL38",
names=c("WT", "1- R208H", "2- R391C", "3- A421V", "4- E527K"),ylab="Binding affinity score")

dev.off() # Close the PNG file




#Make vectors out of the values in column "Score" of the data frames above
Bosutinib <- list(Bosutinib_1, Bosutinib_2, Bosutinib_3, Bosutinib_4)
Saracatinib <- list(Saracatinib_1, Saracatinib_2, Saracatinib_3, Saracatinib_4)
Ibrutinib <- list(Ibrutinib_1, Ibrutinib_2, Ibrutinib_3, Ibrutinib_4)
RL38 <- list(RL38_1, RL38_2, RL38_3, RL38_4)
# make vector of inhibitors
inhibitors <- list(Bosutinib, Saracatinib, Ibrutinib, RL38)


# write out t-test results to file

##### Bosutinib #####
# create output file.txt
sink(file = "./analysis/FastDRH_scores/t_test_Bosutinib.txt")
# get statistics
print(cat("Variance ", round(var(Bosutinib_WT), digits = 3), "\t", round(var(Bosutinib_1), digits = 3), "\t", round(var(Bosutinib_2), digits = 3), "\t", round(var(Bosutinib_3), digits = 3), "\t", round(var(Bosutinib_4), digits = 3), "\n"))
print(cat("Mean ", round(mean(Bosutinib_WT), digits = 3), "\t", round(mean(Bosutinib_1), digits = 3), "\t", round(mean(Bosutinib_2), digits = 3), "\t", round(mean(Bosutinib_3), digits = 3), "\t", round(mean(Bosutinib_4), digits = 3), "\n"))
print(cat("Standard deviation ", round(sd(Bosutinib_WT), digits = 3), "\t", round(sd(Bosutinib_1), digits = 3), "\t", round(sd(Bosutinib_2), digits = 3), "\t", round(sd(Bosutinib_3), digits = 3), "\t", round(sd(Bosutinib_4), digits = 3), "\n"))
# perform t-test
# loop over vectors in Bosutinib
i <- 1
# separate output
cat("\n\n")
for (mutation in Bosutinib){
  print(paste0("mutation ", i))
  print(round(t.test(Bosutinib_WT, mutation, var.equal=FALSE)$p.value, digits = 3))
  i <- i + 1
  # separate output
  cat("\n\n")
  }
sink(file = NULL)


##### Saracatinib #####
# create output file.txt
sink(file = "./analysis/FastDRH_scores/t_test_Saracatinib.txt")
# get statistics
print(cat("Variance ", round(var(Saracatinib_WT), digits = 3), "\t", round(var(Saracatinib_1), digits = 3), "\t", round(var(Saracatinib_2), digits = 3), "\t", round(var(Saracatinib_3), digits = 3), "\t", round(var(Saracatinib_4), digits = 3), "\n"))
print(cat("Mean ", round(mean(Saracatinib_WT), digits = 3), "\t", round(mean(Saracatinib_1), digits = 3), "\t", round(mean(Saracatinib_2), digits = 3), "\t", round(mean(Saracatinib_3), digits = 3), "\t", round(mean(Saracatinib_4), digits = 3), "\n"))
print(cat("Standard deviation ", round(sd(Saracatinib_WT), digits = 3), "\t", round(sd(Saracatinib_1), digits = 3), "\t", round(sd(Saracatinib_2), digits = 3), "\t", round(sd(Saracatinib_3), digits = 3), "\t", round(sd(Saracatinib_4), digits = 3), "\n"))
# perform t-test
# loop over vectors in Bosutinib
i <- 1
# separate output
cat("\n\n")
for (mutation in Saracatinib){
  print(paste0("mutation ", i))
  print(round(t.test(Saracatinib_WT, mutation, var.equal=FALSE)$p.value, digits = 3))
  i <- i + 1
  # separate output
  cat("\n\n")
  }
sink(file = NULL)


##### Ibrutinib #####
# create output file.txt
sink(file = "./analysis/FastDRH_scores/t_test_Ibrutinib.txt")
# get statistics
print(cat("Variance ", round(var(Ibrutinib_WT), digits = 3), "\t", round(var(Ibrutinib_1), digits = 3), "\t", round(var(Ibrutinib_2), digits = 3), "\t", round(var(Ibrutinib_3), digits = 3), "\t", round(var(Ibrutinib_4), digits = 3), "\n"))
print(cat("Mean ", round(mean(Ibrutinib_WT), digits = 3), "\t", round(mean(Ibrutinib_1), digits = 3), "\t", round(mean(Ibrutinib_2), digits = 3), "\t", round(mean(Ibrutinib_3), digits = 3), "\t", round(mean(Ibrutinib_4), digits = 3), "\n"))
print(cat("Standard deviation ", round(sd(Ibrutinib_WT), digits = 3), "\t", round(sd(Ibrutinib_1), digits = 3), "\t", round(sd(Ibrutinib_2), digits = 3), "\t", round(sd(Ibrutinib_3), digits = 3), "\t", round(sd(Ibrutinib_4), digits = 3), "\n"))

# perform t-test
# loop over vectors in Ibrutinib
i <- 1
# separate output
cat("\n\n")
for (mutation in Ibrutinib){
  print(paste0("mutation ", i))
  print(round(t.test(Ibrutinib_WT, mutation, var.equal=FALSE)$p.value, digits = 3))
  i <- i + 1
  # separate output
  cat("\n\n")
  }
sink(file = NULL)

##### RL38 #####
# create output file.txt
sink(file = "./analysis/FastDRH_scores/t_test_RL38.txt")
# get statistics
print(cat("Variance ", round(var(RL38_WT), digits = 3), "\t", round(var(RL38_1), digits = 3), "\t", round(var(RL38_2), digits = 3), "\t", round(var(RL38_3), digits = 3), "\t", round(var(RL38_4), digits = 3), "\n"))
print(cat("Mean ", round(mean(RL38_WT), digits = 3), "\t", round(mean(RL38_1), digits = 3), "\t", round(mean(RL38_2), digits = 3), "\t", round(mean(RL38_3), digits = 3), "\t", round(mean(RL38_4), digits = 3), "\n"))
print(cat("Standard deviation ", round(sd(RL38_WT), digits = 3), "\t", round(sd(RL38_1), digits = 3), "\t", round(sd(RL38_2), digits = 3), "\t", round(sd(RL38_3), digits = 3), "\t", round(sd(RL38_4), digits = 3), "\n"))
# loop over vectors in Bosutinib
i <- 1
# separate output
cat("\n\n")
for (mutation in RL38){
  print(paste0("mutation ", i))
  print(round(t.test(RL38_WT, mutation, var.equal=FALSE)$p.value, digits = 3))
  i <- i + 1
  # separate output
  cat("\n\n")
  }
sink(file = NULL)
