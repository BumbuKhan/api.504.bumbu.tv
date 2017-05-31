-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Май 31 2017 г., 07:32
-- Версия сервера: 5.6.35-cll-lve
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `504_AEW`
--

-- --------------------------------------------------------

--
-- Структура таблицы `feed_back`
--

CREATE TABLE IF NOT EXISTS `feed_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `phone_data` text NOT NULL,
  `add_datetime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `ordering` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Дамп данных таблицы `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `ordering`) VALUES
(1, 'Lesson 1', 1),
(2, 'Lesson 2', 2),
(3, 'Lesson 3', 3),
(4, 'Lesson 4', 4),
(5, 'Lesson 5', 5),
(6, 'Lesson 6', 6),
(7, 'Lesson 7', 7),
(8, 'Lesson 8', 8),
(9, 'Lesson 9', 9),
(10, 'Lesson 10', 10),
(11, 'Lesson 11', 11),
(12, 'Lesson 12', 12),
(13, 'Lesson 13', 13),
(14, 'Lesson 14', 14),
(15, 'Lesson 15', 15),
(16, 'Lesson 16', 16),
(17, 'Lesson 17', 17),
(18, 'Lesson 18', 18),
(19, 'Lesson 19', 19),
(20, 'Lesson 20', 20),
(21, 'Lesson 21', 21),
(22, 'Lesson 22', 22),
(23, 'Lesson 23', 23),
(24, 'Lesson 24', 24),
(25, 'Lesson 25', 25),
(26, 'Lesson 26', 26),
(27, 'Lesson 27', 27),
(28, 'Lesson 28', 28),
(29, 'Lesson 29', 29),
(30, 'Lesson 30', 30),
(31, 'Lesson 31', 31),
(32, 'Lesson 32', 32),
(33, 'Lesson 33', 33),
(34, 'Lesson 34', 34),
(35, 'Lesson 35', 35),
(36, 'Lesson 36', 36),
(37, 'Lesson 37', 37),
(38, 'Lesson 38', 38),
(39, 'Lesson 39', 39),
(40, 'Lesson 40', 40),
(41, 'Lesson 41', 41),
(42, 'Lesson 42', 42);

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE IF NOT EXISTS `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(2) NOT NULL,
  `word` varchar(100) NOT NULL,
  `definition` varchar(255) NOT NULL,
  `example_a` varchar(255) NOT NULL,
  `example_b` varchar(255) NOT NULL,
  `example_c` varchar(255) NOT NULL,
  `ordering` int(2) NOT NULL,
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lesson_id_2` (`lesson_id`,`word`),
  UNIQUE KEY `lesson_id_3` (`lesson_id`,`ordering`),
  KEY `lesson_id` (`lesson_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Дамп данных таблицы `words`
--

