A-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 22 2022 г., 17:36
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `qbcore`
--

-- --------------------------------------------------------

--
-- Структура таблицы `investment`
--

CREATE TABLE `investment` (
  `id` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `curs` int(11) NOT NULL,
  `lastupdate` int(11) NOT NULL,
  `free_amount` int(11) NOT NULL,
  `all_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `investment`
--

INSERT INTO `investment` (`id`, `company`, `curs`, `lastupdate`, `free_amount`, `all_amount`) VALUES
(1, 'Сеть магазинов 24/7', 5077, 1645541738, 992, 1000),
(2, 'Lifeinvader', 20029, 1645541739, 1000, 1000),
(3, 'Rogers Salvage&Scrap', 49464, 1645541740, 998, 1000),
(4, 'Grand Banks Steel Inc Foundry', 76067, 1645541740, 1000, 1000),
(5, 'Humane Labs and Research', 103246, 1645541741, 1000, 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `investments`
--

CREATE TABLE `investments` (
  `id` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `date` int(11) NOT NULL DEFAULT current_timestamp(),
  `curs` int(11) NOT NULL,
  `datelabel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `investments`
--

INSERT INTO `investments` (`id`, `company`, `date`, `curs`, `datelabel`) VALUES
(24, 'Сеть магазинов 24/7', 1645356753, 5000, '02/20/22'),
(25, 'Lifeinvader', 1645356753, 10000, '02/20/22'),
(26, 'Rogers Salvage&Scrap', 1645356753, 15000, '02/20/22'),
(27, 'Grand Banks Steel Inc Foundry', 1645356753, 71000, '02/20/22'),
(28, 'Humane Labs and Research', 1645356753, 125000, '02/20/22'),
(34, 'Сеть магазинов 24/7', 1645367643, 4993, '02/19/22'),
(35, 'Lifeinvader', 1645367644, 9957, '02/19/22'),
(36, 'Rogers Salvage&Scrap', 1645367644, 15037, '02/19/22'),
(37, 'Grand Banks Steel Inc Foundry', 1645367645, 71120, '02/19/22'),
(38, 'Humane Labs and Research', 1645367645, 125037, '02/19/22'),
(138, 'Сеть магазинов 24/7', 1645541738, 5077, '02/22/22'),
(139, 'Lifeinvader', 1645541739, 20029, '02/22/22'),
(140, 'Rogers Salvage&Scrap', 1645541740, 49464, '02/22/22'),
(141, 'Grand Banks Steel Inc Foundry', 1645541740, 76067, '02/22/22'),
(142, 'Humane Labs and Research', 1645541741, 104246, '02/22/22');

-- --------------------------------------------------------

--
-- Структура таблицы `players_stocks`
--

CREATE TABLE `players_stocks` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(8) NOT NULL,
  `company` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `investment`
--
ALTER TABLE `investment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company` (`company`);

--
-- Индексы таблицы `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `players_stocks`
--
ALTER TABLE `players_stocks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `investment`
--
ALTER TABLE `investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT для таблицы `investments`
--
ALTER TABLE `investments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT для таблицы `players_stocks`
--
ALTER TABLE `players_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
