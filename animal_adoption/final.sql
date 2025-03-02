/*
SQLyog Community Edition- MySQL GUI v7.01 
MySQL - 5.0.27-community-nt : Database - petadopt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`petadopt` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `petadopt`;

/*Table structure for table `adlogin` */

DROP TABLE IF EXISTS `adlogin`;

CREATE TABLE `adlogin` (
  `id` int(255) default NULL,
  `fname` varchar(255) default NULL,
  `lname` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `pass` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `adlogin` */

insert  into `adlogin`(`id`,`fname`,`lname`,`email`,`pass`) values (NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `cat` */

DROP TABLE IF EXISTS `cat`;

CREATE TABLE `cat` (
  `id` int(255) NOT NULL auto_increment,
  `breed_name` longtext NOT NULL,
  `image` longtext NOT NULL,
  `description` longtext NOT NULL,
  `weight` longtext NOT NULL,
  `color_options` longtext NOT NULL,
  `life_expectancy` longtext NOT NULL,
  `characteristics` longtext NOT NULL,
  `personality` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cat` */

insert  into `cat`(`id`,`breed_name`,`image`,`description`,`weight`,`color_options`,`life_expectancy`,`characteristics`,`personality`) values (1,'Singapura','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/singapura-detail-1.jpg?bust=1540317126&width=355','The appearance of an alert healthy small- to medium-sized muscular bodied cat with noticeably large eyes and ears in proportion to its head. Cat to have the illusion of refined delicate coloring.','Small, with males weighing 6 to 8 pounds and females weighing 5 to 6 pounds','[\'Sepia\']','9 to 15 years','Warm beige, ticked coat; large expressive eyes; small cat','Sweet, demanding, affectionate and occasionally bossy'),(2,'Munchkin','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/munchkin-detail.jpg?bust=1535567248&width=355','The Munchkin cat has no problem getting around the same as its longer-limbed feline friends â€” it just might take them a few extra steps along the way. These cute, curious cats are known for snatching shiny objects, so donâ€™t be surprised if these â€œmagpiesâ€ borrow your favorite piece of jewelry.','Small with weight between 5 to 9 pounds','[\'Any color or pattern\']','12 to 15 years','Thick semi-foreign body, not compact, very short legs','self-assured and outgoing, friendly and people-oriented'),(3,'Abyssinian','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/abyssinian-detail.jpg?bust=1535664455&width=355','The Abyssinian is often a colorful cat with a distinctly ticked coat, medium in size and regal in appearance; lithe, hard and muscular, showing eager activity and lively interest in their surroundings. They are often well balanced temperamentally and physically.','Small to medium, with males weighing 7 to 10 pounds and females weighing 6 to 8 pounds','[\'Ruddy\', \'red\', \'blue\', \'fawn\']','9 to 15 years','Ticked coat; ruddy, red, blue and fawn colors','Busy, active, agenda-driven and affectionate'),(4,'Cornish Rex','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/cornish-rex-detail.jpg?bust=1535566983&width=355','The Cornish Rex is distinguished from all other breeds by its extremely soft, wavy coat and racy type.Â The catÂ is surprisingly heavy and warm to the touch. All contours of the Cornish Rex are gently curved.','Small to medium, with males weighing 6 to 9 pounds and females weighing 5 to 7 pounds','[\'White\', \'black\', \'blue\', \'red\', \'cream\', \'chocolate\', \'lavender\', \'silver\', \'smokeandtabby\', \'plusvariouspatternsandshadings\']','9 to 15 years','Soft, wavy, curly coat; many colors and patterns','Active, racy, affectionate'),(5,'Devon Rex','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/devon-rex-detail.jpg?bust=1535566997&width=355','The Devon Rex is a breed of unique appearance.Â The breedâ€™sÂ large eyes, short muzzle, prominent cheekbones, and huge, lowset ears create a characteristic elfin look. A cat of medium fine frame, the Devon is well covered with soft, wavy fur. The fur is of a distinctive texture, as the mutation that causes its wavy coat is cultivated in no other breed.','Small to Medium','[\'Short\']','9 to 15 years','Naturally curly, wavy coat; many colors and patterns','Pixie look and personality'),(6,'American Curl','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/american-curl-detail.jpg?bust=1535566890&width=355','The distinctive feature of the American Curl is their attractive, uniquely curled-back ears. Elegant, well balanced, moderately muscled, slender rather than massive in build.Â  They often appear well proportioned and balanced and can vary in size.','Small to Medium','[\'Short\', \'Semi-long\']','13+ years','Ears curl back, away from the face; available in a variety of colors and patterns','Energetic and affectionate'),(7,'Oriental','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/oriental-short-hair-detail.jpg?bust=1535567104&width=355','The Oriental is a svelte cat with long, tapering lines, very lithe but muscular. Excellent physical condition. Eyes clear. Strong and lithe, neither bony nor flabby. Because of the longer coat, the Longhair Division appears to have softer lines and less extreme type than the Shorthair Division.','Small to Medium','[\'Shorthair\', \'Longhair\']','9 to 15 years','Siamese style cat without the point markings; over 150 colors and patterns are possible','Vocal, affectionate, active; can be insistent'),(8,'Burmese','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/Burmese-01.jpg?bust=1539031130&width=355','The Burmese is a cat of medium size with substantial bone structure, good muscular development, and a surprising weight for their size. This together with a rounded head, expressive eyes, and a sweet expression presents a totally distinctive cat who is comparable to no other breed.','Medium, with males weighing from 8 to 12 pounds and females weighing from 6 to 10 pounds','[\'Sable\', \'champagne\', \'blue\', \'platinum\']','10 to 16 years','Stocky and well muscled; sable, also champagne, blue and platinum','People oriented, affectionate'),(9,'LaPerm','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/laperm-detail.jpg?bust=1535567062&width=355','The LaPerm breedÂ is a naturally occurring mutation producing curly coats in both long- and shorthaired cats. They are medium sized, of moderate type. All parts of body are in harmony with the size of cat. This breed matures in two to three years.','Medium, with males weighing from 7 to 10 pounds and females weighing from 5 to 8 pounds','[\'White\', \'black\', \'blue\', \'red\', \'cream\', \'chocolate\', \'cinnamon\', \'fawnandlavender\', \'plusvariouspatternsandshadings\']','9 to 15 years','Medium sized, curly coated; many colors and patterns','Affectionate, gentle and while very active, enjoy sitting in a comfortable lap'),(10,'Tonkinese','https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/Tonkinese-02.jpg?bust=1539031355&width=355','The Tonkinese is an alert, active cat with good muscular development. Tonkinese cats are very personable and are known for their good temperament and loyal companionship.','Medium, with males weighing 8 to 12 pounds and females weighing 6 to 8 pounds','[\'Naturalmink\', \'champagnemink\', \'bluemink\', \'platinummink\', \'naturalsolid\', \'champagnesolid\', \'bluesolid\', \'platinumsolid\', \'naturalpoint\', \'champagnepoint\', \'bluepoint\', \'platinumpoint\']','9 to 15 years','Originally developed from Burmese and Siamese; strikes a balance between the two parent breeds','Can be vocal, people oriented');

/*Table structure for table `dog` */

DROP TABLE IF EXISTS `dog`;

CREATE TABLE `dog` (
  `id` int(255) NOT NULL auto_increment,
  `breed_name` longtext NOT NULL,
  `temperment` longtext NOT NULL,
  `img` longtext NOT NULL,
  `description` longtext NOT NULL,
  `height` longtext NOT NULL,
  `weight` longtext NOT NULL,
  `life_expectancy` longtext NOT NULL,
  `grp` longtext NOT NULL,
  `color_options` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dog` */

insert  into `dog`(`id`,`breed_name`,`temperment`,`img`,`description`,`height`,`weight`,`life_expectancy`,`grp`,`color_options`) values (1,'Tibetan Spaniel','Playful, Bright, Self-Confident','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/28170708/Tibetan-Spaniel-laying-down-outdoors.jpg','The frisky and curious Tibetan Spaniel was bred ages ago for sentinel work on the walls of Tibetan monasteries. Known for a flat, silky coat and Â“lionÂ’s maneÂ” around the neck, the Tibetan Spaniel forms a tight, worshipful bond with their humans.','10 inches','9-15 pounds','12-15 years','Non-Sporting Group','[\'Black\', \'Black & Tan\', \'Cream\', \'Gold\', \'Red\', \'Sable\', \'Silver Sable\', \'White\']'),(2,'Norwich Terrier','Affectionate, Alert, Curious','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/11234249/Norwich-Terrier-standing-outdoors.jpg','Norwich Terriers are plucky little earthdogs named for their hometown in England. The old clichÃ© Â“a big dog in a small packageÂ” was coined for breeds like the Norwich, who can be oblivious to the fact that they are just 10 inches tall.','10 inches','12 pounds','12-15 years','Terrier Group','[\'Black & Tan\', \'Grizzle\', \'Red\', \'Wheaton\']'),(3,'West Highland White Terrier','Loyal, Happy, Entertaining','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/30142244/West-Highland-White-Terrier-laying-down-in-the-grass.jpg','Smart, confident, and always entertaining at play, the adorable West Highland White Terrier (Westie, for short) has charmed owners for over 300 years. This diminutive but sturdy earthdog is among the most popular of the small terriers.','10 inches','15-20 pounds','13-15 years','Terrier Group','[\'White\']'),(4,'Scottish Terrier','Confident, Independent, Spirited','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224538/Scottish-Terrier-On-White-02.jpg','A solidly compact dog of vivid personality, the Scottish Terrier is an independent, confident companion of high spirits. Scotties have a dignified, almost-human character. Their terrier persistence has earned the breed the nickname Â“the Diehard.Â”','10 inches','18-21 pounds','12 years','Terrier Group','[\'Black\', \'Black Brindle\', \'Brindle\', \'Red Brindle\', \'Silver Brindle\', \'Wheaten\']'),(5,'Lhasa Apso','Confident, Smart, Comical','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231104/Lhasa-Apso-On-White-01.jpg','The lavishly coated Lhasa Apso is a thousand-year-old breed who served as sentinels at palaces and monasteries isolated high in the Himalayas. Smart, confident, and complex, Lhasas are family comedians but regally aloof with strangers.','10-11 inches','12-18 pounds','12-15 years','Non-Sporting Group','[\'Black\', \'Black & Tan\', \'Cream\', \'Golden\', \'Grizzle\', \'Red\', \'Red Gold\', \'White\', \'Blue\', \'Charcoal\', \'Gray\', \'Liver\', \'Silver\']'),(6,'Australian Terrier','Affectionate, Courageous, Spirited','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29112347/Australian-Terrier-on-White-011.jpg','The diminutive Australian Terrier is plucky, spirited, and smartÂ—how did they fit so much dog into such a bitty package? Upbeat and lively, the self-assured Aussie approaches life with plenty of the old-time terrier curiosity and grit.','10-11 inches','15-20 pounds','11-15 years','Terrier Group','[\'Blue & Tan\', \'Red\', \'Sandy\', \'Black\', \'Black & Red\', \'Black & Tan\', \'Blue\', \'Blue & Black\', \'Blue Black & Tan\', \'Brindle\', \'Red & Black\', \'Red & Tan\', \'Red & White\', \'Sable\']'),(7,'Bolognese','Playful, Easy-Going, Devoted','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/07171038/AdobeStock_71665389.jpg','A small companion breed originating in Italy, the Bolognese is a calm, faithful dog with a long, fluffy pure-white coat. They are very playful, easy-going and love people.','10-12 inches','5.5-9 pounds','12-14 years','Foundation Stock Service','[\'White\']'),(8,'Russell Terrier','Alert, Inquisitive, Lively','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224927/Russell-Terrier-On-White-03.jpg','Upbeat, lively, inquisitive, and friendly, the jaunty Russell Terrier was developed by England\'s \"Sporting Parson\" for use in foxhunts. The adorable Russell Terrier looks like a plush toy come to life but is an eager, tireless working terrier.','10-12 inches','9-15 pounds','12-14 years','Terrier Group','[\'White\']'),(9,'Lancashire Heeler','Affectionate, Versatile, Intelligent','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/30165210/Lancashire-heeler.1.jpg','The Lancashire Heeler is a medium to high energy dog. Intelligent, alert and friendly, they are quick to learn new tasks. A sturdy little dog with a short, weather-resistant coat of black and tan or liver and tan, they are affectionate with their owners, always happy, talkative, and always ready for a walk. Their small size is what gives them their charm.','10-12 inches','9-17 pounds','12-15 years','Miscellaneous Class','[\'Black & Tan\', \'Liver & Tan\']'),(10,'Schipperke','Confident, Alert, Curious','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224700/Schipperke-On-White-01.jpg','The Schipperke, Belgium\'s \"little captain,\" is the traditional barge dog of the Low Countries. Curious, lively, and intense but mischievous, this little black dog is a robust, long-lived companion for whom there is never a dull moment.','10-12 inches','10-16 pounds','12-14 years','Non-Sporting Group','[\'Black\', \'Apricot\', \'Black & Tan\', \'Blue\', \'Chocolate\', \'Cream\', \'Fawn\', \'Gray\', \'Red\', \'White\']');

/*Table structure for table `petinfo` */

DROP TABLE IF EXISTS `petinfo`;

CREATE TABLE `petinfo` (
  `id` int(255) NOT NULL auto_increment,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `adoptpet` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `anypet` varchar(255) NOT NULL,
  `PetName_s` varchar(255) NOT NULL,
  `PetBreed_s` varchar(255) NOT NULL,
  `disposition` varchar(255) NOT NULL,
  `veterinarian_num` varchar(255) NOT NULL,
  `renthome` varchar(255) NOT NULL,
  `yard` varchar(255) NOT NULL,
  `ifyes` longtext NOT NULL,
  `petpolicy` longtext NOT NULL,
  `ifrent` longtext NOT NULL,
  `lownokill` varchar(255) NOT NULL,
  `child` varchar(255) NOT NULL,
  `ifchildyes` longtext NOT NULL,
  `hrsperday` longtext NOT NULL,
  `crate` varchar(255) NOT NULL,
  `emergently` varchar(255) NOT NULL,
  `behaveissue` longtext NOT NULL,
  `referencesnumber` longtext NOT NULL,
  `crate2` varchar(255) NOT NULL,
  `detaileddescription` longtext NOT NULL,
  `Signature` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `petinfo` */

insert  into `petinfo`(`id`,`fname`,`lname`,`adoptpet`,`email`,`phone`,`address`,`anypet`,`PetName_s`,`PetBreed_s`,`disposition`,`veterinarian_num`,`renthome`,`yard`,`ifyes`,`petpolicy`,`ifrent`,`lownokill`,`child`,`ifchildyes`,`hrsperday`,`crate`,`emergently`,`behaveissue`,`referencesnumber`,`crate2`,`detaileddescription`,`Signature`) values (1,'aniket','patil','abc','a@gmail.com','9874563210','abcnvbv','No','sbvsv','jdbvsj','jdbvs','akdbvkjadb','Rent','No','sjhdvsj','jsdhvjsh','jhdvhsv','No','96584122556','adhbcjadb','ahdvad ad','Yes','akjbca','a dcad ','ajd cmad','No','ajhdvhjad ','jdhvjadv ');

/*Table structure for table `userdetails` */

DROP TABLE IF EXISTS `userdetails`;

CREATE TABLE `userdetails` (
  `id` int(255) NOT NULL auto_increment,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userdetails` */

insert  into `userdetails`(`id`,`fname`,`lname`,`email`,`pass`) values (1,'aniket','patil','a@gmail.com','a');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
