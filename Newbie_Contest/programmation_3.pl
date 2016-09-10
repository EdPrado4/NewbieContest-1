# Newbie Contest - Challenge programmation 3

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ 'kraken31', 1 ] );
$mech->set_fields( "passwrd" => [ 'dejean', 1 ] );
$mech->click();

# R�cup�ration de l'�quation
my $equation = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog4.php" );
my $page = $mech->content;
if ( $page =~ /(.*) est l.*/ ) {
	$equation = $1;
}

# Transformation de l'�quation en perl
( $equation =~ s/racine/sqrt/ );
( $equation =~ s/&sup2;/\*\*2/ );

# Calcul de l'op�ration
my $resultat = int(eval($equation));

# R�cup�ration du mot de passe
my $password = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr4.php?solution=$resultat" );
$page = $mech->content;
print $page;
