library(dplyr)
library(magrittr)
library(ggplot2)

Rcpp::sourceCpp("zach.cpp")

# everything is a vector
# make a vector of size 100
# index is based (in R), and correctly zero based in Rcpp
v <- runif(n = 10)  # Rob always prefers the assignment operator
# v = runif(n = 10) # this, is clearly ambiguous in R.

data.frame(n = v, mn = -v) # r is expecting the columns to be the same size
data.frame(n = c(v,v), mn = -v) # c() will Concatentate two things together
# why?
# R essentially thought for you, and decided that your second column obviously needed to be repeated.
# it only does this when it's a constant multiple over all the weird columns you're giving. RULE.
2 * v # constant multiple on the left is 10, on the right 1.
2 # is actually a vector, of length 1.

 
n1<- data.frame(n = v, mn = -v) # 10 rows
n2<- data.frame(n = c(v,v), mn = -v)  # 20 rows
d<- bind_rows(n1,n2) # 30 rows.
d %>% head()
d %>% head

d %>% filter(n > 0.5) # approximately half the data
d %>% filter(n %>% is_greater_than(0.5)) # same same, more chars... ?
d %>% filter(n %>% is_greater_than(0.5) %>% not %>% not %>% not) # same same, more chars... ?
d %>% filter(!(n > 0.5)) #................. just not as readable as the above.

# old school R.
d[d$n > 0.5,] # same as line 24.

d[(d$n > 0.5) & (d$n < 0.9),]$n
d$n[(d$n > 0.5) & (d$n < 0.9)]

d %>% filter(n > 0.5, n < 0.9) %>% select(n) %>% unlist %>% as.numeric
# str -> structure of object.

v<- runif(1e7)
sum(v)

loopysum<- function(v){
  n<- 0
  for(i in 1:length(v)){
    n <- n + v[i]
  }
}
system.time(sum(v))
system.time(loopysum(v))

# because everything is a vector, if you can't model using vectors, or the native performance of vectors, you have to work harder.

system.time(mysum(v))
addthing(1:10)
deletething(1:10)

# for plotting, learn ggplot. 

# canvas + layer + layer + attr
d %>% head
ggplot(data = d) + geom_point(aes(x = n, y = mn)) + geom_line(aes(x = n, y = mn))
ggplot() + 
  geom_point(data = n1[1:3,], aes(x = n, y = mn)) + 
  geom_line(data = n2[-(1:3),], aes(x = n, y = mn, col = n)) + 
  theme_bw() + labs(x = "not this", y = "but this") + 
  coord_flip()

ggplot(data = d) + geom_histogram(aes(x = n))

ggplot() + 
  geom_line(data = n2[-(1:3),], aes(x = n, y = mn, col = n)) + 
  geom_point(data = n1[1:3,], aes(x = n, y = mn), size = 5) + 
  theme_bw() + labs(x = "not this", y = "but this") + 
  coord_flip()
