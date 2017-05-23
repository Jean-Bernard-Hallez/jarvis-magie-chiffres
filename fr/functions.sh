jv_pg_magiechiffre() {
magie_dire_1fois_repete
var_magie="/dev/shm/mag-lequel.txt"

if test -e "$var_magie"; then
QuelTour=`cat $var_magie`
$QuelTour
else
magie_tour_hasard
fi
}

magie_tour_hasard () {
magienumero=("jv_pg_magiechiffre1" "jv_pg_magiechiffre2" "jv_pg_magiechiffre3" "jv_pg_magiechiffre4" "jv_pg_magiechiffre5" "jv_pg_magiechiffre6" "jv_pg_magiechiffre7" "jv_pg_magiechiffre8")
QuelTour="${magienumero[$RANDOM % ${#magienumero[@]} ]}"
######################################################################################################################################
# QuelTour="jv_pg_magiechiffre1"	# pour faire du forcing ##############################################################################
######################################################################################################################################
echo "$QuelTour" > $var_magie
# echo "-$QuelTour-"
$QuelTour
}

######################################################
################ Tour N° 1 OK ########################
######################################################
jv_pg_magiechiffre1 () {
order="$memoordermagie"

prog_debut_magie

if [[ "$order" == "répète" ]]; then
magie_mot_repete
fi

if [[ "$suiterep_magie" == "repete" ]]; then
magie_mot_ok
if [[ "$mauvrep_magie" == "erreur de frappe" ]]; then
magie_mot_ditok
return;
fi
fi

if [[ "$var1valeur" == "Q0" ]]; then
suiterep_magie="repete"
say "Voici le tour du chiffre fétiche !"
say "Je vais te demander de penser à un nombre de deux chiffres, par exemple ton âge, sans me le dire ?"
aide_magie=""
magie_mot_ditok
echo "Q1" > $var1_magie
return; 
fi


if [[ "$var1valeur" == "Q1" ]]; then
suiterep_magie="repete"
if [[ "$aide_magie" == "aide" ]]; then
say "additionner 90 à ce chiffre, par exemple si tu as pensée à 10 le résultat est 10 plus 90 est égale à 100 "
aide_magie=""
else
say "additionner 90 à ce chiffre "
fi
magie_mot_ditok
echo "Q2" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q2" ]]; then
suiterep_magie="repete"
say "rajoute le chiffre des centaines avec le nombre formé uniquement par le chiffre de dizaines et celui des unités."
	if [[ "$aide_magie" == "aide" ]]; then
	say "par exemple si tu as trouvé 421 le résultat est 4  plus 21  c'est égale à 25"
	aide_magie=""
	fi
magie_mot_ditok
echo "Q3" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q3" ]]; then
suiterep_magie=""
say "Je te demande de me révéler le nombre que tu as obtenu ?"
echo "Q4" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q4" ]]; then
max_chiffre_totalmagie="2"
conv_chiffre_magie "$order"
if [[ "$chiffre_totalmagie_bug" == "1" ]]; then return; fi

say "je sais à présent à quel chiffre tu as pensé:"
resultat_magie=$(( $resultat_magie + 9 ))
magieGONG
say "il s'agit du nombre: $resultat_magie"

fin-magie_estjuste
return;
fi

if [[ "$var1valeur" == "RESULTAT" ]]; then
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then
	magie_mot_fin_ok
	else
	magie_mot_fin_rate
	fi

say "Est-ce que l'on recommence ?"
suiterep_magie=""
echo "FIN" > $var1_magie
return;
fi
}

######################################################
################ Tour N° 2 OK ########################
######################################################

jv_pg_magiechiffre2 () {
order="$memoordermagie"

prog_debut_magie

if [[ "$order" == "répète" ]]; then
magie_mot_repete
fi

if [[ "$suiterep_magie" == "repete" ]]; then
magie_mot_ok
if [[ "$mauvrep_magie" == "erreur de frappe" ]]; then
magie_mot_ditok
return;
fi
fi


if [[ "$var1valeur" == "Q0" ]]; then
say "Super c'est reparti... Je vais te demander de prendre un papier et un stylo."
suiterep_magie="repete"
magie_mot_ditok
echo "Q1" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q1" ]]; then
say "maintenant sans rien me dire, tu vas écrire un nombre de quatre chiffre"
	if [[ "$aide_magie" == "aide" ]]; then
	say "par exemple 1 2 3 4"
	aide_magie=""
	fi

suiterep_magie="repete"
magie_mot_ditok
echo "Q2" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q2" ]]; then
say "additionne chacun des chiffres de ce nombre entres-eux"
	if [[ "$aide_magie" == "aide" ]]; then
	say "par exemple si tu ton nombre est 1 2 3 4 tu fais 1 plus 2, plus 3, plus 4, c'est égale à 10"
	aide_magie=""
	fi

suiterep_magie="repete"
magie_mot_ditok
echo "Q3" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q3" ]]; then
say "soustrait ce chiffre que tu as trouvé au nombre du départ inscrit sur ton papier"
	if [[ "$aide_magie" == "aide" ]]; then
	say "par exemple si tu as trouvé 1 2 3 4 moins 10 est égale à 1224"
	aide_magie=""
	fi

suiterep_magie="repete"
magie_mot_ditok
echo "Q4" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q4" ]]; then
say "dans l'ordre que tu veux donnes-moi simplement 3 des chiffres de ton résultat ?"
	if [[ "$aide_magie" == "aide" ]]; then
	say "par exemple si tu as trouvé 1 2 3 4 tu peux me donner que 1 2 3, ou 2 3 4 ou, 1 2 4 exetera."
	aide_magie=""
	fi
suiterep_magie=""
echo "Q5" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q5" ]]; then
max_chiffre_totalmagie="3"
conv_chiffre_magie "$order"

if [[ "$chiffre_totalmagie_bug" == "1" ]]; then
say "merci de me redonner dans l'ordre que tu veux 3 des chiffres de ton résultat..."
return;
fi

say "Tu m'as donné les chiffres$resultat_magie1_virgule"
resultat_magie5=$(( 9 - $resultat_magie_addition ))
resultat_magie="$resultat_magie5"
if [[ "$resultat_magie5" =~ "-" ]]; then resultat_magie=$(( $resultat_magie5 + 9 )); fi
							     
say "et le chiffre manquant est le:"
magieGONG
say "C'est le $resultat_magie5 !"
fin-magie_estjuste
return;
fi

if [[ "$var1valeur" == "RESULTAT" ]]; then
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then
	magie_mot_fin_ok
	else
	magie_mot_fin_rate
	fi

say "Est-ce que l'on recommence ?"
suiterep_magie=""
echo "FIN" > $var1_magie
return;
fi
}



