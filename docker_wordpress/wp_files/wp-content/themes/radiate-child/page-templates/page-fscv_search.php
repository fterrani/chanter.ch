<?php
/**
 * Template Name: Page de recherche de choeur
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">
			<h1> Rechecher un choeur </h1>
			</br>
			<!-- Search form -->				
				<form method="POST" style="background-color:white; padding-left:1em">
					Nom du choeur  <input type="text" name="name_choir" style="margin:2em; padding-left:0.5em">
					</br>
					Langue du choeur  
						<input type="radio" name="lang" value="all" checked style="margin:0.5em">Tous
						<input type="radio" name="lang" value="fr" style="margin:0.5em">Français
						<input type="radio" name="lang" value="de" style="margin:0.5em">Allemand
					</br>
					</br>
					<!-- Pods has troubles to filter requests on relationfields with multiple entries
					Dans l'USC ?  
						<input type="radio" name="usc" value="" checked>Tous
						<input type="radio" name="usc" value="oui">Oui
						<input type="radio" name="usc" value="non">Non
					</br>
					Dans quel groupe ?
						<select name="group">
							<option value="all">Tous
							<option value="gscbv">Groupement des Sociétés de Chant du Bas-Valais
							<option value="ucc">Union des Chorales du Centre
							<option value="gcvc">Groupement des Chanteurs du Valais Central
							<option value="ocv">Oberwalliser Chor- und Cäcilien Verband				
						</select>
					</br> -->
					Type de choeur  
						<select name="type" style="margin:1em">
							<option value="all">Tous
							<option value="Hommes">Hommes
							<option value="Femmes">Femmes
							<option value="Mixte">Mixte
							<option value="Jeunes">Jeunes			
						</select>
					</br>
					Jour de répétition  
						<select name="day" style="margin:1em">
							<option value="all">Tous
							<option value="lu">Lundi
							<option value="ma">Mardi
							<option value="me">Mercredi
							<option value="je">Jeudi			
							<option value="ve">Vendredi			
							<option value="sa">Samedi			
							<option value="di">Dimanche			
						</select>
					</br>
					<input type="submit" name="submit" value="Rechercher" style="margin:1em">

				</form>
				</br>
				</br>
				<?php			
				//Retrieving values from the form
				if ($_SERVER['REQUEST_METHOD'] === 'POST') {
					$name = 't.post_title LIKE "%'.$_POST['name_choir'].'%"';
					/* Pods has troubles to filter requests on relationfields with multiple entries
					if($_POST['usc'] == 'oui'){
						$usc = 'organization.organization_name = "USC" OR organization.post_title = "USC"';
					}
					else if($_POST['usc'] == 'non'){
						$usc = 'organization.organization_name NOT LIKE "USC" OR organization.post_title NOT LIKE "USC"';
					}
					if($_POST['group'] != 'all'){
						$group = 'organization.organization_name LIKE "'.$_POST['group'].'" OR organization.post_title LIKE "'.$_POST['group'].'"';
					}
					*/
					if($_POST['lang'] != 'all'){
						$language = 'language LIKE "'.$_POST['lang'].'"';
					}
					
					if($_POST['type'] != 'all'){
						$type = 'choir_type LIKE "'.$_POST['type'].'"';
					}
					
					if($_POST['day'] != 'all'){
						$day_rehearsal = 'rehearsal_day LIKE "'.$_POST['day'].'"';			
					}

					//Forging Pods where statement
					$where = $where.$name;
					/* Pods has troubles to filter requests on relationfields with multiple entries
					if($usc != ''){
						$where = $where.' AND '.$usc;
					}
					if($group != ''){
						$where = $where.' AND '.$group;
					}
					*/
					if($lang != ''){
						$where = $where.' AND '.$language;
					}
					if($type != ''){
						$where = $where.' AND '.$type;
					}
					if($day_rehearsal != ''){
						$where = $where.' AND '.$day_rehearsal;
					}
																
					//Setting params
					$params = array(
						'where' => $where,
						'limit' => -1,
						'orderby' => 'post_title ASC'
					);
												
					//Getting choirs according to params						
					$choirs = pods('fscv_choir', $params);
					
					if($choirs->total() > 0){	?>
					<table>
						<tr style="background-color:lightyellow">
							<th>Nom</th>
							<th>Ville</th>
							<th>Adresse</th>
							<th>Type</th>
							<th>Site internet</th>
							<th>Détails</th>
						</tr>
					<?php 
					//Display choirs
					while($choirs->fetch()){ ?>
						<tr style="background-color:white">
							<td><?php echo $choirs->display('post_title') ?></td> <!-- Name -->
							<td><?php echo $choirs->display('postcode').' '.$choirs->display('locality') ?></td> <!-- Ville -->
							<td><?php echo $choirs->display('street') ?></td> <!-- Address -->
							<td><?php echo $choirs->display('choir_type') ?></td> <!-- Type -->
							<td><?php $esc_url = htmlspecialchars($choirs->display('website'));?>
								<a href="<?=$esc_url?>"><?=$esc_url?></a></td> <!-- Website -->
							<td><?php $esc_postlink = get_permalink($choirs->display('id'))?>
								<a href="<?=$esc_postlink?>">Voir la page</a></td> <!-- Details -->
						</tr>
				<?php	
				} ?>
					</table>
					
					<?php 
					}
					else { ?>
					<h3> Aucun résultat pour cette recherche. <h3>	
			<?php	}
					?>								
		<?php	}
			?>
		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer();