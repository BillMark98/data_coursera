## Problem
* how to filter out NAs from consective columns using loop


* to filter multiple times to get rid of NAs 
```
atest <- brfss2013
for(i in 1 : length(chronicDiseaseType)) {
    atest <- atest %>%
        filter(!is.na(atest[i]))
}
```

* to get the particular column number of a variable
```
which(colnames(brfss2013) == "cvdinfr4")
```

* here is a link about [legend in geom_point](https://stackoverflow.com/questions/17713919/two-geom-points-add-a-legend)

