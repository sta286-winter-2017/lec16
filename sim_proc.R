library(ggplot2)
library(dplyr)
reps <- 3
len <- 30
beta <- 2
eta <- 1/(gamma(1+1/beta))

shuffle <- sample(1:(2*reps))
shuffle <- c(sort(shuffle[1:reps]), sort(shuffle[(reps+1):(2*reps)]))

two_proc <-
  data_frame(Run=factor(rep(shuffle, each=len)),
             X = c(rexp(reps*len), rweibull(reps*len, beta, eta))) %>% 
  group_by(Run) %>% 
  mutate(S = cumsum(X)) 

