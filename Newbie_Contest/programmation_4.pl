# Newbie Contest - Challenge programmation 4

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ 'kraken31', 1 ] );
$mech->set_fields( "passwrd" => [ 'dejean', 1 ] );
$mech->click();

# R�cup�ration de l'a chaine � d�crypter et de la cl�
my $chaine = "";
my $cle = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog5.php" );
my $page = $mech->content;
if ( $page =~ /.*ypter est : '(.*)' <br .*'(.*)'/ ) {
	$chaine = $1;
	$cle = $2;
}
print "$chaine\n$cle\n\n";

while ( $chaine ne "" ) {
	my $caractere = chomp($chaine);
	print $caractere;
}

# Transformation de l'�quation en perl
#( $equation =~ s/racine/sqrt/ );
#( $equation =~ s/&sup2;/\*\*2/ );

# Calcul de l'op�ration
#my $resultat = int(eval($equation));

# R�cup�ration du mot de passe
#my $password = "";
#$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr4.php?solution=$resultat" );
#$page = $mech->content;
#print $page;
