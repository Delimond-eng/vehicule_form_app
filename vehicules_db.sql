-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 19 juin 2024 à 01:24
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vehicules_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

CREATE TABLE `achats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `achat_prix` varchar(255) NOT NULL,
  `devise` varchar(255) NOT NULL DEFAULT 'CDF',
  `achat_date` timestamp NULL DEFAULT NULL,
  `nip_acheteur` varchar(255) NOT NULL,
  `nom_vendeur` varchar(255) NOT NULL,
  `telephone_vendeur` varchar(255) NOT NULL,
  `email_vendeur` varchar(255) DEFAULT NULL,
  `adresse_vendeur` varchar(255) NOT NULL,
  `vehicule_id` bigint(20) UNSIGNED NOT NULL,
  `vehicule_npi` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'actif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `assurances`
--

CREATE TABLE `assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero_police` varchar(255) NOT NULL,
  `nom_assureur` varchar(255) NOT NULL,
  `date_validite` timestamp NULL DEFAULT NULL,
  `type_assurance_id` bigint(20) UNSIGNED NOT NULL,
  `vehicule_id` bigint(20) UNSIGNED NOT NULL,
  `vehicule_npi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marques`
--

CREATE TABLE `marques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `marque_libelle` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marques`
--

INSERT INTO `marques` (`id`, `marque_libelle`, `created_at`, `updated_at`) VALUES
(1, 'Abarth', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(2, 'Acura', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(3, 'Alfa Romeo', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(4, 'Aston Martin', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(5, 'Audi', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(6, 'Bentley', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(7, 'BMW', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(8, 'Bugatti', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(9, 'Buick', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(10, 'Cadillac', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(11, 'Chevrolet', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(12, 'Chrysler', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(13, 'Citroën', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(14, 'Dacia', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(15, 'Daewoo', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(16, 'Daihatsu', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(17, 'Dodge', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(18, 'Ferrari', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(19, 'Fiat', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(20, 'Ford', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(21, 'Genesis', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(22, 'GMC', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(23, 'Honda', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(24, 'Hyundai', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(25, 'Infiniti', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(26, 'Isuzu', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(27, 'Jaguar', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(28, 'Jeep', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(29, 'Kia', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(30, 'Koenigsegg', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(31, 'Lamborghini', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(32, 'Lancia', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(33, 'Land Rover', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(34, 'Lexus', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(35, 'Lincoln', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(36, 'Lotus', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(37, 'Maserati', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(38, 'Mazda', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(39, 'McLaren', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(40, 'Mercedes-Benz', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(41, 'Mini', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(42, 'Mitsubishi', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(43, 'Nissan', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(44, 'Pagani', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(45, 'Peugeot', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(46, 'Porsche', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(47, 'Ram', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(48, 'Renault', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(49, 'Rolls-Royce', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(50, 'Saab', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(51, 'Subaru', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(52, 'Suzuki', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(53, 'Tesla', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(54, 'Toyota', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(55, 'Volkswagen', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(56, 'Volvo', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(57, 'Alpina', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(58, 'Apollo', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(59, 'Arrinera', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(60, 'Ascari', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(61, 'Baojun', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(62, 'Bollinger', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(63, 'Borgward', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(64, 'Brilliance', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(65, 'BYD', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(66, 'Caterham', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(67, 'Changan', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(68, 'Chery', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(69, 'De Tomaso', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(70, 'DMC', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(71, 'DS Automobiles', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(72, 'Faraday Future', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(73, 'Fisker', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(74, 'Geely', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(75, 'Ginetta', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(76, 'Great Wall', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(77, 'Haval', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(78, 'Hennessey', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(79, 'Hispano Suiza', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(80, 'Hongqi', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(81, 'Hummer', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(82, 'JAC', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(83, 'Karma', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(84, 'Lucid', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(85, 'Mahindra', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(86, 'Marussia', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(87, 'MG', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(88, 'Nio', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(89, 'Opel', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(90, 'Perodua', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(91, 'Proton', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(92, 'Qoros', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(93, 'Rimac', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(94, 'Rivian', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(95, 'Roewe', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(96, 'SEAT', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(97, 'SRT', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(98, 'SSC North America', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(99, 'Tata', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(100, 'Troller', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(101, 'Vauxhall', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(102, 'Venucia', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(103, 'VinFast', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(104, 'Wiesmann', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(105, 'Wuling', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(106, 'XPeng', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(107, 'Zotye', '2024-06-18 22:22:45', '2024-06-18 22:22:45');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_06_11_183012_create_achats_table', 1),
(6, '2024_06_11_184253_create_vehicule_types_table', 1),
(7, '2024_06_11_185254_create_proprietaires_table', 1),
(8, '2024_06_11_185532_create_vehicules_table', 1),
(9, '2024_06_18_131549_create_marques_table', 1),
(10, '2024_06_18_152024_create_assurances_table', 1),
(11, '2024_06_18_152050_create_type_assurances_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `proprietaires`
--

CREATE TABLE `proprietaires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nip_proprietaire` varchar(255) NOT NULL,
  `nip_chauffeur` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'actif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_assurances`
