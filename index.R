#read data dalam bentuk .csv
datacsv <- read.csv(file = "Kab Semarang.csv", header = TRUE)
datacsv
#slicing data kolom ke 2 sampai ke delapan dan baris dari baris ke-2 sampai ke 23
master_data <- datacsv[2:23,2:8]
master_data
#membuat skala kecil untuk tiap value agar sedikit jaraknya dan lebih kecil value tiap data
master_data <- scale(master_data)
#merubah data ke dalam sebuah data frame
masterdf <- data.frame(master_data)
#check 6 data teratas dari data frame
head(masterdf)
#import library
library(cluster)
library(factoextra)

#check sum of squares dengan metode Shilouette
fviz_nbclust(masterdf, kmeans, method = "silhouette")
#optimal number cluster 2
#membuat clustering dengan center k = 2
km_clustering <- kmeans(masterdf, centers = 2, nstart = 25)
km_clustering

final <- data.frame(master_data, km_clustering$cluster)
final
