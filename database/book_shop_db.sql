-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2022 at 06:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
--
-- Database: `book_shop_db`
--
-- --------------------------------------------------------
--
-- Table structure for table `cart`
--
CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `cart`
--
INSERT INTO `cart` (
    `id`,
    `client_id`,
    `inventory_id`,
    `price`,
    `quantity`,
    `date_created`
  )
VALUES (4, 1, 1, 2500, 1, '2021-07-16 13:48:00');
-- --------------------------------------------------------
--
-- Table structure for table `categories`
--
CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `categories`
--
INSERT INTO `categories` (
    `id`,
    `category`,
    `description`,
    `status`,
    `date_created`
  )
VALUES (
    1,
    'Computer Science',
    '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;The Computer Science Books category includes a wide range of titles that cover the basic principles and applications of computer science. Topics include programming, algorithms, artificial intelligence, databases, information theory, and software engineering.&lt;/p&gt;',
    1,
    '2021-07-16 09:08:44'
  ),
  (
    2,
    'Computer Engineering',
    '&lt;p&gt;The Computer Engineering books category includes books on the design and development of computer hardware and software. Topics covered include computer architecture, digital logic, computer networks, and software engineering.&lt;/p&gt;',
    1,
    '2021-07-16 09:09:25'
  ),
  (
    3,
    'IT',
    '&lt;p&gt;The Information Technology books category includes a variety of titles that discuss topics related to information technology, including books on computer programming, web development, databases, information security, and more.&lt;/p&gt;',
    1,
    '2021-07-16 09:09:46'
  ),
  (
    5,
    'Browse',
    '&lt;p&gt;Sample&lt;/p&gt;',
    1,
    '2021-07-16 09:09:46'
  );
-- --------------------------------------------------------
--
-- Table structure for table `clients`
--
CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `clients`
--
INSERT INTO `clients` (
    `id`,
    `firstname`,
    `lastname`,
    `gender`,
    `contact`,
    `email`,
    `password`,
    `default_delivery_address`,
    `date_created`
  )
VALUES (
    1,
    'John',
    'Smith',
    'Male',
    '091023456789',
    'jsmith@sample.com',
    '1254737c076cf867dc53d60a0364f38e',
    'Sample Address',
    '2021-07-16 10:34:48'
  ),
  (
    2,
    'Ralph ',
    'Cajipe',
    'Male',
    '09166665832',
    'ralphcajipe@gmail.com',
    'fc5e038d38a57032085441e7fe7010b0',
    '49 Santa Rosa - Fort Magsaysay Road, Soledad, Santa Rosa, Nueva Ecija, Philippines 3101',
    '2022-07-12 13:04:57'
  ),
  (
    3,
    'Henrik',
    'Cajipe',
    'Male',
    '09166665832',
    'test@gmail.com',
    '39aa4fc6c6766bc58a9c68f9d72d83da',
    '49, Santa Rosa - Fort Magsaysay Road, Brgy. Soledad\r\nHouse has a thin black gate with a closed sari-sari store, located before Alenville Resort',
    '2022-07-13 18:57:57'
  );
-- --------------------------------------------------------
--
-- Table structure for table `inventory`
--
CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `inventory`
--
INSERT INTO `inventory` (
    `id`,
    `product_id`,
    `quantity`,
    `price`,
    `date_created`,
    `date_updated`
  )
VALUES (1, 1, 50, 2500, '2021-07-16 10:02:39', NULL),
  (2, 2, 20, 3500, '2021-07-16 10:09:08', NULL),
  (3, 3, 10, 2500, '2021-07-16 12:05:54', NULL),
  (4, 4, 50, 1999.99, '2021-07-16 13:12:10', NULL);
-- --------------------------------------------------------
--
-- Table structure for table `orders`
--
CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `orders`
--
INSERT INTO `orders` (
    `id`,
    `client_id`,
    `delivery_address`,
    `payment_method`,
    `order_type`,
    `amount`,
    `status`,
    `paid`,
    `date_created`,
    `date_updated`
  )
