# Newbie Contest - Challenge programmation 3

use WWW::Mechanize;

my $usernb = $ARGV[0];
my $passnb = $ARGV[1];

my $mech = WWW::Mechanize->new();

# D�finition du proxy
$mech->proxy(['https', 'http', 'ftp'], 'http://proxy-tech.svc.ext.tdc:3128/');

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ $usernb, 1 ] );
$mech->set_fields( "passwrd" => [ $passnb, 1 ] );
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
