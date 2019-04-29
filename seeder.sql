use pets_db;

INSERT INTO users(id, username, email, password)
VALUES (1, 'James', 'James@gmail.com', '1234'),
       (2, 'Bethany', 'Bethany@gmail.com', '1234'),
       (3, 'Patrick', 'Patrick@gmail.com', '1234'),
       (4, 'Dad', 'Dad@gmail.com', '1234'),
       (5, 'Mom', 'Mom@gmail.com', '1234');

INSERT INTO ads (user_id, title, description, createDate, soldDate, zipCode, dob, gender, pictureURL)
VALUES(1, 'Dog for sale', 'Loving dog', '2016-05-17', '2018-03-15', '78250', '1988-05-17', 'M', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg'),
      (2, 'Cat for sale', 'Loving cat', '2016-05-17', '2018-03-15', '78280', '1988-05-17', 'F', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg'),
      (3,'Fish for sale', 'Loving fish', '2016-05-17', '2018-03-15', '78260', '1988-05-17', 'M', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg'),
      (4, 'Reptile for sale', 'Loving reppy', '2016-05-17', '2018-03-15', '78280', '1988-05-17', 'F', 'https://i.kinja-img.com/gawker-media/image/upload/s--4vlfc0Vs--/c_scale,f_auto,fl_progressive,q_80,w_800/zhdfbwvbc2miyqyaryl9.jpg');

INSERT INTO characteristics(id, characteristic)
VALUES(1, 'kid friendly'),
      (2, 'pet friendly'),
      (3, 'shy');



