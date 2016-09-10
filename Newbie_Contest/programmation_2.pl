# Newbie Contest - Challenge programmation 2

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ 'kraken31', 1 ] );
$mech->set_fields( "passwrd" => [ 'dejean', 1 ] );
$mech->click();

# R�cup�ration du premier nombre al�atoire
my $nombre1 = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog3_1.php" );
my $page = $mech->content;

if ( $page =~ /.*: (\d*)/ ) {
	$nombre1 = $1;
}

# R�cup�ration du deuxi�me nombre al�atoire
my $nombre2 = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog3_2.php" );
my $page = $mech->content;

if ( $page =~ /.*: (\d*)/ ) {
	$nombre2 = $1;
}

# Calcul de l'op�ration
my $resultat = "";
$resultat = sqrt($nombre1)*$nombre2;
print $resultat;

# R�cup�ration du mot de passe
#my $password = "";
#$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr1.php?solution=$nombre" );
#$page = $mech->content;
#print $page;
