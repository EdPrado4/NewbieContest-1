# Newbie Contest - Challenge programmation 1

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

# R�cup�ration du nombre al�atoire
my $nombre = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog1.php" );
my $page = $mech->content;

if ( $page =~ /.*: (\d*)/ ) {
	$nombre = $1;
}

# R�cup�ration du mot de passe
my $password = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr1.php?solution=$nombre" );
$page = $mech->content;
print $page;