######################################################
################ Tour N° 3 OK ########################
######################################################
# http://villemin.gerard.free.fr/Referenc/Vocabula/GlosP/Preuve.htm#savoir
jv_pg_magiechiffre3 () {
order="$memoordermagie"
var3_magie="/dev/shm/tour1fois3.txt"
var3_magie_date=`cat $var3_magie 2>/dev/shm/null`
var3_magie_date_auj=`date +%d`

if [[ "$var3_magie_date" == "$var3_magie_date_auj" ]]; then
jv_warning "Tout déja fait aujourd'hui... ne peut-être refait ! désolé..."
jv_pg_magiechiffre
return;
fi

prog_debut_magie

if [[ "$order" == "répète" ]]; then
magie_mot_repete
fi

if [[ "$suiterep_magie" == "repete" ]]; then
magie_mot_ok
if [[ "$mauvrep_magie" == "erreur de frappe" ]]; then
magie_mot_ditok
return;
fi
fi

if [[ "$var1valeur" == "Q0" ]]; then
say "Voici le Tour à un coup d'œil de la journée"
say "Je vais te demander de prendre un papier et un stylo"
magie_mot_ditok
suiterep_magie="repete"
echo "Q1" > $var1_magie
return; 
fi

if [[ "$var1valeur" == "Q1" ]]; then
say "maintenant sans rien me dire, tu vas écrire un nombre de trois chiffre"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple 123"
aide_magie=""
fi
magie_mot_ok
suiterep_magie="repete"
echo "Q2" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q2" ]]; then
say "ensuite formes un deuxième nombre en renversant l'ordre des chiffres, par exemple si tu avais 321 le second chiffre sera 123 ?"
magie_mot_ok
aide_magie=""
suiterep_magie="repete"
echo "Q3" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q3" ]]; then
say "Soustraire le plus grand nombre au plus petit de ces chiffres, et entoure le"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple si tu as 800 et 200 tu fais"
say "800 moins 200 est égale à 600 "
aide_magie=""
fi
magie_mot_ok
suiterep_magie="repete"
echo "Q4" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q4" ]]; then
say "Retournez encore une fois ce nouveau nombre que tu as trouvé, et entoure le aussi"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple si tu as 1 2 3 ca devient 3 2 1"
aide_magie=""
fi

magie_mot_ok
suiterep_magie="repete"
echo "Q5" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q5" ]]; then
say "Additionne les deux nombres entourés"
suiterep_magie=""
echo "Q6" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q6" ]]; then
say "Voilà.... je pense avoir deviné ce chiffre là !..."
magieGONG
say "le chiffre que tu as trouvé est égale à 1089 soit 1, 0, 8, 9."

sudo rm $var1_magie
date +%d > $var3_magie
fin-magie_estjuste
return;
fi

if [[ "$var1valeur" == "RESULTAT" ]]; then
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then
	magie_mot_fin_ok
	else
	magie_mot_fin_rate
	fi

say "Est-ce que l'on recommence ?"
suiterep_magie=""
echo "FIN" > $var1_magie
return;
fi
}


