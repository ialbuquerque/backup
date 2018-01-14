extractFileIdFromURL <- function(url) {
  return(stringr::str_extract(url, '[[:alnum:]_-]{30,}'))
}

buildDownloadURL <- function(url, sheetid){
  address <- paste0(
    'https://docs.google.com/spreadsheets/export?id=',
    extractFileIdFromURL(url),
    '&format=csv&gid=',
    sheetid
  )
  return(address)
}

# Main function to read from google sheet
tableFromGoogleSheet <- function(url, sheetid){
  suppressMessages(table <- readr::read_csv(file = buildDownloadURL(url, sheetid)))
  return(table)
}