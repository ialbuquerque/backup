source('./workspace/scripts/importFunctions.R')
# save data into global variables
url <- 'docs.google.com/spreadsheets/d/1nxMrVWaacd1T7XflgJD0bAItzHPjO3jWHXqwGgtCZmQ'
allCancers <- tableFromGoogleSheet(url, '145826304')
dataSpecificCancers <- tableFromGoogleSheet(url, '1652744081')

plotBoxGraph <- function(data) {
  data$CancerType <- as.factor(data$CancerType)
  return(ggplot(data, aes(x = CancerType, y = RateByThousand)) +
           geom_boxplot())
}

plotBoxGraph(dataSpecificCancers)

cleanup = theme(panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                panel.background = element_blank(),
                axis.line = element_line(color = "black"))