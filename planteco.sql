-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 10 juin 2019 à 15:00
-- Version du serveur :  5.7.24
-- Version de PHP :  7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `planteco`
--

-- --------------------------------------------------------

--
-- Structure de la table `rasperryplants`
--

DROP TABLE IF EXISTS `rasperryplants`;
CREATE TABLE IF NOT EXISTS `rasperryplants` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `Humidity` int(11) NOT NULL,
  `Luminosity` int(11) NOT NULL,
  `Temperature` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `registeredplants`
--

DROP TABLE IF EXISTS `registeredplants`;
CREATE TABLE IF NOT EXISTS `registeredplants` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `CATEGORY` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `PHOTOS` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HUMIDITY` int(11) DEFAULT NULL,
  `TEMPERATURE` int(11) DEFAULT NULL,
  `BRIGHTNESS` int(11) DEFAULT NULL,
  `PERIOD` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `registeredplants`
--

INSERT INTO `registeredplants` (`ID`, `NAME`, `CATEGORY`, `DESCRIPTION`, `PHOTOS`, `HUMIDITY`, `TEMPERATURE`, `BRIGHTNESS`, `PERIOD`) VALUES
(1, 'Prunier D\'enten', 'Fruitier', 'L’arbre a un port semi-dressé, bien vigoureux, sa productivité est abondante et régulière. La récolte s’effectue d’août à septembre, à maturité des fruits. Les pruniers sont particulièrement peu exigeants vis-à-vis du terrain et du climat mise à part les situations en terrains trop argileux ou trop à l’ombre. Ils sont faciles d’entretien, résistants aux maladies et à la sécheresse.', NULL, 20, 15, 70, 'Printemps'),
(2, 'Lagerstroemia \'Soir d\'Eté', 'Fleur', 'La floraison délicate et très douce par ses tons pastels de rose dragée apparait par de très nombreuses thyrses vaporeuses et s\'étend jusqu\'à l\'automne. Pour bien se développer et résister au froid, le Lagerstroemia doit être placé en situation chaude et ensoleillée, dans un sol drainant. Cette plante résiste très bien à la pollution des villes et se plaît aussi en bord de mer.', NULL, 0, 20, 50, 'Été'),
(13, 'Plantest', 'Fleur', NULL, NULL, NULL, NULL, NULL, 'Automne');

-- --------------------------------------------------------

--
-- Structure de la table `spec plante`
--

DROP TABLE IF EXISTS `spec plante`;
CREATE TABLE IF NOT EXISTS `spec plante` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Catégorie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Photos` int(11) DEFAULT NULL,
  `Humidité sol optimale` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Température optimale` int(40) UNSIGNED NOT NULL,
  `Luminosité optimale` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Période de floraison` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Période de floraison` (`Période de floraison`),
  KEY `Catégorie` (`Catégorie`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `spec plante`
--

INSERT INTO `spec plante` (`ID`, `Nom`, `Catégorie`, `Description`, `Photos`, `Humidité sol optimale`, `Température optimale`, `Luminosité optimale`, `Période de floraison`) VALUES
(1, 'Prunier D\'enten', 'Fruitier', 'L’arbre a un port semi-dressé, bien vigoureux, sa productivité est abondante et régulière. La récolte s’effectue d’août à septembre, à maturité des fruits. Les pruniers sont particulièrement peu exigeants vis-à-vis du terrain et du climat mise à part les situations en terrains trop argileux ou trop à l’ombre. Ils sont faciles d’entretien, résistants aux maladies et à la sécheresse.', NULL, 'Normal', 15, 'Soleil', 'Printemps'),
(2, 'Lagerstroemia \'Soir d\'Eté\'', 'Fleur', 'La floraison délicate et très douce par ses tons pastels de rose dragée apparait par de très nombreuses thyrses vaporeuses et s\'étend jusqu\'à l\'automne. Pour bien se développer et résister au froid, le Lagerstroemia doit être placé en situation chaude et ensoleillée, dans un sol drainant. Cette plante résiste très bien à la pollution des villes et se plaît aussi en bord de mer.', NULL, 'Sec', 20, 'Soleil', 'Été'),
(3, 'Mimosa', 'Fleur', 'Cet arbuste a des feuilles persistantes fines et découpées, d\'un vert grisé. La floraison, en longs panicules très parfumés, apparaît de décembre à mars et est extrêmement abondante.', NULL, 'Normal', 8, 'Soleil', 'Hiver'),
(4, 'Abricotier Bergeron', 'Fruitier', 'Il est bon producteur et donne une mise à fruit rapide. Sa floraison est demi-tardive. Aussi, il est recommandé dans les régions un peu froides. Ses abricots, de bonne grosseur, ont une forme légèrement oblongue ainsi qu\'une belle coloration jaune orangé et rouge. La chair est de bonne qualité, ferme. Cette variété d\'abricotier est autofertile (ne nécessite pas d’autres arbres pour être pollinisé).', NULL, 'Normal', 15, 'Soleil', 'Printemps'),
(5, 'Passiflore', 'Fleur', 'Ses fleurs mesurent entre 7 et 10 cm de diamètre et sont très graphiques et colorées de blanc, pourpre et bleu violacé. La passiflore agrippe ses tiges volubiles pour grimper le long d\'un muret ou d\'une pergola. Elle se cultive également en pot guidée par un treillage. Cette plante grimpante apporte un peu d\'exotisme dans le jardin.', NULL, 'Sec', 20, 'Soleil', 'Été'),
(6, 'Ciste pourpre', 'Fleur', 'Le cistus prend la forme d’un arbuste buissonnant, compact et persistant en climat doux. Ses feuilles sont d\'une jolie teinte gris-vert. Il se recouvre littéralement de grandes fleurs roses tâchetées de rouge au printemps. Les pétales ont un aspect chiffoné délicat. Associez la avec d\'autres arbustes méditerranéens comme des lavandes, des santolines, des potentilles...', NULL, 'Normal', 15, 'Soleil', 'Printemps'),
(7, 'Chamaerops humilis', 'Arbuste', 'Ce palmier produit de belles feuilles en éventail de couleur vert clair sur le dessus et souvent légèrement laineuses dessous (fibres blanchâtres', NULL, 'Normal', 20, 'Soleil', 'Été/Automne'),
(8, 'Pheonix des canaries', 'Arbuste', 'Les palmes vertes, brillantes, pouvant atteindre 4 m de long, sortent d\'un tronc massif, brun foncé. Vous pouvez le garder à l\'extérieur avec des protection contre le froid si des gelées sont prévues. On peut aussi le cultiver en véranda ou dans une pièce très lumineuse mais peu chauffée.', NULL, 'Normal', 15, 'Mi-ombre', 'Printemps/Été/Automne/Hiver'),
(9, 'Delosperma Nubigenum', 'Fleur', 'Le Pourpier exige un sol chaud et une situation ensoleillé.\r\nCette espèce rampante est un magnifique couvre-sol mais peut aussi être utilisée en grimpante.\r\nSes rameaux courts, vêtus de feuilles charnues, vert clair, portent des fleurs allant du jaune vif au vermillon.\r\nLe pourpier exigera d\'être protègé des gelées..', NULL, 'Sec', 20, 'Soleil', 'Été'),
(10, 'Lime de Tahiti', 'Fruitier', 'La lime de Tahiti est un agrume vigoureux au port buissonnant. Il possède un beau feuillage persistant vert foncé qui dégage un doux parfum lorsque l\'on frotte ses feuilles. La floraison printanière révèle de nombreuses petites fleurs blanches très parfumées entre mars et avril. Il donne ensuite des fruits ressemblant à des petits citrons. L\'écorce ainsi que la chair sont de couleur vert avec la pulpe très juteuse et acide. Les fruits se récoltent entre le mois d\'octobre et le mois de décembre et s\'utilisent en cuisine pour leur zeste et leur jus.', NULL, 'Normal', 15, 'Mi-ombre', 'Printemps'),
(11, 'Laurier rose à fleurs', 'Fleur', 'Le laurier est un grand arbuste de soleil, très florifère qui aime les terres bien drainées. Ses feuilles sont allongées, fines, vert brillant. Il offre de très belles fleurs simples, roses. A la plantation, utiliser un terreau spécial plantes méditerranéennes ou un mélange composé d\'1/3 de terreau, 1/3 de terre de jardin et 1/3 de billes d\'argile pour le drainage. Utilisation en bac, en isolé, en haie ou en massif.', NULL, 'Normal', 25, 'Soleil', 'Été');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
