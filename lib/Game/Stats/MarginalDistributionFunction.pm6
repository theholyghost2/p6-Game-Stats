use v6.c;

use Game::Stats::Population;

class Game::Stats::MarginalDistributionFunction is Game::Stats::Population 
{
	### marginal distribution unto $index (1 dimension, no table)
	method Marginal($index = @.population.elems) {
		my $sum = 0.0;

		for (my $i = 0; $i < $index; $i++) {
			$sum += @.population[$i];
		}

		return $sum;
	}
}
