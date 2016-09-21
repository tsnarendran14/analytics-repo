library(RMySQL)
connect<-dbConnect(MySQL(),user="genome", host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(connect,"show databases;"); dbDisconnect(connect)
result

connect<-dbConnect(MySQL(),user="genmoe",db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables<-dbListTables(hg19)
length(allTables)
allTables[1:5]

#list all the fields in trait affyU133Plus2...lists columns in dataset
dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19,"select count(*) from affyU133Plus2")
#Read table
affyData<-dbReadTable(hg19,"affyU133Plus2")
head(affyData)

query<-dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis<-fetch(query)
quantile(affyMis$misMatches)
#fetched top 10 rows
affyMisSmall<-fetch(query,n=10)
dbClearResult(query)
dim(affyMisSmall)

dbDisconnect(hg19)