--

CREATE TABLE `type_assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_assurance_libelle` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_assurances`
--

INSERT INTO `type_assurances` (`id`, `type_assurance_libelle`, `created_at`, `updated_at`) VALUES
(1, 'Assurance automobile', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(2, 'Assurance moto', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(3, 'Assurance camion', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(4, 'Assurance véhicule de loisirs', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(5, 'Assurance flotte automobile', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(6, 'Assurance taxi ou VTC', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(7, 'Assurance transport de marchandises', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(8, 'Assurance engins agricoles ou de chantier', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(9, 'Assurance véhicules de collection', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(10, 'Assurance véhicules électriques ou hybrides', '2024-06-18 22:22:45', '2024-06-18 22:22:45');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Gaston Delimond', 'gastondelimond@gmail.com', NULL, '$2y$10$QRyT5AUX7n3U8m6Q0B31sOZjAQ/.UXH2VyzUxGx/dmrg1lmvsUNrS', NULL, NULL, NULL),
(2, 'Lionnel Nawej', 'lionnelnawej@gmail.com', NULL, '$2y$10$vz92qNIJ4PTWW1heanvL1ODrhlwMd./BUWD0rFTBPPSaU6WvJP/Z2', NULL, NULL, NULL),
(3, 'Admin', 'admin@gmail.com', NULL, '$2y$10$APt5HkpgYIkkrUlXqPQofu6UEAkPwFFJm2qkmxjam3A00SMRDdGvu', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `serie` varchar(255) NOT NULL,
  `plaque` varchar(255) NOT NULL,
  `couleur` varchar(255) NOT NULL,
  `chassis` varchar(255) NOT NULL,
  `modele` varchar(255) NOT NULL,
  `photo_avant` varchar(255) NOT NULL,
  `photo_arriere` varchar(255) NOT NULL,
  `profil_droit` varchar(255) NOT NULL,
  `profil_gauche` varchar(255) NOT NULL,
  `nbre_chevaux` varchar(255) NOT NULL,
  `date_debut_service` varchar(255) NOT NULL,
  `validite_assurance` varchar(255) DEFAULT NULL,
  `police_assurance` varchar(255) DEFAULT NULL,
  `type_usage` varchar(255) NOT NULL,
  `vehicule_type_id` bigint(20) UNSIGNED NOT NULL,
  `marque_id` bigint(20) UNSIGNED NOT NULL,
  `proprietaire_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'actif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_types`
--

CREATE TABLE `vehicule_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vehicule_type_libelle` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'actif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicule_types`
--

INSERT INTO `vehicule_types` (`id`, `vehicule_type_libelle`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SUV', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(2, 'Berline', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(3, 'Camion', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(4, 'Coupé', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(5, 'Cabriolet', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(6, 'Break', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(7, 'Monospace', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(8, 'Pick-up', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45'),
(9, 'Van', 'actif', '2024-06-18 22:22:45', '2024-06-18 22:22:45');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `assurances`
--
ALTER TABLE `assurances`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `proprietaires`
--
ALTER TABLE `proprietaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_assurances`
--
ALTER TABLE `type_assurances`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicule_types`
--
ALTER TABLE `vehicule_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achats`
--
ALTER TABLE `achats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assurances`
--
ALTER TABLE `assurances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `marques`
--
ALTER TABLE `marques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `proprietaires`
--
ALTER TABLE `proprietaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_assurances`
--
ALTER TABLE `type_assurances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicule_types`
--
ALTER TABLE `vehicule_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
