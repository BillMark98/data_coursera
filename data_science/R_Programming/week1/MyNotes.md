### Fix bug
On opening R 
error message: 
```
WARNING: You're using a non-UTF8 locale, therefore only ASCII characters will work. Please read R for Mac OS X FAQ (see Help) section 9 and adjust your system preferences accordingly. [History restored from /Users/nemo/.Rapp.history]
```

and the link is ![fix non-UTF8](https://stackoverflow.com/questions/9689104/installing-r-on-mac-warning-messages-setting-lc-ctype-failed-using-c)



### homework1

to read in the `.csv` file , use the command `read.csv(filename)` ( Dont forget to change the working  
directory to where the file is)  
I got the error after changing the dir  :
```
objc[71717]: Class FIFinderSyncExtensionHost is implemented in both /System/Library/PrivateFrameworks/FinderKit.framework/Versions/A/FinderKit (0x7fffa78731d0) and /System/Library/PrivateFrameworks/FileProvider.framework/OverrideBundles/FinderSyncCollaborationFileProviderOverride.bundle/Contents/MacOS/FinderSyncCollaborationFileProviderOverride (0x10ed63dc8). One of the two will be used. Which one is undefined.
```
I use 
```
initial <- read.csv("hm1_data.csv")
```  
to get the `csv` file  

`initial` has three attributes : `names`,`class`,`row.names`  

To get row number:  `nrow(initial)`
To get col names: `names(initial)` or `colnames(initial)`  
To print out the first 2 lines: `initial[c(1:2)]`  
To print the last 2 lines: `tail(initial,2)`  
How many missing values of the first column: 
```
iNA <- is.na(initial[,1])
v <- initial[,1][iNA]
length(v)
```  
or 
```
ns <- subset(initial,is.na(Ozone))
nrow(ns)
```
* a useful link for ![subset data frame](https://www.r-bloggers.com/5-ways-to-subset-a-data-frame-in-r/)
The mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation:  
```
vbar <- initial[,1][!iNA] 
mean(vbar)
```

Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?  
```
v <- subset(initial,Ozone > 31 & Temp > 90)
mean(v$S)
```

What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
```
may <- subset(initial,Month == 5)
mayNoNA <- subset(may,!is.na(Ozonne)) ## to delete the NA rows because with NA, the max will return NA
max(mayNoNA$Oz)
```




### Notes on swirl
* create a path `testdir2/testdir3`
```
dir.create(file.path('testdir2','testdir3'),recursive = TRUE)
```


define a function using the text editor  
then can choose the code in the editor, using `cmd + enter` will copy the code   
into the console and compile that  


R high level graphic function: by plotting will generate a complete graphic window
low level graphic function: need a graphic window first , then will add elements to it



1. help function 
?func
args(func)  print out all the arguments
2. the pmf of binomial how to plot the number of the pmf


3. tr.erg   an argument of tr?
4. how to adjust the size of the graphic window\


## week2
`mean(y,rm = TRUE)` will calculate the mean of the vector y, with all `NA` removed

here is a link to explain ![optim in R](https://magesblog.com/post/2013-03-12-how-to-use-optim-in-r/)  
* to indent the code: select codes and `cmd + i`


```
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
z <- 10
f(3)
```  
will return 10