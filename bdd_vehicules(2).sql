-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 04 Juin 2024 à 01:08
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdd_vehicules`
--

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

CREATE TABLE `achats` (
  `achat_id` int(11) NOT NULL,
  `prixAchat` int(11) NOT NULL,
  `dateAchat` varchar(255) NOT NULL,
  `vehicule_id` int(11) NOT NULL,
  `nipVendeur` varchar(255) NOT NULL,
  `nipAchateur` varchar(255) NOT NULL,
  `create_at` varchar(255) NOT NULL,
  `update_at` varchar(255) NOT NULL,
  `statutAchats` varchar(255) NOT NULL DEFAULT 'actif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `modeles`
--

CREATE TABLE `modeles` (
  `modele_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `typeVehicule_id` varchar(100) DEFAULT NULL,
  `dateEnregistrement` varchar(255) NOT NULL,
  `statutModele` varchar(255) NOT NULL DEFAULT 'actif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `modeles`
--

INSERT INTO `modeles` (`modele_id`, `nom`, `typeVehicule_id`, `dateEnregistrement`, `statutModele`) VALUES
(1, 'Toyota', '1', '', 'actif'),
(2, 'Honda', '1', '', 'actif'),
(3, 'Ford', '1', '', 'actif'),
(4, 'Chevrolet', '1', '', 'actif'),
(5, 'Nissan', '1', '', 'actif'),
(6, 'Toyota', '2', '', 'actif'),
(7, 'Honda', '2', '', 'actif'),
(8, 'Tesla', '2', '', 'actif'),
(9, 'BMW', '2', '', 'actif'),
(10, 'Mercedes-Benz', '2', '', 'actif'),
(11, 'Ford', '3', '', 'actif'),
(12, 'Chevrolet', '3', '', 'actif'),
(13, 'Ram', '3', '', 'actif'),
(14, 'GMC', '3', '', 'actif'),
(15, 'Toyota', '3', '', 'actif'),
(16, 'Ford', '4', '', 'actif'),
(17, 'Chevrolet', '4', '', 'actif'),
(18, 'BMW', '4', '', 'actif'),
(19, 'Audi', '4', '', 'actif'),
(20, 'Mercedes-Benz', '4', '', 'actif'),
(21, 'Mazda', '5', '', 'actif'),
(22, 'BMW', '5', '', 'actif'),
(23, 'Porsche', '5', '', 'actif'),
(24, 'Audi', '5', '', 'actif'),
(25, 'Mercedes-Benz', '5', '', 'actif'),
(26, 'Volvo', '6', '', 'actif'),
(27, 'Subaru', '6', '', 'actif'),
(28, 'Audi', '6', '', 'actif');

-- --------------------------------------------------------

--
-- Structure de la table `proprietaires`
--

CREATE TABLE `proprietaires` (
  `proprietaire_id` int(11) NOT NULL,
  `nipPropietaire` varchar(255) NOT NULL,
  `nipChauffeur` varchar(255) NOT NULL,
  `vehicule_id` int(11) NOT NULL,
  `create_at` varchar(255) NOT NULL,
  `update_at` varchar(255) NOT NULL,
  `statutPropiertaire` varchar(255) NOT NULL DEFAULT 'actif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `types_vehicules`
--

CREATE TABLE `types_vehicules` (
  `typeVehicule_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `types_vehicules`
--

INSERT INTO `types_vehicules` (`typeVehicule_id`, `nom`) VALUES
(1, 'SUV'),
(2, 'Berline'),
(3, 'Camion'),
(4, 'Coupé'),
(5, 'Cabriolet'),
(6, 'Break'),
(7, 'Monospace'),
(8, 'Pick-up'),
(9, 'Van'),
(10, 'Moto');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `vehicule_id` int(11) NOT NULL,
  `serie` varchar(255) NOT NULL,
  `plaque` varchar(255) NOT NULL,
  `couleur` varchar(50) DEFAULT NULL,
  `marque` varchar(255) NOT NULL,
  `typeVehicule_id` int(11) NOT NULL,
  `chassis` varchar(50) DEFAULT NULL,
  `photoDevant` varchar(255) DEFAULT NULL,
  `photoArriere` varchar(255) DEFAULT NULL,
  `profilDroit` varchar(255) DEFAULT NULL,
  `profilGauche` varchar(255) DEFAULT NULL,
  `nbreChevaux` varchar(255) NOT NULL,
  `dateMiseEnService` varchar(255) NOT NULL,
  `typeUsage` varchar(255) NOT NULL,
  `policeAssurance` varchar(255) NOT NULL,
  `validiteAssurance` varchar(255) NOT NULL,
  `modele_id` int(11) DEFAULT NULL,
  `proprietaire_id` int(11) DEFAULT NULL,
  `create_at` varchar(255) NOT NULL,
  `update_at` varchar(255) NOT NULL,
  `statutVehicule` varchar(255) NOT NULL DEFAULT 'actif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`achat_id`);

--
-- Index pour la table `modeles`
--
ALTER TABLE `modeles`
  ADD PRIMARY KEY (`modele_id`);

--
-- Index pour la table `proprietaires`
--
ALTER TABLE `proprietaires`
  ADD PRIMARY KEY (`proprietaire_id`);

--
-- Index pour la table `types_vehicules`
--
ALTER TABLE `types_vehicules`
  ADD PRIMARY KEY (`typeVehicule_id`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`vehicule_id`),
  ADD KEY `modele_id` (`modele_id`),
  ADD KEY `proprietaire_id` (`proprietaire_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `achats`
--
ALTER TABLE `achats`
  MODIFY `achat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `modeles`
--
ALTER TABLE `modeles`
  MODIFY `modele_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `proprietaires`
--
ALTER TABLE `proprietaires`
  MODIFY `proprietaire_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `types_vehicules`
--
ALTER TABLE `types_vehicules`
  MODIFY `typeVehicule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `vehicule_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD CONSTRAINT `vehicules_ibfk_1` FOREIGN KEY (`modele_id`) REFERENCES `modeles` (`modele_id`),
  ADD CONSTRAINT `vehicules_ibfk_2` FOREIGN KEY (`proprietaire_id`) REFERENCES `proprietaires` (`proprietaire_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
