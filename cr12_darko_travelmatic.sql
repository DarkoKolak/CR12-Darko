-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Sep 2019 um 15:54
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr12_darko_travelmatic`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `concert`
--

CREATE TABLE `concert` (
  `concertId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `webAdress` varchar(100) DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `eventtime` time DEFAULT NULL,
  `ticketprice` int(11) DEFAULT NULL,
  `fk_location` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `concert`
--

INSERT INTO `concert` (`concertId`, `Name`, `adress`, `zipCode`, `webAdress`, `eventDate`, `eventtime`, `ticketprice`, `fk_location`, `image`) VALUES
(1, 'Kris Kristofferson', 'Wiener Stadthalle, Halle F, Roland Rainer Platz 1,', 1150, 'http://kriskristofferson.com/', '2019-11-15', '20:00:00', 59, 1, 'https://lh4.googleusercontent.com/8B3Uvcit7tz1MnSCpV4OawMJpWrluMqWGd5dqDDivsab_w30GnSYrM0xd3O9wGF6deAMKvzI9D0ptptq8bGVm_o7Vk2Gt7ClukscE6bMw1mUYRcl1BcZ6tZQOqN5FNBcwMz4p9Ga'),
(2, 'Lenny Kravitz', 'Wiener Stadthalle - Halle D, Roland Rainer Platz 1', 1150, 'www.lennykravitz.com/', '2019-12-09', '19:30:00', 48, 1, 'https://lh5.googleusercontent.com/74lQjmcgVjXOrimysU0h8OmxzHRcvwf01IzGsl1LwjKQtFVC5NKfuXDM2e6o1CsUFMhiSVhMGt1gRs6JD0C6Cd896ZA7NWOrXf0qzFs_CsVUXGyPEC97G06YV5GzdEu5bXyoFB-z'),
(3, 'Michael Buble', 'Roland-Rainer-Platz1', 1150, 'https://www.bandsintown.com/e/100501556-michael-buble-at-wiener-stadthalle?came_from=253&utm_medium=', '2019-09-21', '19:00:00', 50, 1, 'https://photos.bandsintown.com/thumb/6855715.jpeg'),
(4, 'Ozzy Osbourne', 'Wiener Stadthalle', 1150, 'ozzyosbourne.at', '2020-02-26', '20:00:00', 70, 1, 'https://photos.bandsintown.com/thumb/8548286.jpeg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `LocationId` int(10) UNSIGNED NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `Country` varchar(70) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`LocationId`, `image`, `Country`, `City`) VALUES
(1, 'https://s3-media1.fl.yelpcdn.com/bphoto/2uSSajk_jwf46u90JPLqCA/l.jpg', 'Austria', 'Vienna'),
(2, 'https://lh5.googleusercontent.com/KSjp-79rS7p6COzjpgPk3-vP4fpNwhk6i91qoZAdYIKd4nHJx8nGdyHg7my01ahEImfk64MgTdPlW-dDoJ_SryXbKpd5794QfJLi3JBfLRS4_BTtj-hLoD4csemw4q4FtmgrPhk-', 'Hungary', 'Budapest');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurantId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `image` varchar(500) NOT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `type` enum('Traditional','Chinese','Indian','Italian','Greece','Balkan') DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `webAdress` varchar(100) DEFAULT NULL,
  `fk_location` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `restaurant`
--

INSERT INTO `restaurant` (`restaurantId`, `Name`, `adress`, `image`, `zipCode`, `Phone`, `type`, `description`, `webAdress`, `fk_location`) VALUES
(1, 'Lemon Leaf Thai Restaurant', 'Kettenbrückengasse 19', 'https://s3-media1.fl.yelpcdn.com/bphoto/2uSSajk_jwf46u90JPLqCA/l.jpg', 1050, 435812308, 'Chinese', 'Chinesse Restoran', 'www.lemonleaf.at', 1),
(2, 'SIXTA', 'Schönbrunner Straße 21', 'https://lh5.googleusercontent.com/KSjp-79rS7p6COzjpgPk3-vP4fpNwhk6i91qoZAdYIKd4nHJx8nGdyHg7my01ahEImfk64MgTdPlW-dDoJ_SryXbKpd5794QfJLi3JBfLRS4_BTtj-hLoD4csemw4q4FtmgrPhk-', 1050, 431585285, 'Traditional', 'Some description', 'http://www.sixta-restaurant.at/', 1),
(3, 'XXXL ', 'Wurlitzergasse 87', 'https://lh5.googleusercontent.com/p/AF1QipNXl0HSo00InWW2lm_iXbX-gUuYei9mXW46zMgi=w213-h160-k-no', 1170, 12345678, 'Balkan', 'Balkan Grill ', 'http://www.restaurant-xxxl.at/', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `thingstodo`
--

CREATE TABLE `thingstodo` (
  `thingId` int(10) UNSIGNED NOT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `image` varchar(500) NOT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` enum('Museum','Historical site','Nightlife','Must see') DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `webAdress` varchar(100) DEFAULT NULL,
  `fk_location` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `thingstodo`
--

INSERT INTO `thingstodo` (`thingId`, `adress`, `image`, `zipCode`, `name`, `type`, `description`, `webAdress`, `fk_location`) VALUES
(1, 'Maxingstraße 13b', 'https://www.zoovienna.at/media/_versions_/veranstaltungen/themenfuehrung_animal_detail_456.jpg', 1130, 'Zoo Vienna', 'Must see', 'The Zoo in VIenna', 'https://www.zoovienna.at/', 1),
(2, 'Fritz-Grünbaum-Platz 1', 'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/70/12/f3.jpg', 1060, 'Haus des Meeres', 'Must see', 'Underwather World', 'https://www.haus-des-meeres.at', 1),
(3, 'Schönbrunner Schloßstraße 47', 'https://www.regionalsuche.at/wp-content/uploads/2018/07/bigstock-Vienna-Austria-October-211515499.jpg', 1130, 'Schloss Schönbrunn', 'Historical site', 'Schloss Schönbrunn', 'https://www.schoenbrunn.at/', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userdata`
--

CREATE TABLE `userdata` (
  `userId` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `userrole` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `userdata`
--

INSERT INTO `userdata` (`userId`, `firstname`, `lastname`, `username`, `password`, `email`, `userrole`) VALUES
(1, 'Darko', 'Kolak', 'darkec', 'darko2101', 'kolakdarko@yahoo.com', 1),
(2, 'dar', 'dark', 'dar', NULL, 'da', 0),
(3, 'Goran', 'Stevic', 'gogi', '', 'gogi@codefactory.com', 0),
(4, 'Goran', 'Stevic', 'gogi1', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'gogi@codefactory1.com', 1),
(5, 'Darko', 'Kolak', 'darkec1', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'darko@darko.com', 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `concert`
--
ALTER TABLE `concert`
  ADD PRIMARY KEY (`concertId`),
  ADD KEY `fk_location` (`fk_location`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationId`);

--
-- Indizes für die Tabelle `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurantId`),
  ADD KEY `fk_location` (`fk_location`);

--
-- Indizes für die Tabelle `thingstodo`
--
ALTER TABLE `thingstodo`
  ADD PRIMARY KEY (`thingId`),
  ADD KEY `fk_location` (`fk_location`);

--
-- Indizes für die Tabelle `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `concert`
--
ALTER TABLE `concert`
  MODIFY `concertId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `LocationId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurantId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `thingstodo`
--
ALTER TABLE `thingstodo`
  MODIFY `thingId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `userdata`
--
ALTER TABLE `userdata`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `concert`
--
ALTER TABLE `concert`
  ADD CONSTRAINT `concert_ibfk_1` FOREIGN KEY (`fk_location`) REFERENCES `location` (`LocationId`);

--
-- Constraints der Tabelle `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`fk_location`) REFERENCES `location` (`LocationId`);

--
-- Constraints der Tabelle `thingstodo`
--
ALTER TABLE `thingstodo`
  ADD CONSTRAINT `thingstodo_ibfk_1` FOREIGN KEY (`fk_location`) REFERENCES `location` (`LocationId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
