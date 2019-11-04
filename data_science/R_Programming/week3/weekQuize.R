#1
flowers <- split(iris, iris$Species)
# instead of colMeans, use mean since just 1 dimension
# note that the example in the book is a matrix (3 columns, so use colMeans)
sapply(flowers, function(x){
    mean(x[,"Sepal.Length"])
})

flowersAnother <- iris %>%
    group_by(Species) %>%
    summarise(meanSepalLengh = mean(Sepal.Length))
#2
apply(iris[,1:4],2, mean)
apply(iris[,1:4],1,mean)
colMeans(iris) #Error in colMeans(iris) : 'x' must be numeric
apply(iris,1,mean) #There were 50 or more warnings (use warnings() to see the first 50)

#3
splitMt <- split(mtcars$mpg,mtcars$cyl)
sapply(split(mtcars$mpg,mtcars$cyl),mean)

averageMpg <- tapply(mtcars$mpg,mtcars$cyl,mean)
with(mtcars, tapply(mpg,cyl,mean))

mean(mtcars$mpg,mtcars$cyl) # Error in mean.default(mtcars$mpg, mtcars$cyl) : 
# 'trim' must be numeric of length one

#4 
avHorsepw <- sapply(split(mtcars$hp,mtcars$cyl),mean)
avHorsepw
dfhp <- abs(avHorsepw["8"] - avHorsepw["4"])
dfhp


