<?php

/**
 * Runs several checks against the user before allowing access to a page.
 *
 * LICENSE:
 *
 * This source file is subject to the licensing terms that
 * is available through the world-wide-web at the following URI:
 * http://codecanyon.net/wiki/support/legal-terms/licensing-terms/.
 *
 * @author       Jigowatt <info@jigowatt.co.uk>
 * @author       Matt Gates <matt.gates@jigoshop.com>
 * @copyright    Copyright © 2009-2012 Jigowatt Ltd.
 * @license      http://codecanyon.net/wiki/support/legal-terms/licensing-terms/
 * @link         http://codecanyon.net/item/php-login-user-management/49008
 */

include_once( 'generic.class.php' );

class Index extends Generic {

	function __construct() {

		

	}

	/**
	 * Checks whether or not the user has logged in.
	 *
	 * If the user is not logged in, we will store the page the user
	 * is coming from and redirect the user later after logging in.
	 *
	 * @param    boolean    $redirect    Ask the user to sign in or not.
	 */
	private function isGuest($forceLogin) {

		if ( !$forceLogin )
			return empty( $_SESSION['jigowatt']['user_id'] );

		if ( empty($_SESSION['jigowatt']['user_id']) ) :

			$_SESSION['jigowatt']['referer'] = $_SERVER['REQUEST_URI'];

			$page = parent::getOption('guest-redirect');
			header('Location: ' . $page);
			exit();

		endif;
	}
	
	public function getAL($surveyor_id) {
		if(!empty($_SESSION['jigowatt']['user_id'])):
			$params = array( ':surveyor_id' => $surveyor_id);
			$query = "SELECT * FROM login_users
			          inner join login_address_listings
					  on login_users.user_id = login_address_listings.surveyor_id
					  where login_users.user_id = :surveyor_id";
			$stmt = parent::query($query,$params);
			$row = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
		endif;
		return $row;
	}
}

$index = new Index();