######################################################
################ Tour N° 4 OK ########################
######################################################
# http://villemin.gerard.free.fr/Referenc/Vocabula/GlosP/Preuve.htm#savoir
jv_pg_magiechiffre4 () {

order="$memoordermagie"
var4_magie="/dev/shm/tour1fois4.txt"
var4_magie_date=`cat $var4_magie 2>/dev/shm/null`
var4_magie_date_auj=`date +%d`
	
if [[ "$var4_magie_date" == "$var4_magie_date_auj" ]]; then
jv_warning "Tout déja fait aujourd'hui... ne peut-être refait !"
jv_pg_magiechiffre
return;
fi


prog_debut_magie

if [[ "$order" == "répète" ]]; then
magie_mot_repete
fi

if [[ "$suiterep_magie" == "repete" ]]; then
magie_mot_ok
if [[ "$mauvrep_magie" == "erreur de frappe" ]]; then
magie_mot_ditok
return;
fi
fi

if [[ "$var1valeur" == "Q0" ]]; then
say "Voici le Tour à un coup d'œil de la journée"
say "Je vais te demander de prendre un papier, un stylo et une calculatrice"
suiterep_magie="repete"
magie_mot_ditok
echo "Q1" > $var1_magie
return; 
fi

if [[ "$var1valeur" == "Q1" ]]; then
say "maintenant sans rien me dire, écrit un grand nombre quelconque avec plusieurs chiffres de ton choix."
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple 475968"
aide_magie=""
fi

suiterep_magie="repete"
magie_mot_ditok
echo "Q2" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q2" ]]; then
say "ensuite multiplie ce nombre par 9"
magie_mot_ditok
suiterep_magie="repete"
echo "Q3" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q3" ]]; then
say "retires 5 de ce nombre"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple si tu as 50 moins 5 c'est égale à 45 "
aide_magie=""
fi
magie_mot_ditok
suiterep_magie="repete"
echo "Q4" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q4" ]]; then
say "additione chacun des chiffres de ce nombre entre eux"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple si tu as 45 ça fait 4 plus 5 est égale à 9"
aide_magie=""
fi
suiterep_magie="repete"
magie_mot_ditok
echo "Q5" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q5" ]]; then
say "Recommence jusqu'a ce que tu obtiennes qu'un seul chiffre"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple si tu as 95 "
say "ça fait 9 plus 5 est égale à 14"
say "donc 14 c'est 1 plus 4 est égale à 5"
say "il reste bien qu'un seul chiffre."
aide_magie=""
fi
suiterep_magie="repete"
magie_mot_ditok
echo "Q6" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q6" ]]; then
say "Associer ce chiffre à la lettre correspondante dans l'alphabet et écrit le sans me le dire"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple si tu as le chiffre"
say "10,"
say "la dixième lettre de l'alphabet est J"
aide_magie=""
fi
suiterep_magie="repete"
magie_mot_ditok
echo "Q7" > $var1_magie
fi

if [[ "$var1valeur" == "Q7" ]]; then
say "Trouvez un pays d'Europe commençant par cette lettre, sans me le dire et ecrit le"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple si tu la lettre F, le pays peux être la France ou la Finlande exetera..."
aide_magie=""
fi
suiterep_magie="repete"
magie_mot_ditok
echo "Q8" > $var1_magie
fi

if [[ "$var1valeur" == "Q8" ]]; then
say "Ok c'est à mon tour...  Sans que tu me dises quoi que ce soit, "
say "je vais être capable de donner un fruit dont le nom commence par la dernière lettre du pays que tu as choisi..."
suiterep_magie="repete"
magie_mot_ditok
suiterep_magie=""
echo "Q9" > $var1_magie
fi

if [[ "$var1valeur" == "Q9" ]]; then
magieGONG
say "ça sent la verdure..."
say "Je suis juteux..."
say "de couleur vert à l'intérieur et un peu acide"
say "sa peau est marron ca y est ! 
magieGONG
je vois c'est un kiwi !"
sudo rm $var1_magie
date +%d > $var4_magie
fin-magie_estjuste
return;
fi

if [[ "$var1valeur" == "RESULTAT" ]]; then
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then
	magie_mot_fin_ok
	else
	magie_mot_fin_rate
	fi

say "Est-ce que l'on recommence ?"
suiterep_magie=""
echo "FIN" > $var1_magie
return;
fi
}


######################################################
################ Tour N° 5 OK ########################
######################################################

