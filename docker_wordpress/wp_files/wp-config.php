<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define('DB_NAME', 'db_wp_chanter');

/** Utilisateur de la base de données MySQL. */
define('DB_USER', 'whatever');

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', 'AdminHevs01');

/** Adresse de l’hébergement MySQL. */
define('DB_HOST', 'mysql');

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define('DB_CHARSET', 'utf8mb4');

/** Type de collation de la base de données.
  * N’y touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '|}*66-7 sIS/?7EF=!A?)}@oS-y!U]ib7`FC.$?pvkR(=UZ.$pU(<97[*Zq&PD`A');
define('SECURE_AUTH_KEY',  'DY2Jv&n]t>p1L!Sg-a3lt9ZIv)%dGyju(mIdh212AaXQO*XRrX+a/5^|CdG$1*He');
define('LOGGED_IN_KEY',    'LsWe9O2%:O{)xK1%Ip!CEvz$;ypn7JZY$n~!*6xnPYy$oHY$5Q,O]v[]#KEAxtOn');
define('NONCE_KEY',        'P6Wxw$OLp>8&&Ii:2uGS55$9cvGb_,JFax,hkpR.LZ>Wpb{l_4>*;p#mm:W~dAg/');
define('AUTH_SALT',        'cDWg+$g.cp+!tjmll:m(`DgX!Rnc|em<H.&5|<KOxZKX52=Sx chd,0$4:krA.G$');
define('SECURE_AUTH_SALT', 'TXMV-LDwOMx~rX?hh=83-ped(826z//P7TSFbQ[,7x&8`>Bo%[`i$Eu$,3l[aXq{');
define('LOGGED_IN_SALT',   'V.C>bG>*mt(7a} &S<<3aI -pbeS_98:R#,(v%qK~7x>u1G;i2]&Mx?~QL?wi_SL');
define('NONCE_SALT',       'PnUu2yyB4vvnM+6OZG+-N?f$wJD3=5<+iTcqysMm2GGyRK.+(B%w0tV^q5JT`,|d');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix  = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);


// On désactive l'affichage des erreurs PHP (souhaitable en production).
// Les erreurs sont tout de même logguées en fichier texte.
ini_set('display_errors', '0');


/* C’est tout, ne touchez pas à ce qui suit ! */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');