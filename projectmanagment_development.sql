-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 26 2018 г., 00:37
-- Версия сервера: 5.5.25
-- Версия PHP: 5.6.19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `projectmanagment_development`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ar_internal_metadata`
--

CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2018-12-20 00:31:56', '2018-12-20 00:31:56');

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `summary` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `name`, `summary`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'Games', 'Best game in the world', '2018-12-14', '2018-12-20', '2018-12-20 00:51:29', '2018-12-24 21:38:25'),
(2, 'Directory', 'Number', '2018-12-01', '2018-12-20', '2018-12-20 10:30:55', '2018-12-20 10:30:55'),
(4, 'Encouragement', 'We will be investigating the effects of encouragement on task persistence. Participants will be students who are enrolled in PSY 1000 courses who elect to participate in partial fulfillment of course requirements. Participants will be randomly assigned to either the “encouragement group” or the “no encouragement group” and to either the “easy task group” or “difficult task group.” The task will consistof a challenging maze (see attached).\r\nFor the encouragement group, we will tell them before they begin the task that “they can do it” and that “this is something we know they can do.” For the no encouragement group, we will simply give them instructions for the maze (i.e., “work on the maze until you’re asked to stop”). Participants in the “easy task group” will be given five minutes to work on the maze; participants in the “difficult task group” will only be given two minutes to work on the maze.\r\nAfter the time is up, we will then give participants another challenging maze to do, actually an “impossible” maze. They will have as long as they want to work on this maze. We will time how long they wish to work on it. We predict that the “easy/encouragement group” (i.e., those participants who were successful on the first task and who were encouraged) will work longer on the task than the other groups.\r\nAfter participants are done with the task, they will be thanked and debriefed.\r\n', '2018-12-01', '2019-02-28', '2018-12-25 22:45:08', '2018-12-25 22:45:08');

-- --------------------------------------------------------

--
-- Структура таблицы `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20181220002746'),
('20181222212145'),
('20181225182405');

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tasks_on_project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 'Develop', 'User interface development\r\n\r\n', 'In progress', 1, '2018-12-22 22:21:52', '2018-12-24 01:59:47'),
(4, 'Develop', 'Server side development', 'New', 1, '2018-12-25 21:15:44', '2018-12-25 21:15:44');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `unconfirmed_email`, `created_at`, `updated_at`) VALUES
(1, 'shmegiro98@gmail.com', '$2a$11$hw9mPmhQqVhSjNBfzrhkRuJ08pi4YB9ON4xA8e5okH1M1Y.boCyvu', '9e5959302fb15a0334c00da73eff64fdf9b4413b8d9cfeddc1955e01143574cd', '2018-12-25 20:27:34', '2018-12-25 23:57:08', 'W2H-4ymXKAc-yesPzmY3', '2018-12-25 20:32:40', '2018-12-25 20:05:16', NULL, '2018-12-25 20:05:16', '2018-12-25 23:57:08');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_rails_02e851e3b7` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
