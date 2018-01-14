################### funcoes para montar data frame por tipo de cancer e anos
formatFoodVsCancerByState <- function(foodRate, cancerRate, stateIndex) {
  values <- getCorrelation(foodRate, cancerRate, stateIndex)[[1]]
  result <- data.frame(values[1], values[2], values[3], values[4], values[5], values[6])
  colnames(result) <- c("ano0", "ano1", "ano2", "ano3", "ano4", "ano5")
  return(result)
}

addCancerTypesColumn <- function(data) {
  return(cbind("CancerType" = c("allSites", "femaleBreast", "colonRectum", "leukemia", "lungBronchus", "nonHodgkinLymphoma", "prostate"), data))
}

# Esta funcao cria varias linhas para comparar a correlacao do dado de restaurante
# passado versus cada tipo de cancer no estudo (um estado por vez)
##### talvez fazer uma forma que faca isso pra todos os estados?
getDataForPlotGraphRestaurantCancerTypes <- function(stateIndex, foodRate, cancers) {
  resultToPlot <- data.frame()
  for (cancerType in cancers) {
    resultToPlot <- rbind(resultToPlot, formatFoodVsCancerByState(foodRate, cancerType, stateIndex))
  }
  return(addCancerTypesColumn(resultToPlot))
}

################### funcao test para ter todos os estados
getAllStates <- function(foodRate, cancers) {
  for (stateIndex in 1:52) {
    print(getDataForPlotGraphRestaurantCancerTypes(
      stateIndex, fastFoodRate,
      cancers = list (allSitesNewCases,femaleBreastNewCases,colonRectumNewCases,leukemiaNewCases,lungBronchusNewCases,nonHodgkinLymphomaNewCases,prostateNewCases)
      #cancers = list (allSitesDeaths,femaleBreastDeaths,colonRectumDeaths,leukemiaDeaths,lungBronchusDeaths,nonHodgkinLymphomaDeaths,prostateDeaths)
    ))
  }  
}
result <- getAllStates(
    fastFoodRate,
    cancers = list (allSitesNewCases,femaleBreastNewCases,colonRectumNewCases,leukemiaNewCases,lungBronchusNewCases,nonHodgkinLymphomaNewCases,prostateNewCases)
  )
result


#################### todos os estados por correlacao especifica

getStatesColumn <- function(table) {
  return(table[["State"]])
}

getAllCancerVersusYears <- function(foodRate, cancerRate) {
  result <- data.frame()
  for (stateIndex in 1:52) {
    result <- rbind(result, formatFoodVsCancerByState(foodRate, cancerRate, stateIndex))
  }
  return(cbind("Estado" = getStatesColumn(foodRate), result))
}
getAllCancerVersusYears(fastFoodRate, colonRectumNewCases)

