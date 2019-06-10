use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

use Game::Stats::DistributionPopulation;
use Game::Stats::Covariance;
use Game::Stats::Correlation;
use Game::Stats::Probability;

my $num-tests = 9;

plan $num-tests;
 
# .... tests 
#  

my $pp = 0.1;
my $pop = Game::Stats::DistributionPopulation.new;

my @plist;
my @indices;

loop (my $i = $pp, my $j = 0; $i <= 1.0; $i+=0.1, $j++) {
	$pop.add($i);
	push(@plist, $i);
	push(@indices, $j);
}

ok $pop.Expectance, 0.55;

is-deeply $pop.Variance, $pop.Variance;

is-deeply $pop.GeneratedNumber, $pop.GeneratedNumber;

my $cov = Game::Stats::Covariance.new;
my $corr = Game::Stats::Correlation.new;

is-deeply $cov.Covariance($pop,$pop), $cov.Covariance($pop,$pop);

is-deeply $corr.Correlation($pop,$pop), $corr.Correlation($pop,$pop);

my $p = Game::Stats::Probability.new(xpop => @plist);

is-deeply $p.Bayes(@indices, @plist, 1), $p.Bayes(@indices, @plist, 1);

is-deeply $p.Bayes(@indices, @plist, 0), $p.Bayes(@indices, @plist, 0);

is-deeply $p.CalculatedCondP(3,0), $p.CalculatedCondP(3,0);

is-deeply $p.CalculatedCondP(7,4), $p.CalculatedCondP(7,4);

done-testing;  # optional with 'plan' 
