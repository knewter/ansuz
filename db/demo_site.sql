-- MySQL dump 10.11
--
-- Host: localhost    Database: ansuz_development
-- ------------------------------------------------------
-- Server version	5.0.67-0ubuntu6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ansuz_themes`
--

DROP TABLE IF EXISTS `ansuz_themes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ansuz_themes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `repository_url` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ansuz_themes`
--

LOCK TABLES `ansuz_themes` WRITE;
/*!40000 ALTER TABLE `ansuz_themes` DISABLE KEYS */;
INSERT INTO `ansuz_themes` VALUES (2,'foo','bar','2008-11-23 03:05:56','2008-11-23 03:05:56');
/*!40000 ALTER TABLE `ansuz_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comments`
--

DROP TABLE IF EXISTS `blog_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL auto_increment,
  `author` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `website` varchar(255) default NULL,
  `text` text,
  `blog_post_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog_comments`
--

LOCK TABLES `blog_comments` WRITE;
/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `contents` text,
  `created_by` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog_posts`
--

LOCK TABLES `blog_posts` WRITE;
/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
INSERT INTO `blog_posts` VALUES (1,'It all went wrong when we left the gold standard','<p><a href=\"http://www.independent.co.uk/opinion/commentators/dominic-lawson/dominic-lawson-it-all-went-wrong-when-we-left-the-gold-standard-960268.html\">Dominic Lawson</a> on the gold standard and the failure of the New Deal:</p>\r\n<blockquote>\r\n<p>John Maynard Keynes, rather than Ludwig von Mises, is the economist whose name is currently being invoked on the airwaves in Britain. in his own day, too, Keynes obliterated Mises: it became fashionable to believe that Roosevelt&rsquo;s New Deal was a kind of successful rudimentary application of Keynesianism.</p>\r\n<p>Yet Roosevelt&rsquo;s policy of massive intervention by the state to prop up wage rates and inflate credit gets a much better press than it ever deserved. Consider this: in September 1931 the US unemployment rate was 17.4 per cent and the Dow Jones industrial Average stood at 140. By January 1938, unemployment was still at 17.4 per cent, and the Dow Average had dropped to 121.</p>\r\n</blockquote>',NULL,'2008-10-14 03:07:08','2008-10-14 03:07:08'),(2,'This is the second blog post','<p>Yessir.</p>',NULL,'2008-10-14 03:15:46','2008-10-14 03:15:46'),(3,'This is a test','<p>Heeeey</p>',NULL,'2008-10-27 12:24:36','2008-10-27 12:24:36');
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_section_versions`
--