VALUES (
    5,
    3,
    '49, Santa Rosa - Fort Magsaysay Road, Brgy. Soledad\r\nHouse has a thin black gate with a closed sari-sari store, located before Alenville Resort',
    'cod',
    2,
    2500,
    0,
    0,
    '2022-07-13 19:01:52',
    NULL
  ),
  (
    6,
    3,
    '49, Santa Rosa - Fort Magsaysay Road, Brgy. Soledad\r\nHouse has a thin black gate with a closed sari-sari store, located before Alenville Resort',
    'cod',
    1,
    3500,
    0,
    0,
    '2022-07-13 19:02:45',
    NULL
  ),
  (
    7,
    3,
    '49, Santa Rosa - Fort Magsaysay Road, Brgy. Soledad\r\nHouse has a thin black gate with a closed sari-sari store, located before Alenville Resort',
    'cod',
    2,
    7500,
    0,
    0,
    '2022-07-13 19:43:23',
    NULL
  );
-- --------------------------------------------------------
--
-- Table structure for table `order_list`
--
CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `order_list`
--
INSERT INTO `order_list` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `price`,
    `total`
  )
VALUES (4, 5, 1, 1, 2500, 2500),
  (5, 6, 2, 1, 3500, 3500),
  (6, 7, 1, 3, 2500, 7500);
-- --------------------------------------------------------
--
-- Table structure for table `products`
--
CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `products`
--
INSERT INTO `products` (
    `id`,
    `category_id`,
    `sub_category_id`,
    `title`,
    `author`,
    `description`,
    `status`,
    `date_created`
  )
