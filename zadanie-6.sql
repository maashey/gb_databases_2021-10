/*
 *  1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
 *    который больше всех общался с выбранным пользователем (написал ему сообщений).
 */
 
 -- возьмём user_id = 1
SELECT from_user_id AS fan_id
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count(*) DESC
LIMIT 1;



/*
 *  2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
 */
 
-- найдём пользователей моложе 10 лет 
SELECT 
 user_id, 
 TIMESTAMPDIFF(YEAR, birthday, now()) AS age,
 birthday
FROM profiles 
WHERE TIMESTAMPDIFF(YEAR, birthday, now()) < 10;

-- уберем лишнее
SELECT user_id
FROM profiles 
WHERE TIMESTAMPDIFF(YEAR, birthday, now()) < 10;

-- найдем лайки, которые получили эти пользователи
SELECT * FROM likes
WHERE user_id IN (
	SELECT user_id
	FROM profiles 
	WHERE TIMESTAMPDIFF(YEAR, birthday, now()) < 10
);

-- посчитаем количество лайков
SELECT count(*) FROM likes
WHERE user_id IN (
	SELECT user_id
	FROM profiles 
 	WHERE TIMESTAMPDIFF(YEAR, birthday, now()) < 10
);




/*
 * 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
 */
 
SELECT count(*) AS likes_cnt,
		(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender
FROM likes
GROUP BY gender
ORDER BY likes_cnt DESC
LIMIT 1;