DROP TABLE IF EXISTS `content_section_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_section_versions` (
  `id` int(11) NOT NULL auto_increment,
  `content_section_id` int(11) default NULL,
  `version` int(11) default NULL,
  `author_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `contents` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `content_section_versions`
--

LOCK TABLES `content_section_versions` WRITE;
/*!40000 ALTER TABLE `content_section_versions` DISABLE KEYS */;
INSERT INTO `content_section_versions` VALUES (1,1,1,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 04:38:13','2008-11-19 04:38:13'),(2,1,2,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 04:38:19','2008-11-19 04:38:19'),(3,1,3,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:04:21','2008-11-19 05:04:21'),(4,1,4,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 05:12:35','2008-11-19 05:12:35'),(5,1,5,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:14:55','2008-11-19 05:14:55'),(6,1,6,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 05:15:17','2008-11-19 05:15:17'),(7,1,7,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:15:45','2008-11-19 05:15:45'),(8,1,8,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 05:16:04','2008-11-19 05:16:04'),(9,1,9,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:16:43','2008-11-19 05:16:43'),(10,1,10,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 05:19:46','2008-11-19 05:19:46'),(11,1,11,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:20:01','2008-11-19 05:20:01'),(12,1,12,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 05:20:44','2008-11-19 05:20:44'),(13,1,13,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:24:09','2008-11-19 05:24:09'),(14,1,14,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 05:25:46','2008-11-19 05:25:46'),(15,1,15,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:27:32','2008-11-19 05:27:32'),(16,1,16,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 05:28:37','2008-11-19 05:28:37'),(17,1,17,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssss</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:29:35','2008-11-19 05:29:35'),(18,1,18,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img alt=\"Curved_header\" src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssssasdfsdfsd</div> <img alt=\"Curved_footer\" src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" /></div>','2008-11-19 05:29:41','2008-11-19 05:29:41'),(19,1,19,NULL,'Module for Page Plugin #1','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" /> <div class=\"content\">We\'re a <em>software development company</em> with an emphasis on <em>web applications</em>. We build products for clients ranging from wholesale knitting supply manufacturers to insurance companies.<br /> <br /> We\'d <em class=\"love\">love</em> to work for you.sadfasdfssssssssssssssasdfsdfsd</div> <img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-11-19 05:29:49','2008-11-19 05:29:49'),(20,1,20,NULL,'Module for Page Plugin #1','<p>foo</p>','2008-11-19 05:34:31','2008-11-19 05:34:31'),(21,15,1,NULL,'Module for Page Plugin #29',NULL,'2008-11-23 16:16:32','2008-11-23 16:16:32'),(22,16,1,NULL,'Module for Page Plugin #30',NULL,'2008-11-23 19:10:01','2008-11-23 19:10:01'),(23,17,1,NULL,'Module for Page Plugin #31',NULL,'2008-11-24 02:24:44','2008-11-24 02:24:44'),(24,17,2,NULL,'Module for Page Plugin #31','<p>This is the footer.</p>','2008-11-24 02:24:52','2008-11-24 02:24:52'),(25,18,1,NULL,'Module for Page Plugin #32',NULL,'2008-11-24 02:56:50','2008-11-24 02:56:50'),(26,18,2,NULL,'Module for Page Plugin #32','<p>This is the footer</p>','2008-11-24 02:57:02','2008-11-24 02:57:02'),(27,19,1,NULL,'Module for Page Plugin #33',NULL,'2008-12-02 01:48:44','2008-12-02 01:48:44'),(28,19,2,NULL,'Module for Page Plugin #33','	<!-- left nav -->\n	<div id=\"left-nav\">\n		<div class=\"top-level\">\n			<a id=\"site-home\" class=\"active\" href=\"http://w3.raleigh.foo/ccsaleskit/index.html\">foo Sales Kit</a>\n		</div>\n	</div>\n	<!-- start related links -->\n	<div id=\"related-links\">\n		<p class=\"title\">Related links</p>\n		<ul>\n			<li><a href=\"http://w3.raleigh.foo/community/ccrprograms.html\">CC marketing program brochures</a></li>\n			<li><a href=\"http://www.foo/foo/foogives/\">foo Web\n			    site</a></li>\n		<li><a href=\"https://w3.foo/transform/worksmart/tools/r2c/myportal/dealhub/dhc\">Deal Hub Connect</a></li>\n		</ul>\n	</div>\n	<!-- stop related links -->\n','2008-12-02 01:48:50','2008-12-02 01:48:50'),(29,20,1,NULL,'Module for Page Plugin #34',NULL,'2008-12-02 01:50:03','2008-12-02 01:50:03'),(30,20,2,NULL,'Module for Page Plugin #34','\n			<h2 class=\"bar-gray-med-dark\">foo contacts</h2>\n			<ul class=\"anchor-link\">\n			<li><a href=\"http://w3.foo/ondemandcommunity/contact.wss\">Find your CC Manager</a></li>\n			<li><a href=\"mailto:hrkraem@us.foo?subject=CC%20Sales%20Kit%20-%20more%20information%20needed\">Get more information</a></li>\n			</ul>\n		\n<div style=\"clear: both;\">&nbsp;</div>		\n			<h2 class=\"bar-blue-med\">foo</h2>\n			<ul class=\"anchor-link\">\n			<li><a href=\"http://www.foo/foo/responsibility/\">Corporate responsibility</a></li>\n	<li><a href=\"http://spectator.streamuk.com/strategist/episode4.php\">IBM\'s integration of CSR in our business strategy and GIE model</a></li>\n	        <li><a href=\"http://www.foo/press/us/en/pressrelease/24126.wss\">IBM Global CEO Study: CEOs Battle to Keep Up With the Pace of Change</a></li>\n	        <li><a href=\"http://www-935.foo/services/us/index.wss/ibvstudy/gbs/a1029293\">CSR Study: Attaining Sustainable Growth through Corporate Social Responsibility</a></li>\n	        <li> <a href=\"http://w3.foo/news/w3news/top_stories/2007/07/chq_itmnewsletter_0707.html\">Innovation That Matters newsletter</a></li>\n	<li><a href=\"http://w3.foo/manager/quickview/mgrqv.nsf/Content/18525667B%3A006E549E\">Corporate\n	    Citizenship Overview Quickview</a></li>\n	<li> <a href=\"http://w3.foo/news/w3news/top_stories/2007/08/chq_points_of_light_award.html\">Palmisano\n	    receives highest community service honor</a></li>\n	</ul>\n		\n<div style=\"clear: both;\">&nbsp;</div>\n			<h2 class=\"bar-green-med-dark\">State and country profiles</h2>\n	<p align=\"center\">\n      <a href=\"http://w3.raleigh.foo/ccsaleskit/profiles.html\" target=\"_blank\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/wcg_globe_hands.jpg\" alt=\"many hands holding globe\" border=\"0\" width=\"108\" height=\"102\"></a></p>	\n\n   <p align=\"center\"><strong> <a href=\"http://w3.raleigh.foo/ccsaleskit/profiles.html\">State and country profiles</a></strong></p>\n 				\n<!-- <div style=\"clear:both;\">&nbsp;</div>\n				<h2 class=\"bar-gray-med-dark\">Client connections</h2>\n			<ul class=\"anchor-link\">\n			 <li>June \n			      feature (coming soon) </li>\n			</ul>		-->\n			<br>\n		<h2 class=\"bar-blue-med\">CC programs using IBM technologies</h2>\n			<ul class=\"anchor-link\">\n				<li><a href=\"http://w3.raleigh.foo/ccsaleskit/worldcommunitygrid.html\" target=\"_blank\">Grid technology</a></li>\n				<li><a href=\"http://w3.raleigh.foo/ccsaleskit/webadaptationtechnology.html\" target=\"_blank\">Open source</a></li>\n				<li><a href=\"http://w3.raleigh.foo/ccsaleskit/traducelo.html\" target=\"_blank\">Real-time translation services</a></li>\n		      <li><a href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\" target=\"_blank\">Voice recognition</a></li>\n			</ul>			\n<div style=\"clear: both;\">&nbsp;</div>\n  </div>\n	<!-- stop sidebar -->\n','2008-12-02 01:50:13','2008-12-02 01:50:13'),(31,21,1,NULL,'Module for Page Plugin #35',NULL,'2008-12-02 01:52:13','2008-12-02 01:52:13'),(32,21,2,NULL,'Module for Page Plugin #35','	<!-- Begin CCR Banner -->\n    		<table class=\"table-wrap\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n    			<tbody><tr>\n					<td align=\"right\" bgcolor=\"#498fa9\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/ccrbanner.jpg\" alt=\"foo\" width=\"500\" height=\"150\"></td>\n				</tr>\n    			<tr>\n					<td><div class=\"hrule-dots\">&nbsp;</div></td>\n				</tr>\n   			</tbody></table>\n	<!-- End CCR Banner -->\n	\n	\n	<h2 class=\"green-dark\">Use IBM\'s community leadership as a competitive advantage</h2>\n	\n	\n		<p>Welcome to the foo (CC) Sales Kit for client facing teams,\n		  available to you on demand! Throughout this site, you will find unique\n		  value-add assets and materials that you can use with your clients to\n		  build relationships, showcase unique IBM solutions and illuminate\n		  IBM\'s commitment to global social responsibility. Although targeted\n		  industry kits are provided, don\'t miss the wide variety of other assets\n		  designed to bolster your account work, including specific <a href=\"#program\">CC\n		  program overviews</a>, <a href=\"#news\">CC in the news</a> stories and <a href=\"#success\">examples</a> of how others have used\n		  this material to win. <!-- Finally, check out the special\n		  feature, <em>Client connections,</em> which provides you a unique targeted\n		  marketing campaign to be used in client situations.--></p>\n	<!-- begin Industry materials --> 			\n		<div class=\"float-left\" style=\"width: 49%;\">\n			<h2 class=\"bar-gray-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">Industry materials</h2>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/education.html\">Education</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/government.html\">Government</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/health.html\">Health</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/smb.html\">General Business</a></li>\n				</ul>\n	  </div>\n	<!-- end Industry materials --> 	\n	\n		<div class=\"float-left\" style=\"width: 2%; background-color: rgb(255, 255, 255);\">&nbsp;</div>\n	\n	<!-- begin Value add materials --> 	\n		<div class=\"float-left\" style=\"width: 49%;\">\n			<h2 class=\"bar-gray-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">Value add materials</h2>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://www.foo/foo/foogives/awards/index.shtml\">Awards and honors</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/papers.html\">Papers and presentations</a></li>\n				</ul>\n	  </div>\n	<!-- end Value add materials --> \n		<div class=\"clear\">&nbsp;</div>\n		\n<!-- begin News and announcements --> 	\n	<a name=\"success\" id=\"success\"></a>	\n      	<h2 class=\"bar-blue-med-dark\" style=\"margin-top: 15px; margin-bottom: 10px;\">Corporate\n      	  Citizenship success stories</h2>\n			<div class=\"clear\">&nbsp;</div>\n			\n	<!-- begin left news story  -->\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<p><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/atlanta_skyline.jpg\" alt=\"Atlanta skyline\" class=\"float-left\" style=\"margin-right: 10px;\" width=\"60\" height=\"40\">\n				<a href=\"http://w3.foo/news/w3news/top_stories/discuss/2008/04/americas_pba.html\">\n				Volunteerism delivers client value</a> <br>\n			  IBMers help Public Broadcasting Atlanta focus on the future.</p>\n	  </div>\n	<!-- end left news story  -->\n	\n	<!-- begin right news story  -->			\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<p><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/hsbc.gif\" alt=\"HSBC logo\" class=\"float-left\" style=\"margin-right: 10px;\" width=\"60\" height=\"40\">\n				<a href=\"http://w3.foo/news/w3news/top_stories/2008/09/ccca_cbittaiwan.html\">\n				IBM, HSBC Multi-year win results from shared values</a> <br>\n				In July 2008, HSBC awarded IBM Taiwan a two-year, $800K (US)\n				user help desk project. CC helped win the client\'s heart.</p>\n	 \n	 			<p align=\"right\"><a href=\"http://w3.raleigh.foo/ccsaleskit/success.html\">View more featured success stories</a></p>\n	 \n	  </div>\n 	<!-- end right news story  -->\n		\n			<div class=\"clear\">&nbsp;</div>		\n		\n	<!-- begin CCR Programs --> \n	<a name=\"program\" id=\"program\"></a>\n		<h2 class=\"bar-green-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">foo program overviews</h2>\n			<div class=\"float-left\" style=\"width: 49%;\">\n			\n			<h3 class=\"green-dark\">Accessibility</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/accessibilityworks07_hires.pdf\">Accessibility Works</a></li>\n				</ul>\n						\n			<h3 class=\"green-dark\">Bridging Digital Divide</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/webadaptationtechnology.html\">accessibilityWorks &amp; Web Adaptation Technology</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/diversity.html\">Diversity initiatives</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/traducelo.html\">Â¡TradÃºceloAhora! (Translate Now)</a></li>\n				</ul>\n						\n			<h3 class=\"green-dark\">Cultural / Art</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/eternalegypt.html\">Eternal Egypt</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/forbiddencity.html\">The Forbidden City: Beyond Space and Time</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/genographic.html\">Genographic Project</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/nmaahc.html\">The National Museum of African American History and Culture</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryscience.html\">TryScience</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/worldcommunitygrid.html\">World Community Grid</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/cultural.html\">Additional programs</a></li>\n				</ul>\n\n			<h3 class=\"green-dark\">Disaster Response</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/disaster-response.html\">Disaster Response</a></li>\n				</ul>\n			\n			<h3 class=\"green-dark\">Early Childhood Education</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/kidsmart.html\">KidSmart</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>					\n				</ul>				\n			\n			<h3 class=\"green-dark\">Economic Development</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/global.citizen.html\">Global Citizens Portfolio</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/sme.html\">Small and Medium Enterprise (SME) Toolkit</a></li>	\n				</ul>\n		</div>	\n		\n		<div class=\"float-left\" style=\"width: 49%;\">\n			\n			<h3 class=\"green-dark\">Environmental</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/powerup0208_hires.pdf\">PowerUp</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/great_rivers0208_hires.pdf\">Great Rivers</a></li>	\n		  </ul>\n			\n			<h3 class=\"green-dark\">Literacy</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/sme.html\">Small and Medium Enterprise (SME) Toolkit</a></li>	\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/traducelo.html\">Â¡TradÃºceloAhora! (Translate Now)</a></li>									\n				</ul>\n\n			<h3 class=\"green-dark\">Mentoring</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/mentorplace.html\">MentorPlace</a></li>\n		 		</ul>\n\n			<h3 class=\"green-dark\">STEM Initiatives</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/csta.html\">IBM/Computer Science Teachers Association (CSTA)</a></li>\n					<li><a href=\"http://w3.raleigh.foo/community/pr/exite0508hires.pdf\">EXITE</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/genographic.html\">Genographic Project</a></li>\n					<li><a href=\"http://w3.foo/news/w3news/top_stories/2008/05/us_americas_competitiveness_summit.html\">IBM helps increase Americaâ€™s competitiveness</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/mentorplace.html\">MentorPlace</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/transitionteaching.html\">Transition to Teaching</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryengineering.html\">TryEngineering</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryscience.html\">TryScience</a></li>														\n				</ul>\n										\n			<h3 class=\"green-dark\">Systemic Reform in Education</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/changetoolkit.html\">Change Toolkit</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/reinventingeducation.html\">Reinventing Education</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/transitionteaching.html\">Transition to Teaching</a></li>\n				</ul>\n										\n			<h3 class=\"green-dark\">Volunteerism</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/ondemandcommunity.html\">On Demand Community</a></li>\n				</ul>							\n		</div>						\n		\n	<!-- end CCR Programs --> \n	\n	 <div class=\"clear\">&nbsp;</div>\n	 	\n	\n			\n			\n	<!-- begin additional news stories -->\n	<a name=\"news\" id=\"news\"></a>\n	<h2 class=\"bar-gray-dark\" style=\"margin-top: 15px; margin-bottom: 10px;\">foo in the news</h2>\n    \n    \n    <p>\n      <a href=\"http://www.csrwire.com/News/12614.html\">Stan Litow was honored by CRO Magazine as its CEO of the Year, among corporate foundation heads</a></p>\n    \n    \n   <p> <u>Assembly Magazine\'s</u> November issue, features IBM Poughkeepsie as \"Plant of the Year,\" <br>\nThe magazine includes a lengthy cover story â€” Big Blue Goes Green â€”\nhighlighting a variety of manufacturing and integrated supply chain\nefforts at IBM Poughkeepsie, including environmental initiatives,\ncustomer-driven assembly, complex products and the award criteria. In\naddition to the cover story, Assembly Magazine features sidebars on\nGreen Sigma, supply chain leadership, IBM Poughkeepsie in the community\nand innovation, and a slideshow dedicated to Poughkeepsie workers. As\nwinner of the fifth annual Assembly Plant of the Year competition, the\nIBM Poughkeepsie plant received an engraved crystal award and a\ncommemorative banner during a special presentation at the plant. Follow\nthese links to read more on these topics: </p>\n\n<ul>\n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Cover_Story/BNP_GUID_9-5-2006_A_10000000000000456511\">Big Blue Goes Green</a></li> \n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459092\">Green Sigma Initiative</a> </li>\n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459086\">A Helping Hand in the Community: Assembly Magazine: A Helping Hand in the Community</a> </li> \n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459103\">World-Class Supply Chain</a></li> \n</ul>\n\n<p><a href=\"http://www.csrwire.com/News/13552.html\">The Women Writing\nScience Project: Feminist Press and IBM Launch New Social Networking\nSite to Increase the Numbers of Young Women in Science.</a></p>\n\n<p>An exciting new aspect to the annual On Demand Community Excellence\nAward has been added for 2008! Now, IBM employees can nominate\ncoâ€“workers â€” or themselves â€” for consideration. For details, <a href=\"http://w3-01.foo/foo/ondemandcommunity/success/news.wss?CC=16108\">click\n    here</a>.</p>\n\n<p><strong>White House recognizes IBM volunteerism</strong><br>\n  IBM recently received very significant national recognition for its global community service efforts related to On\n  Demand Community and the Corporate Service Corps. On Sept. 8th, Sam Palmisano\n  and CC&amp;CA Manager Kathy Carlisle were invited to the U.S. White House where IBM was singled out\n  in a speech by President George Bush for its leadership in volunteerism in corporate citizenship practices.  \n  <br><a href=\"http://w3.foo/news/w3news/top_stories/2008/09/us_kc_wh.html\">w3 news story</a><br>\n  <a href=\"http://www.whitehouse.gov/news/releases/2008/09/20080908-6.html\">President Bush Discusses Volunteerism</a></p>	\n\n<p><strong>Supply Chain Manager of the Year: Paterson spearheads change at IBM\n  </strong><br>\n  In his distinguished career at Big Blue, chief procurement officer John Paterson\n  has made purchasing more global and strategic to the company, and he has turned\n  it into a profit generator. <a href=\"http://www.purchasing.com/index.asp?layout=articlePrint&amp;articleID=CA6603119&amp;article_prefix=CA&amp;article_id=6603119\">Read\n  the full article</a>. </p>\n\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/10/gbs_jantz_morgan.html\">Jantz Morgan engages GBS for CSR strategy</a></p>\n\n<p><a href=\"http://www.interbrand.com/press_release.aspx?pressid=244&amp;langid=1000\">IBM named one of 2008 Best Global Brands, and takes #2 slot over Microsoft</a></p>\n\n<p>IBM once again gained a prized spot on Working Mother\'s \"Best Companies\" list.<br>\n  See IBM highlighted in these articles: <a href=\"http://www.workingmother.com/web?service=vpage/3285\">10\n  best companies for Part-timers</a>, <a href=\"http://www.workingmother.com/web?service=vpage/3248\">10 Best for Paternity\n  Leave</a> and <a href=\"http://www.workingmother.com/web?service=direct/1/ViewArticlePage/dlinkFullTopArticle2&amp;sp=1665&amp;sp=94\">Ageless\n  in America</a>.</p>\n	\n<p><a href=\"http://www.csrwire.com/News/12952.html\">IBM and United States Tennis Association Go Green at the 2008 U.S. Open</a></p>\n\n<p><a href=\"http://www.csrwire.com/News/12766.html\">IBM and Bridgespan Act to Enhance the Nonprofit Sector Talent Pool</a></p>\n\n<p><a href=\"http://www.csrwire.com/News/12668.html\">IBM makes CSR Wire list of world top 20 sustainable stocks due to green efforts</a></p>\n\n<p><a href=\"http://www.globe-net.com/news/index.cfm?type=2&amp;newsID=3607\">IBM is Canada\'s Top Corporate Citizen for 2008</a></p>\n	\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/07/chq_csc.html\">The\nfirst three Corporate Service Corps (CSC) teams are now on their way to\nRomania, Ghana and the Philippines, marking the official launch of the\nprogram.</a><br> The CSC gives IBMers first-hand experience, in\nunderstanding the global economy, while developing their global\nleadership skills.\n</p>\n	\n<p><a href=\"http://w3.foo/articles/workingknowledge/2008/06/us_centralnj_TraduceloAhora.html\">IBM\n    donates software that helps non-English-speaking parents communicate with teachers.</a></p>\n\n<p><a href=\"http://www.forbes.com/leadership/claytonchristensen/2008/05/16/foo-cemex-google-lead-clayton-in_gp_0516claytonchristensen_inl.html\">The Right Corporate Karma</a><br>A\ngrowing body of evidence asserts that corporations can do well by doing\ngood, showing that conducting business responsibly and ethically is not\nonly a risk-mitigation play, but can actually lead to innovative, new\nopportunities to grow market share and revenue. </p>\n\n<p><a href=\"http://www.workingmother.com/web?service=vpage/109\">IBM in the top 5 list for Working Mother\'s 20 best companies for multicultural women.  \n</a></p>\n  \n  <p><a href=\"http://w3.foo/news/w3news/top_stories/2008/05/anz_cri_2007_gold.html\">IBM Australia Gold in Corporate Responsibility Index 2007</a><br>\nIt was announced on 20 May that IBM has again achieved gold in the <a href=\"http://w3.foo/articles/downloads/pdf/cri_results_2007.pdf\">Corporate\n  Responsibility Index</a> (CRI). This places IBM in a select group of Australian\n  companies who lead in recognising and acting on their responsibilities not\n  just to shareholders, but to a broad range of stakeholders including clients,\n  employees, the broader community and also&nbsp;the environment.</p>\n\n\n<p><a href=\"http://money.cnn.com/2008/05/15/magazines/fortune/fortune500/Gunther_superrice.fortune/?postversion=2008051516\">IBM and research team at the University of Washington announce plan to develop stronger and more nourishing strains of rice</a><br>\nIBM: From supercomputers to superrice. How sharing unused processing power computer can aid the fight against world hunger.</p>\n\n<p><a href=\"http://blog.wired.com/business/2008/05/foo-microsoft-t.html\">IBM, Microsoft Trounce Apple on Climate Friendliness Scorecard</a><br>\nIBM earned top honors among electronics manufacturers on a\nrecently-updated climate friendliness scorecard, earning 77 out of a\npossible 100 points to beat runners-up Canon, Toshiba, Sony and HP in a\nranking of the companies\' responsiveness to climate change.</p>\n  \n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/03/hk_whatmakeshkspecial.html#\">What Makes Hong Kong Special?</a><br>\nAt the south-eastern tip of China, offering a wealth of diverse\nattractions and opportunities to explore, Hong Kong is certainly a lot\nmore than a city destination. IBM has been here for over half a\ncentury, playing a pivotal role in the growth and development of this\nthriving metropolis.</p>\n\n<p><a href=\"http://www.businessweek.com/managing/content/apr2008/ca2008043_500367.htm\">Fine-Tuning Corporate Social Responsibility</a><br>\n  BusinessWeek has published an\n  interview with Business Strategy Consulting VP and Global Leader George Pohle\n  on our corporate social responsibility study.</p>\n\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/02/gbs_csr_study.html\" target=\"_blank\">Doing well by doing good: Businesses seek growth, but don\'t understand customer concerns.</a><br>\n  Corporate social responsibility can be the foundational principal of corporate\n    operations. Done right, it offers companies improved relationships with all\n    key constituents. It offers more loyal customers, lower costs, higher revenue,\n    and a more sustainable world for business and society.</p>\n	\n<p><a href=\"http://www.computerworld.com/action/article.do?command=viewArticleBasic&amp;taxonomyName=mainframes_and_supercomputers&amp;articleId=9059698&amp;taxonomyId=67&amp;intsrc=kc_top\" target=\"_blank\">  IBM\n    uses grid to advance cancer diagnosis and treatment.</a><br>\nIBM researchers and a team of doctors are building a database of\ndigital images that they hope will enable oncologists to diagnose and\ntreat cancer patients faster and with more success.</p>	\n	\n<p><a href=\"http://www.computerworld.com/action/article.do?command=viewArticleBasic&amp;articleId=9045698\" target=\"_blank\"> Cancer research gets boost from World Community Grid project.</a> <br>\n Researchers to accomplish 162 years of research in 1 to 2 years.</p>\n 	\n<p><a href=\"http://www.smallbusinesscomputing.com/news/article.php/3696486\" target=\"_blank\"> The Small Business Toolkit: Now Serving the Underserved</a> <br>\n The SmallBusiness Toolkit â€” a collaborative project of the International\n Finance Corporation (IFC) â€” an arm of the World Bank, and IBM â€” is a free,\n online resource for these emerging-market and under-served small businesses\n around the world. The Toolkit helps entrepreneurs and small business owners\n apply sound business-management practices to drive growth and success.\n</p>	\n	\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2007/07/chq_andrew_zolli.html\" target=\"_blank\"> Futurist calls IBM a â€œproxy for global trendsâ€ \n</a> <br>\n Because IBM is so big, and so global, much can be learned about where the world is headed simply by studying the company.</p>	\n	\n<p><a href=\"http://www.thecro.com/taxonomy/term/1\" target=\"_blank\"> Integrating IBM</a> <br>\n IBM takes on the challenge of weaving corporate social responsibility efforts into its core business practices.</p>\n  \n    <p align=\"right\"><a href=\"http://www.foo/foo/foogives/news/index.shtml\" target=\"_blank\">View more featured news stories</a></p>\n	<!-- end additional news stories -->\n\n			<div class=\"clear\">&nbsp;</div>\n			<p class=\"hrule-dots\" style=\"margin-top: 10px; margin-bottom: 0px;\">&nbsp;</p>\n\n	<!-- begin links to WCG and ODC -->\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<a href=\"http://www.worldcommunitygrid.org/\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/tap-into-your-community.jpg\" alt=\"World Community Grid\" width=\"225\" height=\"75\"></a>\n			</div>\n			\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<a href=\"http://w3-01.foo/foo/ondemandcommunity/home.wss\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/volunteer-for-odc.jpg\" alt=\"On Demand Community\" width=\"225\" height=\"75\"></a>\n			</div>\n	<!-- begin links to WCG and ODC -->\n	\n			<div class=\"clear\">&nbsp;</div>\n			<p class=\"hrule-dots\" style=\"margin-top: 0px; margin-bottom: 10px;\">&nbsp;</p>\n\n	\n		<p class=\"clear\">&nbsp;</p>\n		\n		<p class=\"terms\"><a href=\"http://w3.foo/w3/info_terms_of_use.html\">Terms of use</a></p>\n','2008-12-02 01:52:19','2008-12-02 01:52:19'),(33,21,3,NULL,'Module for Page Plugin #35','	<!-- start content head -->\n	<div id=\"content-head\">\n\n\n	<p id=\"breadcrumbs\"></p>\n	</div>\n	<!-- stop content head -->\n\n	<!-- start main content -->\n	<div id=\"content-main\">\n	<!-- Begin CCR Banner -->\n    		<table class=\"table-wrap\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n    			<tbody><tr>\n					<td align=\"right\" bgcolor=\"#498fa9\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/ccrbanner.jpg\" alt=\"foo\" width=\"500\" height=\"150\"></td>\n				</tr>\n    			<tr>\n					<td><div class=\"hrule-dots\">&nbsp;</div></td>\n				</tr>\n   			</tbody></table>\n	<!-- End CCR Banner -->\n	\n	\n	<h2 class=\"green-dark\">Use IBM\'s community leadership as a competitive advantage</h2>\n	\n	\n		<p>Welcome to the foo (CC) Sales Kit for client facing teams,\n		  available to you on demand! Throughout this site, you will find unique\n		  value-add assets and materials that you can use with your clients to\n		  build relationships, showcase unique IBM solutions and illuminate\n		  IBM\'s commitment to global social responsibility. Although targeted\n		  industry kits are provided, don\'t miss the wide variety of other assets\n		  designed to bolster your account work, including specific <a href=\"#program\">CC\n		  program overviews</a>, <a href=\"#news\">CC in the news</a> stories and <a href=\"#success\">examples</a> of how others have used\n		  this material to win. <!-- Finally, check out the special\n		  feature, <em>Client connections,</em> which provides you a unique targeted\n		  marketing campaign to be used in client situations.--></p>\n	<!-- begin Industry materials --> 			\n		<div class=\"float-left\" style=\"width: 49%;\">\n			<h2 class=\"bar-gray-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">Industry materials</h2>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/education.html\">Education</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/government.html\">Government</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/health.html\">Health</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/smb.html\">General Business</a></li>\n				</ul>\n	  </div>\n	<!-- end Industry materials --> 	\n	\n		<div class=\"float-left\" style=\"width: 2%; background-color: rgb(255, 255, 255);\">&nbsp;</div>\n	\n	<!-- begin Value add materials --> 	\n		<div class=\"float-left\" style=\"width: 49%;\">\n			<h2 class=\"bar-gray-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">Value add materials</h2>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://www.foo/foo/foogives/awards/index.shtml\">Awards and honors</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/papers.html\">Papers and presentations</a></li>\n				</ul>\n	  </div>\n	<!-- end Value add materials --> \n		<div class=\"clear\">&nbsp;</div>\n		\n<!-- begin News and announcements --> 	\n	<a name=\"success\" id=\"success\"></a>	\n      	<h2 class=\"bar-blue-med-dark\" style=\"margin-top: 15px; margin-bottom: 10px;\">Corporate\n      	  Citizenship success stories</h2>\n			<div class=\"clear\">&nbsp;</div>\n			\n	<!-- begin left news story  -->\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<p><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/atlanta_skyline.jpg\" alt=\"Atlanta skyline\" class=\"float-left\" style=\"margin-right: 10px;\" width=\"60\" height=\"40\">\n				<a href=\"http://w3.foo/news/w3news/top_stories/discuss/2008/04/americas_pba.html\">\n				Volunteerism delivers client value</a> <br>\n			  IBMers help Public Broadcasting Atlanta focus on the future.</p>\n	  </div>\n	<!-- end left news story  -->\n	\n	<!-- begin right news story  -->			\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<p><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/hsbc.gif\" alt=\"HSBC logo\" class=\"float-left\" style=\"margin-right: 10px;\" width=\"60\" height=\"40\">\n				<a href=\"http://w3.foo/news/w3news/top_stories/2008/09/ccca_cbittaiwan.html\">\n				IBM, HSBC Multi-year win results from shared values</a> <br>\n				In July 2008, HSBC awarded IBM Taiwan a two-year, $800K (US)\n				user help desk project. CC helped win the client\'s heart.</p>\n	 \n	 			<p align=\"right\"><a href=\"http://w3.raleigh.foo/ccsaleskit/success.html\">View more featured success stories</a></p>\n	 \n	  </div>\n 	<!-- end right news story  -->\n		\n			<div class=\"clear\">&nbsp;</div>		\n		\n	<!-- begin CCR Programs --> \n	<a name=\"program\" id=\"program\"></a>\n		<h2 class=\"bar-green-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">foo program overviews</h2>\n			<div class=\"float-left\" style=\"width: 49%;\">\n			\n			<h3 class=\"green-dark\">Accessibility</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/accessibilityworks07_hires.pdf\">Accessibility Works</a></li>\n				</ul>\n						\n			<h3 class=\"green-dark\">Bridging Digital Divide</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/webadaptationtechnology.html\">accessibilityWorks &amp; Web Adaptation Technology</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/diversity.html\">Diversity initiatives</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/traducelo.html\">Â¡TradÃºceloAhora! (Translate Now)</a></li>\n				</ul>\n						\n			<h3 class=\"green-dark\">Cultural / Art</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/eternalegypt.html\">Eternal Egypt</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/forbiddencity.html\">The Forbidden City: Beyond Space and Time</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/genographic.html\">Genographic Project</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/nmaahc.html\">The National Museum of African American History and Culture</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryscience.html\">TryScience</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/worldcommunitygrid.html\">World Community Grid</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/cultural.html\">Additional programs</a></li>\n				</ul>\n\n			<h3 class=\"green-dark\">Disaster Response</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/disaster-response.html\">Disaster Response</a></li>\n				</ul>\n			\n			<h3 class=\"green-dark\">Early Childhood Education</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/kidsmart.html\">KidSmart</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>					\n				</ul>				\n			\n			<h3 class=\"green-dark\">Economic Development</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/global.citizen.html\">Global Citizens Portfolio</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/sme.html\">Small and Medium Enterprise (SME) Toolkit</a></li>	\n				</ul>\n		</div>	\n		\n		<div class=\"float-left\" style=\"width: 49%;\">\n			\n			<h3 class=\"green-dark\">Environmental</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/powerup0208_hires.pdf\">PowerUp</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/great_rivers0208_hires.pdf\">Great Rivers</a></li>	\n		  </ul>\n			\n			<h3 class=\"green-dark\">Literacy</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/sme.html\">Small and Medium Enterprise (SME) Toolkit</a></li>	\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/traducelo.html\">Â¡TradÃºceloAhora! (Translate Now)</a></li>									\n				</ul>\n\n			<h3 class=\"green-dark\">Mentoring</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/mentorplace.html\">MentorPlace</a></li>\n		 		</ul>\n\n			<h3 class=\"green-dark\">STEM Initiatives</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/csta.html\">IBM/Computer Science Teachers Association (CSTA)</a></li>\n					<li><a href=\"http://w3.raleigh.foo/community/pr/exite0508hires.pdf\">EXITE</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/genographic.html\">Genographic Project</a></li>\n					<li><a href=\"http://w3.foo/news/w3news/top_stories/2008/05/us_americas_competitiveness_summit.html\">IBM helps increase Americaâ€™s competitiveness</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/mentorplace.html\">MentorPlace</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/transitionteaching.html\">Transition to Teaching</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryengineering.html\">TryEngineering</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryscience.html\">TryScience</a></li>														\n				</ul>\n										\n			<h3 class=\"green-dark\">Systemic Reform in Education</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/changetoolkit.html\">Change Toolkit</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/reinventingeducation.html\">Reinventing Education</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/transitionteaching.html\">Transition to Teaching</a></li>\n				</ul>\n										\n			<h3 class=\"green-dark\">Volunteerism</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/ondemandcommunity.html\">On Demand Community</a></li>\n				</ul>							\n		</div>						\n		\n	<!-- end CCR Programs --> \n	\n	 <div class=\"clear\">&nbsp;</div>\n	 	\n	\n			\n			\n	<!-- begin additional news stories -->\n	<a name=\"news\" id=\"news\"></a>\n	<h2 class=\"bar-gray-dark\" style=\"margin-top: 15px; margin-bottom: 10px;\">foo in the news</h2>\n    \n    \n    <p>\n      <a href=\"http://www.csrwire.com/News/12614.html\">Stan Litow was honored by CRO Magazine as its CEO of the Year, among corporate foundation heads</a></p>\n    \n    \n   <p> <u>Assembly Magazine\'s</u> November issue, features IBM Poughkeepsie as \"Plant of the Year,\" <br>\nThe magazine includes a lengthy cover story â€” Big Blue Goes Green â€”\nhighlighting a variety of manufacturing and integrated supply chain\nefforts at IBM Poughkeepsie, including environmental initiatives,\ncustomer-driven assembly, complex products and the award criteria. In\naddition to the cover story, Assembly Magazine features sidebars on\nGreen Sigma, supply chain leadership, IBM Poughkeepsie in the community\nand innovation, and a slideshow dedicated to Poughkeepsie workers. As\nwinner of the fifth annual Assembly Plant of the Year competition, the\nIBM Poughkeepsie plant received an engraved crystal award and a\ncommemorative banner during a special presentation at the plant. Follow\nthese links to read more on these topics: </p>\n\n<ul>\n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Cover_Story/BNP_GUID_9-5-2006_A_10000000000000456511\">Big Blue Goes Green</a></li> \n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459092\">Green Sigma Initiative</a> </li>\n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459086\">A Helping Hand in the Community: Assembly Magazine: A Helping Hand in the Community</a> </li> \n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459103\">World-Class Supply Chain</a></li> \n</ul>\n\n<p><a href=\"http://www.csrwire.com/News/13552.html\">The Women Writing\nScience Project: Feminist Press and IBM Launch New Social Networking\nSite to Increase the Numbers of Young Women in Science.</a></p>\n\n<p>An exciting new aspect to the annual On Demand Community Excellence\nAward has been added for 2008! Now, IBM employees can nominate\ncoâ€“workers â€” or themselves â€” for consideration. For details, <a href=\"http://w3-01.foo/foo/ondemandcommunity/success/news.wss?CC=16108\">click\n    here</a>.</p>\n\n<p><strong>White House recognizes IBM volunteerism</strong><br>\n  IBM recently received very significant national recognition for its global community service efforts related to On\n  Demand Community and the Corporate Service Corps. On Sept. 8th, Sam Palmisano\n  and CC&amp;CA Manager Kathy Carlisle were invited to the U.S. White House where IBM was singled out\n  in a speech by President George Bush for its leadership in volunteerism in corporate citizenship practices.  \n  <br><a href=\"http://w3.foo/news/w3news/top_stories/2008/09/us_kc_wh.html\">w3 news story</a><br>\n  <a href=\"http://www.whitehouse.gov/news/releases/2008/09/20080908-6.html\">President Bush Discusses Volunteerism</a></p>	\n\n<p><strong>Supply Chain Manager of the Year: Paterson spearheads change at IBM\n  </strong><br>\n  In his distinguished career at Big Blue, chief procurement officer John Paterson\n  has made purchasing more global and strategic to the company, and he has turned\n  it into a profit generator. <a href=\"http://www.purchasing.com/index.asp?layout=articlePrint&amp;articleID=CA6603119&amp;article_prefix=CA&amp;article_id=6603119\">Read\n  the full article</a>. </p>\n\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/10/gbs_jantz_morgan.html\">Jantz Morgan engages GBS for CSR strategy</a></p>\n\n<p><a href=\"http://www.interbrand.com/press_release.aspx?pressid=244&amp;langid=1000\">IBM named one of 2008 Best Global Brands, and takes #2 slot over Microsoft</a></p>\n\n<p>IBM once again gained a prized spot on Working Mother\'s \"Best Companies\" list.<br>\n  See IBM highlighted in these articles: <a href=\"http://www.workingmother.com/web?service=vpage/3285\">10\n  best companies for Part-timers</a>, <a href=\"http://www.workingmother.com/web?service=vpage/3248\">10 Best for Paternity\n  Leave</a> and <a href=\"http://www.workingmother.com/web?service=direct/1/ViewArticlePage/dlinkFullTopArticle2&amp;sp=1665&amp;sp=94\">Ageless\n  in America</a>.</p>\n	\n<p><a href=\"http://www.csrwire.com/News/12952.html\">IBM and United States Tennis Association Go Green at the 2008 U.S. Open</a></p>\n\n<p><a href=\"http://www.csrwire.com/News/12766.html\">IBM and Bridgespan Act to Enhance the Nonprofit Sector Talent Pool</a></p>\n\n<p><a href=\"http://www.csrwire.com/News/12668.html\">IBM makes CSR Wire list of world top 20 sustainable stocks due to green efforts</a></p>\n\n<p><a href=\"http://www.globe-net.com/news/index.cfm?type=2&amp;newsID=3607\">IBM is Canada\'s Top Corporate Citizen for 2008</a></p>\n	\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/07/chq_csc.html\">The\nfirst three Corporate Service Corps (CSC) teams are now on their way to\nRomania, Ghana and the Philippines, marking the official launch of the\nprogram.</a><br> The CSC gives IBMers first-hand experience, in\nunderstanding the global economy, while developing their global\nleadership skills.\n</p>\n	\n<p><a href=\"http://w3.foo/articles/workingknowledge/2008/06/us_centralnj_TraduceloAhora.html\">IBM\n    donates software that helps non-English-speaking parents communicate with teachers.</a></p>\n\n<p><a href=\"http://www.forbes.com/leadership/claytonchristensen/2008/05/16/foo-cemex-google-lead-clayton-in_gp_0516claytonchristensen_inl.html\">The Right Corporate Karma</a><br>A\ngrowing body of evidence asserts that corporations can do well by doing\ngood, showing that conducting business responsibly and ethically is not\nonly a risk-mitigation play, but can actually lead to innovative, new\nopportunities to grow market share and revenue. </p>\n\n<p><a href=\"http://www.workingmother.com/web?service=vpage/109\">IBM in the top 5 list for Working Mother\'s 20 best companies for multicultural women.  \n</a></p>\n  \n  <p><a href=\"http://w3.foo/news/w3news/top_stories/2008/05/anz_cri_2007_gold.html\">IBM Australia Gold in Corporate Responsibility Index 2007</a><br>\nIt was announced on 20 May that IBM has again achieved gold in the <a href=\"http://w3.foo/articles/downloads/pdf/cri_results_2007.pdf\">Corporate\n  Responsibility Index</a> (CRI). This places IBM in a select group of Australian\n  companies who lead in recognising and acting on their responsibilities not\n  just to shareholders, but to a broad range of stakeholders including clients,\n  employees, the broader community and also&nbsp;the environment.</p>\n\n\n<p><a href=\"http://money.cnn.com/2008/05/15/magazines/fortune/fortune500/Gunther_superrice.fortune/?postversion=2008051516\">IBM and research team at the University of Washington announce plan to develop stronger and more nourishing strains of rice</a><br>\nIBM: From supercomputers to superrice. How sharing unused processing power computer can aid the fight against world hunger.</p>\n\n<p><a href=\"http://blog.wired.com/business/2008/05/foo-microsoft-t.html\">IBM, Microsoft Trounce Apple on Climate Friendliness Scorecard</a><br>\nIBM earned top honors among electronics manufacturers on a\nrecently-updated climate friendliness scorecard, earning 77 out of a\npossible 100 points to beat runners-up Canon, Toshiba, Sony and HP in a\nranking of the companies\' responsiveness to climate change.</p>\n  \n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/03/hk_whatmakeshkspecial.html#\">What Makes Hong Kong Special?</a><br>\nAt the south-eastern tip of China, offering a wealth of diverse\nattractions and opportunities to explore, Hong Kong is certainly a lot\nmore than a city destination. IBM has been here for over half a\ncentury, playing a pivotal role in the growth and development of this\nthriving metropolis.</p>\n\n<p><a href=\"http://www.businessweek.com/managing/content/apr2008/ca2008043_500367.htm\">Fine-Tuning Corporate Social Responsibility</a><br>\n  BusinessWeek has published an\n  interview with Business Strategy Consulting VP and Global Leader George Pohle\n  on our corporate social responsibility study.</p>\n\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/02/gbs_csr_study.html\" target=\"_blank\">Doing well by doing good: Businesses seek growth, but don\'t understand customer concerns.</a><br>\n  Corporate social responsibility can be the foundational principal of corporate\n    operations. Done right, it offers companies improved relationships with all\n    key constituents. It offers more loyal customers, lower costs, higher revenue,\n    and a more sustainable world for business and society.</p>\n	\n<p><a href=\"http://www.computerworld.com/action/article.do?command=viewArticleBasic&amp;taxonomyName=mainframes_and_supercomputers&amp;articleId=9059698&amp;taxonomyId=67&amp;intsrc=kc_top\" target=\"_blank\">  IBM\n    uses grid to advance cancer diagnosis and treatment.</a><br>\nIBM researchers and a team of doctors are building a database of\ndigital images that they hope will enable oncologists to diagnose and\ntreat cancer patients faster and with more success.</p>	\n	\n<p><a href=\"http://www.computerworld.com/action/article.do?command=viewArticleBasic&amp;articleId=9045698\" target=\"_blank\"> Cancer research gets boost from World Community Grid project.</a> <br>\n Researchers to accomplish 162 years of research in 1 to 2 years.</p>\n 	\n<p><a href=\"http://www.smallbusinesscomputing.com/news/article.php/3696486\" target=\"_blank\"> The Small Business Toolkit: Now Serving the Underserved</a> <br>\n The SmallBusiness Toolkit â€” a collaborative project of the International\n Finance Corporation (IFC) â€” an arm of the World Bank, and IBM â€” is a free,\n online resource for these emerging-market and under-served small businesses\n around the world. The Toolkit helps entrepreneurs and small business owners\n apply sound business-management practices to drive growth and success.\n</p>	\n	\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2007/07/chq_andrew_zolli.html\" target=\"_blank\"> Futurist calls IBM a â€œproxy for global trendsâ€ \n</a> <br>\n Because IBM is so big, and so global, much can be learned about where the world is headed simply by studying the company.</p>	\n	\n<p><a href=\"http://www.thecro.com/taxonomy/term/1\" target=\"_blank\"> Integrating IBM</a> <br>\n IBM takes on the challenge of weaving corporate social responsibility efforts into its core business practices.</p>\n  \n    <p align=\"right\"><a href=\"http://www.foo/foo/foogives/news/index.shtml\" target=\"_blank\">View more featured news stories</a></p>\n	<!-- end additional news stories -->\n\n			<div class=\"clear\">&nbsp;</div>\n			<p class=\"hrule-dots\" style=\"margin-top: 10px; margin-bottom: 0px;\">&nbsp;</p>\n\n	<!-- begin links to WCG and ODC -->\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<a href=\"http://www.worldcommunitygrid.org/\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/tap-into-your-community.jpg\" alt=\"World Community Grid\" width=\"225\" height=\"75\"></a>\n			</div>\n			\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<a href=\"http://w3-01.foo/foo/ondemandcommunity/home.wss\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/volunteer-for-odc.jpg\" alt=\"On Demand Community\" width=\"225\" height=\"75\"></a>\n			</div>\n	<!-- begin links to WCG and ODC -->\n	\n			<div class=\"clear\">&nbsp;</div>\n			<p class=\"hrule-dots\" style=\"margin-top: 0px; margin-bottom: 10px;\">&nbsp;</p>\n\n	\n		<p class=\"clear\">&nbsp;</p>\n		\n		<p class=\"terms\"><a href=\"http://w3.foo/w3/info_terms_of_use.html\">Terms of use</a></p>\n</div>\n	<!-- stop main content -->\n	\n','2008-12-02 01:55:48','2008-12-02 01:55:48'),(34,21,4,NULL,'Module for Page Plugin #35','	<!-- start content head -->\n	<div id=\"content-head\">\n\n\n	<p id=\"breadcrumbs\"></p>\n	</div>\n	<!-- stop content head -->\n\n	<!-- start main content -->\n	<div id=\"content-main\">\n	<!-- Begin CCR Banner -->\n    		<table class=\"table-wrap\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n    			<tbody><tr>\n					<td align=\"right\" bgcolor=\"#498fa9\"><img src=\"/themes/foo/images/ccrbanner.jpg\" alt=\"foo\" width=\"500\" height=\"150\"></td>\n				</tr>\n    			<tr>\n					<td><div class=\"hrule-dots\">&nbsp;</div></td>\n				</tr>\n   			</tbody></table>\n	<!-- End CCR Banner -->\n	\n	\n	<h2 class=\"green-dark\">Use IBM\'s community leadership as a competitive advantage</h2>\n	\n	\n		<p>Welcome to the foo (CC) Sales Kit for client facing teams,\n		  available to you on demand! Throughout this site, you will find unique\n		  value-add assets and materials that you can use with your clients to\n		  build relationships, showcase unique IBM solutions and illuminate\n		  IBM\'s commitment to global social responsibility. Although targeted\n		  industry kits are provided, don\'t miss the wide variety of other assets\n		  designed to bolster your account work, including specific <a href=\"#program\">CC\n		  program overviews</a>, <a href=\"#news\">CC in the news</a> stories and <a href=\"#success\">examples</a> of how others have used\n		  this material to win. <!-- Finally, check out the special\n		  feature, <em>Client connections,</em> which provides you a unique targeted\n		  marketing campaign to be used in client situations.--></p>\n	<!-- begin Industry materials --> 			\n		<div class=\"float-left\" style=\"width: 49%;\">\n			<h2 class=\"bar-gray-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">Industry materials</h2>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/education.html\">Education</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/government.html\">Government</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/health.html\">Health</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/smb.html\">General Business</a></li>\n				</ul>\n	  </div>\n	<!-- end Industry materials --> 	\n	\n		<div class=\"float-left\" style=\"width: 2%; background-color: rgb(255, 255, 255);\">&nbsp;</div>\n	\n	<!-- begin Value add materials --> 	\n		<div class=\"float-left\" style=\"width: 49%;\">\n			<h2 class=\"bar-gray-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">Value add materials</h2>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://www.foo/foo/foogives/awards/index.shtml\">Awards and honors</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/papers.html\">Papers and presentations</a></li>\n				</ul>\n	  </div>\n	<!-- end Value add materials --> \n		<div class=\"clear\">&nbsp;</div>\n		\n<!-- begin News and announcements --> 	\n	<a name=\"success\" id=\"success\"></a>	\n      	<h2 class=\"bar-blue-med-dark\" style=\"margin-top: 15px; margin-bottom: 10px;\">Corporate\n      	  Citizenship success stories</h2>\n			<div class=\"clear\">&nbsp;</div>\n			\n	<!-- begin left news story  -->\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<p><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/atlanta_skyline.jpg\" alt=\"Atlanta skyline\" class=\"float-left\" style=\"margin-right: 10px;\" width=\"60\" height=\"40\">\n				<a href=\"http://w3.foo/news/w3news/top_stories/discuss/2008/04/americas_pba.html\">\n				Volunteerism delivers client value</a> <br>\n			  IBMers help Public Broadcasting Atlanta focus on the future.</p>\n	  </div>\n	<!-- end left news story  -->\n	\n	<!-- begin right news story  -->			\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<p><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/hsbc.gif\" alt=\"HSBC logo\" class=\"float-left\" style=\"margin-right: 10px;\" width=\"60\" height=\"40\">\n				<a href=\"http://w3.foo/news/w3news/top_stories/2008/09/ccca_cbittaiwan.html\">\n				IBM, HSBC Multi-year win results from shared values</a> <br>\n				In July 2008, HSBC awarded IBM Taiwan a two-year, $800K (US)\n				user help desk project. CC helped win the client\'s heart.</p>\n	 \n	 			<p align=\"right\"><a href=\"http://w3.raleigh.foo/ccsaleskit/success.html\">View more featured success stories</a></p>\n	 \n	  </div>\n 	<!-- end right news story  -->\n		\n			<div class=\"clear\">&nbsp;</div>		\n		\n	<!-- begin CCR Programs --> \n	<a name=\"program\" id=\"program\"></a>\n		<h2 class=\"bar-green-dark\" style=\"margin-top: 10px; margin-bottom: 10px;\">foo program overviews</h2>\n			<div class=\"float-left\" style=\"width: 49%;\">\n			\n			<h3 class=\"green-dark\">Accessibility</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/accessibilityworks07_hires.pdf\">Accessibility Works</a></li>\n				</ul>\n						\n			<h3 class=\"green-dark\">Bridging Digital Divide</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/webadaptationtechnology.html\">accessibilityWorks &amp; Web Adaptation Technology</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/diversity.html\">Diversity initiatives</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/traducelo.html\">Â¡TradÃºceloAhora! (Translate Now)</a></li>\n				</ul>\n						\n			<h3 class=\"green-dark\">Cultural / Art</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/eternalegypt.html\">Eternal Egypt</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/forbiddencity.html\">The Forbidden City: Beyond Space and Time</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/genographic.html\">Genographic Project</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/nmaahc.html\">The National Museum of African American History and Culture</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryscience.html\">TryScience</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/worldcommunitygrid.html\">World Community Grid</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/cultural.html\">Additional programs</a></li>\n				</ul>\n\n			<h3 class=\"green-dark\">Disaster Response</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/disaster-response.html\">Disaster Response</a></li>\n				</ul>\n			\n			<h3 class=\"green-dark\">Early Childhood Education</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/kidsmart.html\">KidSmart</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>					\n				</ul>				\n			\n			<h3 class=\"green-dark\">Economic Development</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/global.citizen.html\">Global Citizens Portfolio</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/sme.html\">Small and Medium Enterprise (SME) Toolkit</a></li>	\n				</ul>\n		</div>	\n		\n		<div class=\"float-left\" style=\"width: 49%;\">\n			\n			<h3 class=\"green-dark\">Environmental</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/powerup0208_hires.pdf\">PowerUp</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/community/pr/great_rivers0208_hires.pdf\">Great Rivers</a></li>	\n		  </ul>\n			\n			<h3 class=\"green-dark\">Literacy</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\">Reading Companion</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/sme.html\">Small and Medium Enterprise (SME) Toolkit</a></li>	\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/traducelo.html\">Â¡TradÃºceloAhora! (Translate Now)</a></li>									\n				</ul>\n\n			<h3 class=\"green-dark\">Mentoring</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/mentorplace.html\">MentorPlace</a></li>\n		 		</ul>\n\n			<h3 class=\"green-dark\">STEM Initiatives</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/csta.html\">IBM/Computer Science Teachers Association (CSTA)</a></li>\n					<li><a href=\"http://w3.raleigh.foo/community/pr/exite0508hires.pdf\">EXITE</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/genographic.html\">Genographic Project</a></li>\n					<li><a href=\"http://w3.foo/news/w3news/top_stories/2008/05/us_americas_competitiveness_summit.html\">IBM helps increase Americaâ€™s competitiveness</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/mentorplace.html\">MentorPlace</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/transitionteaching.html\">Transition to Teaching</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryengineering.html\">TryEngineering</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/tryscience.html\">TryScience</a></li>														\n				</ul>\n										\n			<h3 class=\"green-dark\">Systemic Reform in Education</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/changetoolkit.html\">Change Toolkit</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/reinventingeducation.html\">Reinventing Education</a></li>\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/transitionteaching.html\">Transition to Teaching</a></li>\n				</ul>\n										\n			<h3 class=\"green-dark\">Volunteerism</h3>\n				<ul style=\"margin-left: 2em; padding-left: 0pt;\">\n					<li><a class=\"head\" href=\"http://w3.raleigh.foo/ccsaleskit/ondemandcommunity.html\">On Demand Community</a></li>\n				</ul>							\n		</div>						\n		\n	<!-- end CCR Programs --> \n	\n	 <div class=\"clear\">&nbsp;</div>\n	 	\n	\n			\n			\n	<!-- begin additional news stories -->\n	<a name=\"news\" id=\"news\"></a>\n	<h2 class=\"bar-gray-dark\" style=\"margin-top: 15px; margin-bottom: 10px;\">foo in the news</h2>\n    \n    \n    <p>\n      <a href=\"http://www.csrwire.com/News/12614.html\">Stan Litow was honored by CRO Magazine as its CEO of the Year, among corporate foundation heads</a></p>\n    \n    \n   <p> <u>Assembly Magazine\'s</u> November issue, features IBM Poughkeepsie as \"Plant of the Year,\" <br>\nThe magazine includes a lengthy cover story â€” Big Blue Goes Green â€”\nhighlighting a variety of manufacturing and integrated supply chain\nefforts at IBM Poughkeepsie, including environmental initiatives,\ncustomer-driven assembly, complex products and the award criteria. In\naddition to the cover story, Assembly Magazine features sidebars on\nGreen Sigma, supply chain leadership, IBM Poughkeepsie in the community\nand innovation, and a slideshow dedicated to Poughkeepsie workers. As\nwinner of the fifth annual Assembly Plant of the Year competition, the\nIBM Poughkeepsie plant received an engraved crystal award and a\ncommemorative banner during a special presentation at the plant. Follow\nthese links to read more on these topics: </p>\n\n<ul>\n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Cover_Story/BNP_GUID_9-5-2006_A_10000000000000456511\">Big Blue Goes Green</a></li> \n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459092\">Green Sigma Initiative</a> </li>\n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459086\">A Helping Hand in the Community: Assembly Magazine: A Helping Hand in the Community</a> </li> \n<li><a href=\"http://www.assemblymag.com/CDA/Articles/Web_Exclusive/BNP_GUID_9-5-2006_A_10000000000000459103\">World-Class Supply Chain</a></li> \n</ul>\n\n<p><a href=\"http://www.csrwire.com/News/13552.html\">The Women Writing\nScience Project: Feminist Press and IBM Launch New Social Networking\nSite to Increase the Numbers of Young Women in Science.</a></p>\n\n<p>An exciting new aspect to the annual On Demand Community Excellence\nAward has been added for 2008! Now, IBM employees can nominate\ncoâ€“workers â€” or themselves â€” for consideration. For details, <a href=\"http://w3-01.foo/foo/ondemandcommunity/success/news.wss?CC=16108\">click\n    here</a>.</p>\n\n<p><strong>White House recognizes IBM volunteerism</strong><br>\n  IBM recently received very significant national recognition for its global community service efforts related to On\n  Demand Community and the Corporate Service Corps. On Sept. 8th, Sam Palmisano\n  and CC&amp;CA Manager Kathy Carlisle were invited to the U.S. White House where IBM was singled out\n  in a speech by President George Bush for its leadership in volunteerism in corporate citizenship practices.  \n  <br><a href=\"http://w3.foo/news/w3news/top_stories/2008/09/us_kc_wh.html\">w3 news story</a><br>\n  <a href=\"http://www.whitehouse.gov/news/releases/2008/09/20080908-6.html\">President Bush Discusses Volunteerism</a></p>	\n\n<p><strong>Supply Chain Manager of the Year: Paterson spearheads change at IBM\n  </strong><br>\n  In his distinguished career at Big Blue, chief procurement officer John Paterson\n  has made purchasing more global and strategic to the company, and he has turned\n  it into a profit generator. <a href=\"http://www.purchasing.com/index.asp?layout=articlePrint&amp;articleID=CA6603119&amp;article_prefix=CA&amp;article_id=6603119\">Read\n  the full article</a>. </p>\n\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/10/gbs_jantz_morgan.html\">Jantz Morgan engages GBS for CSR strategy</a></p>\n\n<p><a href=\"http://www.interbrand.com/press_release.aspx?pressid=244&amp;langid=1000\">IBM named one of 2008 Best Global Brands, and takes #2 slot over Microsoft</a></p>\n\n<p>IBM once again gained a prized spot on Working Mother\'s \"Best Companies\" list.<br>\n  See IBM highlighted in these articles: <a href=\"http://www.workingmother.com/web?service=vpage/3285\">10\n  best companies for Part-timers</a>, <a href=\"http://www.workingmother.com/web?service=vpage/3248\">10 Best for Paternity\n  Leave</a> and <a href=\"http://www.workingmother.com/web?service=direct/1/ViewArticlePage/dlinkFullTopArticle2&amp;sp=1665&amp;sp=94\">Ageless\n  in America</a>.</p>\n	\n<p><a href=\"http://www.csrwire.com/News/12952.html\">IBM and United States Tennis Association Go Green at the 2008 U.S. Open</a></p>\n\n<p><a href=\"http://www.csrwire.com/News/12766.html\">IBM and Bridgespan Act to Enhance the Nonprofit Sector Talent Pool</a></p>\n\n<p><a href=\"http://www.csrwire.com/News/12668.html\">IBM makes CSR Wire list of world top 20 sustainable stocks due to green efforts</a></p>\n\n<p><a href=\"http://www.globe-net.com/news/index.cfm?type=2&amp;newsID=3607\">IBM is Canada\'s Top Corporate Citizen for 2008</a></p>\n	\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/07/chq_csc.html\">The\nfirst three Corporate Service Corps (CSC) teams are now on their way to\nRomania, Ghana and the Philippines, marking the official launch of the\nprogram.</a><br> The CSC gives IBMers first-hand experience, in\nunderstanding the global economy, while developing their global\nleadership skills.\n</p>\n	\n<p><a href=\"http://w3.foo/articles/workingknowledge/2008/06/us_centralnj_TraduceloAhora.html\">IBM\n    donates software that helps non-English-speaking parents communicate with teachers.</a></p>\n\n<p><a href=\"http://www.forbes.com/leadership/claytonchristensen/2008/05/16/foo-cemex-google-lead-clayton-in_gp_0516claytonchristensen_inl.html\">The Right Corporate Karma</a><br>A\ngrowing body of evidence asserts that corporations can do well by doing\ngood, showing that conducting business responsibly and ethically is not\nonly a risk-mitigation play, but can actually lead to innovative, new\nopportunities to grow market share and revenue. </p>\n\n<p><a href=\"http://www.workingmother.com/web?service=vpage/109\">IBM in the top 5 list for Working Mother\'s 20 best companies for multicultural women.  \n</a></p>\n  \n  <p><a href=\"http://w3.foo/news/w3news/top_stories/2008/05/anz_cri_2007_gold.html\">IBM Australia Gold in Corporate Responsibility Index 2007</a><br>\nIt was announced on 20 May that IBM has again achieved gold in the <a href=\"http://w3.foo/articles/downloads/pdf/cri_results_2007.pdf\">Corporate\n  Responsibility Index</a> (CRI). This places IBM in a select group of Australian\n  companies who lead in recognising and acting on their responsibilities not\n  just to shareholders, but to a broad range of stakeholders including clients,\n  employees, the broader community and also&nbsp;the environment.</p>\n\n\n<p><a href=\"http://money.cnn.com/2008/05/15/magazines/fortune/fortune500/Gunther_superrice.fortune/?postversion=2008051516\">IBM and research team at the University of Washington announce plan to develop stronger and more nourishing strains of rice</a><br>\nIBM: From supercomputers to superrice. How sharing unused processing power computer can aid the fight against world hunger.</p>\n\n<p><a href=\"http://blog.wired.com/business/2008/05/foo-microsoft-t.html\">IBM, Microsoft Trounce Apple on Climate Friendliness Scorecard</a><br>\nIBM earned top honors among electronics manufacturers on a\nrecently-updated climate friendliness scorecard, earning 77 out of a\npossible 100 points to beat runners-up Canon, Toshiba, Sony and HP in a\nranking of the companies\' responsiveness to climate change.</p>\n  \n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/03/hk_whatmakeshkspecial.html#\">What Makes Hong Kong Special?</a><br>\nAt the south-eastern tip of China, offering a wealth of diverse\nattractions and opportunities to explore, Hong Kong is certainly a lot\nmore than a city destination. IBM has been here for over half a\ncentury, playing a pivotal role in the growth and development of this\nthriving metropolis.</p>\n\n<p><a href=\"http://www.businessweek.com/managing/content/apr2008/ca2008043_500367.htm\">Fine-Tuning Corporate Social Responsibility</a><br>\n  BusinessWeek has published an\n  interview with Business Strategy Consulting VP and Global Leader George Pohle\n  on our corporate social responsibility study.</p>\n\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2008/02/gbs_csr_study.html\" target=\"_blank\">Doing well by doing good: Businesses seek growth, but don\'t understand customer concerns.</a><br>\n  Corporate social responsibility can be the foundational principal of corporate\n    operations. Done right, it offers companies improved relationships with all\n    key constituents. It offers more loyal customers, lower costs, higher revenue,\n    and a more sustainable world for business and society.</p>\n	\n<p><a href=\"http://www.computerworld.com/action/article.do?command=viewArticleBasic&amp;taxonomyName=mainframes_and_supercomputers&amp;articleId=9059698&amp;taxonomyId=67&amp;intsrc=kc_top\" target=\"_blank\">  IBM\n    uses grid to advance cancer diagnosis and treatment.</a><br>\nIBM researchers and a team of doctors are building a database of\ndigital images that they hope will enable oncologists to diagnose and\ntreat cancer patients faster and with more success.</p>	\n	\n<p><a href=\"http://www.computerworld.com/action/article.do?command=viewArticleBasic&amp;articleId=9045698\" target=\"_blank\"> Cancer research gets boost from World Community Grid project.</a> <br>\n Researchers to accomplish 162 years of research in 1 to 2 years.</p>\n 	\n<p><a href=\"http://www.smallbusinesscomputing.com/news/article.php/3696486\" target=\"_blank\"> The Small Business Toolkit: Now Serving the Underserved</a> <br>\n The SmallBusiness Toolkit â€” a collaborative project of the International\n Finance Corporation (IFC) â€” an arm of the World Bank, and IBM â€” is a free,\n online resource for these emerging-market and under-served small businesses\n around the world. The Toolkit helps entrepreneurs and small business owners\n apply sound business-management practices to drive growth and success.\n</p>	\n	\n<p><a href=\"http://w3.foo/news/w3news/top_stories/2007/07/chq_andrew_zolli.html\" target=\"_blank\"> Futurist calls IBM a â€œproxy for global trendsâ€ \n</a> <br>\n Because IBM is so big, and so global, much can be learned about where the world is headed simply by studying the company.</p>	\n	\n<p><a href=\"http://www.thecro.com/taxonomy/term/1\" target=\"_blank\"> Integrating IBM</a> <br>\n IBM takes on the challenge of weaving corporate social responsibility efforts into its core business practices.</p>\n  \n    <p align=\"right\"><a href=\"http://www.foo/foo/foogives/news/index.shtml\" target=\"_blank\">View more featured news stories</a></p>\n	<!-- end additional news stories -->\n\n			<div class=\"clear\">&nbsp;</div>\n			<p class=\"hrule-dots\" style=\"margin-top: 10px; margin-bottom: 0px;\">&nbsp;</p>\n\n	<!-- begin links to WCG and ODC -->\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<a href=\"http://www.worldcommunitygrid.org/\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/tap-into-your-community.jpg\" alt=\"World Community Grid\" width=\"225\" height=\"75\"></a>\n			</div>\n			\n			<div class=\"float-left\" style=\"width: 48%;\">\n				<a href=\"http://w3-01.foo/foo/ondemandcommunity/home.wss\"><img src=\"/themes/foo/images/volunteer-for-odc.jpg\" alt=\"On Demand Community\" width=\"225\" height=\"75\"></a>\n			</div>\n	<!-- begin links to WCG and ODC -->\n	\n			<div class=\"clear\">&nbsp;</div>\n			<p class=\"hrule-dots\" style=\"margin-top: 0px; margin-bottom: 10px;\">&nbsp;</p>\n\n	\n		<p class=\"clear\">&nbsp;</p>\n		\n		<p class=\"terms\"><a href=\"http://w3.foo/w3/info_terms_of_use.html\">Terms of use</a></p>\n</div>\n	<!-- stop main content -->\n	\n','2008-12-02 02:01:51','2008-12-02 02:01:51'),(35,19,3,NULL,'Module for Page Plugin #33','<!-- left nav --> 	<div id=\"left-nav\"><div class=\"top-level\"><a href=\"http://w3.raleigh.foo/ccsaleskit/index.html\" class=\"active\" id=\"site-home\">foo Sales Kit</a></div></div> 	<!-- start related links --> 	<div id=\"related-links\"><p class=\"title\">Related links</p> 		<ul> 			<li><a href=\"http://w3.raleigh.foo/community/ccrprograms.html\">CC marketing program brochures</a></li> 			<li><a href=\"http://www.foo/foo/foogives/\">foo Web 			    site</a></li> 		<li><a href=\"https://w3.foo/transform/worksmart/tools/r2c/myportal/dealhub/dhc\">Deal Hub Connect</a></li> 		</ul></div> 	<!-- stop related links -->','2008-12-04 02:39:02','2008-12-04 02:39:02'),(36,22,1,NULL,'Module for Page Plugin #41',NULL,'2008-12-07 23:47:56','2008-12-07 23:47:56'),(37,9,1,NULL,'Module for Page Plugin #18','<p>Please contact us if you have any questions, at 205-555-1515</p><br />','2008-12-11 00:02:28','2008-12-11 00:02:28'),(38,5,1,NULL,'Module for Page Plugin #13','<p>We have no definitive purpose, this is just a demo site after all.</p>','2008-12-11 00:02:56','2008-12-11 00:02:56'),(39,4,1,NULL,'Module for Page Plugin #9','<p>There\'s a photo album plugin after this content section.&nbsp; Bring up this page in the admin interface and you should be able to upload some photos to it.</p><br />','2008-12-11 00:03:39','2008-12-11 00:03:39'),(40,21,5,NULL,'Module for Page Plugin #35','<p>Congratulations, you\'ve got Ansuz up and running?&nbsp; Now you should just</p><a href=\"/admin\">log in as an admin</a><p>and start fooling around!</p><br />','2008-12-11 00:05:15','2008-12-11 00:05:15'),(41,21,6,NULL,'Module for Page Plugin #35','<p>Congratulations, you\'ve got Ansuz up and running?&nbsp; Now you should just <a href=\"/admin\">log in as an admin</a> and start fooling around!</p>','2008-12-11 00:05:34','2008-12-11 00:05:34'),(42,21,7,NULL,'Module for Page Plugin #35','<p>Congratulations, you\'ve got Ansuz up and running!&nbsp; Now you should just <a href=\"/admin\">log in as an admin</a> and start fooling around!</p>','2008-12-11 00:05:42','2008-12-11 00:05:42');
/*!40000 ALTER TABLE `content_section_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_sections`
--

DROP TABLE IF EXISTS `content_sections`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_sections` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `contents` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `version` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `content_sections`
--

LOCK TABLES `content_sections` WRITE;
/*!40000 ALTER TABLE `content_sections` DISABLE KEYS */;
INSERT INTO `content_sections` VALUES (1,'Module for Page Plugin #1','<p>foo</p>','2008-08-24 21:08:55','2008-11-19 05:34:31',20),(2,'Module for Page Plugin #7','Ansuz may be <a href=\'http://github.com/knewter/ansuz/tree/master\'>downloaded at the github project page</a>.','2008-09-07 01:14:55','2008-09-07 01:17:56',1),(3,'Module for Page Plugin #8','<h3>github</h3>\r\n<p>It\'s an open source project on <a href=\"http://www.github.com\">github</a>, so <a href=\"http://github.com/knewter/ansuz/tree/master\">come on over and fork with us.</a></p>\r\n\r\n<h3>IRC</h3>\r\n<p>We also tend to hang out in #ansuz on FreeNode.</p>','2008-09-07 18:05:37','2008-09-07 18:09:51',1),(4,'Module for Page Plugin #9','<p>There\'s a photo album plugin after this content section.&nbsp; Bring up this page in the admin interface and you should be able to upload some photos to it.</p><br />','2008-09-07 22:20:24','2008-12-11 00:03:39',1),(5,'Module for Page Plugin #13','<p>We have no definitive purpose, this is just a demo site after all.</p>','2008-10-12 20:56:03','2008-12-11 00:02:56',1),(6,'Module for Page Plugin #14','<div align=\"center\">\n<form action=\"https://www.paypal.com/cgi-bin/webscr\" method=\"post\">\n    <input type=\"hidden\" name=\"cmd\" value=\"_xclick\" /> <input type=\"hidden\" name=\"business\" value=\"payments@isotope11.com\" /> <input type=\"hidden\" name=\"item_name\" value=\"Isotope Eleven\" /> <input type=\"hidden\" name=\"item_number\" value=\"Services\" /> <input type=\"hidden\" name=\"no_shipping\" value=\"0\" /> <input type=\"hidden\" name=\"no_note\" value=\"1\" /> <input type=\"hidden\" name=\"currency_code\" value=\"USD\" /> <input type=\"hidden\" name=\"lc\" value=\"US\" /> <input type=\"hidden\" name=\"bn\" value=\"PP-BuyNowBF\" /> <input type=\"image\" border=\"0\" src=\"https://www.paypal.com/en_US/i/btn/btn_paynowCC_LG.gif\" name=\"submit\" alt=\"PayPal - The safer, easier way to pay online!\" /> <img width=\"1\" height=\"1\" border=\"0\" alt=\"\" src=\"https://www.paypal.com/en_US/i/scr/pixel.gif\" />\n</form>\n<br />\n<br />\n<strong>Question:</strong> Do I need a paypal account to use this payment method?<br />\n<br />\n<div align=\"center\"><strong>Answer: </strong>NO. You do not need a paypal account to use this. Simply follow the instructions on the<br />\nleft hand side of the payment screen.<br />\n</div>\n<br />\n<br />\n<a onclick=\"document.getElementById(myid).name=\'new_user_button.x\';document.getElementById(myid).value=\'\';document.forms.login_form.submit();return false;\" href=\"https://www.paypal.com/cgi-bin/webscr#\"></a><noscript><input type=\"submit\" name=\"new_user_button.x\" value=\"Continue\" class=\"transparentButton\" alt=\"\"></noscript>\n<div id=\"xptCardIcons\"> <img width=\"26\" height=\"16\" border=\"0\" alt=\"Visa\" class=\"marginBottom\" src=\"https://www.paypalobjects.com/WEBSCR-475-20070806-1/en_US/i/logo/logo_ccVisa.gif\" /><wbr></wbr><img border=\"0\" alt=\"Mastercard\" class=\"marginBottom\" src=\"https://www.paypalobjects.com/WEBSCR-475-20070806-1/en_US/i/logo/logo_ccMC.gif\" /><wbr></wbr><img border=\"0\" alt=\"American Express\" class=\"marginBottom\" src=\"https://www.paypalobjects.com/WEBSCR-475-20070806-1/en_US/i/logo/logo_ccAmex.gif\" /><wbr></wbr><img border=\"0\" alt=\"Discover\" class=\"marginBottom\" src=\"https://www.paypalobjects.com/WEBSCR-475-20070806-1/en_US/i/logo/logo_ccDiscover.gif\" /><wbr></wbr><img border=\"0\" alt=\"eCheck\" class=\"marginBottom\" src=\"https://www.paypalobjects.com/WEBSCR-475-20070806-1/en_US/i/logo/logo_ccEcheck.gif\" /><wbr></wbr><img border=\"0\" alt=\"PayPal\" class=\"marginBottom\" src=\"https://www.paypalobjects.com/WEBSCR-475-20070806-1/en_US/i/logo/PayPal_mark_37x23.gif\" /></div>\n</div>','2008-10-12 21:51:34','2008-10-12 21:53:41',1),(7,'Module for Page Plugin #16','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" />\n<div class=\"content\">\n<em>MyStock</em> A selective stock photography site with an expressive search system.</div>\n<img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-10-13 10:48:15','2008-10-14 03:05:27',1),(8,'Module for Page Plugin #17','<div class=\"curved\"><img src=\"/themes/ansuz_theme_isotope11/images/curved_header.png\" alt=\"Curved_header\" />\n<div class=\"content\">An <em>open-source content management system</em> built in <em class=\'love\'>Ruby on Rails</em> that just works.</div>\n<img src=\"/themes/ansuz_theme_isotope11/images/curved_footer.png\" alt=\"Curved_footer\" /></div>','2008-10-14 01:29:14','2008-10-14 01:30:09',1),(9,'Module for Page Plugin #18','<p>Please contact us if you have any questions, at 205-555-1515</p><br />','2008-10-14 01:30:57','2008-12-11 00:02:28',1),(10,'Module for Page Plugin #19',NULL,'2008-10-27 02:32:49','2008-10-27 02:32:49',1),(11,'Module for Page Plugin #21',NULL,'2008-11-04 05:21:16','2008-11-04 05:21:16',1),(12,'Module for Page Plugin #23',NULL,'2008-11-09 20:49:52','2008-11-09 20:49:52',1),(13,'Module for Page Plugin #25',NULL,'2008-11-16 19:53:20','2008-11-16 19:53:20',1),(14,'Module for Page Plugin #26',NULL,'2008-11-16 20:19:10','2008-11-16 20:19:10',1),(15,'Module for Page Plugin #29',NULL,'2008-11-23 16:16:32','2008-11-23 16:16:32',1),(16,'Module for Page Plugin #30',NULL,'2008-11-23 19:10:01','2008-11-23 19:10:01',1),(17,'Module for Page Plugin #31','<p>This is the footer.</p>','2008-11-24 02:24:44','2008-11-24 02:24:52',2),(18,'Module for Page Plugin #32','<p>This is the footer</p>','2008-11-24 02:56:50','2008-11-24 02:57:02',2),(19,'Module for Page Plugin #33','<!-- left nav --> 	<div id=\"left-nav\"><div class=\"top-level\"><a href=\"http://w3.raleigh.foo/ccsaleskit/index.html\" class=\"active\" id=\"site-home\">foo Sales Kit</a></div></div> 	<!-- start related links --> 	<div id=\"related-links\"><p class=\"title\">Related links</p> 		<ul> 			<li><a href=\"http://w3.raleigh.foo/community/ccrprograms.html\">CC marketing program brochures</a></li> 			<li><a href=\"http://www.foo/foo/foogives/\">foo Web 			    site</a></li> 		<li><a href=\"https://w3.foo/transform/worksmart/tools/r2c/myportal/dealhub/dhc\">Deal Hub Connect</a></li> 		</ul></div> 	<!-- stop related links -->','2008-12-02 01:48:44','2008-12-04 02:39:02',3),(20,'Module for Page Plugin #34','\n			<h2 class=\"bar-gray-med-dark\">foo contacts</h2>\n			<ul class=\"anchor-link\">\n			<li><a href=\"http://w3.foo/ondemandcommunity/contact.wss\">Find your CC Manager</a></li>\n			<li><a href=\"mailto:hrkraem@us.foo?subject=CC%20Sales%20Kit%20-%20more%20information%20needed\">Get more information</a></li>\n			</ul>\n		\n<div style=\"clear: both;\">&nbsp;</div>		\n			<h2 class=\"bar-blue-med\">foo</h2>\n			<ul class=\"anchor-link\">\n			<li><a href=\"http://www.foo/foo/responsibility/\">Corporate responsibility</a></li>\n	<li><a href=\"http://spectator.streamuk.com/strategist/episode4.php\">IBM\'s integration of CSR in our business strategy and GIE model</a></li>\n	        <li><a href=\"http://www.foo/press/us/en/pressrelease/24126.wss\">IBM Global CEO Study: CEOs Battle to Keep Up With the Pace of Change</a></li>\n	        <li><a href=\"http://www-935.foo/services/us/index.wss/ibvstudy/gbs/a1029293\">CSR Study: Attaining Sustainable Growth through Corporate Social Responsibility</a></li>\n	        <li> <a href=\"http://w3.foo/news/w3news/top_stories/2007/07/chq_itmnewsletter_0707.html\">Innovation That Matters newsletter</a></li>\n	<li><a href=\"http://w3.foo/manager/quickview/mgrqv.nsf/Content/18525667B%3A006E549E\">Corporate\n	    Citizenship Overview Quickview</a></li>\n	<li> <a href=\"http://w3.foo/news/w3news/top_stories/2007/08/chq_points_of_light_award.html\">Palmisano\n	    receives highest community service honor</a></li>\n	</ul>\n		\n<div style=\"clear: both;\">&nbsp;</div>\n			<h2 class=\"bar-green-med-dark\">State and country profiles</h2>\n	<p align=\"center\">\n      <a href=\"http://w3.raleigh.foo/ccsaleskit/profiles.html\" target=\"_blank\"><img src=\"Corporate%20Citizenship%20Sales%20Kit%20_%20Corporate%20Citizenship%20Sales%20Kit_files/wcg_globe_hands.jpg\" alt=\"many hands holding globe\" border=\"0\" width=\"108\" height=\"102\"></a></p>	\n\n   <p align=\"center\"><strong> <a href=\"http://w3.raleigh.foo/ccsaleskit/profiles.html\">State and country profiles</a></strong></p>\n 				\n<!-- <div style=\"clear:both;\">&nbsp;</div>\n				<h2 class=\"bar-gray-med-dark\">Client connections</h2>\n			<ul class=\"anchor-link\">\n			 <li>June \n			      feature (coming soon) </li>\n			</ul>		-->\n			<br>\n		<h2 class=\"bar-blue-med\">CC programs using IBM technologies</h2>\n			<ul class=\"anchor-link\">\n				<li><a href=\"http://w3.raleigh.foo/ccsaleskit/worldcommunitygrid.html\" target=\"_blank\">Grid technology</a></li>\n				<li><a href=\"http://w3.raleigh.foo/ccsaleskit/webadaptationtechnology.html\" target=\"_blank\">Open source</a></li>\n				<li><a href=\"http://w3.raleigh.foo/ccsaleskit/traducelo.html\" target=\"_blank\">Real-time translation services</a></li>\n		      <li><a href=\"http://w3.raleigh.foo/ccsaleskit/readingcompanion.html\" target=\"_blank\">Voice recognition</a></li>\n			</ul>			\n<div style=\"clear: both;\">&nbsp;</div>\n  </div>\n	<!-- stop sidebar -->\n','2008-12-02 01:50:03','2008-12-02 01:50:13',2),(21,'Module for Page Plugin #35','<p>Congratulations, you\'ve got Ansuz up and running!&nbsp; Now you should just <a href=\"/admin\">log in as an admin</a> and start fooling around!</p>','2008-12-02 01:52:13','2008-12-11 00:05:42',7),(22,'Module for Page Plugin #41',NULL,'2008-12-07 23:47:56','2008-12-07 23:47:56',1);
/*!40000 ALTER TABLE `content_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_builder_responses`
--

DROP TABLE IF EXISTS `form_builder_responses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_responses` (
  `id` int(11) NOT NULL auto_increment,
  `form_builder_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `form_builder_responses`
--

LOCK TABLES `form_builder_responses` WRITE;
/*!40000 ALTER TABLE `form_builder_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_builder_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_builders`
--

DROP TABLE IF EXISTS `form_builders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builders` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `submit_text` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `form_builders`
--

LOCK TABLES `form_builders` WRITE;
/*!40000 ALTER TABLE `form_builders` DISABLE KEYS */;
INSERT INTO `form_builders` VALUES (1,'Module for Page Plugin #43','Submit','2008-12-08 13:12:25','2008-12-08 13:12:25');
/*!40000 ALTER TABLE `form_builders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_responses`
--

DROP TABLE IF EXISTS `form_field_responses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_field_responses` (
  `id` int(11) NOT NULL auto_increment,
  `form_builder_response_id` int(11) default NULL,
  `form_field_id` int(11) default NULL,
  `string` varchar(255) default NULL,
  `boolean` tinyint(1) default NULL,
  `text` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `form_field_responses`
--

LOCK TABLES `form_field_responses` WRITE;
/*!40000 ALTER TABLE `form_field_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_text_areas`
--

DROP TABLE IF EXISTS `form_field_text_areas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_field_text_areas` (
  `id` int(11) NOT NULL auto_increment,
  `label` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `form_field_text_areas`
--

LOCK TABLES `form_field_text_areas` WRITE;
/*!40000 ALTER TABLE `form_field_text_areas` DISABLE KEYS */;
INSERT INTO `form_field_text_areas` VALUES (1,'Comments'),(2,'Field Label'),(3,'Tell Us How you REALLY Feel About It');
/*!40000 ALTER TABLE `form_field_text_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_text_fields`
--

DROP TABLE IF EXISTS `form_field_text_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_field_text_fields` (
  `id` int(11) NOT NULL auto_increment,
  `label` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `form_field_text_fields`
--

LOCK TABLES `form_field_text_fields` WRITE;
/*!40000 ALTER TABLE `form_field_text_fields` DISABLE KEYS */;
INSERT INTO `form_field_text_fields` VALUES (1,'Name'),(2,'Rate this plugin');
/*!40000 ALTER TABLE `form_field_text_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_fields`
--

DROP TABLE IF EXISTS `form_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_fields` (
  `id` int(11) NOT NULL auto_increment,
  `form_builder_id` int(11) default NULL,
  `position` int(11) default NULL,
  `field_type` varchar(255) default NULL,
  `field_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `form_fields`
--

LOCK TABLES `form_fields` WRITE;
/*!40000 ALTER TABLE `form_fields` DISABLE KEYS */;
INSERT INTO `form_fields` VALUES (1,1,NULL,'Ansuz::JAdams::FormFieldTextField',1,'2008-12-08 13:24:09','2008-12-08 13:24:09'),(2,1,NULL,'Ansuz::JAdams::FormFieldTextArea',1,'2008-12-08 13:24:24','2008-12-08 13:24:24'),(4,1,NULL,'Ansuz::JAdams::FormFieldTextField',2,'2008-12-09 00:14:41','2008-12-09 00:14:41'),(5,1,NULL,'Ansuz::JAdams::FormFieldTextArea',3,'2008-12-09 00:15:16','2008-12-09 00:15:16');
/*!40000 ALTER TABLE `form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `forums` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `topics_count` int(11) default '0',
  `posts_count` int(11) default '0',
  `position` int(11) default NULL,
  `description_html` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,'First Forum','This is the first forum',2,3,1,NULL);
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fyles`
--

DROP TABLE IF EXISTS `fyles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fyles` (
  `id` int(11) NOT NULL auto_increment,
  `mime_type` varchar(255) default NULL,
  `file_name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `fyles`
--

LOCK TABLES `fyles` WRITE;
/*!40000 ALTER TABLE `fyles` DISABLE KEYS */;
/*!40000 ALTER TABLE `fyles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_entries`
--

DROP TABLE IF EXISTS `menu_entries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `menu_entries` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `link` varchar(255) default NULL,
  `position` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `menu_entries`
--

LOCK TABLES `menu_entries` WRITE;
/*!40000 ALTER TABLE `menu_entries` DISABLE KEYS */;
INSERT INTO `menu_entries` VALUES (2,'pages','special',NULL,NULL,'2008-10-05 23:18:20','2008-10-05 23:18:20'),(3,'Forums','/forums',NULL,NULL,'2008-12-11 00:10:21','2008-12-11 00:10:21'),(4,'Blog','/articles',NULL,NULL,'2008-12-11 00:11:19','2008-12-11 00:11:19');
/*!40000 ALTER TABLE `menu_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderatorships`
--

DROP TABLE IF EXISTS `moderatorships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `moderatorships` (
  `id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_moderatorships_on_forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `moderatorships`
--

LOCK TABLES `moderatorships` WRITE;
/*!40000 ALTER TABLE `moderatorships` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderatorships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitorships`
--

DROP TABLE IF EXISTS `monitorships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `monitorships` (
  `id` int(11) NOT NULL auto_increment,
  `topic_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `active` tinyint(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `monitorships`
--

LOCK TABLES `monitorships` WRITE;
/*!40000 ALTER TABLE `monitorships` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitorships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_metadatas`
--

DROP TABLE IF EXISTS `page_metadatas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_metadatas` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `subject` varchar(255) default NULL,
  `description` text,
  `publisher` varchar(255) default NULL,
  `rights` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page_metadatas`
--

LOCK TABLES `page_metadatas` WRITE;
/*!40000 ALTER TABLE `page_metadatas` DISABLE KEYS */;
INSERT INTO `page_metadatas` VALUES (1,1,'Home','test','This is the home page','Josh Adams','All rights reserved.','2008-11-14 02:34:36','2008-11-14 03:03:30'),(2,6,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(3,7,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(4,8,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(5,9,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(6,10,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(7,11,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(8,12,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(9,13,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(10,14,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(11,15,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(12,16,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(13,17,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(14,18,NULL,NULL,NULL,NULL,NULL,'2008-11-14 02:34:36','2008-11-14 02:34:36'),(15,19,NULL,NULL,NULL,NULL,NULL,'2008-11-16 19:53:20','2008-11-16 19:53:20'),(16,20,NULL,NULL,NULL,NULL,NULL,'2008-11-16 20:19:10','2008-11-16 20:19:10'),(17,21,NULL,NULL,NULL,NULL,NULL,'2008-11-20 06:53:12','2008-11-20 06:53:12'),(18,21,NULL,NULL,NULL,NULL,NULL,'2008-11-23 16:16:20','2008-11-23 16:16:20'),(19,22,NULL,NULL,NULL,NULL,NULL,'2008-11-23 18:49:46','2008-11-23 18:49:46'),(20,23,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:51:48','2008-11-23 22:51:48'),(21,24,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:51:48','2008-11-23 22:51:48'),(22,25,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:51:48','2008-11-23 22:51:48'),(23,26,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:51:48','2008-11-23 22:51:48'),(24,27,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:52:17','2008-11-23 22:52:17'),(25,28,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:52:17','2008-11-23 22:52:17'),(26,29,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:52:17','2008-11-23 22:52:17'),(27,30,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:54:01','2008-11-23 22:54:01'),(28,31,NULL,NULL,NULL,NULL,NULL,'2008-11-23 22:54:01','2008-11-23 22:54:01'),(29,32,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:22:11','2008-11-24 02:22:11'),(30,33,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:22:11','2008-11-24 02:22:11'),(31,34,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:22:30','2008-11-24 02:22:30'),(32,35,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:22:30','2008-11-24 02:22:30'),(33,36,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:24:07','2008-11-24 02:24:07'),(34,37,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:24:07','2008-11-24 02:24:07'),(35,38,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:24:29','2008-11-24 02:24:29'),(36,39,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:24:29','2008-11-24 02:24:29'),(37,40,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:24:53','2008-11-24 02:24:53'),(38,41,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:24:53','2008-11-24 02:24:53'),(39,42,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:25:01','2008-11-24 02:25:01'),(40,43,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:25:01','2008-11-24 02:25:01'),(41,44,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:27:13','2008-11-24 02:27:13'),(42,45,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:27:13','2008-11-24 02:27:13'),(43,46,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:27:21','2008-11-24 02:27:21'),(44,47,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:29:57','2008-11-24 02:29:57'),(45,48,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:49:05','2008-11-24 02:49:05'),(46,49,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:49:09','2008-11-24 02:49:09'),(47,50,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:50:53','2008-11-24 02:50:53'),(48,51,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:51:17','2008-11-24 02:51:17'),(49,52,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:52:50','2008-11-24 02:52:50'),(50,53,NULL,NULL,NULL,NULL,NULL,'2008-11-24 02:56:18','2008-11-24 02:56:18'),(51,54,NULL,NULL,NULL,NULL,NULL,'2008-12-02 01:48:32','2008-12-02 01:48:32'),(52,55,NULL,NULL,NULL,NULL,NULL,'2008-12-02 01:49:50','2008-12-02 01:49:50'),(53,56,NULL,NULL,NULL,NULL,NULL,'2008-12-07 20:12:19','2008-12-07 20:12:19'),(54,57,NULL,NULL,NULL,NULL,NULL,'2008-12-07 20:12:34','2008-12-07 20:12:34'),(55,58,NULL,NULL,NULL,NULL,NULL,'2008-12-07 22:11:52','2008-12-07 22:11:52'),(56,59,NULL,NULL,NULL,NULL,NULL,'2008-12-07 23:42:15','2008-12-07 23:42:15');
/*!40000 ALTER TABLE `page_metadatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_plugins`
--

DROP TABLE IF EXISTS `page_plugins`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `module_type` varchar(255) default NULL,
  `module_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `position` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page_plugins`
--

LOCK TABLES `page_plugins` WRITE;
/*!40000 ALTER TABLE `page_plugins` DISABLE KEYS */;
INSERT INTO `page_plugins` VALUES (4,2,'Ansuz::JAdams::PhotoAlbum',1,'2008-08-31 17:35:20','2008-08-31 17:35:20',NULL),(6,3,'Ansuz::JAdams::PhotoAlbum',1,'2008-08-31 18:52:12','2008-08-31 18:52:12',NULL),(7,4,'Ansuz::JAdams::ContentSection',2,'2008-09-07 01:14:55','2008-09-07 01:14:55',NULL),(8,5,'Ansuz::JAdams::ContentSection',3,'2008-09-07 18:05:37','2008-09-07 18:05:37',NULL),(9,6,'Ansuz::JAdams::ContentSection',4,'2008-09-07 22:20:24','2008-09-07 22:20:24',NULL),(13,7,'Ansuz::JAdams::ContentSection',5,'2008-10-12 20:56:03','2008-10-12 20:56:03',NULL),(14,9,'Ansuz::JAdams::ContentSection',6,'2008-10-12 21:51:34','2008-10-12 21:51:34',NULL),(16,11,'Ansuz::JAdams::ContentSection',7,'2008-10-13 10:48:13','2008-10-13 10:48:15',NULL),(17,8,'Ansuz::JAdams::ContentSection',8,'2008-10-14 01:29:14','2008-10-14 01:29:14',NULL),(18,10,'Ansuz::JAdams::ContentSection',9,'2008-10-14 01:30:57','2008-10-14 01:30:57',NULL),(19,19,'Ansuz::JAdams::ContentSection',10,'2008-10-27 02:32:49','2008-10-27 02:32:49',NULL),(24,7,'Ansuz::JAdams::PhotoAlbum',6,'2008-11-09 20:58:20','2008-11-09 20:58:20',NULL),(26,20,'Ansuz::JAdams::ContentSection',14,'2008-11-16 20:19:10','2008-11-16 20:58:10',2),(27,20,'Ansuz::JAdams::PhotoAlbum',7,'2008-11-16 20:56:40','2008-11-16 20:58:10',1),(28,19,'Ansuz::JAdams::PhotoAlbum',8,'2008-11-16 22:14:43','2008-11-16 22:14:43',1),(29,21,'Ansuz::JAdams::ContentSection',15,'2008-11-23 16:16:32','2008-11-23 16:16:32',1),(30,22,'Ansuz::JAdams::ContentSection',16,'2008-11-23 19:10:01','2008-11-23 19:10:01',1),(31,39,'Ansuz::JAdams::ContentSection',17,'2008-11-24 02:24:44','2008-11-24 02:24:44',1),(32,53,'Ansuz::JAdams::ContentSection',18,'2008-11-24 02:56:50','2008-11-24 02:56:50',1),(33,54,'Ansuz::JAdams::ContentSection',19,'2008-12-02 01:48:44','2008-12-02 01:48:44',1),(34,55,'Ansuz::JAdams::ContentSection',20,'2008-12-02 01:50:03','2008-12-02 01:50:03',1),(35,1,'Ansuz::JAdams::ContentSection',21,'2008-12-02 01:52:13','2008-12-02 01:52:13',1),(43,59,'Ansuz::JAdams::FormBuilder',1,'2008-12-08 13:12:25','2008-12-08 13:12:25',1),(44,6,'Ansuz::JAdams::PhotoAlbum',9,'2008-12-11 00:03:45','2008-12-11 00:03:45',1);
/*!40000 ALTER TABLE `page_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `full_title` varchar(255) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `page_order` int(11) default '0',
  `parent_id` int(11) default NULL,
  `page_type` varchar(255) default 'page',
  `display_title` tinyint(1) default '1',
  `published` tinyint(1) default '1',
  `linked` tinyint(1) default '1',
  `show_sub_menu` tinyint(1) default '0',
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_pages_on_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'home','Home','Home','Testing','2008-08-23 13:38:46','2008-11-23 17:02:49',0,NULL,'page',0,1,1,0,'published'),(6,'portfolio','Portfolio','Portfolio',NULL,'2008-10-12 19:47:35','2008-11-23 17:02:49',1,1,'page',0,1,1,1,'published'),(7,'about_us','About Us','About Us',NULL,'2008-10-12 19:58:57','2008-11-23 17:02:49',0,1,'page',0,1,1,0,'published'),(10,'contact_us','Contact Us','Contact Us',NULL,'2008-10-12 21:54:32','2008-11-23 17:02:49',4,1,'page',0,1,1,0,'published'),(44,'special','special','special',NULL,'2008-11-24 02:27:13','2008-11-24 02:45:19',9,1,'page',1,1,1,0,'draft'),(53,'footer','footer','footer',NULL,'2008-11-24 02:56:18','2008-11-24 02:56:18',0,44,'page',1,1,1,0,'draft');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_album_photos`
--

DROP TABLE IF EXISTS `photo_album_photos`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `photo_album_photos` (
  `id` int(11) NOT NULL auto_increment,
  `photo_album_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `caption` text,
  `photo_album_photo_image_file_name` varchar(255) default NULL,
  `photo_album_photo_image_content_type` varchar(255) default NULL,
  `photo_album_photo_image_file_size` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photo_album_photos`
--

LOCK TABLES `photo_album_photos` WRITE;
/*!40000 ALTER TABLE `photo_album_photos` DISABLE KEYS */;
INSERT INTO `photo_album_photos` VALUES (1,1,'asdf','asdf','Screenshot.png','image/png',157634),(2,1,'awfs','sdf','kubuntu-leaflet.png','image/png',1206099),(3,2,'Isotope11 Logo','This is just the isotope11 logo.  And a caption.','logo.png','image/png',38285),(4,3,'new photo','This is a basic captionsssss','Random_Joy_by_PSRADICH.jpg','image/jpeg',287032),(6,6,'another photo','another test','ruler-example.png','image/png',847419),(7,8,'dsfg','fdsg','blog-posts.png','image/png',73322),(8,8,'asdfsadf','sadfsadfsad','manage-users.png','image/png',71480),(9,6,'asdf','sdaf','Screenshot.png','image/png',457911);
/*!40000 ALTER TABLE `photo_album_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `photo_albums` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'Module for Page Plugin #6'),(2,'Module for Page Plugin #10'),(3,'Module for Page Plugin #11'),(4,'Module for Page Plugin #20'),(5,'Module for Page Plugin #22'),(6,'Module for Page Plugin #24'),(7,'Module for Page Plugin #27'),(8,'Module for Page Plugin #28'),(9,'Module for Page Plugin #44');
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_schema_info`
--

DROP TABLE IF EXISTS `plugin_schema_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_schema_info` (
  `plugin_name` varchar(255) default NULL,
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_schema_info`
--

LOCK TABLES `plugin_schema_info` WRITE;
/*!40000 ALTER TABLE `plugin_schema_info` DISABLE KEYS */;
INSERT INTO `plugin_schema_info` VALUES ('ansuz_blog',1),('savage_beast',1),('ansuz_menu_system',1),('ansuz_user_manager',1),('ansuz_scrollable_content',1),('ansuz_theme_repository',1),('ansuz_testimonials',1),('ansuz_theme_installer',1),('fckeditor',1);
/*!40000 ALTER TABLE `plugin_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `topic_id` int(11) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `forum_id` int(11) default NULL,
  `body_html` text,
  PRIMARY KEY  (`id`),
  KEY `index_posts_on_forum_id` (`forum_id`,`created_at`),
  KEY `index_posts_on_user_id` (`user_id`,`created_at`),
  KEY `index_posts_on_topic_id` (`topic_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'this is more testing','2008-11-16 19:13:22','2008-11-17 13:27:26',1,'<p>this is more testing</p>'),(2,1,1,'this is a test with some honest to god *content* in it, using some _tags_ by \"god\":http://www.slashdot.org.','2008-11-17 13:24:11','2008-11-17 13:34:27',1,'<p>this is a test with some honest to god <strong>content</strong> in it, using some <em>tags</em> by <a href=\"http://www.slashdot.org\">god</a>.</p>'),(3,1,2,'this is a another topic','2008-11-17 18:09:10','2008-11-17 18:09:10',1,'<p>this is a another topic</p>');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) default NULL,
  `authorizable_type` varchar(40) default NULL,
  `authorizable_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (5,'author',NULL,NULL,'2008-11-23 16:26:53','2008-11-23 16:26:53'),(6,'admin',NULL,NULL,'2008-11-23 17:08:23','2008-11-23 17:08:23'),(7,'initial_reviewer',NULL,NULL,'2008-11-23 17:08:23','2008-11-23 17:08:23'),(8,'final_reviewer',NULL,NULL,'2008-11-23 17:08:23','2008-11-23 17:08:23');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `roles_users` (
  `user_id` int(11) default NULL,
  `role_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,5,'2008-11-23 16:26:53','2008-11-23 16:26:53'),(1,6,'2008-11-23 17:08:23','2008-11-23 17:08:23'),(1,7,'2008-11-23 17:08:23','2008-11-23 17:08:23'),(1,8,'2008-11-23 17:08:23','2008-11-23 17:08:23'),(2,5,'2008-11-23 16:26:53','2008-11-23 16:26:53'),(4,8,'2008-11-23 17:08:23','2008-11-23 17:08:23');
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('2'),('20080824195700'),('20080824204532'),('20080831171235'),('20080907232248'),('20080907570000'),('20080908012455'),('20080913132029'),('20080914031652'),('20081109194519'),('20081114021853'),('20081116025647'),('20081116204546'),('20081123161548'),('20081202023651'),('20081207200834');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrollable_content_sections`
--

DROP TABLE IF EXISTS `scrollable_content_sections`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `scrollable_content_sections` (
  `id` int(11) NOT NULL auto_increment,
  `scrollable_content_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `contents` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `scrollable_content_sections`
--

LOCK TABLES `scrollable_content_sections` WRITE;
/*!40000 ALTER TABLE `scrollable_content_sections` DISABLE KEYS */;
INSERT INTO `scrollable_content_sections` VALUES (1,1,'Test Section','<p>This is the content for the test section</p>'),(2,1,'Section two','<p>This is the second one...</p>'),(3,2,'MyStock and SportGraphics','<div class=\"twocol\">\r\n<div class=\"left col\"><a href=\"/pages/portfolio/mystock\"> <img width=\"415\" height=\"150\" src=\"/uploads/Image/mystock_header.png\" alt=\"\" />\r\n<h3>MyStock<br /><span>A selective Stock Photography site with an expressive search system.</span></h3>\r\n</a></div>\r\n<div class=\"right col\"><a href=\"/pages/portfolio/sport_graphics\"> <img width=\"415\" height=\"150\" src=\"/uploads/Image/sportgraphics_header.png\" alt=\"\" />\r\n<h3>SportGraphics<br /><span>An e-commerce site selling rowing photographs.</span></h3>\r\n</a></div>\r\n</div>\r\n<div class=\"clear\">&nbsp;</div>'),(4,2,'AIUA and Deep South Fibers','<div class=\"twocol\">\r\n<div class=\"left col\"><a href=\"/pages/portfolio/alabama_insurance_underwriting_association\">\r\n<img src=\"/uploads/Image/aiua_header.png\" alt=\"\" />\r\n<h3>AIUA<br /><span>An insurance rate calculator and e-commerce platform.</span></h3>\r\n</a></div>\r\n<div class=\"right col\"><a href=\"/pages/portfolio/deep_south_fibers\">\r\n<img width=\"415\" height=\"150\" src=\"/uploads/Image/dsf_header.png\" alt=\"\" />\r\n<h3>Deep South Fibers<br /><span>A wholesale knit supplier\'s wholesale e-com site.</span></h3>\r\n</a></div>\r\n</div>\r\n<div class=\"clear\">&nbsp;</div>'),(5,2,'Monkey Tails and Ryan Weaver','<div class=\"twocol\">\r\n<div class=\"left col\"><a href=\"/pages/portfolio/monkey_tails\">\r\n<img width=\"415\" height=\"150\" alt=\"\" src=\"/uploads/Image/mtm_header.png\" />\r\n<h3>Monkey Tail Monograms<br /><span>A local custom monogramming shop.</span></h3>\r\n</a></div>\r\n<div class=\"right col\"><a href=\"/pages/portfolio/ryan_weaver_insurance\">\r\n<img width=\"415\" height=\"150\" alt=\"\" src=\"/uploads/Image/rweaver_header.png\" />\r\n<h3>Ryan Weaver Insurance<br /><span>An independent insurance agency.</span></h3>\r\n</a></div>\r\n</div>\r\n<div class=\"clear\">&nbsp;</div>'),(6,2,'ShopKnits and The Political Inquirer','<div class=\"twocol\">\r\n<div class=\"left col\"><a href=\"/pages/portfolio/shop_knits\">\r\n<img width=\"415\" height=\"150\" src=\"/uploads/Image/sk_header.png\" alt=\"\" />\r\n<h3>ShopKnits<br /><span>An online retail knitting shop with a custom e-commerce platform.</span></h3>\r\n</a></div>\r\n<div class=\"right col\"><a href=\"/pages/portfolio/political_inquirer\">\r\n<img width=\"415\" height=\"150\" src=\"/uploads/Image/pi_header.png\" alt=\"\" />\r\n<h3>The Political Inquirer<br /><span>Writers of all walks, talking about politics.</span></h3>\r\n</a></div>\r\n</div>\r\n<div class=\"clear\">&nbsp;</div>');
/*!40000 ALTER TABLE `scrollable_content_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrollable_contents`
--

DROP TABLE IF EXISTS `scrollable_contents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `scrollable_contents` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `scrollable_contents`
--

LOCK TABLES `scrollable_contents` WRITE;
/*!40000 ALTER TABLE `scrollable_contents` DISABLE KEYS */;
INSERT INTO `scrollable_contents` VALUES (1,'Module for Page Plugin #12'),(2,'Module for Page Plugin #15');
/*!40000 ALTER TABLE `scrollable_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `user_theme_name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `site_title` varchar(255) default NULL,
  `show_inline_edit_links` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'default',NULL,'2008-09-13 14:15:23','2008-09-13 14:15:23',NULL,0),(2,'--- :default\n','default','2008-09-13 14:15:38','2008-12-11 00:44:06','Ansuz Demonstration Site',1);
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id_and_taggable_type` (`tag_id`,`taggable_type`),
  KEY `index_taggings_on_user_id_and_tag_id_and_taggable_type` (`user_id`,`tag_id`,`taggable_type`),
  KEY `index_taggings_on_taggable_id_and_taggable_type` (`taggable_id`,`taggable_type`),
  KEY `index_taggings_on_user_id_and_taggable_id_and_taggable_type` (`user_id`,`taggable_id`,`taggable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,1,'Ansuz::JAdams::BlogPost',NULL),(2,2,1,'Ansuz::JAdams::BlogPost',NULL),(3,1,2,'Ansuz::JAdams::BlogPost',NULL);
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `taggings_count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `index_tags_on_name` (`name`),
  KEY `index_tags_on_taggings_count` (`taggings_count`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'first',2),(2,'second',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL auto_increment,
  `content` text,
  `attributed_to` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'These guys are great.','Some people','2008-11-16 21:31:29','2008-11-16 21:31:29');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `hits` int(11) default '0',
  `sticky` int(11) default '0',
  `posts_count` int(11) default '0',
  `replied_at` datetime default NULL,
  `locked` tinyint(1) default '0',
  `replied_by` int(11) default NULL,
  `last_post_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_topics_on_forum_id` (`forum_id`),
  KEY `index_topics_on_sticky_and_replied_at` (`forum_id`,`sticky`,`replied_at`),
  KEY `index_topics_on_forum_id_and_replied_at` (`forum_id`,`replied_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,1,1,'new topic','2008-11-16 19:13:22','2008-11-16 19:13:22',0,0,2,'2008-11-17 13:24:11',0,1,2),(2,1,1,'test topic','2008-11-17 18:09:10','2008-11-17 18:09:10',1,0,0,'2008-11-17 18:09:10',0,1,3);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `posts_count` int(11) default '0',
  `last_seen_at` datetime default NULL,
  `admin` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@test.com','e990cbcc77b735a8b817180853040b9ac33a342f','db4ac6d40b754711427469ed526bf81e36d33965','2008-08-23 13:46:26','2008-12-11 00:12:10',NULL,NULL,3,NULL,1),(2,'author','test@test.com','f91cc27cddd131ce0903d137d270b9eb86043538','3f31644e38d6140a086e9e38f0ad615ff90b2e30','2008-11-23 22:38:53','2008-12-04 01:56:00',NULL,NULL,0,NULL,0),(4,'content_approver','content@test.com','289b1b8ec4c90a98ecc0d727a9f0bca29dab4efc','9cb35e3873cab51991504f7cb2eb0ce58edd40b4','2008-12-04 01:56:42','2008-12-04 01:56:42',NULL,NULL,0,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-12-11  0:44:30
