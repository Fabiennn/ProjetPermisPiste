-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 14 juin 2021 à 21:17
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP :  7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetpermis`
--
CREATE DATABASE IF NOT EXISTS `projetpermis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projetpermis`;

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `id` int(11) NOT NULL,
  `fk_action` int(11) DEFAULT NULL,
  `wording` char(25) DEFAULT NULL,
  `score_minimum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`id`, `fk_action`, `wording`, `score_minimum`) VALUES
(1, NULL, 'Se mettre en tenue', 1),
(2, 1, 'Préparation véhicule', 3),
(3, 2, 'Effectuer manoeuvre', 6),
(4, NULL, 'Analyser panne(s)', 2),
(5, 4, 'Resoudre panne(s)', 4),
(20, NULL, 'Action supprimée', 0);

-- --------------------------------------------------------

--
-- Structure de la table `action__mission`
--

CREATE TABLE `action__mission` (
  `fk_action` int(11) NOT NULL,
  `fk_mission` int(11) NOT NULL,
  `id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `action__mission`
--

INSERT INTO `action__mission` (`fk_action`, `fk_mission`, `id`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(2, 1, NULL),
(2, 2, NULL),
(3, 1, NULL),
(4, 1, NULL),
(4, 2, NULL),
(5, 1, NULL),
(5, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(110),
(110),
(110),
(110),
(110),
(110);

-- --------------------------------------------------------

--
-- Structure de la table `indicator`
--

CREATE TABLE `indicator` (
  `id` int(11) NOT NULL,
  `fk_action` int(11) NOT NULL,
  `wording` char(50) DEFAULT NULL,
  `value_if_check` int(11) DEFAULT NULL,
  `value_if_uncheck` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `indicator`
--

INSERT INTO `indicator` (`id`, `fk_action`, `wording`, `value_if_check`, `value_if_uncheck`) VALUES
(1, 1, 'Prendre ses outils', 2, -1),
(2, 1, 'Prendre des explosifs', -1, 2),
(3, 3, 'Conduire à 110 km/h', -2, 2),
(4, 3, 'Conduire les yeux ouverts', 3, -6),
(5, 3, 'Avoir les deux mains sur le volant', 1, 0),
(6, 4, 'S\'informer auprès des techniciens', 2, 0),
(7, 4, 'Consulter le manuel', 1, 0),
(8, 4, 'Respecter la procédure', 2, -2),
(9, 4, 'Demander de l\'aide à la tour de controle', -2, 0),
(20, 2, 'Ajouter les outils', 6, -2),
(21, 2, 'Vérifier la pression des pneus', -2, 1),
(22, 2, 'Ajuster son siège', 3, -1),
(23, 3, 'Jouer aux auto-temponneuses', -3, 3),
(24, 3, 'Manger le déssert', -2, 2),
(25, 5, 'Insulter les techniciens', -3, 1),
(26, 5, 'Aller dans le garage', 1, -2),
(27, 5, 'Taper le matériel', -2, 3),
(28, 5, 'Prendre les boites à outils des autres', -3, 5),
(29, 5, 'Porter des gants', 3, -1);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `fk_learner` int(11) NOT NULL,
  `fk_mission` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `fk_learner`, `fk_mission`, `date`) VALUES
(88, 16, 1, '2021-06-14'),
(89, 16, 1, '2021-06-14'),
(90, 16, 2, '2021-06-14'),
(91, 16, 2, '2021-06-14');

-- --------------------------------------------------------

--
-- Structure de la table `inscription__action`
--

CREATE TABLE `inscription__action` (
  `id` int(11) NOT NULL,
  `fk_inscription` int(11) NOT NULL,
  `fk_action` int(11) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `inscription__action`
--

INSERT INTO `inscription__action` (`id`, `fk_inscription`, `fk_action`, `sort`, `score`) VALUES
(92, 88, 1, 1, 1),
(93, 88, 2, 1, 10),
(94, 88, 3, 1, 6),
(95, 88, 4, -1, -2),
(96, 88, 5, 1, 12),
(97, 90, 1, 1, 1),
(98, 90, 2, 1, 10),
(99, 90, 4, 1, 2),
(100, 90, 5, -1, 4),
(101, 91, 1, 1, 4),
(102, 91, 2, -1, -1),
(103, 91, 4, 1, 3),
(104, 91, 5, 1, 13),
(105, 89, 1, 1, 4),
(106, 89, 2, 1, 10),
(107, 89, 3, 1, 10),
(108, 89, 4, 1, 5),
(109, 89, 5, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `learner`
--

CREATE TABLE `learner` (
  `id` int(11) NOT NULL,
  `surname` char(25) DEFAULT NULL,
  `forname` char(25) DEFAULT NULL,
  `salt` char(100) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `mdp` char(80) DEFAULT NULL,
  `role` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `learner`
--

INSERT INTO `learner` (`id`, `surname`, `forname`, `salt`, `email`, `mdp`, `role`) VALUES
(1, 'Doe', 'John', 'nC+LkxSBRR5r/uSLrtB7MB7laCpEWRs5uUpLm3N2JqA=', 'john.doe@email.com', 'WFGexk0cocZHcs7qJuPawA==', 'admin'),
(15, 'Fabien', 'Goubin', 'nC+LkxSBRR5r/uSLrtB7MB7laCpEWRs5uUpLm3N2JqA=', 'fabien.goubin@email.com', 'WFGexk0cocZHcs7qJuPawA==', 'apprenant'),
(16, 'Felix', 'Geffrault', 'nC+LkxSBRR5r/uSLrtB7MB7laCpEWRs5uUpLm3N2JqA=', 'felix.geffrault@email.com', 'WFGexk0cocZHcs7qJuPawA==', 'apprenant');

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

CREATE TABLE `mission` (
  `id` int(11) NOT NULL,
  `wording` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mission`
--

INSERT INTO `mission` (`id`, `wording`) VALUES
(1, 'Mission A'),
(2, 'Ma nouvelle mission');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Act_KEY_FK_ACTION_PREDECESSOR` (`fk_action`);

--
-- Index pour la table `action__mission`
--
ALTER TABLE `action__mission`
  ADD PRIMARY KEY (`fk_action`,`fk_mission`),
  ADD KEY `MisGoa_KEY_FK_MISSION` (`fk_mission`),
  ADD KEY `ActGoa_KEY_FK_ACTION` (`fk_action`);

--
-- Index pour la table `indicator`
--
ALTER TABLE `indicator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ind_KEY_FK_ACTION` (`fk_action`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ins_KEY_FK_LEARNER` (`fk_learner`),
  ADD KEY `Ins_KEY_FK_GAME` (`fk_mission`);

--
-- Index pour la table `inscription__action`
--
ALTER TABLE `inscription__action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `LeaAct_KEY_FK_INSCRIPTION` (`fk_inscription`),
  ADD KEY `LeaAct_KEY_FK_ACTION` (`fk_action`);

--
-- Index pour la table `learner`
--
ALTER TABLE `learner`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mission`
--
ALTER TABLE `mission`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `indicator`
--
ALTER TABLE `indicator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT pour la table `inscription__action`
--
ALTER TABLE `inscription__action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT pour la table `learner`
--
ALTER TABLE `learner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `mission`
--
ALTER TABLE `mission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `action`
--
ALTER TABLE `action`
  ADD CONSTRAINT `Act_FK_ACTION` FOREIGN KEY (`fk_action`) REFERENCES `action` (`id`);

--
-- Contraintes pour la table `action__mission`
--
ALTER TABLE `action__mission`
  ADD CONSTRAINT `ActGoa_FK_ACTION` FOREIGN KEY (`fk_action`) REFERENCES `action` (`id`),
  ADD CONSTRAINT `ActGoa_FK_MISSION` FOREIGN KEY (`fk_mission`) REFERENCES `mission` (`id`);

--
-- Contraintes pour la table `indicator`
--
ALTER TABLE `indicator`
  ADD CONSTRAINT `Ind_FK_ACTION` FOREIGN KEY (`fk_action`) REFERENCES `action` (`id`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `Ins_FK_LEARNER` FOREIGN KEY (`fk_learner`) REFERENCES `learner` (`id`),
  ADD CONSTRAINT `Ins_FK_MISSION` FOREIGN KEY (`fk_mission`) REFERENCES `mission` (`id`);

--
-- Contraintes pour la table `inscription__action`
--
ALTER TABLE `inscription__action`
  ADD CONSTRAINT `LeaAct_FK_ACTION` FOREIGN KEY (`fk_action`) REFERENCES `action` (`id`),
  ADD CONSTRAINT `LeaAct_FK_INSCRIPTION` FOREIGN KEY (`fk_inscription`) REFERENCES `inscription` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
