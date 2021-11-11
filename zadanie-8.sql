-- 1. Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
 -- возьмём to_user_id = 1
SELECT u.id AS fan_id,
u.firstname, u.lastname,
count(m.id) AS messages
FROM messages m JOIN users u ON m.from_user_id = u.id
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY messages DESC
LIMIT 1;


-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
SELECT count(l.id) AS likes_count
FROM likes l LEFT JOIN profiles p
ON l.user_id = p.user_id
WHERE TIMESTAMPDIFF(YEAR, p.birthday, now()) < 10;


-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT p.gender, COUNT(l.id) AS likes_count
FROM likes l INNER JOIN profiles p
  ON l.user_id = p.user_id
GROUP BY p.gender
ORDER BY likes_count DESC
LIMIT 1;