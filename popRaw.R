library(magrittr)
readLines('index.html') %>%
  gsub('<p><small></p>', '<small>', ., fixed = TRUE) %>%
  gsub('<p></small></p>', '</small>', ., fixed = TRUE) %>%
  gsub('<p><small>', '<small>', ., fixed = TRUE) %>%
  gsub('<small></p>', '<small>', ., fixed = TRUE) %>%
  writeLines('index.html')



library(magrittr)
readLines('white/index.html') %>%
  gsub('<p><small></p>', '<small>', ., fixed = TRUE) %>%
  gsub('<p></small></p>', '</small>', ., fixed = TRUE) %>%
  gsub('<p><small>', '<small>', ., fixed = TRUE) %>%
  gsub('<small></p>', '<small>', ., fixed = TRUE) %>%
  writeLines('white/index.html')