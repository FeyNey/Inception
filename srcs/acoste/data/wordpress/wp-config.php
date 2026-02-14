<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'wppassword' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '_~?r@93y_;E&YX-_IL6l^}>}axfrtb $>}4PtA;>I+fkp+(wo]s+L]CEuieZO+BM' );
define( 'SECURE_AUTH_KEY',   'n92gV]]|~Lo:1eX7(tQ&D(-@bi4ka`qr/cR3O-4Xz#B#KO~M luk,l6./f-dv?P`' );
define( 'LOGGED_IN_KEY',     'L}tT8|(gL |}oJ9f+*TKc<a_Oq4)OPbW6#%t7OvKyLu?_v}Pny+`d+50Rn@%uby1' );
define( 'NONCE_KEY',         'gZvP7kN$XetHMah$J19v;Dk92n0e>`R[8cF]PI}S{d:Z3{._a|=//K7f^SwA.6p?' );
define( 'AUTH_SALT',         '%&]5%qGD(I-5/Z`bmixShXCn&o.+Ub{!GoAK@GeF%TkWK{kka:;J+V{VVsn^=?!X' );
define( 'SECURE_AUTH_SALT',  'BCHxS2z5h/0o M%QfxIN@AS9y<NEF+}EJ[=zKILXQ,lWa};BZq99_>D&?N<>(1}T' );
define( 'LOGGED_IN_SALT',    '#~~Jz|?FCB$#TTEi;0Jw>B:Hk?$hqu@;7^?5w*kf1t,hZR7#h?N7V+)o81TLb74a' );
define( 'NONCE_SALT',        'Pa Db.~fpX4q^;nTYDraZ&iL]!^N+PXDl+lC@x :NF#fDt[0LMq/8{N!DZFwuBv}' );
define( 'WP_CACHE_KEY_SALT', 'Ci^V2OTmH30|b6x61$>w=^xIO13JChEC~=5[??!ktMOG/KS2/7hV9@RH<L]~NU{y' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
