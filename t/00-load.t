use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

use Game::Stats::Population;
use Game::Stats::DistributionPopulation;
use Game::Stats::Covariance;
use Game::Stats::Correlation;
use Game::Stats::Probability;

my $num-tests = 5;

plan $num-tests;
 
# .... tests 
#  

use-ok "Game::Stats::Population";
use-ok "Game::Stats::DistributionPopulation";
use-ok "Game::Stats::Covariance";
use-ok "Game::Stats::Correlation";
use-ok "Game::Stats::Probability";

done-testing;  # optional with 'plan' 