jv_pg_magiechiffre5 () {
order="$memoordermagie"


prog_debut_magie

if [[ "$order" == "répète" ]]; then
magie_mot_repete
fi

if [[ "$suiterep_magie" == "repete" ]]; then
magie_mot_ok
if [[ "$mauvrep_magie" == "erreur de frappe" ]]; then
magie_mot_ditok
return;
fi
fi


if [[ "$var1valeur" == "Q0" ]]; then
say "Voici le Tour de 7 fois !"
say "Je vais te demander de prendre un papier, un stylo et une calculatrice"
suiterep_magie="repete"
magie_mot_ditok
echo "Q1" > $var1_magie
return; 
fi

if [[ "$var1valeur" == "Q1" ]]; then
say "Choisi un seul chiffre que tu tapes sur ta calculatrice"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple le 8..."
aide_magie=""
fi

suiterep_magie="repete"
magie_mot_ditok
echo "Q2" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q2" ]]; then
say "Multipliez-le plusieurs fois par des nombres pris au hasard de sorte qu'il y est 7 chiffres d'inscrit sur la calculatrice"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple 8 fois 12 fois 45 fois 351,"
say "je me retrouve avec le nombre 1516320"
say "soit, 7 chiffres au total"
aide_magie=""
fi

suiterep_magie="repete"
magie_mot_ditok
echo "Q3" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q3" ]]; then
say "inscrits sur le papier ce nombre de 7 chiffres"
say "et donnes moi au hasard 6 chiffres d'entres eux"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple 1 2 3 4 5 6"
aide_magie=""
fi
say "Je vais être capable de retrouver celui qui manque..."
suiterep_magie=""
echo "Q4" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q4" ]]; then
max_chiffre_totalmagie=6
conv_chiffre_magie "$order"
# resultat_magie --> résultat

if [[ "$chiffre_totalmagie_bug" == "1" ]]; then
say "essayes par groupe e 2 chiffres"
suiterep_magie=""
return;
fi

say "je pense savoir, je peux me tromper mais, tu m'as donné le$resultat_magie1_virgule..."

verifnbrchif_magie=`echo "$resultat_magie_addition" | wc -c`
if [[ "$verifnbrchif_magie" == "3" ]]; then
resultat_magie7a=`echo $resultat_magie_addition | cut -c1`
resultat_magie7b=`echo $resultat_magie_addition | cut -c2`
resultat_magie7=$(( $resultat_magie7a + $resultat_magie7b ))
else
resultat_magie7="$resultat_magie_addition"
fi

resultat_magie8=$(( 9 - $resultat_magie7 ))
resultat_magie="$resultat_magie8"
if [[ "$resultat_magie8" =~ "-" ]]; then resultat_magie=$(( $resultat_magie8 + 9 )); fi
							     
magieGONG
say "le chiffre manquant est le: $resultat_magie"
fin-magie_estjuste
return;
fi

if [[ "$var1valeur" == "RESULTAT" ]]; then
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then
	magie_mot_fin_ok
	else
	magie_mot_fin_rate
	fi

say "Est-ce que l'on recommence ?"
suiterep_magie=""
echo "FIN" > $var1_magie
return;
fi
}

######################################################
################ Tour N° 6 OK ########################
######################################################
# http://villemin.gerard.free.fr/Magie/Agedevin.htm
jv_pg_magiechiffre6 () {
order="$memoordermagie"

prog_debut_magie

if [[ "$order" == "répète" ]]; then
magie_mot_repete
fi

if [[ "$suiterep_magie" == "repete" ]]; then
magie_mot_ok
if [[ "$mauvrep_magie" == "erreur de frappe" ]]; then
magie_mot_ditok
return;
fi
fi


if [[ "$var1valeur" == "Q0" ]]; then
say "Voici le Tour de ta date de naisance !"
say "Je vais te demander de prendre une calculatrice, dis moi quand tu es ok ?"
suiterep_magie="repete"
echo "Q1" > $var1_magie
return; 
fi

if [[ "$var1valeur" == "Q1" ]]; then
say "Sans rien me dire, inscrivez votre mois de naissance"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple si tu es né au mois de février tapes"
say "2"
aide_magie=""
fi
suiterep_magie="repete"
magie_mot_ditok
echo "Q2" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q2" ]]; then
say "Multipliez ce chiffre par 2"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple 2 fois 2"
aide_magie=""
fi
suiterep_magie="repete"
magie_mot_ditok
echo "Q3" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q3" ]]; then
say "Ajoutez 5"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple 7 plus 7 est égale à 9"
aide_magie=""
fi
suiterep_magie="repete"
magie_mot_ditok
echo "Q4" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q4" ]]; then
say "Multiplies le par 50"
if [[ "$aide_magie" == "aide" ]]; then
say "par exemple 2 fois 50 est égale à 100"
aide_magie=""
fi
suiterep_magie="repete"
magie_mot_ditok
echo "Q5" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q5" ]]; then
min=55
max=279
chiffre_magie_random=$[($RANDOM % ($[$max - $min] + 1)) + $min]
ajouter_magie_date=$((`date +%Y` - 2003 + 1753 + $chiffre_magie_random))
say "Ajoutez $ajouter_magie_date"
suiterep_magie="repete"
magie_mot_ditok
echo "Q6" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q6" ]]; then
say "soustraire votre année de naissance: par exemple 1971, et donnez-moi le résultat trouvé"
suiterep_magie=""
echo "Q7" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q7" ]]; then
max_chiffre_totalmagie=4
conv_chiffre_magie "$order"
# $resultat_magie --> Résulat

if [[ "$chiffre_totalmagie_bug" == "1" ]]; then
say "merci de me redonner dans l'ordre que tu veux les chiffres de ton résultat..."
say "par exemple 2 3 6 1 "
suiterep_magie=""
return;
fi


resultatde_magie=$(( $resultat_magie - $chiffre_magie_random ))

verifnbrchif_magie=`echo "$resultat_magie" | wc -c`

if [[ "$verifnbrchif_magie" == "4" ]]; then
resultat_magie1=`echo $resultatde_magie | cut -c1`
resultat_magie2=`echo $resultatde_magie | cut -c2-3`
else
resultat_magie1=`echo $resultatde_magie | cut -c1-2`
resultat_magie2=`echo $resultatde_magie | cut -c3-4`
fi

if [[ "$resultat_magie1" == "1" ]]; then
local moisentier="Janvier"
fi

if [[ "$resultat_magie1" == "2" ]]; then
local moisentier="Février"
fi

if [[ "$resultat_magie1" == "3" ]]; then
local moisentier="Mars"
fi

if [[ "$resultat_magie1" == "4" ]]; then
local moisentier="Avril"

fi

if [[ "$resultat_magie1" == "5" ]]; then
local moisentier="Mai"
fi

if [[ "$resultat_magie1" == "6" ]]; then
local moisentier="Juin"

fi

if [[ "$resultat_magie1" == "7" ]]; then
local moisentier="Juillet"
fi

if [[ "$resultat_magie1" == "8" ]]; then
local moisentier="Août"
fi

if [[ "$resultat_magie1" == "9" ]]; then
local moisentier="Septembre"
fi

if [[ "$resultat_magie1" == "10" ]]; then
local moisentier="Octobre"
fi

if [[ "$resultat_magie1" == "11" ]]; then
local moisentier="Novembre"
fi

if [[ "$resultat_magie1" == "12" ]]; then
local moisentier="Décembre"
fi
							     
magieGONG
say "Vous avez exactement $resultat_magie2 ans et jous êtes du mois de $moisentier"
fin-magie_estjuste
return;
fi

if [[ "$var1valeur" == "RESULTAT" ]]; then
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then
	magie_mot_fin_ok
	else
	magie_mot_fin_rate
	fi

say "Est-ce que l'on recommence ?"
suiterep_magie=""
echo "FIN" > $var1_magie
return;
fi
}

