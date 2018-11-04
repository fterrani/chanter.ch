<?php
/**
 * The template used for displaying page content in single.php
 *
 * @package ThemeGrill
 * @subpackage Radiate
 * @since Radiate 1.0
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">
		<h1 class="entry-title"><?php the_title(); ?></h1>

		<div class="entry-meta">
			<?php radiate_posted_on(); ?>
		</div><!-- .entry-meta -->
	</header><!-- .entry-header -->

	<div class="entry-content">
		<!-- Logical part : get data from pods to automatically display information about the choir -->
		<?php
		//Get current choir ID
		$id_choir = get_the_ID();
		//Get the current choir data
		$params_choir = array(
			'where' => 't.id = '.$id_choir
		);
		$current_choir = pods('choir', $params_choir);
		$current_choir->fetch();
		//Store every choir fields in variables
		$locality = $current_choir->display( 'locality' );
		$postcode = $current_choir->display( 'postcode' );
		$street = $current_choir->display( 'street' );
		$gospel = $current_choir->display( 'gospel_choir' );
		$church = $current_choir->display( 'church_choir' );
		$jodel = $current_choir->display( 'jodel_choir' );
		$website = $current_choir->display( 'website' );
		$staff = $current_choir->display( 'staff_number' );
		$creation_year = $current_choir->display( 'creation_year' );
		$organizations = $current_choir->display( 'fscv_organization' );
		//$type = $current_choir->display( 'type' );
		//$institution = $current_choir->display( 'institution' );
		//$language = $current_choir->display( 'language' );
		//Get the people's id involved in the current choir		
		$params_attrib = array(
			'where' => 'choir.id = '.$id_choir,
			'limit' => 5
		);
		$choir_attributions = pods('fscv_choir_attributi', $params_attrib);
		$id_people = array();		
		if ( $choir_attributions->total() > 0 ) {
			while($choir_attributions->fetch()){
				echo('Fonction : '.$choir_attributions->field( 'attribution.attribution_name' ).
					' || Nom : '.$choir_attributions->field( 'person.person_title' ).' '.
					$choir_attributions->field( 'person.first_name' ).' '.
					$choir_attributions->field( 'person.last_name' ));
					
			}
		}
		?>
		
		<?php
		the_content(); ?>
		<?php
			wp_link_pages( array(
				'before' => '<div class="page-links">' . __( 'Pages:', 'radiate' ),
				'after'  => '</div>',
			) );	
			
		?>
	</div><!-- .entry-content -->

	<footer class="entry-meta">
		<?php if ( 'post' == get_post_type() ) : // Hide category and tag text for pages on Search ?>
			<?php
				/* translators: used between list items, there is a space after the comma */
				$categories_list = get_the_category_list( __( ', ', 'radiate' ) );
				if ( $categories_list && radiate_categorized_blog() ) :
			?>
			<span class="cat-links">
				<?php echo $categories_list; ?>
			</span>
			<?php endif; // End if categories ?>

			<?php
				/* translators: used between list items, there is a space after the comma */
				$tags_list = get_the_tag_list( '', __( ', ', 'radiate' ) );
				if ( $tags_list ) :
			?>
			<span class="tags-links">
				<?php echo $tags_list; ?>
			</span>
			<?php endif; // End if $tags_list ?>
		<?php endif; // End if 'post' == get_post_type() ?>

		<?php if ( ! post_password_required() && ( comments_open() || '0' != get_comments_number() ) ) : ?>
		<span class="comments-link"><?php comments_popup_link( __( 'Leave a comment', 'radiate' ), __( '1 Comment', 'radiate' ), __( '% Comments', 'radiate' ) ); ?></span>
		<?php endif; ?>

		<?php edit_post_link( __( 'Edit', 'radiate' ), '<span class="edit-link">', '</span>' ); ?>
	</footer><!-- .entry-meta -->
</article><!-- #post-## -->
<?php if ( get_theme_mod( 'radiate_author_bio_show', 0 ) == 1 ) { ?>
   <?php if ( get_the_author_meta( 'description' ) ) : ?>
      <div class="author-box clearfix">
         <div class="author-img"><?php echo get_avatar( get_the_author_meta( 'user_email' ), '100' ); ?></div>
            <div class="author-description-wrapper">
               <h4 class="author-name"><?php the_author_meta( 'display_name' ); ?></h4>
               <p class="author-description"><?php the_author_meta( 'description' ); ?></p>
            </div>
      </div>
   <?php endif; ?>
<?php }
 ?>