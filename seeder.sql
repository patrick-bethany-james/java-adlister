use pets_db;

INSERT INTO users(id, username, email, password)
VALUES (1, 'James', 'James@gmail.com', '1234'),
       (2, 'Bethany', 'Bethany@gmail.com', '1234'),
       (3, 'Patrick', 'Patrick@gmail.com', '1234'),
       (4, 'Dad', 'Dad@gmail.com', '1234'),
       (5, 'Mom', 'Mom@gmail.com', '1234');

INSERT INTO ads (user_id, title, description, createDate, soldDate, zipCode, dob, gender, pictureURL, species)
VALUES(1, 'Dog for sale', 'Loving dog', '2016-05-17', '2018-03-15', '78250', '1988-05-17', 'M', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg', 'dog'),
      (1, 'Here is a cat', 'Cat', '1988-05-17', '2018-03-15', '78250', '2019-03-17', 'M', '/img/stupidCat.jpg', 'cat'),
      (1, 'This fish is garbage', 'Fish boy. He is one wild dude.', '1988-05-17', '2018-03-15', '78250', '2019-03-17', 'M', '/img/mouthFish.jpeg', 'fish'),
      (2, 'WANTED. The Best Cat ', 'WANTED: Angry cat that hates being pointed at.', '2016-05-17', '2018-03-15', '78280', '1988-05-17', 'F', '/img/brody.png', 'cat'),
      (3,'Fish for sale', 'Loving fish', '2016-05-17', '2018-03-15', '78260', '1988-05-17', 'M', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg', 'fish'),
      (4, 'Reptile for sale', 'Loving reppy', '2016-05-17', '2018-03-15', '78280', '1988-05-17', 'F', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg', 'reptile'),
      (4, 'Reptile for trade', 'TRADE HIM!', '2016-05-17', '2018-03-15', '78280', '1988-05-17', 'M', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg', 'reptile'),
      (5,'Come get this snake!', 'Friendly', '2019-03-18', null,'78250','1967-04-02','F','https://images.pexels.com/photos/38438/rattlesnake-toxic-snake-dangerous-38438.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','reptile'),
      (1,'Mice for SALE!!','Perfect for you pet snake','2019-02-14',null,'75503','1999-02-22','M','https://www.rd.com/wp-content/uploads/2018/08/11-Things-Mice-Dont-Want-You-to-Know-9-760x506.jpg','rodent'),
      (2,'Dory','A little off, but nice','2019-03-24',null,'78251','2010-02-06','F','https://qph.fs.quoracdn.net/main-qimg-13e27d61b3fb7ca91335f502b928eadc','fish');
INSERT INTO characteristics(id, characteristic)
VALUES(1, 'kid friendly'),
      (2, 'pet friendly'),
      (3, 'shy');



# (1,'','','',null,'','','','','');