######################################################
################ Tour N° 7 OK ########################
######################################################
# http://villemin.gerard.free.fr/Magie/Agedevin.htm
jv_pg_magiechiffre7 () {
order="$memoordermagie"
prog_debut_magie

if [[ "$order" == "répète" ]]; then
magie_mot_repete
fi

if [[ "$suiterep_magie" == "repete" ]]; then
magie_mot_ok
if [[ "$mauvrep_magie" == "erreur de frappe" ]]; then
magie_mot_ditok
return;
fi
fi


if [[ "$var1valeur" == "Q0" ]]; then
say "Voici le Tour de ta date de naisance numéro 2 !"
say "Je vais te demander de prendre un papier et une calculatrice, dis moi quand tu es ok ?"
suiterep_magie="repete"
magie_mot_ditok
echo "Q1" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q1" ]]; then
say "Sans rien me dire, prends ton âge et multiplie le par 10, écris le sur le papier et entoure le"
suiterep_magie="repete"
magie_mot_ditok
echo "Q2" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q2" ]]; then
say "Pense un simple chiffre et écrit le sur le papier"
suiterep_magie="repete"
magie_mot_ditok
echo "Q3" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q3" ]]; then
say "multiplie-le par 9 et entoure le résultat"
suiterep_magie="repete"
magie_mot_ditok
echo "Q4" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q4" ]]; then
say "soustrait maintenant les deux nombres que tu as entouré"
suiterep_magie=""
magie_mot_ditok
echo "Q5" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q5" ]]; then
max_chiffre_totalmagie=3
conv_chiffre_magie "$order"
# $resultat_magie --> Résulat

resultat_magie1=`echo $resultat_magie | cut -c1-2`
resultat_magie2=`echo $resultat_magie | cut -c3`
resultat_magie3=$(( $resultat_magie1 + resultat_magie2 ))
				     
magieGONG

say "Vous avez $resultat_magie3 ans..."

fin-magie_estjuste
return;
fi

if [[ "$var1valeur" == "RESULTAT" ]]; then
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then
	magie_mot_fin_ok
	else
	magie_mot_fin_rate
	fi

say "Est-ce que l'on recommence ?"
suiterep_magie=""
echo "FIN" > $var1_magie
return;
fi

}


