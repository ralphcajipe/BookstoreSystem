<?php
/* Defining the constants. */

/* Defining the developer's data. */
$dev_data = array('id'=>'-1','firstname'=>'Developer','lastname'=>'','username'=>'dev_oretnom','password'=>'5da283a2d990e8d8512cf967df5bc0d0','last_login'=>'','date_updated'=>'','date_added'=>'');

/* Checking if the constant `base_url` is defined. If it is not defined, it will define it. */
if(!defined('base_url')) define('base_url','http://localhost/BookstoreSystem/');

/* Defining the constant `base_app` if it is not defined. */
if(!defined('base_app')) define('base_app', str_replace('\\','/',__DIR__).'/' );

/* Checking if the constant `dev_data` is defined. If it is not defined, it will define it. */
if(!defined('dev_data')) define('dev_data',$dev_data);

/* Checking if the constant `DB_SERVER` is defined. If it is not defined, it will define it. */
if(!defined('DB_SERVER')) define('DB_SERVER',"localhost");

/* Checking if the constant DB_USERNAME is defined. If it is not defined, it will define it. */
if(!defined('DB_USERNAME')) define('DB_USERNAME',"root");

/* Checking if the constant DB_PASSWORD is defined. If it is not defined, it will define it. */
if(!defined('DB_PASSWORD')) define('DB_PASSWORD',"");

/* Checking if the constant DB_NAME is defined. If it is not defined, it will define it. */
if(!defined('DB_NAME')) define('DB_NAME',"book_shop_db");
?>