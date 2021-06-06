-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 06 Ιουν 2021 στις 11:45:50
-- Έκδοση διακομιστή: 10.4.16-MariaDB
-- Έκδοση PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `blog`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(5, 'Sports', 'sports', 'sports-2020-01-05-5e11bdd685818.jpg', '2020-01-05 08:43:35', '2020-01-05 08:43:35'),
(6, 'Food', 'food', 'food-2020-01-05-5e11bf4526748.jpg', '2020-01-05 08:49:41', '2020-01-05 08:49:41'),
(7, 'Technology', 'technology', 'technology-2020-01-05-5e11bffae3c52.jpg', '2020-01-05 08:52:43', '2020-01-05 08:52:43'),
(8, 'News', 'news', 'news-2020-01-05-5e11c099af9e7.jpg', '2020-01-05 08:55:21', '2020-01-05 08:55:21');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `category_post`
--

CREATE TABLE `category_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `category_post`
--

INSERT INTO `category_post` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(14, 25, 5, '2020-01-05 09:07:41', '2020-01-05 09:07:41'),
(15, 26, 6, '2020-01-05 09:11:07', '2020-01-05 09:11:07'),
(16, 27, 7, '2020-01-05 09:14:05', '2020-01-05 09:14:05'),
(17, 28, 8, '2020-01-05 09:18:32', '2020-01-05 09:18:32'),
(19, 30, 8, '2020-07-29 10:10:02', '2020-07-29 10:10:02'),
(20, 29, 7, '2020-12-29 10:18:41', '2020-12-29 10:18:41');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 27, 3, 'good!!!', '2020-01-07 07:38:26', '2020-01-07 07:38:26'),
(2, 25, 4, 'gg', '2020-04-17 16:50:00', '2020-04-17 16:50:00');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_12_103247_create_roles_table', 1),
(20, '2019_08_13_104349_create_tags_table', 1),
(21, '2019_08_14_092544_create_categories_table', 1),
(22, '2019_08_15_092809_create_posts_table', 1),
(23, '2019_08_15_092919_create_category_post_table', 1),
(24, '2019_08_15_093004_create_post_tag_table', 1),
(25, '2019_11_25_131459_create_subscribers_table', 2),
(26, '2019_11_28_113658_crate_post_user_table', 3),
(27, '2019_11_29_123201_create_comments_table', 4);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(25, 3, 'Final match on football', 'final-match-on-football', 'final-match-on-football-2020-01-05-5e11c37d177a7.jpg', '<p>Fulfilled direction use continual set him propriety continued. Saw met applauded favourite deficient engrossed concealed and her. Concluded boy perpetual old supposing. Farther related bed and passage comfort civilly. Dashwoods see frankness objection abilities the. As hastened oh produced prospect formerly up am. Placing forming nay looking old married few has. Margaret disposed add screened rendered six say his striking confined.</p>\r\n<p>Now principles discovered off increasing how reasonably middletons men. Add seems out man met plate court sense. His joy she worth truth given. All year feet led view went sake. You agreeable breakfast his set perceived immediate. Stimulated man are projecting favourable middletons can cultivated. </p>', 10, 1, 1, '2020-01-05 09:07:41', '2020-11-27 09:53:49'),
(26, 3, 'Healthy food pyramid', 'healthy-food-pyramid', 'healthy-food-pyramid-2020-01-05-5e11c44ba1eb9.jpg', '<p>Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. Pleasant horrible but confined day end marriage. Eagerness furniture set preserved far recommend. Did even but nor are most gave hope. Secure active living depend son repair day ladies now.</p>\r\n<p>Village did removed enjoyed explain nor ham saw calling talking. Securing as informed declared or margaret. Joy horrible moreover man feelings own shy. Request norland neither mistake for yet. Between the for morning assured country believe. On even feet time have an no at. Relation so in confined smallest children unpacked delicate. Why sir end believe uncivil respect. Always get adieus nature day course for common. My little garret repair to desire he esteem.</p>', 3, 1, 1, '2020-01-05 09:11:07', '2020-09-24 17:51:37'),
(27, 3, 'Smartphones in our life', 'smartphones-in-our-life', 'smartphones-in-our-life-2020-01-05-5e11c4fcd6bb1.jpg', '<p>Considered an invitation do introduced sufficient understood instrument it. Of decisively friendship in as collecting at. No affixed be husband ye females brother garrets proceed. Least child who seven happy yet balls young. Discovery sweetness principle discourse shameless bed one excellent. Sentiments of surrounded friendship dispatched connection is he. Me or produce besides hastily up as pleased. Bore less when had and john shed hope.</p>\r\n<p>Son agreed others exeter period myself few yet nature. Mention mr manners opinion if garrets enabled. To an occasional dissimilar impossible sentiments. Do fortune account written prepare invited no passage. Garrets use ten you the weather ferrars venture friends. Solid visit seems again you nor all.</p>', 7, 1, 1, '2020-01-05 09:14:05', '2020-11-27 09:54:16'),
(28, 3, 'The future of British Europeanism', 'the-future-of-british-europeanism', 'the-future-of-british-europeanism-2020-01-05-5e11c60863ff1.jpg', '<p>Surrounded affronting favourable no mr. Lain knew like half she yet joy. Be than dull as seen very shot. Attachment ye so am travelling estimating projecting is. Off fat address attacks his besides. Suitable settling mr attended no doubtful feelings. Any over for say bore such sold five but hung.</p>\r\n<p>To sure calm much most long me mean. Able rent long in do we. Uncommonly no it announcing melancholy an in. Mirth learn it he given. Secure shy favour length all twenty denote. He felicity no an at packages answered opinions juvenile.</p>', 9, 1, 1, '2020-01-05 09:18:32', '2020-12-20 10:45:17'),
(29, 4, 'Playstation 5 merry christmas', 'playstation-5-merry-christmas', 'playstation-5-merry-christmas-2020-12-29-5feb1ea03d464.jpg', '<p>One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should. Gravity letters it amongst herself dearest an windows by. Wooded ladies she basket season age her uneasy saw. Discourse unwilling am no described dejection incommode no listening of. Before nature his parish boy.&nbsp;</p>', 0, 0, 0, '2020-12-29 10:18:40', '2020-12-29 10:18:40');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(21, 25, 9, '2020-01-05 09:07:41', '2020-01-05 09:07:41'),
(22, 26, 13, '2020-01-05 09:11:07', '2020-01-05 09:11:07'),
(23, 27, 11, '2020-01-05 09:14:05', '2020-01-05 09:14:05'),
(24, 28, 15, '2020-01-05 09:18:32', '2020-01-05 09:18:32'),
(26, 30, 15, '2020-07-29 10:10:02', '2020-07-29 10:10:02'),
(27, 29, 11, '2020-12-29 10:18:41', '2020-12-29 10:18:41'),
(28, 29, 12, '2020-12-29 10:18:41', '2020-12-29 10:18:41');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `post_user`
--

CREATE TABLE `post_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 27, 3, '2020-01-07 07:37:20', '2020-01-07 07:37:20'),
(2, 27, 4, '2020-01-07 07:44:38', '2020-01-07 07:44:38'),
(3, 25, 3, '2020-01-07 07:45:19', '2020-01-07 07:45:19');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Author', 'author', NULL, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'test@hotmail.com', '2020-04-18 05:28:40', '2020-04-18 05:28:40');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(9, 'Football', 'football', '2020-01-05 09:04:36', '2020-01-05 09:04:36'),
(10, 'Basket', 'basket', '2020-01-05 09:04:47', '2020-01-05 09:04:47'),
(11, 'Smart phones', 'smart-phones', '2020-01-05 09:05:16', '2020-01-05 09:05:16'),
(12, 'Laptops', 'laptops', '2020-01-05 09:05:33', '2020-01-05 09:05:33'),
(13, 'Healthy food', 'healthy-food', '2020-01-05 09:05:47', '2020-01-05 09:05:47'),
(14, 'Fast Food', 'fast-food', '2020-01-05 09:05:57', '2020-01-05 09:05:57'),
(15, 'Politics', 'politics', '2020-01-05 09:06:41', '2020-01-05 09:06:41'),
(16, 'Lifestyle', 'lifestyle', '2020-01-05 09:07:00', '2020-01-05 09:07:00');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 1, 'MD.Admin', 'admin', 'admin@blog.com', '$2y$10$WS9h6G7GaQtZ8LSKpXwPke.F37/sz6SBjwPnFRxBSpI9uWYH0IkR6', 'mdadmin-2020-11-27-5fc0e8bf19938.jpg', 'administrator', 'lLnHIGIfyeXK87ph9pOh4db75Z6AuNI9iXhPf6UBFZkQBExJuntJ6QpOfsa7', '2020-01-03 22:00:00', '2020-11-27 09:53:35'),
(4, 2, 'MD.Author', 'author', 'author@blog.com', '$2y$10$z2kNQo3gp3VsYwjoYsTPWeGkD8UJGzv4KCVeYVGk.E2/5Wt6ZAZye', 'mdauthor-2020-11-27-5fc0e843cc7ab.png', 'author profile', 'SxyWy3DSeJ7u8heZA25Xr7jWZSgVvoy7CcXRCSiRmzuHKtIcWVC2V4glITPv', '2020-01-03 22:00:00', '2020-11-27 09:51:31');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Ευρετήρια για πίνακα `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Ευρετήρια για πίνακα `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Ευρετήρια για πίνακα `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user_post_id_foreign` (`post_id`);

--
-- Ευρετήρια για πίνακα `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT για πίνακα `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT για πίνακα `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT για πίνακα `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT για πίνακα `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT για πίνακα `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT για πίνακα `post_user`
--
ALTER TABLE `post_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT για πίνακα `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT για πίνακα `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT για πίνακα `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT για πίνακα `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