######################################################
################ Tour N° 8 OK ########################
######################################################
# http://villemin.gerard.free.fr/Magie/Agedevin.htm
jv_pg_magiechiffre8 () {
order="$memoordermagie"
prog_debut_magie

if [[ "$order" == "répète" ]]; then
magie_mot_repete
fi

if [[ "$suiterep_magie" == "repete" ]]; then
magie_mot_ok
if [[ "$mauvrep_magie" == "erreur de frappe" ]]; then
magie_mot_ditok
return;
fi
fi

if [[ "$var1valeur" == "Q0" ]]; then
say "Voici le Tour ou je dois Devinez un très grand nombre !"
min=19999
max=29999
chiffre_magie_random=$[($RANDOM % ($[$max - $min] + 1)) + $min]
chiffre_magie_random=20800
resultat_magie1=`echo $chiffre_magie_random | cut -c1`
resultat_magie2=`echo $chiffre_magie_random | cut -c2-`
resultat_magie2A=`echo $resultat_magie2 | cut -c1`
if [[ "$resultat_magie2A" == "0" ]]; then resultat_magie2=`echo $resultat_magie2 | cut -c2-`; max_chiffre_totalmagie=3; else max_chiffre_totalmagie=4; fi
resultat_magie3=$(( $resultat_magie1 + $resultat_magie2 ))
conv_chiffre_magie "$resultat_magie3"
resultat_magie4="$resultat_magie1_virgule"


if test -n "$NOM_MAGIE_POURSMS"; then
say "Je vais envoyer un Texto à $NOM_MAGIE_POURSMS, donc prépares-toi... "
say "et ne le regardez pas ce message tant que je ne le vous dis pas... "
suiterep_magie="repete"
magie_mot_ditok
echo "Q1" > $var1_magie
return;
else
suiterep_magie="repete"
magie_mot_ditok
echo "Q2" > $var1_magie
return;
fi
fi

if [[ "$var1valeur" == "Q1" ]]; then
say "ok je le fais partir..."
jv_handle_order "MESSEXTERNE ; $NOM_MAGIE_POURSMS ; je vous avez bien dit que je suis fort: $chiffre_magie_random"
echo "Q2" > $var1_magie
suiterep_magie="repete"
magie_mot_ditok
return;
fi

if [[ "$var1valeur" == "Q2" ]]; then
say "Je vais te demander de prendre un papier et une calculatrice."
suiterep_magie="repete"
magie_mot_ditok
echo "Q3" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q3" ]]; then
say "inscrit sur ce papier ce nombre: "
say "$resultat_magie soit $resultat_magie1_virgule"
suiterep_magie="repete"
magie_mot_ditok
echo "Q4" > $var1_magie
return;
fi


if [[ "$var1valeur" == "Q4" ]]; then
say "Maintenant sous ce nombre,"
say "inscrit un nombre de 4 chiffres quelconque"
say "en alignant les unitées avec les unitées, les dizaines avec les dizaines exetera..."
say "et dictes-moi ton nombre:"
if [[ "$aide_magie" == "aide" ]]; then
say "Par exemple 1 2 3 4"
fi
suiterep_magie=""
echo "Q5" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q5" ]]; then
max_chiffre_totalmagie=4
conv_chiffre_magie "$order"
if [[ "$chiffre_totalmagie_bug" == "1" ]]; then
say "essaye par groupe de 2 chiffres"
echo "Q5" > $var1_magie
return
else
say "Ai-je bien entendu tu m'as dit:"
max_chiffre_totalmagie=4
conv_chiffre_magie "$order"
resultat_magie5="$resultat_magie"
# $resultat_magie --> Résulat
say "$resultat_magie soit $resultat_magie1_virgule"
suiterep_magie="repete"
magie_mot_ditok
echo "Q6" > $var1_magie
return;
fi
fi

if [[ "$var1valeur" == "Q6" ]]; then
say "Dessous ce nombre inscrit celui-ci:"
max_chiffre_totalmagie=4
resultat_magie6=$(( 9999 - $resultat_magie5 ))
conv_chiffre_magie "$resultat_magie6"
# $resultat_magie --> Résulat
say "$resultat_magie6 soit $resultat_magie1_virgule"
suiterep_magie="repete"
magie_mot_ditok
echo "Q7" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q7" ]]; then
say "A ton tour..."
say "inscrit encore un nombre à 4 chiffres et dictes moi le à nouveau"
if [[ "$aide_magie" == "aide" ]]; then
say "Par exemple 1 2 3 4"
fi
suiterep_magie=""
echo "Q8" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q8" ]]; then
max_chiffre_totalmagie=4
conv_chiffre_magie "$order"
if [[ "$chiffre_totalmagie_bug" == "1" ]]; then
say "essaye par groupe de 2 chiffres"
echo "Q8" > $var1_magie
return
else
say "Si j'ai bien saisie tu m'as dit:"
# $resultat_magie --> Résulat
resultat_magie7="$resultat_magie"
say "$resultat_magie soit $resultat_magie1_virgule"
suiterep_magie="repete"
magie_mot_ditok
echo "Q9" > $var1_magie
return;
fi
fi

if [[ "$var1valeur" == "Q9" ]]; then
say "Dessous ce nombre inscrit celui ci:"
max_chiffre_totalmagie=4
resultat_magie8=$(( 9999 - $resultat_magie ))
conv_chiffre_magie "$resultat_magie8"
# $resultat_magie --> Résulat
say "$resultat_magie8 soit $resultat_magie1_virgule"
suiterep_magie="repete"
magie_mot_ditok
echo "Q10" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q10" ]]; then
say "Maintenant tire un trait sous ces nombres."
say "Puis fais l'addition sans rien me dire"
suiterep_magie="repete"
magie_mot_ditok
echo "Q11" > $var1_magie
return;
fi

if [[ "$var1valeur" == "Q11" ]]; then
say "Il me faut me concentrer..."
say "car je pense avoir trouvé le résultat final..."
resultat_magie9=$(( $resultat_magie8 +  $resultat_magie7 + $resultat_magie6 + $resultat_magie5 + $resultat_magie3 ))
max_chiffre_totalmagie=5
conv_chiffre_magie "$resultat_magie9"

	if [[ "$resultat_magie9" == "$chiffre_magie_random" ]]; then
	magieGONG
	say "c'est $resultat_magie9 soit $resultat_magie1_virgule"
		if test -n "$NOM_MAGIE_POURSMS"; then
		echo "Q12" > $var1_magie
		suiterep_magie="repete"
		magie_mot_ditok
		return;
		else
		suiterep_magie=""
		fin-magie_estjuste
		return;
		fi
	else
	echo "FIN" > $var1_magie
	echo "Oups... ma baguette magique est tombée en panne... je ne trouve pas ton chiffre !!! On recommence ok ?"
	return;
	fi
fi


if [[ "$var1valeur" == "Q12" ]]; then
	say "Regardez à présent le texto que $NOM_MAGIE_POURSMS a reçu !!"
	suiterep_magie=""
	fin-magie_estjuste
	return;
fi

if [[ "$var1valeur" == "RESULTAT" ]]; then
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then
	magie_mot_fin_ok
	else
	magie_mot_fin_rate
	fi

say "Est-ce que l'on recommence ?"
suiterep_magie=""
echo "FIN" > $var1_magie
return;
fi



}



