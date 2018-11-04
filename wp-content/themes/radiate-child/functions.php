<?php
add_action( 'wp_enqueue_scripts', 'my_theme_enqueue_style' );
function my_theme_enqueue_style(){
	wp_enqueue_style( 'radiate', get_template_directory_uri() . '/style.css' );
	wp_enqueue_style( 'radiate', get_template_directory_uri() . '/rtl.css' );
}
?>