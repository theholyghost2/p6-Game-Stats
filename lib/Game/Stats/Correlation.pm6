use v6.c;

use Game::Stats::Covariance;

role ThisCorrelation { method cov($xpop,$ypop) {
	return Game::Stats::Covariance.new.Covariance($xpop,$ypop);
}
}
		

class Game::Stats::Correlation does ThisCorrelation {

	method Correlation($xpop,$ypop) { ### These are distribution args
	
		my $varx = $xpop.Variance;
	       	my $vary = $ypop.Variance;
		my $cov = self.cov($xpop, $ypop);

		return $cov / (sqrt($varx) * sqrt($vary)); 

	}
}
