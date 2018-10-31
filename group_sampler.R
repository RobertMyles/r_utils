# sample from groups in a df. Useful for balancing classes in softmax classification models. 
# All down to Jenny Bryan: https://jennybc.github.io/purrr-tutorial/ls12_different-sized-samples.html

library(dplyr)
library(tidyr)
library(purrr)

group_sample <- function(df, var, N){
  var <- enquo(var)
  N <- enquo(N)
  
  df <- df %>% group_by(!! var) %>% 
    nest() %>%            
    mutate(n = !! N) %>% 
    mutate(samp = map2(data, n, sample_n)) %>% 
    select(!! var, samp) %>%
    unnest()
  df
}


# example with mtcars. Here we want a sample of 5, 4 and 6 rows of the classes  

data(mtcars)
var <- cyl
N <-  c(5, 4, 6)

group_sample <- function(df, var, N){
  var <- enquo(var)
  N <- enquo(N)
  
  df <- df %>% group_by(!! var) %>% 
    nest() %>%            
    mutate(n = !! N) %>% 
    mutate(samp = map2(data, n, sample_n)) %>% 
    select(!! var, samp) %>%
    unnest()
  df
}
group_sample(mtcars, cyl, N = c(5, 4, 6)) %>% janitor::tabyl(cyl)

