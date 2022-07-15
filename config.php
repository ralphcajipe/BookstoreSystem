<?php
/**
 * If the user agent is a mobile device, return true, otherwise return false.
 * 
 * @param url The URL to which the request is sent.
 */
/* Used to start the output buffer. */
ob_start();
ini_set('date.timezone','Asia/Manila');
date_default_timezone_set('Asia/Manila');
session_start();

/* A PHP code that is used to connect to the database. */
require_once('initialize.php');
require_once('classes/DBConnection.php');
require_once('classes/SystemSettings.php');
$db = new DBConnection;
$conn = $db->conn;

/**
 * It redirects the user to the specified url.
 * 
 * @param url The URL you want to redirect to.
 */
function redirect($url=''){
	if(!empty($url))
	echo '<script>location.href="'.base_url .$url.'"</script>';
}

/**
 * If the file exists, return the file, otherwise return a default image.
 * 
 * @param file The file name of the image you want to validate.
 * 
 * @return the base_url and the file name.
 */
function validate_image($file){
	if(!empty($file)){
			// exit;
		if(is_file(base_app.$file)){
			return base_url.$file;
		}else{
			return base_url.'dist/img/no-image-available.png';
		}
	}else{
		return base_url.'dist/img/no-image-available.png';
	}
}

/**
 * If the user agent is detected as a mobile device, return true. Otherwise, return false.
 * 
 * @return A boolean value.
 */
function isMobileDevice(){
    $aMobileUA = array(
        '/iphone/i' => 'iPhone', 
        '/ipod/i' => 'iPod', 
        '/ipad/i' => 'iPad', 
        '/android/i' => 'Android', 
        '/blackberry/i' => 'BlackBerry', 
        '/webos/i' => 'Mobile'
    );

    //Return true if Mobile User Agent is detected
    foreach($aMobileUA as $sMobileKey => $sMobileOS){
        if(preg_match($sMobileKey, $_SERVER['HTTP_USER_AGENT'])){
            return true;
        }
    }
    //Otherwise return false..  
    return false;
}
/* Used to flush the output buffer. */
ob_end_flush();
