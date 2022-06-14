-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220613.b3001e4d64
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Cze 2022, 13:03
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bidding_db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bids`
--

CREATE TABLE `bids` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `bid_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=bid,2=confirmed,3=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `bids`
--

INSERT INTO `bids` (`id`, `user_id`, `product_id`, `bid_amount`, `status`, `date_created`) VALUES
(8, 10, 6, 1600, 1, '2022-06-14 12:12:37'),
(9, 10, 4, 2000, 1, '2022-06-14 12:12:48'),
(10, 10, 5, 2100, 1, '2022-06-14 12:13:52'),
(11, 11, 8, 300, 1, '2022-06-14 12:15:03'),
(12, 11, 10, 1900, 1, '2022-06-14 12:15:13'),
(13, 11, 5, 2200, 1, '2022-06-14 12:15:23'),
(14, 12, 7, 2000, 1, '2022-06-14 12:17:06'),
(15, 12, 9, 800, 1, '2022-06-14 12:17:20'),
(16, 12, 8, 400, 1, '2022-06-14 12:17:30'),
(17, 10, 5, 2500, 1, '2022-06-14 12:36:30');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Meble'),
(2, 'Malarstwo'),
(3, 'Porcelana'),
(4, 'Rzemiosło'),
(5, 'Biżuteria');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `start_bid` float NOT NULL,
  `regular_price` float NOT NULL,
  `bid_end_datetime` datetime NOT NULL,
  `img_fname` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `start_bid`, `regular_price`, `bid_end_datetime`, `img_fname`, `date_created`) VALUES
(4, 5, 'Pierścionek z ametystem', 'Pierścionek wykonany w latach 60. XX wieku, ze złota próby 750 (18K), w Europie Zachodniej. W centralnym miejscu kompozycji osadzony jest piękny, naturalny ametyst o głębokiej, nasyconej barwie, wymiarach : 10 x 8 mm. Dookoła ametyst wysadzany jest 20 szt. naturalnych diamentów, w szlifie brylantowym (brylantów), o łącznej masie ~ 0.15 ct. G-H / VS-SI. Rozmiar 16.', 500, 3000, '2022-08-31 15:00:00', '4.png', '2022-06-14 11:16:55'),
(5, 5, 'Zawieszka z rubinem', 'Zawieszka wykonana po 2000 roku, ze złota próby 750 (18K), w Europie Zachodniej. Zawieszka wysadzana 7 szt. naturalnych rubinów w szlifie \"markiza\", o łącznej masie ~ 2.50 ct. oraz 6 szt. naturalnych diamentów w szlifie brylantowym \"brylantów\", o łącznej masie ~ 0.45 ct. H-I / VS-SI.', 600, 3200, '2022-09-28 16:00:00', '5.png', '2022-06-14 12:00:10'),
(6, 2, 'Wyjazd na polowanie', 'Władysław Chmieliński, \"Wyjazd na polowanie\", olej /sklejka, lata 30. XX wieku. Piękna praca artysty, doskonała kompozycja ukazująca talent młodego artysty. Rama oryginalna z epoki, obraz o wymiarach 35,5 x 42,5 cm, w świetle ramy 17,3 x 25 cm. Odręczna sygnatura artysty widoczna w prawym dolnym rogu. Stan zachowania doskonały !', 1300, 4900, '2022-10-24 20:00:00', '6.png', '2022-06-14 12:02:26'),
(7, 2, 'Kościuszko z kosynierami', '\"Kościuszko z Kosynierami\", patriotyczny obraz olejny na płótnie autorstwa Romana Antoniego Breintenwalda namalowany w latach 30. XX wieku. Wielopostaciowa scena rodzajowa z pierwszoplanową postacią Tadeusza Kościuszki, naczelnika powstania odprawiającego swoich żołnierzy idących w bój. Obraz jest bardzo duży, niebywale dekoracyjny, o wymiarach 108 x 78 cm, samo płótno o wymiarach 62 x 90 cm. W prawym dolnym rogu widoczna odręczna sygnatura artysty.', 1600, 11000, '2022-11-28 15:00:00', '7.png', '2022-06-14 12:04:12'),
(8, 3, 'Konsola z herbem Augusta III', 'Konsola / półka wykonana w drezdeńskiej manufakturze porcelany pod koniec XIX wieku. Porcelana dekorowana ręczną malaturą w motywy kwiatowe, ręcznie wykonanymi złoceniami, w dolnej partii pełnoplastycznym bukietem róż. W centralnym miejscu brzuśca konsoli namalowany jest herb Króla Polskiego, elektora saskiego Augusta III z lat 1733-1763 z okresu Unii Polsko - Saskiej. Konsola jest dość duża, widoczna o wymiarach ; szerokość 29 cm, głębokość 20 cm.', 200, 1980, '2022-07-18 15:00:00', '8.png', '2022-06-14 12:06:14'),
(9, 1, 'Lustro salonowe', 'Wspaniałe, pełne przepychu lustro salonowe, idealne również na hol wykonane ze złoconego drewna około 1900 roku. Bogato zdobione ażurowymi motywami roccaile, motywami spienionych fal, na bokach siedem ekspozycyjnych półeczek. Lustro jest duże, bardzo reprezentacyjne o wymiarach 133 x 90 , głębokość 16,5 cm.', 700, 7100, '0000-00-00 00:00:00', '9.png', '2022-06-14 12:08:08'),
(10, 4, 'Zosia', 'Władysław Marcinkowski (1858 - 1947), \"Zosia\" - brąz patynowany wykonany przez artystę w 1883 roku. Rzeźba przedstawiająca postać młodej kobiety stojącej na brunatnej, marmurowej podstawie. Wysokość 51 cm. Na podstawie widoczna odręczna sygnatura artysty wraz z datą \"Marcinkowski 1883\".', 1700, 17000, '2022-12-12 15:00:00', '10.png', '2022-06-14 12:09:48');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Dom aukcyjny z antykami', 'w61874@student.wsiz.edu.pl', '+48 123456789', '', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(26, 26, 26); font-family: Roboto, Helvetica, sans-serif; font-size: 16px; letter-spacing: 1px; text-align: start;&quot;&gt;Profesjonalnym handlem antykami zajmujemy się już od 1998 roku i z wciąż rosnącą satysfakcją zamieniamy wiele dom&oacute;w, dwor&oacute;w i apartament&oacute;w w ekskluzywne dzieła sztuki. Dzięki bogatemu doświadczeniu, wynikającemu z nieprzerwanie rozwijanej namiętnej pasji, zaangażowaniu oraz wsp&oacute;łpracy z najlepszymi projektantami wnętrz możemy sprawić, że bez względu na to czy chcesz urządzić wnętrze, uzupełnić je czy stworzyć unikatową kolekcję, to co z nami osiągniesz przerośnie najśmielsze oczekiwania!!&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Subscriber',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `contact`, `address`, `type`, `date_created`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 'admin@admin.com', '+123456789', '', 1, '2022-06-02 09:19:59'),
(10, 'jan', 'jan123', 'b2f094d578c24c4c20b79539016dda9b', 'jan@mail.com', '+ 48987654332', 'jakaś tam 12', 2, '2022-06-14 12:12:05'),
(11, 'tomek', 'tomtom', '5caf72868c94f184650f43413092e82c', 'Tomasz@mail.com', '+48 123123123', 'jeszczeinna 123', 2, '2022-06-14 12:14:47'),
(12, 'Jakub', 'kuba', '4885d7b7680486e4920a2e4f7a3c0441', 'kuba@mail.com', '+48 987987654', 'chmielna 8', 2, '2022-06-14 12:16:55');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



