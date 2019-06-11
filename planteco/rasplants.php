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
      <li><a href="index.php">Accueil</a></li>
      <li><a href="regplants.php">Plantes enregistrées</a></li>
      <li><a class="active" href="rasplants.php">Votre plante</a></li>
    </ul>
  </nav>
  <div id="theplant">
    <h2>Votre plante connectée</h2>
    <div class="details">
      <h3>Température :</h3><p><?php echo "20" ?>°C</p>
    </div>
    <div class="details">
      <h3>Luminosité :</h3><p><?php echo "70" ?>Lux</p>
    </div>
    <div class="details">
      <h3>Humidité :</h3><p><?php echo "10" ?>%</p>
    </div>
  </div>
  <div id='tab'>
    <h3>Historique</h3>
    <table>
      <tr>
        <th>Date et heure</th>
        <th>Température</th>
        <th>Humidité</th>
        <th>Luminosité</th>
      </tr>
      <?php
        $capt = $connexion->prepare('SELECT * FROM rasplants;');
        $capt->execute();
        $captplant = $capt->fetchAll();
        foreach ($captplant as $info) {
          echo '<tr>';
          echo '<td>'. $info['Date'] .'</td>';
          echo '<td>'. $info['Humidity'] .'</td>';
          echo '<td>'. $info['Luminosity'] .'</td>';
          echo '<td>'. $info['Temperature'] .'</td>';
          echo '</tr>';
        }
      ?>
    </table>
  </div>
</body>
</html>
