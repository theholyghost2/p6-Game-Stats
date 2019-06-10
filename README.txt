This software is a minimal statistics package which includes probabiltiy
calculation based on populations which sometimes are a Distribution themselves.

It is to be used in games and was built for speed not general OOP.

Features are populations and distributions of probabilities wherefor an
estimate and variance can be calculated. A Covariance class provides with
2 populations the covariance. The same works for a correlation.
There is also a Probability class which uses a population of probabilities
and calculates conditional probabilities and thus a multi-variate Bayes
method. You can access the nth probability in this case and work on
towards Bayesian Inference.

Examples:
my $pp = 0.1; ### start probability
my $pop = Mathx::Stat::DistributionPopulation.new; ### list of probabilties

my @plist;
my @indices;

### We fill the distributionpopulation with probabilities

loop (my $i = $pp, my $j = 0; $i <= 1.0; $i+=0.1, $j++) {
	$pop.add($i); 
	push(@plist, $i);
	push(@indices, $j);
}

$pop.Expectance; ### yields 0.55

$pop.Variance; ## yields the variance of the probabilties in the population

$pop.GeneratedNumber ### yields a marginal distribution number based on population

my $cov = Mathx::Stat::Covariance.new;
my $corr = Mathx::Stat::Correlation.new;

### calculation of covariance and correlation

$cov.Covariance($pop,$pop);

$corr.Correlation($pop,$pop);

### make a multi-variate probability instance (again based on a population list)

my $p = Mathx::Stat::Probability.new(xpop => @plist);

### calculate Bayes on several indexed probabilities a conditional
### probability list and the index of the precondition probability

$p.Bayes(@indices, @plist, 1);

$p.Bayes(@indices, @plist, 0);

### caculate conditional probabilities (1-dimensional) of 2 indexed
### probabilities in the population ofthe variable $p

$p.CalculatedCondP(3,0);

$p.CalculatedCondP(7,4);

