#install openalexR package if not done already
library(openalexR)

get_work_counts <- function(){
  #data frame of concepts of interest and their IDs
  concepts <- data.frame(concept_name = c("Mathematics","Biology","History","CS","Medicine","Art","Religion","Philosophy","Literature"),
                         concept_id=c("C33923547","C86803240","C95457728","C41008148","C71924100","C142362112","C24667770","C138885662","C124952713"))
  
  #getting all concept's work counts for each year (going back to 2012) as a data frame and nesting in list
  counts_by_years <- list()
  
  for (i in 1:nrow(concepts)){
    category_data <- oa_fetch(entity="concepts",id=concepts[i,"concept_id"])$counts_by_year[[1]]
    frame <- data.frame(year=category_data$year,counts = category_data$works_count) |> subset(year<=2024)
    counts_by_years[[length(counts_by_years)+1]] <- frame
  }
  
  names(counts_by_years) <- concepts$concept_name
  
  return(counts_by_years)
}

