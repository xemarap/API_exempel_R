library(eurostat)
library(knitr)
library(tidyverse)
library(writexl)

#Tutorial: https://ropengov.github.io/eurostat/articles/eurostat_tutorial.html

#Get table of contents
#toc <- get_eurostat_toc()

#View table of contents
#kable(tail(toc))

#Search table of contents
kable(search_eurostat("NUTS 2", type="dataset")$title)

#Download data
id <- search_eurostat("Employment rates by sex, age, educational attainment level, citizenship and NUTS 2 regions",
                      type = "dataset")$code[1]

#List of regions
regions <- c("SE11", "DK01", "FI1B", "NO08", "NL32", "DE30", "FR10", "DE21", "IE06", "ES51", "ITC4")

##Get whole table
df_view <- get_eurostat(id, filters = list(geo = regions), type = "label", time_format = "num")