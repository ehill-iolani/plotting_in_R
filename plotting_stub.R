# Make sure to always check/set your working directory
# getwd()
# setwd(path/to/working/directory)

########################
### Loading in  data ###
########################

# The first thing we want to do is to load in some data
# Conveniently, we have access to the built-in iris dataset
iris

# We want to store the dataset in an object
dat <- iris

# What sort of object is it?
class(dat)

# What are the dimensions of the data frame?
dim(dat)

# Let's take a peek at the data to see what we're working with
head(dat)
tail(dat)
View(dat)

# What are the names of the columns?
names(dat)

# Might as well get some summary states while we're at it
summary(dat)

########################
### Visualizing data ###
########################

# Let's start the visualization with a histogram
hist(dat$Sepal.Length,
     col = "grey",                          # color of the bars
     main = "Histogram of Sepal Length",      # title of the plot
     xlab = "Sepal Length",                   # x-axis label
     ylab = "Frequency")                      # y-axis label

hist(dat$Sepal.Width,
     col = "grey",                          # color of the bars
     main = "Histogram of Sepal Width",       # title of the plot
     xlab = "Sepal Width",                    # x-axis label
     ylab = "Frequency")                      # y-axis label

# How about a bivariate scatter plot
plot(iris$Sepal.Width, iris$Sepal.Length,
     col = "black",                         # color of the points
     main = "Sepal Width vs Sepal Length",    # title of the plot
     xlab = "Sepal Width",                    # x-axis label
     ylab = "Sepal Length",                   # y-axis label
     pch = 19,                                # shape of points
     xlim = c(1.75, 4.6),                     # x-axis limits
     ylim = c(4, 8))                          # y-axis limits

# Now, what if we want to differentiate between species?
col <- rep("black", length(dat$Species))
col[dat$Species == "setosa"] <- "red"
col[dat$Species == "versicolor"] <- "green"
col[dat$Species == "virginica"] <- "blue"

# How does it look?
plot(iris$Sepal.Width, iris$Sepal.Length,
     col = col,                               # color of the points
     main = "Sepal Width vs Sepal Length",    # title of the plot
     xlab = "Sepal Width",                    # x-axis label
     ylab = "Sepal Length",                   # y-axis label
     pch = 19,                                # shape of points
     xlim = c(1.75, 4.6),                     # x-axis limits
     ylim = c(4, 8))                          # y-axis limits
legend(1.75, 7.9,
     legend = unique(dat$Species),            # row names in the legend
     col = unique(col),                       # colors of the legend
     pch = 19,                                # shape of the legend's points
     cex = .8,                                # size of the legend
     box.lty = 0)                             # no box around legend


######################
### Filtering data ###
######################

# What if we only want to visualize subsets of the data?
# We can use a Boolean to figure out what's what
dat$Species == "setosa"       # Which rows are setosa
dat$Species == "versicolor"   # Which rows are versicolor
dat$Species == "virginica"    # Which rows are virginica

setosa <- dat[dat$Species == "setosa", ]           # Subsets based on Boolean
versicolor <- dat[dat$Species == "versicolor", ]   # Subsets based on Boolean
virginica <- dat[dat$Species == "virginica", ]     # Subsets based on Boolean

# Plots only setosa
plot(setosa$Sepal.Width, setosa$Sepal.Length,
     col = "red",                             # color of the points
     main = "Sepal Width vs Sepal Length",    # title of the plot
     xlab = "Sepal Width",                    # x-axis label
     ylab = "Sepal Length",                   # y-axis label
     pch = 19,                                # shape of the legend's points
     xlim = c(1.75, 4.6),                     # x-axis limits
     ylim = c(4, 8))                          # y-axis limits

# Plots only versicolor
plot(versicolor$Sepal.Width, versicolor$Sepal.Length,
     col = "green",                         # color of the points
     main = "Sepal Width vs Sepal Length",    # title of the plot
     xlab = "Sepal Width",                    # x-axis label
     ylab = "Sepal Length",                   # y-axis label
     pch = 19,                                # shape of the legend's points
     xlim = c(1.75, 4.6),                     # x-axis limits
     ylim = c(4, 8))                          # y-axis limits

# Plots only virginica
plot(virginica$Sepal.Width, virginica$Sepal.Length,
     col = "blue",                            # color of the points
     main = "Sepal Width vs Sepal Length",    # title of the plot
     xlab = "Sepal Width",                    # x-axis label
     ylab = "Sepal Length",                   # y-axis label
     pch = 19,                                # shape of the legend's points
     xlim = c(1.75, 4.6),                     # x-axis limits
     ylim = c(4, 8))                          # y-axis limits

# We can actually reconstruct the original graph from the filtered subsets
plot(setosa$Sepal.Width, setosa$Sepal.Length,
     col = "red",                             # color of the points
     main = "Sepal Width vs Sepal Length",    # title of the plot
     xlab = "Sepal Width",                    # x-axis label
     ylab = "Sepal Length",                   # y-axis label
     pch = 19,                                # shape of the legend's points
     xlim = c(1.75, 4.6),                     # x-axis limits
     ylim = c(4, 8))                          # y-axis limits

points(versicolor$Sepal.Width, versicolor$Sepal.Length, # adds versicolor
     col = "green",
     pch = 19)

points(virginica$Sepal.Width, virginica$Sepal.Length,   # adds virginica
     col = "blue",
     pch = 19)

# What if we want versicolor AND virigincia
dat$Species == "versicolor" | dat$Species == "virginica"
vervir <- dat[dat$Species == "versicolor" | dat$Species == "virginica", ]

col <- rep("black", length(vervir$Species))
col[vervir$Species == "versicolor"] <- "green"
col[vervir$Species == "virginica"] <- "blue"

plot(vervir$Sepal.Width, vervir$Sepal.Length,
     col = col,                               # color of the points
     main = "Sepal Width vs Sepal Length",    # title of the plot
     xlab = "Sepal Width",                    # x-axis label
     ylab = "Sepal Length",                   # y-axis label
     pch = 19,                                # shape of the legend's points
     xlim = c(1.75, 4.6),                     # x-axis limits
     ylim = c(4, 8))                          # y-axis limits

