DROP TABLE IF EXISTS `Users`;

CREATE TABLE IF NOT EXISTS `User` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`id`, `name`, `age`, `isAdmin`, `createdDate`) VALUES
(1, 'Andrey Mironov', 29, 1, '2017-02-27 11:01:42'),
(2, 'Aleksey Andreev', 31, 1, '2017-02-27 11:01:42'),
(3, 'Alexander Ivanov', 38, 1, '2017-02-27 11:01:42'),
(4, 'Semen Sergeev', 26, 1, '2017-02-27 11:01:42'),
(5, 'Tyrion Lannister', 40, 0, '2017-02-27 11:01:42'),
(7, 'Kit Harington', 42, 0, '2017-02-27 11:01:42'),
(8, 'Charles Dance', 40, 0, '2017-02-27 11:01:42'),
(9, 'Theon Greyjoy', 42, 0, '2017-02-27 11:01:42'),
(10, 'Iain Glen', 43, 0, '2017-02-27 11:01:42'),
(11, 'Robb Stark', 24, 0, '2017-02-27 11:01:42'),
(12, 'Mark Addy', 24, 0, '2017-02-27 11:01:42'),
(13, 'Samwell Tarly', 35, 0, '2017-02-27 11:01:42'),
(14, 'Conleth Hill', 36, 0, '2017-02-27 11:01:42'),
(15, 'Jerome Flynn', 32, 0, '2017-02-27 11:01:42'),
(16, 'Liam Cunningham', 37, 0, '2017-02-27 11:01:42'),
(17, 'Davos Seaworth', 38, 0, '2017-02-27 11:01:42'),
(18, 'Daniel Portman', 39, 0, '2017-02-27 11:01:42'),
(19, 'Podrick Payne', 38, 0, '2017-02-27 11:01:42'),
(20, 'Barristan Selmy', 50, 0, '2017-02-27 11:01:42');
