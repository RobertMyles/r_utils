# takes data copied from somewhere else (like a webpage) and formats it as a character vector
# E.g. copying this line from a webtable: "Year Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec Annual"
# this function turns it into a character vector: 
# > char_from_copy("Year Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec Annual") %>% str()
# chr [1:14] "Year" "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" ...

char_from_copy <- function(x, sep = " "){
  x <- str_split(x, " ") %>% .[[1]]
  x
}

