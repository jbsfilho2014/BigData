#
# Atividade de Aprofundamento 
# Tarefa 1 = Knn Cross Validation
#
# Altere o codigo abaixo que avalia modelos knn 
# para k=3,4 e com 5 particoes
# para avaliar modelos knn com k=1:12 e para que 
# as particoes de teste que tenham
# apenas 1 elemento.
#
# Em seguida responda a questao 1 e 2 do questionario.
#
# NaO e NECESSaRIO POSTAR ESSE CoDIGO
#
library(MASS)
library(class)
library(caret)
library(e1071)

# 1 = ID, pega complementar e elimina linhas com NA
biopsy_ = na.omit(biopsy[,-c(1)])   

ctrl <- trainControl(method="repeatedcv",
                     number=3, #folders, partições
                     repeats=1
                     )
nn_grid <- expand.grid(k=c(1:12))
#nn_grid

best_knn <- train(class~.,
                  data=biopsy_,
                  method="knn",
                  trControl=ctrl, 
                  preProcess = c("center", "scale"),  # standardize
                  tuneGrid=nn_grid)

print(best_knn) 