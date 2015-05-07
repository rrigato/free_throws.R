set.seed(1)
prob = .596
x = 100000
outcome = numeric(x)
for i in (1:x)
{
   z = table(rbinom(100000,15,prob))
	outcome = z[1] / 100000;
}
prob_missing15_freethrows = sum(outcome)/ x
prob_missing15_freethrows


p_hat = .596; #sample proportion
alpha = .05; #significance level
n=171; #number of observations
margin_of_error = qnorm(1-alpha/2, mean=0,sd=1)*sqrt((p_hat*(1-p_hat))/n); margin_of_error; #Margin of error
CI_upper = p_hat + margin_of_error; CI_lower = p_hat - margin_of_error; CI_upper; CI_lower; #lower and upper bounds for confidence interval

#simulation using the lower limit of the confidence interval
set.seed(1)  #For repeatable results
prob = .522  #lower limit of the CI
x = 100000   #Number of independent binomial experiments
outcome = numeric(x)  #Used to determine probability of 0 free throws in 15 trials
for i in (1:x)
{
   z = table(rbinom(100000,15,prob))
	outcome = z[1] / 100000;
}
prob_missing15_freethrows = sum(outcome)/ x
prob_missing15_freethrows

set.seed(1);   #For repeatable results
prob = .522    #probability of making a free throw
cuts = c(-1:16);  #Creates the bins for the histogram
results = rbinom(100000,15,prob)   # 100000 independent binomial trials with n = 15 and probability = .522
hist(results, breaks = cuts, xlab = "Made Free Throws", prob=TRUE); #graphs relative frequency
