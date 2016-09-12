# Newbie Contest - Challenge programmation 6

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

# D�finition du proxy
$mech->proxy(['https', 'http', 'ftp'], 'http://proxy-tech.svc.ext.tdc:3128/');

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ 'kraken31', 1 ] );
$mech->set_fields( "passwrd" => [ 'dejean', 1 ] );
$mech->click();

# R�cup�ration de l'�quation
my $equation = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog6.php" );
my $page = $mech->content;
if ( $page =~ /.*<br \/>(.*)/ ) {
	$equation = $1;
}

print "$equation\n";

#R�solution de l'�quation
my $a, $b, $c, $delta, $x1, $x2;

if ( $equation =~ /(.*)x. (.) (.*)x (.) (.*) = .*/ ) {
	$a = $1;
	
	if ( $2 eq "-" ) {
		$b = $2.$3;
	} else {
		$b = $3;
	}
	
	if ( $4 eq "-" ) {
		$c = $4.$5
	} else {
		$c = $5;
	}
}

print "a=$a b=$b c=$c\n";

$delta = $b**2-4*$a*$c;
print "delta=$delta\n";

if ( $delta > 0 ) {
	$x1 = ((0 - $b) - sqrt($delta))/(2 * $a);
	$x2 = ((0 - $b) + sqrt($delta))/(2 * $a);
}

print "x1=$x1\nx2=$x2\n";
$x1=sprintf("%.2f",$x1);
$x2=sprintf("%.2f",$x2);
print "x1=$x1\nx2=$x2\n";

my $resultat = "";
if ( $x1 > $x2 ) {
	$resultat = $x1;
} else {
	$resultat = $x2;
}

print "resultat=$resultat\n";
# R�cup�ration du mot de passe
$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr6.php?solution=$resultat" );
$page = $mech->content;
print $page;
