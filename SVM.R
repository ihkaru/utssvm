#Load Library
library(tidyverse)
library(readr)
library(caret)
library(psych)
library(lattice)
library(e1071)

#Library **tidyverse** akan digunakan untuk plotting dan mengolah variabel. 
#Library **e1071** digunakan untuk melakukan pemodelan SVM.  
#Library **caret** digunakan untuk membuat confusion matriks 
#dan melihar akurasi model.

#Load data menggunakan import dataset di r
str(diagnosis)
diag<-as.data.frame(diagnosis)

#Convert kolom kategorik ke tipe factor
diag$a2<-as.factor(diag$a2)
diag$a3<-as.factor(diag$a3)
diag$a4<-as.factor(diag$a4)
diag$a5<-as.factor(diag$a5)
diag$a6<-as.factor(diag$a6)
diag$d1<-as.factor(diag$d1)
diag$d2<-as.factor(diag$d2)

str(diag)

#Melihat data
pairs.panels(diag)

0o


#Support vector kernel default adalah bertipe radial. Terdapat beberapa pilihan yaitu sigmoid, polynomial, dan linear.


### SVM Classification Plot
#Karena terdapat lebih dari 3 variabel pada dataset ini, perlu didefinisikan variabel mana yang akan ditampilkan, pada kasus ini petal width dan length.

plot(modelSVM, data=iris,
     Petal.Width~Petal.Length,
     slice= list(Sepal.Width = 3,
                 Sepal.Length = 4))


### Confusion Matrix

pred <- predict(modelSVM, iris)
confusionMatrix(table(Predicted = pred, Actual=iris$Species))
