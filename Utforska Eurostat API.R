library(eurostat)
library(knitr)

#Tutorial: https://ropengov.github.io/eurostat/articles/eurostat_tutorial.html

#Get table of contents
#toc <- get_eurostat_toc()

#View table of contents
#kable(tail(toc))

#Search table of contents, in this exemple we search for all datasets containing "NUTS 2" in the title. 
##It's also possible to search for type "table" instead of "dataset"
kable(search_eurostat("NUTS 2", type="dataset")$title)

#Download data by searching for title identified in the table of contents
id <- search_eurostat("Employment rates by sex, age, educational attainment level, citizenship and NUTS 2 regions",
                      type = "dataset")$code[1]

#List of regions, you can create a vector with regions (NUTS 2 in this example) to use as filter
regions <- c("SE11", "DK01", "FI1B", "NO08", "NL32", "DE30", "FR10", "DE21", "IE06", "ES51", "ITC4")

##Get whole dataset/table
df_view <- get_eurostat(id, filters = list(geo = regions), type = "label", time_format = "num")
