-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 13 juin 2024 à 05:18
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
  `achat_date` timestamp NULL DEFAULT NULL,
  `nip_acheteur` varchar(255) NOT NULL,
  `nip_vendeur` varchar(255) NOT NULL,
  `vehicule_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'actif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `achats`
--

INSERT INTO `achats` (`id`, `achat_prix`, `achat_date`, `nip_acheteur`, `nip_vendeur`, `vehicule_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '2000', '2024-06-28 23:00:00', 'I299290', '298292', 1, 'actif', '2024-06-13 01:34:56', '2024-06-13 01:34:56'),
(2, '2000', '2024-06-27 23:00:00', 'SJHSH28', 'ZYU28728', 2, 'actif', '2024-06-13 01:55:29', '2024-06-13 01:55:29'),
(3, '2000', '2024-06-28 23:00:00', '938209', '8374ZJHJHZ', 3, 'actif', '2024-06-13 02:03:49', '2024-06-13 02:03:49'),
(4, '2800', '2024-06-26 23:00:00', 'KZJZKZJJZ', '299292IZ', 4, 'actif', '2024-06-13 02:07:25', '2024-06-13 02:07:25'),
(5, '72837093', '2024-06-26 23:00:00', '9EIJDKDJ', '2983392', 5, 'actif', '2024-06-13 02:10:51', '2024-06-13 02:10:51');

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
(6, '2024_06_11_184044_create_modeles_table', 1),
(7, '2024_06_11_184253_create_vehicule_types_table', 1),
(8, '2024_06_11_185254_create_proprietaires_table', 1),
(9, '2024_06_11_185532_create_vehicules_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `modeles`
--

CREATE TABLE `modeles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modele_libelle` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'actif',
  `vehicule_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `modeles`
--

INSERT INTO `modeles` (`id`, `modele_libelle`, `status`, `vehicule_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Toyota', 'actif', 1, NULL, NULL),
(2, 'Honda', 'actif', 1, NULL, NULL),
(3, 'Ford', 'actif', 1, NULL, NULL),
(4, 'Chevrolet', 'actif', 1, NULL, NULL),
(5, 'Nissan', 'actif', 1, NULL, NULL),
(6, 'Toyota', 'actif', 2, NULL, NULL),
(7, 'Honda', 'actif', 2, NULL, NULL),
(8, 'Tesla', 'actif', 2, NULL, NULL),
(9, 'BMW', 'actif', 2, NULL, NULL),
(10, 'Mercedes-Benz', 'actif', 2, NULL, NULL),
(11, 'Ford', 'actif', 3, NULL, NULL),
(12, 'Chevrolet', 'actif', 3, NULL, NULL),
(13, 'Ram', 'actif', 3, NULL, NULL),
(14, 'GMC', 'actif', 3, NULL, NULL),
(15, 'Toyota', 'actif', 3, NULL, NULL),
(16, 'Ford', 'actif', 4, NULL, NULL),
(17, 'Chevrolet', 'actif', 4, NULL, NULL),
(18, 'BMW', 'actif', 4, NULL, NULL),
(19, 'Audi', 'actif', 4, NULL, NULL),
(20, 'Mercedes-Benz', 'actif', 4, NULL, NULL),
(21, 'Mazda', 'actif', 5, NULL, NULL),
(22, 'BMW', 'actif', 5, NULL, NULL),
(23, 'Porsche', 'actif', 5, NULL, NULL),
(24, 'Audi', 'actif', 5, NULL, NULL),
(25, 'Mercedes-Benz', 'actif', 5, NULL, NULL),
(26, 'Volvo', 'actif', 6, NULL, NULL),
(27, 'Subaru', 'actif', 6, NULL, NULL),
(28, 'Audi', 'actif', 6, NULL, NULL);

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

--
-- Déchargement des données de la table `proprietaires`
--

INSERT INTO `proprietaires` (`id`, `nip_proprietaire`, `nip_chauffeur`, `status`, `created_at`, `updated_at`) VALUES
(1, 'I299290', 'ZUUIEIZU', 'actif', '2024-06-13 01:34:56', '2024-06-13 01:34:56'),
(2, 'SJHSH28', '3838484I3U', 'actif', '2024-06-13 01:55:29', '2024-06-13 01:55:29'),
(3, '938209', '2939EHDD', 'actif', '2024-06-13 02:03:49', '2024-06-13 02:03:49'),
(4, 'KZJZKZJJZ', 'SKSJ2922', 'actif', '2024-06-13 02:07:25', '2024-06-13 02:07:25'),
(5, '9EIJDKDJ', '23033039', 'actif', '2024-06-13 02:10:51', '2024-06-13 02:10:51');

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
(1, 'Gaston Delimond', 'gastondelimond@gmail.com', NULL, '$2y$10$kVHDExAMBChBprGdJjP5r.m1QmIvNKVvTV9p76Bg4xE6RbfCiUzLC', NULL, NULL, NULL),
(2, 'Lionnel Nawej', 'lionnelnawej@gmail.com', NULL, '$2y$10$CyJVwNbdnbld5SqK5MeN7.kBkC5UomDtrvgQzzTZdVvy05HxouQ26', NULL, NULL, NULL),
(3, 'Admin', 'admin@gmail.com', NULL, '$2y$10$bSWuHKYY4STB3HgzQ3WvfecA3p5vySFEZ71YjAXrCrXV91AM4AL82', NULL, NULL, NULL);

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
  `marque` varchar(255) NOT NULL,
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
  `modele_id` bigint(20) UNSIGNED NOT NULL,
  `proprietaire_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'actif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `code`, `serie`, `plaque`, `couleur`, `chassis`, `marque`, `photo_avant`, `photo_arriere`, `profil_droit`, `profil_gauche`, `nbre_chevaux`, `date_debut_service`, `validite_assurance`, `police_assurance`, `type_usage`, `vehicule_type_id`, `modele_id`, `proprietaire_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DK17177220', '29839329', '29839292', '#d783ff', '29289383', '838292', 'http://127.0.0.1:8000/uploads/vehicules/666a5ad0ccc06.png', 'http://127.0.0.1:8000/uploads/vehicules/666a5ad0cdaf8.png', 'http://127.0.0.1:8000/uploads/vehicules/666a5ad0cdbe4.png', 'http://127.0.0.1:8000/uploads/vehicules/666a5ad0cdb7f.png', '2', '2024-06-30', '2025-02-18', 'U2I2UI2UI2', 'Taxi', 5, 17, 1, 'actif', '2024-06-13 01:34:56', '2024-06-13 01:34:56'),
(2, '8145875969', '872HHS', 'SHHE782', '#000000', '2873HSHS', '838YHSHS', 'http://127.0.0.1:8000/uploads/vehicules/666a5fa19256e.png', 'http://127.0.0.1:8000/uploads/vehicules/666a5fa19274d.png', 'http://127.0.0.1:8000/uploads/vehicules/666a5fa192805.png', 'http://127.0.0.1:8000/uploads/vehicules/666a5fa1927b3.png', '3', '2024-06-21', '2024-06-28', '8378SHSHS', 'Taxi', 2, 19, 2, 'actif', '2024-06-13 01:55:29', '2024-06-13 01:55:29'),
(3, 'O655337623', 'DJDJHD', 'SSJSJS', '#7980ff', 'DJHDDH', '92JSJJSHSJ', 'http://127.0.0.1:8000/uploads/vehicules/666a6195af4d0.png', 'http://127.0.0.1:8000/uploads/vehicules/666a6195af5ed.png', 'http://127.0.0.1:8000/uploads/vehicules/666a6195af6ac.png', 'http://127.0.0.1:8000/uploads/vehicules/666a6195af651.png', '2', '2024-06-14', NULL, NULL, 'Personnel', 3, 21, 3, 'actif', '2024-06-13 02:03:49', '2024-06-13 02:03:49'),
(4, 'TL32902226', 'KSJKS', 'KSJSKJS', '#00fcff', 'KLSSKSLS', '82782289HDH', 'http://127.0.0.1:8000/uploads/vehicules/666a626dda044.png', 'http://127.0.0.1:8000/uploads/vehicules/666a626dda2a8.png', 'http://127.0.0.1:8000/uploads/vehicules/666a626dda357.png', 'http://127.0.0.1:8000/uploads/vehicules/666a626dda307.png', '3', '2024-06-28', '2024-06-30', 'OIOI2O2O1', 'Personnel', 4, 19, 4, 'actif', '2024-06-13 02:07:25', '2024-06-13 02:07:25'),
(5, 'PM87866232', 'O93930039', 'ODIDOID', '#9437ff', 'I3I9392', '383873', 'http://127.0.0.1:8000/uploads/vehicules/666a633b97897.png', 'http://127.0.0.1:8000/uploads/vehicules/666a633b97a3f.png', 'http://127.0.0.1:8000/uploads/vehicules/666a633b97afc.png', 'http://127.0.0.1:8000/uploads/vehicules/666a633b97aa6.png', '2', '2024-06-28', '2024-09-29', 'ZIIDJDJHDJ', 'Personnel', 4, 19, 5, 'actif', '2024-06-13 02:10:51', '2024-06-13 02:10:51');

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
(1, 'SUV', 'actif', NULL, NULL),
(2, 'Berline', 'actif', NULL, NULL),
(3, 'Camion', 'actif', NULL, NULL),
(4, 'Coupé', 'actif', NULL, NULL),
(5, 'Cabriolet', 'actif', NULL, NULL),
(6, 'Break', 'actif', NULL, NULL),
(7, 'Monospace', 'actif', NULL, NULL),
(8, 'Pick-up', 'actif', NULL, NULL),
(9, 'Van', 'actif', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `modeles`
--
ALTER TABLE `modeles`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `modeles`
--
ALTER TABLE `modeles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `proprietaires`
--
ALTER TABLE `proprietaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `vehicule_types`
--
ALTER TABLE `vehicule_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