VALUES (
    1,
    1,
    1,
    'Python Crash Course 2nd Edition: A Hands-On Project-Based Introduction to Programming',
    'Eric Matthes',
    '&lt;p&gt;&lt;span style=\\\\\\&quot;text-align: justify;\\\\\\&quot;&gt;\r\n\r\n<span class=\"a-text-italic\">Python Crash Course, 2nd Edition</span>\r\n\r\nwill have you writing programs, solving problems, building computer games, and creating data visualizations in no time.<br><br>You’ll begin with basic concepts like variables, lists, classes, and loops—with the help of fun skill-strengthening exercises for every topic—then move on to making interactive programs and best practices for testing your code. Later chapters put your new knowledge into play with three cool projects: a 2D Space Invaders-style arcade game, a set of responsive data visualizations you’ll build with Python\'s handy libraries (Pygame, Matplotlib, Plotly, Django), and a customized web app you can deploy online.<br><br>Why wait any longer? Start your engine and code!</span>&lt;/span&gt;&lt;br&gt;&lt;/p&gt;',
    1,
    '2021-07-16 09:43:11'
  ),
  (
    2,
    1,
    1,
    'Software Engineering, Tenth Edition',
    'Ian Sommerville',
    '&lt;p&gt;&lt;span style=\\\\\\\\\\\\\\&quot;text-align: justify;\\\\\\\\\\\\\\&quot;&gt;For courses in computer science and software engineering\r\n\r\n \r\n\r\nThe Fundamental Practice of Software Engineering <br><br>\r\n\r\nSoftware Engineering introduces readers to the overwhelmingly important subject of software programming and development. In the past few years, computer systems have come to dominate not just our technological growth, but the foundations of our world’s major industries. This text seeks to lay out the fundamental concepts of this huge and continually growing subject area in a clear and comprehensive manner.\r\n<br><br>\r\n\r\nThe Tenth Edition contains new information that highlights various technological updates of recent years, providing readers with highly relevant and current information. Sommerville’s experience in system dependability and systems engineering guides the text through a traditional plan-based approach that incorporates some novel agile methods. The text strives to teach the innovators of tomorrow how to create software that will make our world a better, safer, and more advanced place to live.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;',
    1,
    '2021-07-16 10:08:53'
  ),
  (
    3,
    1,
    2,
    'Skills of a Successful Software Engineer',
    'Fernando Doglio',
    '&lt;p&gt;&lt;span style=\\&quot;text-align: justify;\\&quot;&gt;Skills of a Successful Software Engineer is a best practices guide for succeeding on a software development team. The book reveals how to optimize both your code and your career, from achieving a good work-life balance to writing the kind of bug-free code delivered by pros. You’ll master essential skills that you might not have learned as a solo coder, including meaningful code commenting, unit testing, and using refactoring to speed up feature delivery. Timeless advice on acing interviews and setting yourself up for leadership will help you throughout your career. Crack open this one-of-a-kind guide, and you’ll soon be working in the professional manner that software managers expect.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;',
    1,
    '2021-07-16 12:03:08'
  ),
  (
    4,
    1,
    2,
    'Fundamentals of Software Architecture',
    'Mark Richards, Neal Ford',
    '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Salary surveys worldwide regularly place software architect in the top 10 best jobs, yet no real guide exists to help developers become architects. Until now. This book provides the first comprehensive overview of software architecture’s many aspects. Aspiring and existing architects alike will examine architectural characteristics, architectural patterns, component determination, diagramming and presenting architecture, evolutionary architecture, and many other topics.\r\n<br>\r\n<br>\r\nMark Richards and Neal Ford—hands-on practitioners who have taught software architecture classes professionally for years—focus on architecture principles that apply across all technology stacks. You’ll explore software architecture in a modern light, taking into account all the innovations of the past decade.&lt;/p&gt;',
    1,
    '2021-07-16 13:11:17'
  ),
  (
    5,
    1,
    2,
    'Turing\'s Vision: The Birth of Computer Science',
    'Chris Bernhardt',
    '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;An accessible and fascinating exploration of how Alan Turing’s mathematical theory gave rise to modern computer science and applications—from the desktop to cell phones\r\n<br>\r\n<br>\r\nIn 1936, when he was just twenty-four years old, Alan Turing wrote a remarkable paper in which he outlined the theory of computation, laying out the ideas that underlie all modern computers. This groundbreaking and powerful theory now forms the basis of computer science. In Turing’s Vision, Chris Bernhardt explains the theory, Turing’s most important contribution, for the general reader. Bernhardt argues that the strength of Turing’s theory is its simplicity, and that, explained in a straightforward manner, it is eminently understandable by the non-specialist. As Marvin Minsky writes, “The sheer simplicity of the theory’s foundation and extraordinary short path from this foundation to its logical and surprising conclusions give the theory a mathematical beauty that alone guarantees it a permanent place in computer theory.” Bernhardt begins with the foundation and systematically builds to the surprising conclusions. He also views Turing’s theory in the context of mathematical history, other views of computation (including those of Alonzo Church), Turing’s later work, and the birth of the modern computer.\r\n<br>\r\n<br>\r\nIn the paper, “On Computable Numbers, with an Application to the Entscheidungsproblem,” Turing thinks carefully about how humans perform computation, breaking it down into a sequence of steps, and then constructs theoretical machines capable of performing each step. Turing wanted to show that there were problems that were beyond any computer\'s ability to solve; in particular, he wanted to find a decision problem that he could prove was undecidable. To explain Turing’s ideas, Bernhardt examines three well-known decision problems to explore the concept of undecidability; investigates theoretical computing machines, including Turing machines; explains universal machines; and proves that certain problems are undecidable, including Turing’s problem concerning computable numbers.&lt;/p&gt;',
    1,
    '2021-07-16 13:11:17'
  );
