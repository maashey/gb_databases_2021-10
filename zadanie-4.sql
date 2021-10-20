USE vk2;

-- В прошлом задании добавила справочники городов и стран.
-- Теперь добавляю в них данные и добавляю связи с ними: изменяю существующие данные в таблице profiles, 
-- затем изменяю таблюцу profiles, переименовываю столбцы и изменяю тип, добавляю ограничения.

INSERT INTO cities (name)
VALUES ('Moscow'), ('Vologda'), ('Sochi'), ('Orel'), ('Penza'), ('Bryansk'), ('Minsk'), ('Paris'), ('New York'), ('Milan'), ('Berlin');

INSERT INTO countries (name)
VALUES ('Russia'), ('Belarus'), ('France'), ('USA'), ('Italy'), ('Germany');

UPDATE profiles SET city = 1;
UPDATE profiles SET country = 1;

ALTER TABLE profiles 
CHANGE COLUMN city city_id INT UNSIGNED NOT NULL,
ADD CONSTRAINT fk_profiles_cities FOREIGN KEY (city_id) REFERENCES cities (id);

ALTER TABLE profiles 
CHANGE COLUMN country country_id INT UNSIGNED NOT NULL,
ADD CONSTRAINT fk_profiles_countries FOREIGN KEY (country_id) REFERENCES countries (id);


/*
 *  i. Заполнить все таблицы БД vk данными (по 10-20 записей в каждой таблице)
 */ 

DESCRIBE users;
INSERT INTO users (firstname, lastname, phone, email, password_hash)
VALUES 
('Антон', 'Сидоров', '89991113311', 'user1@domain.com', '62121b62217426d591b7f69e230fd70a'),
('Дмитрий', 'Кузнецов', '89991113322', 'user2@domain.com', 'aed86fdaf05bb16a2166a9e4032fed87'),
('Ivan', 'Ivanov', '89991112233', 'user3@domain.com', '6bcf8762f5eccc2d428d43df5b13962b'),
('Олег', 'Петров', '89991112244', 'user4@domain.com', 'af44124c6892ec0149fb04ef6c158a88'),
('Тимур', 'Уткин', '89991112255', 'user5@domain.com', '454de61db97e7cd0ebe3d02fa6c40237'),
('Анна', 'Гусева', '89991112266', 'user6@domain.com', '17b30aa68d47c4be0801e224ed4d94f7'),
('Елена', 'Воронцова', '89991112277', 'user7@domain.com', 'bf2cd4e441fa0133b55a6aea0346d9f7'),
('Мария', 'Воробьева', '89991112288', 'user8@domain.com', '6bcf8762f5eccc2d428d43df5b13962b'),
('Ольга', 'Козлова', '89991112299', 'user9@domain.com', 'c5c1cf5d1be4cd31b81a283af37f9943'),
('Ксения', 'Орлова', '89991112200', 'user10@domain.com', '1c6aa9cbda5a08c13cbf79165f732fet');

DESCRIBE media;
INSERT INTO media (user_id, media_types_id, file_name, file_size)
VALUES 
(32, 1, 'dlsff.jpg', 2909755),
(33, 1, 'upts.jpg', 1843550),
(34, 1, 'vpta.jpg', 8842683),
(35, 1, 'slkf.jpg', 28562984),
(36, 1, 'dfih.jpg', 632483),
(37, 1, 'jhdo.jpg', 83298432),
(38, 1, 'kjhsdhk.jpg', 7924789),
(39, 1, 'dskl.jpg', 845895),
(40, 1, 'kdsfj.jpg', 9453975),
(41, 1, 'dlkfsdljk.jpg', 948534),
(32, 2, '29374.mp3', 289749283),
(36, 2, 'sklfdf.mp3', 9875925);

DESCRIBE profiles;
INSERT INTO profiles (user_id, gender, birthday, photo_id, city_id, country_id)
VALUES
(32, 'm', '1989-01-13', 4, 1, 1),
(33, 'm', '1989-01-13', 5, 2, 1),
(34, 'm', '1989-01-13', 6, 3, 1),
(35, 'm', '1989-01-13', 7, 4, 1),
(36, 'm', '1989-01-13', 8, 5, 1),
(37, 'f', '1989-01-13', 9, 6, 1),
(38, 'f', '1989-01-13', 10, 7, 3),
(39, 'f', '1989-01-13', 11, 8, 4),
(40, 'f', '1989-01-13', 12, 9, 5),
(41, 'f', '1989-01-13', 13, 10, 6);

UPDATE profiles 
SET birthday = '2009-08-12' WHERE user_id>37;

DESCRIBE communities;
INSERT INTO communities (name, admin_id)
VALUES ('first', 32),('second', 33),('third', 34),('fourth', 35),('fifth', 36),('sixth', 37),
('seventh', 38),('eighth', 39),('nineth', 40),('tenth',41);

DESCRIBE communities_users ;
INSERT INTO communities_users 
VALUES (1,33), (2,32), (2,41), (3,34), (3,35), (3,36),
(4,37), (4,38), (4,39), (5,1), (5,2), (6,1), (6,2), (7,1), (7,32),
(8,35), (9,40), (10, 33), (11, 36);

DESCRIBE friend_requests;
SELECT * FROM friend_requests;
INSERT INTO friend_requests (from_user_id, to_user_id)
VALUES 
(1,32), (1,33), (1,34), (1,35), (1,36), (1,37), (1,38), (1,39), (1,40), (1,41);

