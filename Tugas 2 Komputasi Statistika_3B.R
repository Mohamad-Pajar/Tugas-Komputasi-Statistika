## Nama        : MOHAMAD PAJAR
## NIM         : 3338250011
## Kelas       : 3B
## Mata Kuliah : Komputasi Statistika
## Tugas 2     : Manajemen Data Menggunakan data iris


## library dplyr untuk mengolah dan manipulasi data
library(dplyr)

## Masukkan data iris di R
data(iris)
iris

## 1. Menampilkan kolom data Sepal.Length
iris$Sepal.Length


## 2. Melihat struktur data
str(iris)

## Menyebutkan tipe data tiap kolom
sapply(iris, class)


## 3. Buat variabel baru dengan nama turunan yang berasal/ turunan dari variabel Sepal.Width.
# Nilai variabel turunan hanya memiliki dua nilai yaitu “Besar” dan “Kecil”.
# Kategori nilai "Besar" jika Sepal.Width > 3
# Dan jika nilai <= 3 masuk ke dalam kategori nilai "Kecil"

iris <- iris %>%
  mutate(turunan = ifelse(Sepal.Width > 3, "Besar", "Kecil"))

# Alternatif : dengan fungsi with()
# iris$turunan <- with(iris, ifelse(Sepal.Width > 3, "Besar", "Kecil"))

# Menampilkan observasi pertama dari dataframe
head(iris)

# Mencetak seluruh isi dataframe
print(iris)


## 4. Ubah variabel turunan menjadi sepal
iris <- iris %>%
  rename(sepal = turunan)

# Alternatif mengubah nama variabel turunan menjadi sepal
# names(iris)[names(iris) == "turunan"] <- "sepal"

head(iris)

## 5. Ambil data dengan sepal bernilai besar dari species virginica
virginica_besar <- iris %>%
  filter(sepal == "Besar", Species == "virginica")

# Alternatif :
# Virginica_besar <- iris[iris$sepal == "Besar" & iris$Species == "virginica", ]

virginica_besar

## 6. Cek jumlah species dalam data
table(iris$Species)

# Jumlah kategori species yang unik:
length(unique(iris$Species))


## 7. Pecah data iris menjadi 3 data frame dengan tiap data frame khusus untuk species tertentu
setosa     <- iris[iris$Species == "setosa", ]
versicolor <- iris[iris$Species == "versicolor", ]
virginica  <- iris[iris$Species == "virginica", ]

# Alternatif menggunakan split()
# iris_split <- split(iris, iris$Species)
# jars_setosa     <- iris_split$setosa
# jars_versicolor <- iris_split$versicolor
# jars_virginica  <- iris_split$virginica


## 8. Dari setiap data frame species, urutkan data berdasarkan Sepal.Width
setosa     <- setosa[order(setosa$Sepal.Width), ]
versicolor <- versicolor[order(versicolor$Sepal.Width), ]
virginica  <- virginica[order(virginica$Sepal.Width), ]

head(setosa)
head(versicolor)
head(virginica)

setosa
versicolor
virginica

