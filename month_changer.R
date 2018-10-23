
library(dplyr)

month_changer <- function(df, var){
  
  # months
  jan <- c("January", "january", "JANUARY", "Jan.", "Jan", "JAN.", "JAN", "jan", "jan.")
  feb <- c("February", "february", "FEBRUARY", "Feb.", "Feb", "FEB.", "FEB", "feb", "feb.")
  mar <- c("March", "march", "MARCH", "Mar.", "Mar", "MAR.", "MAR", "mar", "mar.")
  apr <- c("April", "april", "APRIL", "Apr.", "Apr", "APR.", "APR", "apr", "apr.")
  may <- c("May", "may", "MAY", "May", "MAY", "may")
  june <- c("June", "june", "JUNE", "Jun.", "Jun", "JUN.", "JUN", "jun", "jun.")
  july <- c("July", "july", "JULY", "Jul.", "Jul", "JUL.", "JUL", "jul", "jul.")
  aug <- c("August", "august", "AUGUST", "Aug.", "Aug", "AUG.", "AUG", "aug", "aug.")
  sep <- c("September", "september", "SEPTEMBER", "Sep.", "Sept.", "Sep", "Sept", "SEP.", 
  "SEPT.", "SEP", "SEPT", "sep", "sept", "sep.", "sept.")
  oct <- c("October", "october", "OCTOBER", "Oct.", "Oct", "OCT.", "OCT", "oct", "oct.")
  nov <- c("November", "november", "NOVEMBER", "Nov.", "Nov", "NOV.", "NOV", "nov", "nov.")
  dec <- c("December", "december", "DECEMBER", "Dec.", "Dec", "DEC.", "DEC", "dec", "dec.")
  
  df <- df %>% 
    mutate(UQ(sym(var)) := case_when(
      !!sym(var) %in% jan ~ "01",
      !!sym(var) %in% feb ~ "02",
      !!sym(var) %in% mar ~ "03",
      !!sym(var) %in% apr ~ "04",
      !!sym(var) %in% may ~ "05",
      !!sym(var) %in% june ~ "06",
      !!sym(var) %in% july ~ "07",
      !!sym(var) %in% aug ~ "08",
      !!sym(var) %in% sep ~ "09",
      !!sym(var) %in% oct ~ "10",
      !!sym(var) %in% nov ~ "11",
      !!sym(var) %in% dec ~ "12"
    ))
  
  df
}
