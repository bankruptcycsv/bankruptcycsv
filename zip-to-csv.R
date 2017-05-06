library(data.table)
library(haven)

# Download files from
# https://www.fjc.gov/research/idb/bankruptcy-cases-filed-terminated-and-pending-fy-2008-present
# And make sure the working directory contains these and only these zips

all.zips <- grep("zip$",list.files(),val=T)

for( the.file in all.zips ) { 
    x <- data.table(read_sas(unzip(the.file)))
    new.name <- gsub("zip","csv",the.file)
    sas.name <- gsub("zip","sas7bdat",the.file)
    fwrite(x,file=new.name)
    file.remove(sas.name)
}
