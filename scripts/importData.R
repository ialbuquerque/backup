source('./workspace/scripts/importFunctions.R')
# save data into global variables
foodUrl <- 'docs.google.com/spreadsheets/d/1h1tIECX44cw0Wf3taWRSgfqo_42slEnubHgQYkAt1RU'
fastFoodRate <- tableFromGoogleSheet(foodUrl, '1518783517')
fullServiceRate <- tableFromGoogleSheet(foodUrl, '1969638446')
allRestaurants <- tableFromGoogleSheet(foodUrl, '1677295543')

newCasesCancerUrl <- 'docs.google.com/spreadsheets/d/1EI8oeuyMmEmB41h5EekAWvEb_IMoFwUk1BVJGH4XH6M'
allSitesNewCases <- tableFromGoogleSheet(newCasesCancerUrl, '825266200')
femaleBreastNewCases <- tableFromGoogleSheet(newCasesCancerUrl, '951947736')
colonRectumNewCases <- tableFromGoogleSheet(newCasesCancerUrl, '962900436')
leukemiaNewCases <- tableFromGoogleSheet(newCasesCancerUrl, '844184574')
lungBronchusNewCases <- tableFromGoogleSheet(newCasesCancerUrl, '613445575')
nonHodgkinLymphomaNewCases <- tableFromGoogleSheet(newCasesCancerUrl, '459278417')
prostateNewCases <- tableFromGoogleSheet(newCasesCancerUrl, '1140355445')

deathsCancerUrl <- 'docs.google.com/spreadsheets/d/159Vb0F6RSeNXsvGB0yhoE74c6wuzFhTyMUZcJ2JernU'
allSitesDeaths <- tableFromGoogleSheet(deathsCancerUrl, '343958072')
femaleBreastDeaths <- tableFromGoogleSheet(deathsCancerUrl, '941214401')
colonRectumDeaths <- tableFromGoogleSheet(deathsCancerUrl, '1814835923')
leukemiaDeaths <- tableFromGoogleSheet(deathsCancerUrl, '1528798913')
lungBronchusDeaths <- tableFromGoogleSheet(deathsCancerUrl, '1032349472')
nonHodgkinLymphomaDeaths <- tableFromGoogleSheet(deathsCancerUrl, '245771098')
prostateDeaths <- tableFromGoogleSheet(deathsCancerUrl, '859549658')
