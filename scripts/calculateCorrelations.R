getStateName <- function(food, cancer, index) {
  if(food[index,][[1]] == cancer[index,][[1]]) {
    return(food[index,][["State"]])  
  }
}

getStateData <- function(data, index, columnName) {
  data <- as.data.frame(t(data[index,-1,drop=FALSE]))
  names(data)[1] <- columnName
  return(data)
}

getCancerDataForCorrelation <- function(data, index){
  valuesAvailable <- 8
  if (index < 4) { valuesAvailable <- index + 7 } else { valuesAvailable <- 10 }
  return(data[index:valuesAvailable, "CANCER"])
}

getFoodDataForCorrelation <- function(data, index) {
  valuesAvailable <- 0
  if (index < 4) { valuesAvailable <- 8 } else { valuesAvailable <- 11 - index }
  return(head(data, valuesAvailable))
}

getCorrelation <- function(food, cancer, stateIndex) {
  correlationNumber <- 6
  result <- vector("list", length(correlationNumber))
  
  stateName <- getStateName(food, cancer, stateIndex)
  foodStateData <- getStateData(food, stateIndex, "FOOD")
  cancerStateData <- getStateData(cancer, stateIndex, "CANCER")
  
  for(index in 1:correlationNumber) {
    corCancerData <- getCancerDataForCorrelation(cancerStateData, index)
    corFoodData <- getFoodDataForCorrelation(foodStateData, index)
    result[[1]][index] <- cor(corCancerData, corFoodData, method="spearman")
  }
  return(result)
}
#getCorrelation(fastFoodRate, allSitesDeaths, 1)
