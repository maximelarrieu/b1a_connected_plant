<?php
  include_once 'connexion.php';
?>
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Connected Flowers</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div id="intro">
    <h1>Connected Flowers</h1>
  </div>
  <nav>
    <ul>
      <li><a class="active" href="index.php">Accueil</a></li>
      <li><a href="regplants.php">Plantes enregistrées</a></li>
      <li><a href="rasplants.php">Votre plante</a></li>
    </ul>
  </nav>
  <div class="parameters">
    <?php
  		$last = $connexion->prepare('SELECT * FROM registeredplants ORDER BY ID;');
  		$last->execute();
  		while ($plant = $last->fetch()) {
  			$name = $plant['NAME'];
  			$category = $plant['CATEGORY'];
  			$desc = $plant['DESCRIPTION'];
  			$period = $plant['PERIOD'];
  			$humidity = $plant['HUMIDITY'];
  			$temperature = $plant['TEMPERATURE'];
  			$brightness = $plant['BRIGHTNESS'];
  		}
  	?>
    <h2>Dernier ajout</h2>
    <h3><?= $name ?></h3>
    <h4><?= $category ?></h4>
    <h4><?= $period ?></h4>
    <div class="infos">
      <h5>Température :</h5><?php echo $temperature ?>
    </div>
    <div class="infos">
      <h5>Humidité :</h5><?php echo $humidity ?>
    </div>
    <div class="infos">
      <h5>Luminosité :</h5><?php echo $brightness ?>
    </div>
  </div>
  <div class="parameters">
    <h2>Ajouter une plante</h2>
    <?php
      if (isset($_POST['add']) && isset($_POST['plantname']) && isset($_POST['plantype']) && isset($_POST['plantperiod'])) {
        $ajout = $connexion->prepare("
        INSERT INTO
        registeredplants
        VALUES(NULL,'". $_POST['plantname'] ."','". $_POST['plantype'] ."',NULL,NULL,NULL,NULL,NULL,'". $_POST['plantperiod'] ."')"
        );
        try {
          $ajout->execute(array($_POST['plantname'], $_POST['plantype'], $_POST['plantperiod']));
        }
        catch(Exception $e){
          echo 'Message' . $e->getMessage();
        }
      }
    ?>
    <form method="POST">
      <input type="text" name="plantname" placeholder="Nom de votre plante..." required >
      <input type="text" name="plantype" placeholder="Type de votre plante..." required >
      <input type="text" name="plantperiod" placeholder="Période de floraison..." required >
      <input type="submit" value="AJOUTER" name="add" >
    </form>
  </div>
  <div class="parameters">
    <h2>Modifier une plante</h2>
    <form method="POST">
      <select name="plantmodif">
        <?php
          $menu = $connexion->prepare('SELECT NAME FROM registeredplants ORDER BY NAME;');
          $menu->execute();
          $selectedplant = $menu->fetchAll();
          foreach ($selectedplant as $choice) {
            echo '<option>'. $choice['NAME'] .'</option>';
          }
        ?>
      </select>
      <input type="text" name="newname" id="newname" placeholder="Modifier nom de plante...">
      <?php
        if(isset($_POST['newname']) && isset($_POST['plantmodif'])) {
          $modif = $connexion->prepare('UPDATE registeredplants SET NAME = "'.$_POST['newname'].'" WHERE name="'.$_POST['plantmodif'].'"');
          $modif->execute();
        }
      ?>
      <input type="submit" value="MODIFIER" name="new">
    </form>
    <h2>Supprimer une plante</h2>
    <form method="POST">
      <select name="plantselect" id="plantselect">
        <?php
          $list = $connexion->prepare('SELECT NAME FROM registeredplants ORDER BY NAME;');
          $list->execute();
          $listedplant = $list->fetchAll();
          foreach ($listedplant as $choicep) {
            echo '<option>'. $choicep['NAME'] .'</option>';
          }
        ?>
      </select>
      <input type="submit" value="SUPPRIMER" name="del">
      <?php
        if(isset($_POST['del']) && isset($_POST['plantselect'])) {
          $delete = $connexion->prepare('DELETE FROM registeredplants WHERE NAME = "'.$_POST['plantselect'].'"');
          $delete->execute();
        }
      ?>
    </form>
  </div>
</body>
</html>
