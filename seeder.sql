use pets_db;

INSERT INTO users(id, username, email, password)
VALUES (1, 'James', 'James@gmail.com', '1234'),
       (2, 'Bethany', 'Bethany@gmail.com', '1234'),
       (3, 'Patrick', 'Patrick@gmail.com', '1234'),
       (4, 'Dad', 'Dad@gmail.com', '1234'),
       (5, 'Mom', 'Mom@gmail.com', '1234');

INSERT INTO ads (user_id, title, description, createDate, soldDate, zipCode, dob, gender, pictureURL, species)
VALUES(1, 'Dog for sale', 'Loving dog', '2016-05-17', '2018-03-15', '78250', '1988-05-17', 'M', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg', 'dog'),
      (1, 'Here is a cat', 'Cat', '1988-05-17', '2018-03-15', '78250', '2019-03-17', 'M', 'https://coleandmarmalade.com/wp-content/uploads/2018/12/marm-freckles.jpg', 'cat'),
      (1, 'This fish is garbage', 'Fish boy. He is one wild dude.', '1988-05-17', '2018-03-15', '78250', '2019-03-17', 'M', 'https://upload.wikimedia.org/wikipedia/commons/a/af/Butterfly_Goldfish_02.JPG', 'fish'),
      (2, 'WANTED. The Best Cat ', 'WANTED: Angry cat that hates being pointed at.', '2016-05-17', '2018-03-15', '78280', '1988-05-17', 'F', 'src/main/webapp/img/brody.png', 'cat'),
      (3,'Fish for sale', 'Loving fish', '2016-05-17', '2018-03-15', '78260', '1988-05-17', 'M', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg', 'fish'),
      (4, 'Reptile for sale', 'Loving reppy', '2016-05-17', '2018-03-15', '78280', '1988-05-17', 'F', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg', 'reptile'),
      (4, 'Reptile for trade', 'TRADE HIM!', '2016-05-17', '2018-03-15', '78280', '1988-05-17', 'M', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg', 'reptile')
INSERT INTO characteristics(id, characteristic)
VALUES(1, 'kid friendly'),
      (2, 'pet friendly'),
      (3, 'shy');


