use v6.c;

use Game::Stats::Population;

role ThisGeneratedNumber { 
	### single marginal number for a marginal distribution based upon
	### this column or row (population of probabilities)
	method GeneratedNumber() {

		my $sum = 0.0;

		for @.population -> $p {
			$sum += $p;	
		}
		return $sum;
	}
}

class Game::Stats::DistributionPopulation is Game::Stats::Population does ThisGeneratedNumber 
{
	method Expectance() {

		my $e = 0.0;

		for @.population -> $p {
			$e += $p;
		}

		return $e / @.population.elems;
	}

	method Variance () {
		my $e = self.Expectance();
		my $var = 0.0;

		for @.population -> $p {
			$var += ($p - $e) * ($p - $e);
		}

		return $var / (@.population.elems - 1);
	}

}
