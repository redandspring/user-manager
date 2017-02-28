DROP TABLE IF EXISTS `User`;

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
(1, 'Andrey Mironov', 29, 1, '2001-03-14 11:01:40'),
(2, 'Aleksey Andreev', 31, 1, '2007-05-11 12:11:41'),
(3, 'Alexander Ivanov', 38, 1, '2007-07-22 09:21:25'),
(4, 'Semen Sergeev', 26, 1, '2009-02-26 10:01:32'),
(5, 'Tyrion Lannister', 40, 0, '2010-03-17 12:22:40'),
(7, 'Kit Harington', 42, 0, '2011-04-21 11:32:45'),
(8, 'Charles Dance', 40, 0, '2014-02-27 11:42:44'),
(9, 'Theon Greyjoy', 42, 0, '2015-12-17 03:15:41'),
(10, 'Iain Glen', 43, 0, '2016-05-20 02:11:52'),
(11, 'Robb Stark', 24, 0, '2016-11-17 01:01:22'),
(12, 'Mark Addy', 24, 0, '2016-12-01 10:43:02'),
(13, 'Samwell Tarly', 35, 0, '2016-12-27 13:01:12'),
(14, 'Conleth Hill', 36, 0, '2017-01-30 11:01:44'),
(15, 'Jerome Flynn', 32, 0, '2017-02-20 14:03:12'),
(16, 'Liam Cunningham', 37, 0, '2017-02-21 15:05:22'),
(17, 'Davos Seaworth', 38, 0, '2017-02-22 21:07:41'),
(18, 'Daniel Portman', 39, 0, '2017-02-23 21:01:32'),
(19, 'Podrick Payne', 38, 0, '2017-02-24 10:31:40'),
(20, 'Barristan Selmy', 50, 0, '2017-02-25 11:12:42');
