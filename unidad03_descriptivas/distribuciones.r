plot(function (x) x*x, 0, 10, main="tt")

plot(function(x) dnorm(x, mean=1.462, sd=0.173664), 0.5, 2.5, main = "dnorm(x, mean=1.462, sd=0.173664)",ylab="")

plot(function(x) pnorm(x, mean=1.462, sd=0.173664), 0.5, 2.5, main = "pnorm(x, mean=1.462, sd=0.173664)",ylab="")

plot(function(x) dbinom(x, 100, 0.15), 0, 100,  main = "dbinom",ylab="", type="p")

plot(function(x) pbinom(x, 100, 0.15), 0, 100,  main = "pbinom",ylab="", type="p")

plot(function(x) dunif(x, 0, 25), 0, 100,  main = "dunif",ylab="", type="p")

plot(function(x) dbinom(x, 1000, 1/6), 0, 400,  main = "dbinom",ylab="", type="l",col="blue")
abline(v=170)

plot(function(x) pbinom(x, 1000, 1/6), 0, 400,  main = "pbinom",ylab="", type="l", col="red")
abline(v=170)
abline(h=pbinom(170, 1000, 1/6))

pbinom(170, 1000, 1/6)
