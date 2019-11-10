kobe_streak %>%
    summarise(iqr = mean(length),n = n())### problems
```
hist(kobe_streak,breaks= 0:5)
```  
will result an error
```
Error in hist.default(kobe_streak, breaks = 0:5) : 'x' must be numeric
```
Since it's a data frame object(although just one column), could use  
```
hist(kobe_streak$length, breaks = 0:5)
```

*
```
kobe_streak %>%
    summarise(iqr = mean(length),n = n())
```    
get error
```
/bin/sh:problem: command not found
```  
at first sight, when comparing the example from the previous two worksheets.  
It seems that the reason is that the difference of data type. e.g `arbuthnot` in worksheet 1
is of `"tbl_df" "tbl" "data.frame"` type but `kobe_streak` is only of type `data.frame`. But after using `tbl_df(kobe_streak)` to convert it into the data type as `"tbl_df" "tbl" "data.frame"` still get the error.  
The problem is actually in the executing block  
after these'`' should type {r ...}
like 
```
```{r problem 3}
mytblKobe %>%
 summarise(mean_l = mean(length), sd_l = sd(length))


rdu_flights %>%
  summarise(mean_dd = mean(dep_delay), sd_dd = sd(dep_delay), n = n())
```

```