# --------------------------------------------------------------------
# --------------------------------------------------------------------
# --------------------------------------------------------------------


magieGONG() {
# say "api $jv_api et keyboard $keyboard"

if [[ "$jv_api" == "true" ]] || [[ "$keyboard" == "true" ]] ; then
say " "
return;
else
mpg321 "/dev/shm/abracadabra.mp3" 2>/dev/shm/null
sleep 1
return;
fi
}


conv_chiffre_magie () {
resultat_magie=`echo "$1" | sed -e "s/un/1/g" | sed -e "s/deux/2/g" | sed -e "s/de/2/g" | sed -e "s/trois/3/g" | sed -e "s/quatre/4/g" | sed -e "s/cinq/5/g" | sed -e "s/six/6/g" | sed -e "s/sept/7/g" | sed -e "s/huit/huit/g" | sed -e "s/neuf/9/g" | sed -e "s/zéro/0/g" | sed -e "s/ //g" | sed -e 's/[^0-9]//g'`
order_magie_numerique=`echo "$resultat_magie" | sed -e 's/[^0-9]//g'`
verifnbrchif_magie=$((`echo "$resultat_magie" | wc -c` - 1 ))
verifnbrchif_boucle="1"
resultat_magie1_virgule=""
chiffre_totalmagie_bug="0"
resultat_magie_addition="0"
manquant_chiffre_totalmagie=""

while test  "$verifnbrchif_boucle" != "$(( $verifnbrchif_magie + 1 ))"
# while test  "$lignenumero" != "$lignetotal"
do
resultat_magie1_virgulesuite=`echo $resultat_magie | cut -c$verifnbrchif_boucle`
resultat_magie1_virgule="$resultat_magie1_virgule, $resultat_magie1_virgulesuite"
resultat_magie_addition=$(( $resultat_magie_addition + $resultat_magie1_virgulesuite ))
verifnbrchif_boucle=$(( $verifnbrchif_boucle + 1 ))

done

if test -z "$order_magie_numerique"; then
say "Désolé, je n'ai saisie aucun chiffre...";
chiffre_totalmagie_bug="1"
return;
fi


if test -n "$max_chiffre_totalmagie"; then

	if [[ "$manquant_chiffre_totalmagie" == "$max_chiffre_totalmagie" ]]; then 
	say "redictes moi les chiffres, j'en ai saisie aucun...";
	chiffre_totalmagie_bug="1"
        return;
	fi


	if [[ "$verifnbrchif_magie" -lt "$(( $max_chiffre_totalmagie ))" ]]; then
	max_chiffre_totalmagie_bug=1
	manquant_chiffre_totalmagie=$(( $max_chiffre_totalmagie - $verifnbrchif_magie ))
		if [[ "$manquant_chiffre_totalmagie" == "1" ]]; then 
		chiffre_sinplur="chiffre"
		else
		chiffre_sinplur="chiffres"
		fi

	say "il manque $manquant_chiffre_totalmagie $chiffre_sinplur, j'ai compris que le$resultat_magie1_virgule, redictez-moi tout"
	chiffre_totalmagie_bug="1"
	return;
	fi

	if [[ "$verifnbrchif_magie" -gt "$max_chiffre_totalmagie" ]]; then 
	say "$verifnbrchif_magie chiffres ! il y en a trop !! "
	say "redictes moi les car j'ai entendu$resultat_magie1_virgule ";
	chiffre_totalmagie_bug="1"
	return;
	fi


else
chiffre_totalmagie_bug=0
return;
fi
}

magiechiffre_relance_ok_fin () {

if [[ "$var1valeur" =~ "FIN" ]]; then
	# Si je dois le faire 1 fois par jour: magiefinadire = NON
	if [[ "$magiefinadire" == "NON" ]]; then
		if test -e "$var1_magie"; then
		sudo rm $var1_magie
		fi
	
		if test -e "$var_magie"; then
		sudo rm $var_magie
		return;
		fi
	memoordermagie="non"
	FINMAGIECHIFFRE="FIN"
	return;
	fi

	# Si je peux refaire le tour de magie: magiefinadire = Phrase à redire pour recommencer
	if [[ "$order" =~ "oui" ]] || [[ "$order" =~ "ok" ]]; then 
	say "$magiefinadire"
	echo "Q0" > $var1_magie
	FINMAGIECHIFFRE=""
	chiffre_totalmagie_bug="0"
	return;
	else

		if test -e "$var1_magie"; then
		sudo rm $var1_magie
		fi
	
		if test -e "$var_magie"; then
		sudo rm $var_magie
		fi
	memoordermagie="oui"
	FINMAGIECHIFFRE="FIN"
	fi
fi
}


