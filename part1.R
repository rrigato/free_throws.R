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





set.seed(1);   #For repeatable results
prob = .522    #probability of making a free throw
cuts = c(-1:16);  #Creates the the histogram
results = rbinom(100000,15,prob)   # 100000 independent binomial trials with n = 15 and probability = .522
hist(results, breaks = cuts, xlab = "Made Free Throws", prob=TRUE); #graphs relative frequency


#simulation using the lower limit of the confidence interval
set.seed(2)  #For repeatable results
prob = .522  #lower limit of the CI
x = 100000; g=10000;   #Number of independent binomial experiments
outcome = numeric(g); z = numeric(x)  #Used to determine probability of 0 free throws in 15 trials
for (i in 1:g)
{
   z = rbinom(x,15,prob);       #gives the frequency of made thows
	outcome[i] = mean(z==0);       #probability of making 0 free throws in each sample stored in outcome vector 
}
prob_missing15_freethrows = sum(outcome)/ g
prob_missing15_freethrows; 




#confidence interval using actual data
p_hat = .5164; #sample proportion
alpha = .05; #significance level
n=171; #number of observations
margin_of_error = qnorm(1-alpha/2, mean=0,sd=1)*sqrt((p_hat*(1-p_hat))/n); margin_of_error; #Margin of error
CI_upper = p_hat + margin_of_error; CI_lower = p_hat - margin_of_error; CI_upper; CI_lower; #lower and upper bounds for confidence interval


#simulation using the lower limit of the confidence interval from empirical data
set.seed(3)  #For repeatable results
prob = .441  #lower limit based on empirical data 
x = 100000; g=10000; 
outcome = numeric(g); z = numeric(x) 
for (i in 1:g)
{
   z = rbinom(x,15,prob);   
	outcome[i] = mean(z==0);    
}
prob_missing15_freethrows = sum(outcome)/ g
prob_missing15_freethrows; 



k = 10000;
v = 1000000;
number_of_games = numeric(k);
for( i in 1:k)
{
	x = 0;
	counter = 1;
	t = numeric(v);
	repeat
	{

		t[counter] = rbinom(1,15,prob);

		if (t[counter]==0)
		{
			break;
		}
		else
		{
		counter = counter +1;
		x = x+1;
		}
	}
	
	number_of_games[i] = x;
}
