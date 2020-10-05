<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'lauretta' );

/** MySQL database password */
define( 'DB_PASSWORD', 'collard' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'a6yo 5kb:}Ca5:+8KEGX*LzTM0g-O-JeXw&80vBpU=*Lr&p!+W!6((^f:L<@oFO7');
define('SECURE_AUTH_KEY',  'F<w6$o-nP;|XK860NccjHhiCfC|XIJF7@eufZ$piDpAq5x%+L:)1RQlu&ZVMEgyn');
define('LOGGED_IN_KEY',    'SdCyZr<B+1<WH2-gFT+Jw3HPH9u[-Tim9CZrE%0O5R;]_!~(i[b+,5tooW o[lUC');
define('NONCE_KEY',        ':kM]aV]3HK&S+/4LD/|JxdI.kEAb(YqUGw+SMf/g+Rz;Tt,^te+:61a] NJg]l`4');
define('AUTH_SALT',        'Hzd_<!&|?kl*$ldf|z$s@7l}ax$`Al876:Zm$6#uk-/nc[Lc{z?mJO0ke;N7GR-|');
define('SECURE_AUTH_SALT', 'x2P.|goes(.wBcrU0O@S+)mCfI/3^!bi:/x%XoT9={^-Da|Y_x^5d/i@m/Q~l7Q4');
define('LOGGED_IN_SALT',   '6(8$S(3OBw7+>R7/-K{c-e.ldA-P%,R.GcEDFZo4`>->QxYxNBT4Rm%^(LW2s%|a');
define('NONCE_SALT',       '2A&[EN jtTiWQRoD-d9{(W/-G@W8GO1J=Un3+A.0xu[}U~M+<?EKK~:Bbukr0[8+');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';