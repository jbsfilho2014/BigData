install.packages("ROCR")
library("ROCR")
credit_fraud <- read.csv("r/qconlondon2016_sample_data.csv")
head(credit_fraud)
set.seed(1234)
T <- sample(1:nrow(credit_fraud),round(0.3*nrow(credit_fraud)))

credit_fraud_test   <- credit_fraud[T,]
credit_fraud_train  <- credit_fraud[-T,]

credit_fraud_test$charge_time <- as.numeric(credit_fraud_test$charge_time)
credit_fraud_train$charge_time <- as.numeric(credit_fraud_train$charge_time)

table(credit_fraud$card_country)

fit <- glm(fraudulent~.,
           data=credit_fraud_train,
           family=binomial("logit")
           )

predict_test <- predict(fit,
                       newdata=credit_fraud_test,
                       type="response")>0.5

c_matrix <- table(credit_fraud_test$fraudulent,predict_test)

print(c_matrix)

cat('Accuracy: ', sum(diag(c_matrix))/sum(c_matrix)*100,'%')
#####
exp(coef(fit))

summary(fit)
#####
pr <- prediction(as.numeric(predict_test),as.numeric(credit_fraud_test$fraudulent))

prf <- performance(pr, measure="tpr",x.measure="fpr")
plot(prf, colorize=TRUE)

auc<-performance(pr, measure="auc")
auc<-auc@y.values[[1]]
auc