jv_pg_magiechiffre_fin () {
var_magie="/dev/shm/mag-lequel.txt"
var1_magie="/dev/shm/mag-chiffre1.txt"

if test -e "$var1_magie"; then
sudo rm $var1_magie
fi

if test -e "$var_magie"; then
sudo rm $var_magie
fi
}

magieGONG() {
# say "api $jv_api et keyboard $keyboard"

if [[ "$jv_api" == "true" ]] || [[ "$keyboard" == "true" ]] ; then
say " "
return;
else
ordermagiedit=("Abracadabra !..." "Acara, cadabera !..." "Abracadabro Abracadabri !..." "Ouistiti sapristi !..." "Visto cara de cabra !..." "Sim sala bim !..." "Turlututu, chapeau pointu ! ..." "Magicorama !..." "Hokus Pokus !...")
ordermagiedit1="${ordermagiedit[$RANDOM % ${#ordermagiedit[@]} ]}"
say "$ordermagiedit1"

mpg321 "/home/pi/jarvis/plugins_installed/jarvis-magie/chiffres/abracadabra.mp3" 2>/dev/shm/null
sleep 1
fi
}



magie_mot_repete () {
var_magie="/dev/shm/mag-lequel.txt"
QuelTour_rep=`cat "$var1_magie"`
QuelTour=`cat "$var_magie"`

QuelTour_rep=`echo "$QuelTour_rep" | sed -e "s/Q//g"`
QuelTour_repp=$(( $QuelTour_rep - 1 ))
	if [[ "$QuelTour_repp" =~ "-" ]]; then
	QuelTour_repp="0"
	fi

echo "Q$QuelTour_repp" > $var1_magie
mauvrep_magie=""
memoordermagie=""
order=""
suiterep_magie=""
aide_magie="aide"
commands="$(jv_get_commands)"; jv_handle_order "MAGIE"; return;
return;
}



magie_mot_ok () {
if [[ "$order" =~ "ok" ]]; then
mauvrep_magie=""
else
mauvrep_magie="erreur de frappe"
memoordermagie=""
order=""
commands="$(jv_get_commands)"; jv_handle_order "GOTOMAGREP"; return;
fi
}

magie_mot_ditok () {
ordermagiedit=("j'attends le mot: Ok !" "c'est OK ?" "est ce ok ?" "Ok pour toi ?" "tu es ok ?" "prononce ok pour continuer !" "ok ?" "réponds moi par ok ?")
ordermagiedit1="${ordermagiedit[$RANDOM % ${#ordermagiedit[@]} ]}"
say "$ordermagiedit1"
}

magie_dire_1fois_repete () {
var_magie_repetunjour="/dev/shm/repetok.txt"
aijedis_magie_repetunjour=`cat $var_magie_repetunjour`

if [ ! -e "$var_magie_repetunjour" ]; then
echo $(( `date +%d` - 1))  > $var_magie_repetunjour
fi

if [[ "$aijedis_magie_repetunjour" != `date +%d` ]]; then
say "A tout moment vous pouvez prononcer le mot"
say "répète !"
say "si vous avez mal saisie ce que je vous demande..."
date +%d > $var_magie_repetunjour
fi
}

prog_debut_magie () {
var1_magie="/dev/shm/mag-chiffre1.txt"
magiechiffre_relance_ok_fin # est ce un tour que je peux relancer aujourd'hui ???
if [ ! -e "$var1_magie" ]; then
echo "Q0" > $var1_magie
var1valeur=`cat "$var1_magie"`
else
var1valeur=`cat "$var1_magie"`
fi
}

fin-magie_estjuste() {
ordermagiedit=("Alors est-ce que c'est juste ?" "Le résultat est bien bon ?" "ne me suis-je pas trompé?" "est-ce le bon résultat ?" "C'est bien la bonne réponse ?" "C'est bien le résultat qu'il devait y avoir ?")
ordermagiedit1="${ordermagiedit[$RANDOM % ${#ordermagiedit[@]} ]}"
say ""
say "$ordermagiedit1"
echo "RESULTAT" > $var1_magie
}

magie_mot_fin_ok() {
ordermagiedit=("Je le savait, je suis la plus forte !" "C'est magique n'est pas !" "Alors qui est le plus fort ? " "Magique n'est ce pas !" "C'est impressionant je sais bien merci..." "Il n'y a pas plus magique que moi lol ! " "Je suis fier de mes capacités !" "Moi même je me surprends" "je sais, je suis très forte !")
ordermagiedit1="${ordermagiedit[$RANDOM % ${#ordermagiedit[@]} ]}"
say ""
say "$ordermagiedit1"
}

magie_mot_fin_rate() {
ordermagiedit=("Alors on ne sait plus faie des mathématiques... il y a forcment une ereur de ta part..." "je ne me trompe jamais... toi oui recommence !" "il ne peut pas y avoir d'erreur... tu t'es trompé quelque part..." "impossible, tu t'es trompé dans tes calculs..." "Recommence tu as fait un erreur de mathématique" "Il te faut reprendre les calculs, il y a une erreur, recommence...")
ordermagiedit1="${ordermagiedit[$RANDOM % ${#ordermagiedit[@]} ]}"
say ""
say "$ordermagiedit1"
}