<?php
add_action( 'wp_enqueue_scripts', 'my_theme_enqueue_style' );
function my_theme_enqueue_style(){
	wp_enqueue_style( 'radiate', get_template_directory_uri() . '/style.css' );
	wp_enqueue_style( 'radiate', get_template_directory_uri() . '/rtl.css' );
}

function fscv_test()
{
    //must check that the user has the required capability 
    if (!current_user_can('manage_options'))
    {
      wp_die( __('You do not have sufficient permissions to access this page.') );
    }
	
    // See if the user has posted us some information
    // If they did, this hidden field will be set to 'Y'
    if( isset($_POST[ $hidden_field_name ]) && $_POST[ $hidden_field_name ] == 'Y' )
	{
        // Read their posted value
        $opt_val = $_POST[ $data_field_name ];

        // Put a "settings saved" message on the screen

		?>
		<div class="updated"><p><strong><?php _e('settings saved.', 'menu-test' ); ?></strong></p></div>
		<?php
	}
	
	?>
	<!-- <div class="notice notice-success"><p><strong>Settings saved.</strong></p></div> -->
	<div class="wrap">
		<h2>Liste de personnes</h2>
		
		<form name="form1" method="POST" action="">
			
			<style type="text/css">
				.fscv-export-table
				{
					text-align: left;
					border-collapse: collapse;
				}
				
				.fscv-export-table tr:nth-child(odd)
				{
					background: rgba(255,255,255,0.5);
				}
				
				.fscv-export-table th,
				.fscv-export-table td
				{
					border: 1px solid #ddd;
				}
				
				.fscv-export-table th,
				.fscv-export-table td
				{
					padding: 1em 3em;
				}
			</style>
			
			<?php
			
			function fscv_export_checkbox( $tag, $name, $label )
			{
				$cb_format = '<%s><label><input type="checkbox" id="%s">&nbsp;%s</label></%s>';
				
				return sprintf($cb_format, $tag, $name, $label, $tag);
			}
			?>
			
			<table class="fscv-export-table">
				<tr>
					<?php
						echo '<th>Organisations</th>';
						echo fscv_export_checkbox('th', 'fscv_comittee_all', 'Comités');
						echo fscv_export_checkbox('th', 'fscv_comu_all', 'Commissions de Musique');
						echo fscv_export_checkbox('th', 'fscv_honorary_all', 'Membres honoraires');
					?>
				</tr>
			<?php
			
			$organizations = array(
				'fscv' => 'FSCV',
				'gscbv' => 'GSCBV',
				'ucc' => 'UCC',
				'gcvc' => 'GCVC',
				'ocv' => 'OCV',
				'avcc' => 'AVCC'
			);
			
			$comittees = array(
				'comittee' => 'Comité',
				'comu' => 'Commission de Musique',
				'honorary' => 'Membres honoraires'
			);
			
			foreach ( $organizations as $o_slug => $o_label )
			{
				echo '<tr>';
				echo fscv_export_checkbox('th', 'fscv_'.$o_slug.'_all', $o_label);
				
				foreach($comittees as $c_slug => $c_value)
				{
					echo fscv_export_checkbox('td', 'fscv_'.$o_slug.'_'.$c_slug, $c_value.' '.$o_label);
				}
					
				echo '</tr>';
			}
			
			?>
			</table>
			
			<hr />

			<p class="submit">
			<input type="submit" class="button-primary" value="Afficher" />
			</p>

		</form>
	</div>
	<?php
}

function fscv_test_sub()
{
	echo 'my subpage (echo)';
	return 'my subpage (return)';
}

add_menu_page( 'Export FSCV', 'Export FSCV', 'manage_options', 'fscv-export', 'fscv_test', 'dashicons-download' );
// Submenu test
//add_submenu_page( 'fscv-export', 'Titre de la page', 'Titre du sous-menu', 'manage_options', 'sub-page', 'fscv_test_sub' );

function fscv_person_last_update( $column, $post_id )
{
	if ( $column == 'fscv_person_last_update')
	{
		$timestamp = strtotime( get_post( $post_id )->post_modified );
		
		$str_date = date_i18n( get_option('date_format'), $timestamp );
		$str_time = date_i18n( get_option('time_format'), $timestamp );
		
		echo $str_date.' -- '.$str_time;
	}
}
add_action( 'manage_posts_custom_column' , 'fscv_person_last_update', 20, 2 );

function fscv_person_add_last_update_column($columns)
{
    return array_merge($columns, 
              array('fscv_person_last_update' => __('Last Update')));
}
add_filter('manage_fscv_person_posts_columns' , 'fscv_person_add_last_update_column', 20, 1 );

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
add_action( 'save_post', 'fscv_attrib_save_auto_title', 20, 1 );

// Génère un titre automatique lorsqu'une attribution FSCV est sauvée
function fscv_person_save_auto_title($post_id, $o)
{
	$first_name = get_post_meta( $post_id, 'first_name', true );
	$last_name = get_post_meta( $post_id, 'last_name', true );
	$full_name = $first_name.' '.$last_name;
	
	// Unhook de la fonction pour éviter une boucle infinie
	remove_action( 'save_post_fscv_person', 'fscv_person_save_auto_title', 20, 2 );

	// Écrasement du titre par un titre généré automatiquement
	wp_update_post(
		array(
			'ID' => $post_id,
			'post_title' => $full_name,
			'post_name' => sanitize_title( $full_name )
		)
	);

	// Re-hooking
	add_action( 'save_post_fscv_person', 'fscv_person_save_auto_title', 20, 2 );
}
// Se déclenche à chaque fois qu'un post est créé ou mis à jour
add_action( 'save_post_fscv_person', 'fscv_person_save_auto_title', 20, 2 );