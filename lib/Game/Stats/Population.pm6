use v6.c;

class Game::Stats::Population
{
	has @.population is rw;

	method add($x) {
		push(@.population, $x);
	}

	method nth($index) {
		return @.population[$index];
	}

}

