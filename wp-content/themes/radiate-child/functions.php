<?php
add_action( 'wp_enqueue_scripts', 'my_theme_enqueue_style' );
function my_theme_enqueue_style(){
	wp_enqueue_style( 'radiate', get_template_directory_uri() . '/style.css' );
	wp_enqueue_style( 'radiate', get_template_directory_uri() . '/rtl.css' );
}
// Remplace le titre par un titre généré pour les attributions
function fscv_attrib_title( $title, $post_id = null )
{
	$org_ctype = '';
	
    if ( $post_id != null )
	{
		$post_type = get_post_type( $post_id );
		
		if ( $post_type == 'fscv_org_attrib' )
			$org_ctype = 'organization';
		else if ( $post_type == 'fscv_choir_attrib' )
			$org_ctype = 'choir';
    }
	
	if ( $org_ctype != '' )
	{
		$person = get_post_meta( $post_id, 'person', true );
		$attrib = get_post_meta( $post_id, 'attribution', true );
		$org = get_post_meta( $post_id, $org_ctype, true );
		
		
		$title = $org['post_title'].' -- '.$attrib['post_title'].' -- '.$person['first_name'].' '.$person['last_name'];
	}
	
	return $title;
}

// Modifie l'AFFICHAGE uniquement ! Ne modifie pas le titre
// add_filter( 'the_title', 'fscv_attrib_title', 10, 2 );



// Génère un titre automatique lorsqu'une attribution FSCV est sauvée
function fscv_attrib_save_auto_title($post_id)
{
	$fscv_attrib = array(
		'fscv_org_attrib',
		'fscv_choir_attrib'
	);
	
	// Si le post est une attribution FSCV (choeur ou organisation)
	if ( in_array( get_post_type($post_id), $fscv_attrib ) )
	{
		$attrib_title = fscv_attrib_title( '', $post_id );
		
		// Unhook de la fonction pour éviter une boucle infinie
		remove_action( 'save_post', 'fscv_attrib_save_auto_title' );

		// Écrasement du titre par un titre généré automatiquement
		wp_update_post(
			array(
				'ID' => $post_id,
				'post_title' => $attrib_title,
				'post_name' => sanitize_title( $attrib_title )
			)
		);

		// Re-hooking
		add_action( 'save_post', 'fscv_attrib_save_auto_title' );
	}
}
// Se déclenche à chaque fois qu'un post est créé ou mis à jour
add_action( 'save_post', 'fscv_attrib_save_auto_title' );



// Génère un titre automatique lorsqu'une attribution FSCV est sauvée
function fscv_person_save_auto_title($post_id)
{
	if ( get_post_type($post_id) == 'fscv_person' )
	{
		$first_name = get_post_meta( $post_id, 'first_name', true );
		$last_name = get_post_meta( $post_id, 'last_name', true );
		$full_name = $first_name.' '.$last_name;
		
		// Unhook de la fonction pour éviter une boucle infinie
		remove_action( 'save_post', 'fscv_person_save_auto_title' );

		// Écrasement du titre par un titre généré automatiquement
		wp_update_post(
			array(
				'ID' => $post_id,
				'post_title' => $full_name,
				'post_name' => sanitize_title( $full_name )
			)
		);

		// Re-hooking
		add_action( 'save_post', 'fscv_person_save_auto_title' );
	}
}
// Se déclenche à chaque fois qu'un post est créé ou mis à jour
add_action( 'save_post', 'fscv_person_save_auto_title' );
?>