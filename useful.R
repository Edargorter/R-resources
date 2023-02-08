#Test R Script 

v <- c(1, 2, 3, 4, 5)

paste(path.expand("~"), "/projects/R", sep="")

#quit()

v[1] / v[2]

v[v>2]

class(v)

c(1:7.5) # = c(1:7)

v2 <- c(2, 3, 4, 5, 6)

sum_vec <- v + v2 
sum_vec

bitwXor(v, v2) #bit operations 
bitwNot(v)
bitwAnd(v, v2)
bitwOr(v, v2)

print("v[bitwOr(v, v2) > 2]:")
v[bitwOr(v, v2) > 2]

.Machine$integer.max #maxint 
attributes(.Machine)
a <- .Machine$integer.max
a*v + (a-1)*v2

b <- 7
b %% 6 #mod 

mat <- matrix(1:10, byrow = TRUE, nrow = 5)
mat

mat2 <- matrix(1:12, byrow = TRUE, ncol = 3)
mat2 <- matrix(1:12, byrow = FALSE, ncol = 3)
mat2
dim(mat2)

print("mat: --------------------------------")
mat
mat3 <- cbind(mat, c(1:5))
mat4 <- rbind(c(1:2), mat)
print("cbind: ------------------------------")
mat3
print("rbind: ------------------------------")
mat4

smat <- matrix(1:25, byrow = TRUE, ncol = 5)
smat
smat[2:4,2:4]

names <- c("Zach", "Mozart", "Zach", "Bach", "Bach", "Bach", "Beethoven", "Mozart")
names
class(names)

print("f_names")
f_names <- factor(names)
f_names
class(f_names)

print("summary fnames")
summary(f_names)

data_mtcars <- mtcars
class(data_mtcars)
data_mtcars
#data_mtcars[data_mtcars$mpg > 25]

a <- c(10,20,30,40)
b <- c('book', 'pen', 'textbook', 'pencil_case')
c <- c(TRUE,FALSE,TRUE,FALSE)
d <- c(2.5, 8, 10, 7)
df <- data.frame(a,b,c,d)
df
print("----------------")
summary(df)

tmat <- matrix(1:20, byrow = TRUE, ncol = 4)
tmat

print("tmat[5]")
tmat[5]
print("tmat[5,]")
tmat[5,]
print("tmet[[6]]")
tmat[[6]]
