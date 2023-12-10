


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical`
--

-- --------------------------------------------------------


CREATE TABLE `addmp` (
  `sno` int(11) NOT NULL,
  `medicine` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `addmp` (`sno`, `medicine`) VALUES
(1, 'Dolo 650'),
(2, 'Carpel 250 mg'),
(3, 'Azythromycin 500'),
(4, 'Azythromycin 250'),
(5, 'Rantac 300'),
(6, 'Omez'),
(7, 'Okacet'),
(8, 'Paracetomol');



CREATE TABLE `addpd` (
  `sno` int(11) NOT NULL,
  `product` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `addpd` (`sno`, `product`) VALUES
(1, 'colgate'),
(2, 'perfume'),
(3, 'garnier face wash'),
(4, 'garnier face wash');


CREATE TABLE `posts` (
  `mid` int(11) NOT NULL,
  `medical_name` varchar(100) NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `posts`
  ADD PRIMARY KEY (`mid`);


CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `action` varchar(500) NOT NULL,
  `date` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `logs` ADD CONSTRAINT FOREIGN KEY(`mid`) REFERENCES posts(`mid`); 



CREATE TABLE `medicines` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `amount` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `medicines` varchar(500) NOT NULL,
  `products` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mid` int(11) NOT NULL,
  FOREIGN KEY (`mid`) REFERENCES `posts`(`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DELIMITER $$
CREATE TRIGGER `Delete` BEFORE DELETE ON `medicines` FOR EACH ROW INSERT INTO Logs VALUES(null,OLD.mid,' DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `medicines` FOR EACH ROW INSERT INTO Logs VALUES(null,NEW.mid,' INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update` AFTER UPDATE ON `medicines` FOR EACH ROW INSERT INTO Logs VALUES(null,NEW.mid,' UPDATED',NOW())
$$
DELIMITER ;

-- DELIMITER //
-- CREATE TRIGGER before_insert_posts
-- BEFORE INSERT ON posts
-- FOR EACH ROW
-- BEGIN
--     IF CHAR_LENGTH(NEW.phone_no) <> 10 THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Phone number must be 10 digits';
--     END IF;
-- END;
-- //
-- DELIMITER ;






ALTER TABLE `addmp`
  ADD PRIMARY KEY (`sno`);


ALTER TABLE `addpd`
  ADD PRIMARY KEY (`sno`);


ALTER TABLE `addmp`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE `addpd`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