DESCRIBE media_likes;
INSERT INTO media_likes (media_id, from_user_id)
VALUES 
(1,32), (1,33), (1,34), (1,35), (1,36), (1,37), (1,38), (1,39), (1,40), (1,41),
(5,32), (6,33), (7,34), (8,35), (9,36), (10,37), (11,38), (12,39), (13,40), (14,41);

DESCRIBE messages;
INSERT INTO messages (from_user_id, to_user_id, body, is_delivered)
VALUES 
(1, 2, 'Товарищи! консультация с широким активом позволяет выполнять важные задания по разработке систем массового участия.', 0),
(2, 1, 'С другой стороны укрепление и развитие структуры обеспечивает участие в формировании систем массового участия.',1),
(32, 33, 'Таким образом новая модель организационной деятельности способствует подготовки и реализации систем массового участия.', 0),
(33, 34, 'Разнообразный и богатый опыт консультация с широким активом обеспечивает широкому кругу.', 1),
(34, 35, 'Равным образом постоянный количественный рост и сфера нашей активности играет важную роль', 0),
(35, 36, 'Равным образом консультация с широким активом требуют определения и уточнения модели развития.', 1),
(36, 37, 'Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании новых предложений.', 0),
(37, 38, 'Если у вас есть какие то интересные предложения, обращайтесь! Студия Web-Boss всегда готова решить любую задачу.', 0),
(38, 39, 'Разнообразный и богатый опыт консультация с широким активом обеспечивает широкому кругу.', 1),
(39, 40, 'Повседневная практика показывает, что укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития.', 0);

DESCRIBE posts;
INSERT INTO posts (user_id, body)
VALUES 
(32, 'Не следует, однако забывать, что дальнейшее развитие различных форм деятельности способствует подготовки и реализации форм развития.
Таким образом реализация намеченных плановых заданий позволяет оценить значение новых предложений.
С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач.
Товарищи! консультация с широким активом позволяет выполнять важные задания по разработке систем массового участия.'),
(33, 'Повседневная практика показывает, что реализация намеченных плановых заданий в значительной степени обуславливает создание модели развития.
Товарищи! консультация с широким активом позволяет выполнять важные задания по разработке систем массового участия.
Таким образом новая модель организационной деятельности способствует подготовки и реализации систем массового участия.'),
(34, 'Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности позволяет оценить значение новых предложений.
Идейные соображения высшего порядка, а также начало повседневной работы по формированию позиции позволяет оценить значение модели развития.
Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании новых предложений.'),
(35, 'С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач.
Значимость этих проблем настолько очевидна, что консультация с широким активом играет важную роль в формировании новых предложений.
Разнообразный и богатый опыт консультация с широким активом обеспечивает широкому кругу.'),
(35, 'Товарищи! сложившаяся структура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития.
Если у вас есть какие то интересные предложения, обращайтесь! Студия Web-Boss всегда готова решить любую задачу.
Повседневная практика показывает, что укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития.'),
(37, 'Равным образом постоянный количественный рост и сфера нашей активности играет важную роль в формировании системы обучения кадров, соответствует насущным потребностям.
Товарищи! сложившаяся структура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития.
Таким образом новая модель организационной деятельности способствует подготовки и реализации систем массового участия.'),
(38, 'С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач.
Не следует, однако забывать, что дальнейшее развитие различных форм деятельности способствует подготовки и реализации форм развития.
Равным образом постоянный количественный рост и сфера нашей активности играет важную роль в формировании системы обучения кадров, соответствует насущным потребностям.'),
(1, '. С другой стороны рамки и место обучения кадров способствует подготовки и реализации модели развития.
Повседневная практика показывает, что укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития.
Таким образом новая модель организационной деятельности способствует подготовки и реализации систем массового участия.'),
(1, 'Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности позволяет оценить значение новых предложений.
С другой стороны укрепление и развитие структуры обеспечивает участие в формировании систем массового участия.
Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке модели развития.'),
(2, 'Повседневная практика показывает, что укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития.
Разнообразный и богатый опыт консультация с широким активом обеспечивает широкому кругу.
Идейные соображения высшего порядка, а также рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании новых предложений.');

DESCRIBE posts_likes;
INSERT INTO posts_likes (post_id, from_user_id)
VALUES (1,32), (1,33), (1,34), (1,35), (1,36), (1,37), (1,38), (2,39), (3,40), (4,41),
(5,32), (6,33), (7,34), (8,35), (9,36), (10,37);

DESCRIBE posts_media;
INSERT INTO posts_media (post_id, media_id)
VALUES (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10);



/*
 * ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
 */
SELECT DISTINCT firstname FROM users ORDER BY firstname; 

/*
 * iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
 */
ALTER TABLE profiles 
ADD COLUMN is_active BOOL NOT NULL DEFAULT TRUE;
SELECT * FROM  profiles;
UPDATE profiles SET is_active=0 WHERE (YEAR(CURRENT_DATE)-YEAR(birthday))<18; 

/*
 * iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
 */
DELETE FROM messages WHERE created_at > NOW();


-- v. Написать название темы курсового проекта (в комментарии)
-- Электронная библиотека для скачивания книг (аналог litres)