INSERT INTO `words` (`id`, `lesson_id`, `word`, `definition`, `example_a`, `example_b`, `example_c`, `ordering`, `is_deleted`) VALUES
(1, 1, 'abandon', 'desert, leave without planning to come back, quit', 'When Roy *abandoned* his family, the police went looking for him.', 'The soldier could not *abandon* his friends who were hurt in battle.', 'Because Rose was poor, she had to *abandon* her idea of going to college.', 1, '0'),
(2, 1, 'keen', 'sharp; eager; intense; sensitive', 'The butcher''s *keen* knife cut through the meat', 'My dog has *keen* sense of smell', 'Bill''s *keen* mind pleased all his teachers', 2, '0'),
(3, 1, 'jealous', 'afraid that the one you love might prefer someone else; wanting what someone else has', 'A detective was hired by the *jealous* widow to find the boyfriend who had **abandoned** her', 'Although my neighbor just bought a new car, I''am not *jealous* of him', 'Being *jealous*, Mona would not let her boyfriend b=dance with any of the cheerladiers', 3, '0'),
(4, 1, 'tact', 'ability to say right thing', 'My aunt never hurts anyone''s filings because she always uses *tact*.', 'By the use of *tact*, Janet was able to calm her **jealous** husband.', 'Your friend will admire you if you use *tact* and thoughtfulness', 4, '0'),
(5, 1, 'oath', 'a promise that something is true; a curse', 'The president will take the *oath* of office tomorrow.', 'In court, the witness took an *oath* that he would tell the whole truth,', 'When Terry discovered that he had been **abandoned**, he let out an angry *oath*.', 5, '0'),
(6, 1, 'vacant', 'empty; not filled', 'Someone is planning to build a house on that *vacant* lot.', 'I put my coat on that *vacant* seat.', 'When the landlord broke in, he found that apartment *vacant*', 6, '0'),
(7, 1, 'hardship', 'something that hard to bear; difficult', 'The fighter had to face many *hardships* before he came champion.', 'Abe Lincoln was able to overcome one *hardship* after another.', 'On account of *hardship*, Bert was let out of the army to take care of his sick mother', 7, '0'),
(8, 1, 'gallant', 'brave; showing respect for women', 'The pilot swore a *gallant* **oath** to save his buddy.', 'Many *gallant* knights ended the contest to win the princess.', 'Ed is so *gallant* that he always gives up his subway seat to a woman', 8, '0'),
(9, 1, 'data', 'facts; information', 'The *data* about the bank robbery were given to the F.B.I', 'After studying the *data*, we were able to finish our report.', 'Unless you are given all the *data*, you cannot do the math problem', 9, '0'),
(10, 1, 'unaccustomed', 'not used to something', 'Coming from Alaska, Claude was *unaccustomed* to Florida''s heat.', 'The king was *unaccustomed* to having people disobey him.', '*Unaccustomed* as he was to expect, Vic quickly became tired.', 10, '0'),
(11, 1, 'bachelor', 'a man who has not married', 'My brother took an **oath** to remain a *bachelor*.', 'In the movie, the married man was mistaken for a *bachelor*.', 'Before the wedding, all his *bachelor* friends had a party.', 11, '0'),
(12, 1, 'qualify', 'become fir, show that you are able', 'I am trying to *qualify* for the job that is now **vacant**.', 'Since Pauline can''t carry a tune. she is sure that she will never *qualify* for the Girls'' Chorus.', 'You have to be taller than 5''5" to *qualify* as a policeman in out town', 12, '0'),
(13, 2, 'corpse', 'a dead body, usually of a person', 'When given all the **data** on the *corpse*, the professor was able\r\nto solve the murder.', 'The *corpse* was laid to rest in the **vacant** coffin.', 'An **oath** of revenge was sworn over the *corpse* by his relatives.', 1, '0'),
(14, 2, 'conceal', 'hide', 'Tris could not *conceal* his love for Gloria.', 'Count Dracula *concealed* the **corpse** in his castle.', 'The money was so cleverly *concealed* that we were forced to\r\n**abandon** our search for it.', 2, '0'),
(15, 2, 'dismal', 'dark and depressing', 'When the weather is so *dismal*, I sometimes stay in bed all day.', 'I am **unaccustomed** to this *dismal* climate.', 'As the *dismal* reports of the election came in, the senator''s friends **tactfully** made no mention of them.', 3, '0'),
(16, 2, 'frigit', 'very cold', 'It was a great **hardship** for the men to live through the *frigid* winter at Valley Forge.', 'The **jealous** bachelor* was treated in a *frigid* manner by his girlfriend.', 'Inside the butcher''s freezer the temperature was *frigid*.', 4, '0'),
(17, 2, 'inhabit', 'live in', 'Eskimos *inhabit* the **frigid** part of Alaska.', 'Because Sidney **qualified**, he was allowed to *inhabit* the **vacant** apartment.', 'Many crimes are committed each year against those who *inhabit* the slum area of our city.', 5, '0'),
(18, 2, 'numb', 'without the power of feeling; deadened', 'My fingers quickly became *numb* in the **frigid** room.', 'A *numb* feeling came over Mr. Massey as he read the telegram.', 'When the nurse stuck a pin in my *numb* leg, I felt nothing.', 6, '0'),
(19, 2, 'peril', 'danger', 'The hunter was **abandoned** by the natives when he described the *peril* that lay ahead of them.', 'There is great *peril* in trying to climb the mountain.', 'Our library is filled with stories of *perilous* adventures.', 7, '0'),
(20, 2, 'recline', 'lie down; stretch out; lean back', 'Richard likes to *recline* in front of the television set.', 'After *reclining* on her right arm for an hour, Maxine found that it had become **numb**.', 'My dog''s greatest pleasure is to *recline* by the warm fireplace.', 8, '0'),
(21, 2, 'shriek', 'scream', 'The maid *shrieked* when she discovered the **corpse**', 'With a loud *shriek*, Ronald fled from the room.', 'Facing the **peril** of the waterfall, the boatman let out a terrible *shriek*.', 9, '0'),
(22, 2, 'sinister', 'evil; wicked; dishonest; frightening', 'The *sinister* plot to cheat the widow was uncovered by the police.', 'When the bank guard spied the *sinister*-looking customer, he drew his gun.', 'I was frightened by the *sinister* shadow at the bottom of the stairs.', 10, '0'),
(23, 2, 'tempt', 'try to get someone to do something; test; invite', 'A banana split can *tempt* me to break my diet.', 'The sight of beautiful Louise *tempted* the **bachelor** to change his mind about marriage.', 'Your offer of a job *tempts* me greatly.', 11, '0'),
(24, 2, 'wager', 'bet', 'I lost a small *wager* on the Super Bowl.', 'After winning the *wager*, Tex treated everyone to free drinks.', 'It is legal to make a *wager* in the state of Nevada.', 12, '0'),
(25, 3, 'typical', 'usual; of a kind', 'The **sinister** character in the movie wore a *typical* costume, a dark shirt, loud tie, and tight jacket.', 'The horse ran its *typical* race, a slow start and a slower finish, and my uncle lost his **wager**.', 'It was *typical* of the latecomer to **conceal** the real cause of his lateness.', 1, '0'),
(26, 3, 'minimum', 'the least possible amount; the lowest amount', 'Studies show that adults need a *minimum* of six hours sleep.', 'The *minimum* charge for a telephone, even if no calls are made, is about $60 a month.', 'Congress has set a *minimum* wage for all workers.', 2, '0'),
(27, 3, 'scarce', 'hard to get; rare', 'Chairs that are older than one hundred years are *scarce*.', 'Because there is little moisture in the desert, trees are *scarce*.', 'How *scarce* are good cooks?', 3, '0'),
(28, 3, 'annual', 'once a year; something that appears yearly or lasts for a year', 'The *annual* convention of musicians takes place in Hollywood.', 'The publishers of the encyclopedia put out a book each year called an *annual*.', 'Plants that live only one year are called *annuals*.', 4, '0'),
(29, 3, 'persuade', 'win over to do or believe; make willing', 'Can you *persuade* him to give up his **bachelor** days and get married?', 'No one could *persuade* the captain to leave the sinking ship.', 'Beth''s **shriek** *persuaded* Jesse that she was in real danger.', 5, '0'),
(30, 3, 'essential', 'necessary; very important', 'The *essential* items in the cake are flour, sugar, and shortening.', 'It is *essential* that we follow the road map.', 'Several layers of thin clothing are *essential* to keeping warm in **frigid** climates.', 6, '0'),
(31, 3, 'blend', 'mix together thoroughly; a mixture', 'The colors of the rainbow *blend* into one another.', 'A careful *blend* of fine products will result in delicious food.', 'When Jose *blends* the potatoes together, they come out very smooth.', 7, '0'),
(32, 3, 'visible', 'able to be seen', 'The ship was barely *visible* through the dense fog.', 'Before the stars are *visible*, the sky has to become quite dark.', 'You need a powerful lens to make some germs *visible*.', 8, '0'),
(33, 3, 'expensive', 'costly; high-priced', 'Because diamonds are **scarce** they are *expensive*.', 'Margarine is much less *expensive* than butter.', 'Shirley''s *expensive* dress created a great deal of excitement at the party.', 9, '0'),
(34, 3, 'talent', 'natural ability', 'Medori''s *talent* was noted when she was in first grade.', 'Feeling that he had the **essential** *talent*, Carlos tried out for the school play.', 'Hard work can often make up for a lack of *talent*.', 10, '0'),
(35, 3, 'devise', 'think out; plan; invent', 'The burglars *devised* a scheme for entering the bank at night.', 'I would like to *devise* a method for keeping my toes from becoming **numb** while I am ice\r\nskating.', 'If we could *devise* a plan for using the **abandoned** building, we could save thousands of dollars.', 11, '0'),
(36, 3, 'wholesale', 'in large quantity; less than retail in price', 'The *wholesale* price of milk is six cents a quart lower than retail.', 'Many people were angered by the *wholesale* slaughter of birds.', 'By buying my eggs *wholesale* I save fifteen dollars a year.', 12, '0'),
(37, 4, 'vapor', 'moisture in the air that can be seen; fog; mist', 'Scientists have **devised** methods for trapping *vapor* in bottles so they can study its makeup.', 'He has gathered **data** on the amount of *vapor* rising from the swamp.', 'A *vapor* trail is the **visible** stream of moisture left by the engines of a jet flying at high altitudes.', 1, '0'),
(38, 4, 'eliminate', 'get rid of; remove; omit', 'When the railroad tracks are raised, the danger of crossing will be *eliminated*.', 'When figuring the cost of a car, don''t *eliminate* such extras as air conditioning.', 'If we were to *eliminate* all **reclining** chairs, no one would fall asleep while watching television.', 2, '0'),
(39, 4, 'villain', 'a very wicked person', 'A **typical** moving picture *villain* gets killed at the end.', 'The *villain* **concealed** the **corpse** in the cellar.', 'When the *villain* fell down the well, everyone lived happily ever after.', 3, '0'),
(40, 4, 'dense', 'closely packed together; thick', 'The *dense* leaves on the trees let in a **minimum** of sunlight.', 'We couldn''t row because of the *dense* weeds in the lake.', 'His **keen** knife cut through the *dense* jungle.', 4, '0'),
(41, 4, 'utilize', 'make use of', 'No one seems willing to *utilize* this **vacant** house.', 'The gardener was eager to *utilize* different flowers and **blend** them in order to beautify the borders.', 'Does your mother *utilize* leftovers in her cooking?', 5, '0'),
(42, 4, 'humid', 'moist; damp', 'It was so *humid* in our classroom that we wished the school would buy an air conditioner.', 'New Yorkers usually complain in the summer of the *humid* air.', 'Most people believe that ocean air is quite *humid*.', 6, '0'),
(43, 4, 'theory', 'explanation based on thought, observation, or\r\nreasoning', 'Einstein''s *theory* is really too difficult for the average person to\r\nunderstand.', 'My uncle has a *theory* about the effect of weather on baseball batters.', 'No one has advanced a convincing *theory* explaining the beginnings of writing.', 7, '0'),
(44, 4, 'descend', 'go or come down from a higher place to a lower\r\nlevel', 'If we let the air out of a balloon, it will have to *descend*.', 'The pilot, thinking his plane was in **peril**, *descended* quickly.', 'Knowing her beau was waiting at the bottom of the staircase, Eleanor *descended* at once.', 8, '0'),
(45, 4, 'circulate', 'go around; go from place to place or person to\r\nperson', 'A fan may *circulate* the air in summer, but it doesn''t cool it.', 'My father *circulated* among the guests at the party and made them feel comfortable.', 'Hot water *circulates* through the pipes in the building, keeping the room warm.', 9, '0'),
(46, 4, 'enormous', 'extremely large; huge', 'The *enormous* crab moved across the ocean floor in search of food.', 'Public hangings once drew *enormous* crowds.', 'The **gallant** knight drew his sword and killed the *enormous* dragon.', 10, '0'),
(47, 4, 'predict', 'tell beforehand', 'Weathermen can *predict* the weather correctly most of the time.', 'Who can *predict* the winner of the Super Bowl this year?', 'Laura thought she could *predict* what I would do, but she was wrong.', 11, '0'),
(48, 4, 'vanish', 'disappear; disappear suddenly', 'Even in California the sun will sometimes *vanish* behind a cloud.', 'Not even a powerful witch can make a **jealous** lover *vanish*.', 'Give him a week without a job and all his money will *vanish*.', 12, '0'),
(49, 5, 'tradition', 'beliefs, opinions, and customs handed down from one generation to another', 'The father tried to **persuade** his son that the *tradition* of marriage was important.', 'All religions have different beliefs and *traditions*.', 'As time goes on, we will **eliminate** *traditions* that are meaningless.', 1, '0'),
(50, 5, 'rural', 'in the country', 'Tomatoes are less **expensive** at the *rural* farm stand.', '*Rural* areas are not **densely** populated.', 'The *rural* life is much more peaceful than the city one.', 2, '0'),
(51, 5, 'burden', 'what is carried; a load', 'The *burden* of the country''s safety is in the hands of the president.', 'Irma found the **enormous** box too much of a *burden*.', 'Ricky carried the *burden* throughout his college career.', 3, '0'),
(52, 5, 'campus', 'grounds of a college, university, or school', 'The *campus* was designed to **utilize** all of the college''s buildings.', 'Jeff moved off *campus* when he decided it was cheaper to live at\r\nhome.', 'I chose to go to Penn State because it has a beautiful *campus*.', 4, '0'),
(53, 5, 'majority', 'the larger number; greater part; more than half', 'A *majority* of votes was needed for the bill to pass.', 'The *majority* of people prefer to pay wholesale* prices for meat.', 'In some countries, the government does not speak for the *majority* of the people.', 5, '0'),
(54, 5, 'assemble', 'gather together; bring together', 'The rioters *assembled* outside the White House.', 'I am going to *assemble* a model of a spacecraft.', 'All the people who had *assembled* for the picnic **vanished** when the rain began to fall.', 6, '0'),
(55, 5, 'explore', 'go over carefully; look into closely; examine', 'Lawyer Spence *explored* the **essential** reasons for the crime.', 'The weather bureau *explored* the effects of the rainy weather.', 'Sara wanted to know if all of the methods for solving the problem had been *explored*.', 7, '0'),
(56, 5, 'topic', 'subject that people think, write, or talk about', '**Predicting** the weather is our favorite *topic* of conversation.', 'Valerie only discussed *topics* that she knew well.', 'The speaker''s main *topic* was how to **eliminate** hunger in this world.', 8, '0'),
(57, 5, 'debate', 'a discussion in which reasons for and against\r\nsomething are brought out', 'The *debate* between the two candidates was heated.', '*Debate* in the U.S. Senate lasted for five days.', 'Instead of **shrieking** at each other, the students decided to have a *debate* on the **topic**.', 9, '0'),
(58, 5, 'evade', 'get away from by trickery or cleverness', 'Juan tried to *evade* the **topic** by changing the subject.', 'In order to *evade* the police dragnet, Ernie grew a beard.', 'The prisoner of war *evaded* questioning by pretending to be sick.', 10, '0'),
(59, 5, 'probe', 'search into; examine thoroughly; investigate', 'The lawyer **probed* the man''s mind to see if he was innocent.', 'After *probing* the scientist''s **theory**, we proved it was correct.', 'King Henry''s actions were carefully *probed* by the noblemen.', 11, '0'),
(60, 5, 'reform', 'make better; improve by removing faults', 'After the prison riot, the council decided to *reform* the correctional system.', 'Brad *reformed* when he saw that breaking the law was hurting people other than himself.', 'Only laws that force companies to *reform* will clear the dangerous **vapors** from our air.', 12, '0'),
(61, 6, 'approach', 'come near or nearer to', 'The lawyers in the trial were often asked to *approach* the bench.', 'Her beau kissed Sylvia when he *approached* her.', 'Ben *approached* the **burden** of getting a job with a new spirit.', 1, '0'),
(62, 6, 'detect', 'find out; discover', 'Sam Spade *detected* that the important papers had **vanished**.', 'From her voice it was easy to *detect* that Ellen was frightened.', 'We *detected* from the messy room that a large group of people had **assembled** there.', 2, '0'),
(63, 6, 'defect', 'fault; that which is wrong', 'My Chevrolet was sent back to the factory because of a steering *defect*.', 'His **theory** of the formation of our world was tilled with *defects*.', 'The **villain** was caught because his plan had many *defects*.', 3, '0'),
(64, 6, 'employee', 'a person who works for pay', 'The *employees* went on strike for higher wages.', 'My boss had to tire many *employees* when meat became **scarce**.', 'Joey wanted to go into business for himself and stop being an *employee*.', 4, '0'),
(65, 6, 'neglect', 'give too little care or attention to', 'The senator *neglected* to make his **annual** report to Congress.', 'Bob''s car got dirty when he *neglected* to keep it polished.', 'It is **essential** that you do not *neglect* your homework.', 5, '0'),
(66, 6, 'deceive', 'make someone believe as true something that is false; mislead', 'Atlas was *deceived* about the **burden** he had to carry.', 'Virginia cried when she learned that her best friend had *deceived* her.', 'The **villain** *deceived* Chief White Cloud by pretending to be his friend.', 6, '0'),
(67, 6, 'undoubtedly', 'certainly; beyond doubt', 'Ray''s team *undoubtedly* had the best **debators** in our county.', 'The pilgrims *undoubtedly* **assembled** to travel to Rome together.', 'If she didn''t want to get into an argument, Valerie would have followed the **majority** *undoubtedly*.', 7, '0'),
(68, 6, 'popular', 'liked by most people', 'The Beatles wrote many *popular* songs.', 'At one time miniskirts were very *popular*.', '*Popular* people often find it hard to **evade** their many friends.', 8, '0'),
(69, 6, 'thorough', 'being all that is needed; complete', 'The police made a *thorough* search of the house after the crime had been reported.', 'My science teacher praised Sandy for doing a *thorough* job of cleaning up the lab.', 'Mom decided to spend the day in giving the basement a *thorough* cleaning.', 9, '0'),
(70, 6, 'client', 'person for whom a lawyer acts; customer', 'The lawyer told her *client* that she could **predict** the outcome of his trial.', 'My uncle tried to get General Motors to be a *client* of his company.', 'If this restaurant doesn''t improve its service, all its *clients* will **vanish**.', 10, '0'),
(71, 6, 'comprehensive', 'including much; covering completely', 'After a *comprehensive* exam, my doctor said I was in good condition.', 'The engineer gave our house a **thorough**, *comprehensive* checkup before my father bought it.', 'Mrs. Silver wanted us to do a *comprehensive* study of Edgar Allan Poe.', 11, '0'),
(72, 6, 'defraud', 'take money, rights, etc., away by cheating', 'My aunt saved thousands of dollars by *defrauding* the government.', 'If we could **eliminate** losses from people who *defraud* the government, tax rates could\r\nbe lowered.', 'By *defrauding* his friend, Dexter ruined a family **tradition** of honesty.', 12, '0'),
(73, 7, 'postpone', 'put off to a later time; delay', 'The young couple wanted to *postpone* their wedding until they were sure they could handle the **burdens** of marriage.', 'I **neglected** to *postpone* the party because I thought everyone would be able to come.', 'The supermarket''s owner planned to *postpone* the grand opening until Saturday.', 1, '0'),
(74, 7, 'consent', 'agree; give permission or approval', 'My teacher *consented* to let our class leave early.', 'David would not *consent* to our plan.', 'The **majority** of our club members *consented* to raise the dues.', 2, '0'),
(75, 7, 'massive', 'big and heavy; large and solid; bulky', 'The boss asked some **employees** to lift the *massive* box.', 'From lifting weights, Willie had developed *massive* arm muscles.', 'The main building on the **campus** was so *massive* that the new students had trouble finding their way around at first.', 3, '0'),
(76, 7, 'capsule', 'a small case or covering', 'The small *capsule* contained notes the spy had written after the meeting.', 'A new, untested medicine was **detected** in the *capsule* by the police scientists.', 'He **explored** the space *capsule* for special equipment.', 4, '0'),
(77, 7, 'preserve', 'keep from harm or change; keep safe; protect', 'The lawyers wanted to *preserve* the newest **reforms** in the law.', 'Farmers feel that their **rural** homes should be *preserved*.', 'The outfielder''s records are *preserved* in the Baseball Hall of Fame.', 5, '0'),
(78, 7, 'denounce', 'condemn in public; express strong disapproval of', 'The father *denounced* his son for lying to the district attorney.', 'Some people *denounce* the government for **probing** into their private lives.', 'The consumer advocate *denounced* the **defective** products being sold.', 6, '0'),
(79, 7, 'unique', 'having no like or equal; being the only one of its kind', 'Going to Africa was a *unique* experience for us.', 'The inventor developed a *unique* method of making ice cream.', 'Albie has a *unique* collection of Israeli stamps.', 7, '0'),
(80, 7, 'torrent', 'any violent, rushing stream; flood', 'A **massive** rain was coming down in *torrents*.', 'In the **debate**, a *torrent* of questions was asked.', 'After trying to **defraud** the public, Lefty was faced with a *torrent* of charges.', 8, '0'),
(81, 7, 'resent', 'feel injured and angered at (something)', 'Bertha *resented* the way her boyfriend treated her.', 'The earthquake victim *resented* the poor emergency care.', 'Columbus *resented* the fact that his crew wanted to turn back.', 9, '0'),
(82, 7, 'molest', 'interfere with and trouble; disturb', 'My neighbor was *molested* when walking home from the subway.', 'The gang did a **thorough** job of *molesting* the people in the park.', 'Lifeguards warned the man not to *molest* any of the swimmers.', 10, '0'),
(83, 7, 'gloomy', 'dark; dim; in low spirits', 'My cousin was *gloomy* because his best friend had moved away.', 'The reason Doris wasn''t **popular** was that she always had a *gloomy* appearance.', 'Jones Beach is not so beautiful on a *gloomy* day.', 11, '0'),
(84, 7, 'unforeseen', 'not known beforehand; unexpected', 'We had some *unforeseen* problems with the new engine.', 'The **probe** into the congressman''s finances turned up some *unforeseen* difficulties.', 'The divers faced *unforeseen* trouble in their search for the wreck.', 12, '0'),
(85, 8, 'exaggerate', 'make something greater than it is; overstate', 'He wasn''t trying to **deceive** you when he said that his was the best car in the world; he was just *exaggerating*.', 'The bookkeeper *exaggerated* her importance to the company.', 'When he said that O''Neal was eight feet tall, he was **undoubtedly** *exaggerating*.', 1, '0'),
(86, 8, 'amateur', 'person who does something for pleasure, not for\r\nmoney or as a profession', 'The *amateur* cross-country runner wanted to be in the Olympics.', 'After his song, Don was told that he wasn''t good enough to be anything but an *amateur*.', 'Professional golfers **resent** *amateurs* who think they are as good as the people who play for money.', 2, '0'),
(87, 8, 'mediocre', 'neither good nor bad; average; ordinary', 'After reading my composition, Mrs. Evans remarked that it was *mediocre* and that I could do better.', 'Howard was a *mediocre* scientist who never made any **unique** discoveries.', 'The movie wasn''t a great one; it was only *mediocre*.', 3, '0'),
(88, 8, 'variety', 'lack of sameness; a number of different things', 'Eldorado Restaurant serves a wide *variety* of foods.', 'The show featured a *variety* of entertainment.', 'He faced **unforeseen** problems for a *variety* of reasons.', 4, '0'),
(89, 8, 'valid', 'supported by facts or authority; sound; true', 'The witness **neglected** to give *valid* answers to the judge''s questions.', 'Rita had *valid* reasons for **denouncing** her father''s way of life.', 'When Dave presented *valid* working papers, the foreman **consented** to hiring him immediately.', 5, '0'),
(90, 8, 'survive', 'live longer than; remain alive after', 'It was uncertain whether we would *survive* the **torrent** of rain.', 'Some people believe that only the strongest should *survive*.', 'The space **capsule** was built to *survive* a long journey in space.', 6, '0'),
(91, 8, 'weird', 'mysterious; unearthly', 'She looked **weird* with that horrible makeup on her face.', 'Allen felt that *weird* things were starting to happen when he entered the haunted house.', 'Becky had a *weird* feeling after swallowing the pills.', 7, '0'),
(92, 8, 'prominent', 'well-known; important', 'My **client** is a *prominent* businessperson.', 'Napoleon is a *prominent* figure in the history of France.', 'Her violet eyes were the *prominent* feature of the model''s face.', 8, '0'),
(93, 8, 'security', 'freedom from danger, care, or fear; feeling or\r\ncondition of being safe', 'Our janitor likes the *security* of having all doors locked at night.', 'When the president travels, strict *security* measures are taken.', 'Pablo wanted to **preserve** the *security* of his lifestyle.', 9, '0'),
(94, 8, 'bulky', 'taking up much space; large', 'Charley and Morty removed the *bulky* package from the car.', 'The **massive** desk was quite *bulky* and impossible to carry.', 'His **client** wanted an item that wasn''t so *bulky*, Olsen told us.', 10, '0'),
(95, 8, 'reluctant', 'unwilling', 'It was easy to see that Herman was *reluctant* to go out and find a job.', 'The patient was *reluctant* to tell the nurse the whole **gloomy** truth.', 'I was *reluctant* to give up the **security** of family life.', 11, '0'),
(96, 8, 'obvious', 'easily seen or understood; clear to the eye or mind; not to be doubted; plain', 'It was *obvious* that the lumberjack was tired after his day''s work.', 'The fact that Darcy was a **popular** boy was *obvious* to all.', 'The detective missed the clue because it was too *obvious*.', 12, '0'),
(97, 9, 'vicinity', 'region near a place; neighborhood', 'Living in the *vicinity* of New York, Jeremy was near many museums.', 'The **torrent** of rain fell only in our *vicinity*.', 'We **approached** the Baltimore *vicinity* by car.', 1, '0'),
(98, 9, 'century', '100 years', 'George Washington lived in the eighteenth *century*.', 'The United States is more than two *centuries* old.', 'Many prominent* men have been born in this *century*.', 2, '0'),
(99, 9, 'rage', 'violent anger; something that arouses intense but brief enthusiasm', 'Joan''s bad manners sent her mother into a *rage*.', 'In a fit of *rage*, Francine broke the valuable glass.', 'The mayor felt a sense of *rage* about the **exaggerations** in the press.', 3, '0'),
(100, 9, 'document', 'something handwritten or printed that gives information or proof of some fact', 'Newly discovered *documents* showed that the prisoner was **obviously** innocent.', 'The *documents* of ancient Rome have **survived** many **centuries**.', 'We were **reluctant** to destroy important *documents*.', 4, '0'),
(101, 9, 'conclude', 'end; finish; decide', 'Most people are happy when they *conclude* their work for the day.', 'The **gloomy** day *concluded* with a thunderstorm.', 'Work on the building could not be *concluded* until the contract was signed.', 5, '0'),
(102, 9, 'undeniable', 'not to be denied; cannot be questioned', 'The jury **concluded** that the teenagers were *undeniably* guilty.', 'It is *undeniable* that most professionals can beat any **amateur**.', 'That Leon **resented** Rita''s good marks in school was *undeniable*.', 6, '0'),
(103, 9, 'resist', 'act against; strive against; oppose', 'Totie could not *resist* eating the chocolate sundae.', 'Tight **security** measures *resisted* Jimmy''s entrance into the bank.', 'Harold *resisted* the opportunity to poke fun at the **weird** man.', 7, '0'),
(104, 9, 'lack', 'be entirely without something; have not enough', 'Your daily diet should not *lack* fruits and vegetables.', 'His problem was that he lacked a **variety** of **talents**.', 'As an **amateur** dancer, Vincent knew that he *lacked* the professional touch.', 8, '0'),
(105, 9, 'ignore', 'pay no attention to; disregard', 'Little Alice realized that if she didn''t behave, her parents would *ignore* her.', 'The student could not answer the question because he *ignored* the **obvious** facts.', 'Older brothers and sisters often feel *ignored* when their parents only spend time with a new baby.', 9, '0'),
(106, 9, 'challenge', 'call to a fight', 'Aaron Burr *challenged* Alexander Hamilton to a duel.', 'No one bothered to *challenge* the **prominent** lawyer.', 'Trying to become a doctor was quite a *challenge*, Dick discovered.', 10, '0'),
(107, 9, 'miniature', 'represented on a small scale', 'The young boy wanted a *miniature* sports car for his birthday.', 'Instead of buying a **massive** dog, Teddy got a *miniature* poodle.', 'We were seeking a *miniature* model of the **bulky** chess set.', 11, '0'),
(108, 9, 'source', 'place from which something comes or is obtained', 'The college student knew that he needed more than a basic textbook as a *source* for his report.', 'The *source* of Buddy''s trouble was boredom.', 'Professor Smith''s speech was a **valid** *source* of information on chemistry.', 12, '0'),
(109, 10, 'excel', 'be better than; do better than', 'Because he was so small, Larry could not *excel* in sports.', 'At least Hannah had the **security** of knowing that she *excelled* in swimming.', 'Clarence Darrow wanted to become a **prominent** lawyer, but he felt that he must first *excel* in the study of history.', 1, '0'),
(110, 10, 'feminine', 'of women or girls', 'When my sister wants to look *feminine* she changes from dungarees into a dress.', 'Aunt Sarah can always be counted on to give the *feminine* viewpoint.', 'My brother i~ ashamed to cry at a sad movie because people might think he is behaving in a *feminine* manner.', 2, '0'),
(111, 10, 'mount', 'get up on', 'Congressman Jones *mounted* the platform to make his speech.', 'The watchman *mounted* the tower to see if there were any people in the **vicinity**.', 'My sister couldn''t *mount* the horse so they gave her a pony instead.', 3, '0'),
(112, 10, 'compete', 'try hard to get something wanted by others; be a rival', 'The former champion was **challenged** to *compete* for the tennis title.', 'The runner was **reluctant** to *compete* in front of his parents for the first time.', 'When the **amateur** became a pro he had to *compete* against better men.', 4, '0'),
(113, 10, 'dread', 'look forward to with fear; fear greatly; causing great fear', 'The poor student *dreaded* going to school each morning.', 'He had a *dread* feeling about the **challenge** he was about to face.', 'I *dread* going into that deserted house.', 5, '0'),
(114, 10, 'masculine', 'of man; male', 'The boy became more *masculine* as he got older.', 'It is **undeniable** that his beard makes him look *masculine*.', 'The girls liked Jerry because of his *masculine* ways.', 6, '0'),
(115, 10, 'menace', 'threat', 'lrv''s **lack** of respect made him a *menace* to his parents.', 'The **torrents** of rain were a *menace* to the farmer''s crops.', 'Sergeant Foy''s raw language was an **obvious** *menace* to the reputation of the entire police department.', 7, '0'),
(116, 10, 'tendency', 'leaning; movement in a certain direction', 'My algebra teacher has a *tendency* to forget the students'' names.', 'His *tendency* was to work hard in the morning and then to take it easy in the afternoon.', 'The *tendency* in all human beings is to try to **survive**.', 8, '0'),
(117, 10, 'underestimate', 'set too low a value, amount, or rate', 'I admit that I *underestimated* the power in the **bulky** fighter''s frame.', '**Undoubtedly** the boss *underestimated* his **employee''s** ability to work hard.', 'The value of our house was *underestimated* by at least two thousand dollars.', 9, '0'),
(118, 10, 'victorious', 'having won a victory; conquering', 'Playing in New Jersey, the Jets were *victorious* two years in a row.', 'Terry faced the **challenge** with the bad attitude that he could not be *victorious*.', 'Our girls'' volleyball squad was *victorious* over a taller team.', 10, '0'),
(119, 10, 'numerous', 'very many; several', 'Critics review *numerous* movies every week.', 'Dr. Fischer had **resisted** accepting money from the poor woman on *numerous* house calls.', 'The **debater** used *numerous* **documents** to back up his statements.', 11, '0'),
(120, 10, 'flexible', 'easily bent; willing to yield', 'The toy was *flexible*, and the baby could bend it easily.', 'Remaining *flexible*, Nick listened to arguments from both sides.', 'A mouse''s *flexible* body allows it to squeeze through narrow openings.', 12, '0');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
