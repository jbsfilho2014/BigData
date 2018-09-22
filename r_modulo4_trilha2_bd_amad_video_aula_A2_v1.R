#####
# Módulo 4 - Trilha 2 - A2
head(iris)
nrow(iris)
ncol(iris)
dim(iris)
str(iris)
names(iris)
idx <- sample(1:nrow(iris),5)
idx
iris[idx,]
summary(iris)
boxplot(iris$Petal.Length)
boxplot(iris)

par(mfrow=c(2,2))
hist(iris[,1])
hist(iris[,2])
hist(iris[,3])
hist(iris[,4])

par(mfrow=c(2,2))
plot(density(iris[,1]))
plot(density(iris[,2]))
plot(density(iris[,3]))
plot(density(iris[,4]))

var(iris$Sepal.Length) > var(iris$Sepal.Width)
sd(iris$Sepal.Length) > sd(iris$Sepal.Width)
sd(iris$Sepal.Length) == sqrt(var(iris$Sepal.Length))

idx <- base::sample(1:nrow(iris),30)
my_30_iris_Species <- base::table(iris[idx,]$Species)
my_30_iris_Species
par(mfrow=c(1,2))
pie(my_30_iris_Species)
barplot(my_30_iris_Species)



#####
print()

dim(iris)
head(iris)
tail(iris)
nrow(iris)
ncol(iris)
names(iris)
colnames(iris)
attributes(iris)
str(iris)
summary(iris)
##### 1 variavel:
var(iris$Sepal.Length)
std(iris$Sepal.Length)
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
min(iris$Sepal.Length)
max(iris$Sepal.Length)
quantile(iris$Sepal.Length)
plot(iris$Sepal.Length)#distribuição dos dados
table(iris$Species)
pie(table(iris$Species))
##### mais de 1 variavel:
#cov()
#cor()
#barplot(y~x)
#####trabalhar os data frames
#subset()
#mydf
#sample
#rbind
#cbind
#order
#merge
#is.na, na.rm, complete.cases, na.omit
#
#cut
#unique
#q1 - 1.5*iqr
#q3 + 1.5*iqr


