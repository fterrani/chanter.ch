<?php
/*
	Plugin Name: chanter-custom
	Description: Plugin customisé pour le site de la FSCV, contenant principalement des shortcodes. Veuillez consulter le manuel technique pour plus de détails.
	Author: HES-SO
	Version: 1.0.0
*/

//Display a person's details with his last and first name and eventually his mobile phone number
function shortcode_get_person($atts){
	extract(shortcode_atts(
		array(
			'first_name' => '',
			'last_name' => '',
			'mobile_phone' => ''
		), $atts));
	
	//mobile_phone attribute is not mandatory : if it's empty, does not look for it in Pods
	if($mobile_phone == ''){
		$params = array(
			'where' => 'last_name LIKE "'.$last_name.'" AND first_name LIKE "'.$first_name.'"',
			'limit' => 1
		);
	} else {
		$params = array(
			'where' => 'last_name LIKE "'.$last_name.'" AND first_name LIKE "'.$first_name.'" AND mobile_phone LIKE "'.$mobile_phone.'"',
			'limit' => 1
		);
	}
	//Get the person with Pods
	$the_person = pods('fscv_person', $params);
	
	//Display the person
	$display_person = $the_person->display(' person_title ' ).' '.$the_person->display( 'first_name' ).' '.$the_person->display( 'last_name' );
	
	return $display_person;
}
add_shortcode('person_details', 'shortcode_get_person');

//Display an organization or a choir committee with its name
function shortcode_get_committee($atts){
	extract(shortcode_atts(
		array(
			'choir_name' => '',
			'organization_name' => ''
		), $atts));
	
	//You cannot fill both attributes at the same time !
	if($choir_name != '' && $organization_name != ''){
		return '';
	}
	//Get the choir by its post_title
	else if ($choir_name != ''){
		$params = array(
			'where' => 'post_title LIKE "'.$choir_name.'"',
			'limit' => 1
		);
		
		$the_committee = pods('choir', $params);
		$display_committee = $the_committee->display('post_title').' a été fondé en '.
			$the_committee->display('creation_year').', compte '.
			$the_committee->display('staff_number').' membres actifs et se situe à '.
			$the_committee->display('locality').'.';
	}
	//Get the organization by its name
	else {
		$params = array(
			'where' => 'fscv_organization_name LIKE "'.$organization_name.'" OR post_title LIKE "'.$organization_name.'"',
			'limit' => 1
		);
		
		$the_committee = pods('fscv_organization', $params);
		$display_committee = $the_committee->display('fscv_organization_name').' (ou '.
			$the_committee->display('post_title').') se situe à '.
			$the_committee->display('locality').'.';
	}
	
	return $display_committee;
}
add_shortcode('committee_details', 'shortcode_get_committee');
?>














