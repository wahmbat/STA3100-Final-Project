#install openalexR package if not done already
library(openalexR)

#data frame of concepts of interest and their IDs
concepts <- data.frame(concept_name = c("Mathematics","Biology","History","Computer Science","Medicine"),
                       concept_id=c("C33923547","C86803240","C95457728","C41008148","C71924100"),
                       counts=vector("character",5))

#getting all concept's work counts for each year (going back to 2012) as a data frame and nesting in list
counts_by_years <- list()

for (i in 1:nrow(concepts)){
  category_data <- oa_fetch(entity="concept",id=concepts[i,"concept_id"])$counts_by_year[[1]]
  frame <- data.frame(year=category_data$year,counts = category_data$works_count)
  counts_by_years[[length(counts_by_years)+1]] <- frame
}

names(counts_by_years) <- concepts$concept_name

