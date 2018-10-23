library(recipes); library(zeallot)

test_train_bake <- function(recipe_object, data) {
  df <- initial_split(data)
  tr <- training(df)
  te <- testing(df)
  training <- bake(recipe_object, tr)
  testing <- bake(recipe_object, te)
  
  return(list(training, testing))
}

# fits after the prep() stage in a recipe pipeline
# for use with zeallot's %->%
# like: 
# recipe([CODE]) %>% step_*([CODE]) %>% prep() %>% test_train_bake(data) %->% c(train, test)