-- --------------------------------------------------------
--
-- Table structure for table `sales`
--
CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `sales`
--
INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`)
VALUES (1, 3, 8500, '2021-07-16 11:18:12'),
  (3, 5, 2500, '2022-07-13 19:01:52'),
  (4, 6, 3500, '2022-07-13 19:02:45'),
  (5, 7, 7500, '2022-07-13 19:43:23');
-- --------------------------------------------------------
--
-- Table structure for table `sub_categories`
--
CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `sub_categories`
--
INSERT INTO `sub_categories` (
    `id`,
    `parent_id`,
    `sub_category`,
    `description`,
    `status`,
    `date_created`
  )
VALUES (
    1,
    1,
    'Programming',
    '&lt;p&gt;A programming book is a book written on the subject of programming, software engineering, web development, or some other computer-related topic. Many programming books are textbooks meant for university-level or higher education, but there are also many popular books written for the general public.&lt;/p&gt;',
    1,
    '2021-07-16 09:10:44'
  ),
  (
    2,
    1,
    'Software',
    '&lt;p&gt;If you\'re looking to get ahead in the world of software development, then you need to check out our selection of software development books. From introductory guides to advanced tutorials, we have everything you need to become a software development master.&lt;/p&gt;',
    1,
    '2021-07-16 09:11:05'
  ),
  (
    3,
    2,
    'Arduino',
    '&lt;p&gt;Arduino books are a great way to learn about the popular open-source electronics platform. These books cover a wide range of topics, from programming and hardware to projects and applications. Whether you\'re a beginner or an experienced maker, there\'s an Arduino book for you.&lt;/p&gt;',
    1,
    '2021-07-16 09:11:36'
  ),
  (
    4,
    2,
    'PC Building and Maintenance',
    '&lt;p&gt;PC building and maintenance books provide instructions on how to build and maintain a personal computer. This category includes books on how to select and install components, troubleshoot hardware and software, and optimize system performance.&lt;/p&gt;',
    1,
    '2021-07-16 09:12:51'
  ),
  (
    5,
    3,
    'Networks and Security',
    '&lt;p&gt;If you want to learn about networks and security, this is the category for you. Here, you\'ll find books that cover topics like network administration, network security, and more. Whether you\'re a beginner or an expert, you\'ll find something to help you further your understanding of this important subject.&lt;/p&gt;',
    1,
    '2021-07-16 09:13:28'
  ),
  (
    6,
    3,
    'Cloud',
    '&lt;p&gt;This category includes books about cloud computing, which is the use of networked computers to perform tasks that would traditionally be performed on a single, local computer. Cloud computing books discuss the advantages and disadvantages of using the cloud, as well as how to get the most out of it.&lt;/p&gt;',
    1,
    '2021-07-16 09:13:49'
  ),
  (
    7,
    4,
    'Sub Cat 101',
    '&lt;p&gt;Sample Sub 107&lt;/p&gt;',
    1,
    '2021-07-16 11:34:22'
  ),
  (
    8,
    1,
    'Algorithms',
    '&lt;p&gt;A category for books about algorithms, which are a set of steps for completing a task or solving a problem - the core of computer science.&lt;/p&gt;',
    1,
    '2021-07-16 09:11:05'
  );
-- --------------------------------------------------------
--
-- Table structure for table `system_info`
--
CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `system_info`
--
INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`)
VALUES (1, 'name', 'Booker - Book Shopping Made Easy'),
  (6, 'short_name', '<b>Booker</b>'),
  (11, 'logo', 'uploads/1626397500_book_logo.jpg'),
  (13, 'user_avatar', 'uploads/user_avatar.jpg'),
  (14, 'cover', 'uploads/1626397620_books.jpg');
-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `users`
--
INSERT INTO `users` (
    `id`,
    `firstname`,
    `lastname`,
    `username`,
    `password`,
    `avatar`,
    `last_login`,
    `type`,
    `date_added`,
    `date_updated`
  )
VALUES (
    1,
    'Admin',
    'Access',
    'admin',
    '0192023a7bbd73250516f069df18b500',
    'uploads/1657816260_admin_profile_picture.jpg',
    NULL,
    1,
    '2021-01-20 14:02:37',
    '2022-07-15 00:52:05'
  ),
  (
    4,
    'John',
    'Smith',
    'jsmith',
    '1254737c076cf867dc53d60a0364f38e',
    NULL,
    NULL,
    0,
    '2021-06-19 08:36:09',
    '2021-06-19 10:53:12'
  ),
  (
    5,
    'Claire',
    'Blake',
    'cblake',
    '4744ddea876b11dcb1d169fadf494418',
    NULL,
    NULL,
    0,
    '2021-06-19 10:01:51',
    '2021-06-19 12:03:23'
  );
--
-- Indexes for dumped tables
--
--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `products`
--
ALTER TABLE `products`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `users`
--
ALTER TABLE `users`
ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 8;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 8;
--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 9;
--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(50) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
COMMIT;