DELIMITER $$
CREATE PROCEDURE source_3()
BEGIN
SELECT
	ci.course_title,
    SUM(sl.minutes_watched) AS total_minutes_watched_each_course,
    AVG(sl.minutes_watched) AS average_minutes_watched_each_course,
    COUNT(cr.course_rating) AS number_of_ratings_each_course,
    AVG(cr.course_rating) AS average_rating_for_each_course
FROM
	365_database.365_course_info ci
LEFT JOIN
	365_database.365_student_learning sl ON ci.course_id = sl.course_id
LEFT JOIN
	365_database.365_course_ratings cr ON ci.course_id = cr.course_id
GROUP BY ci.course_id;
END$$
DELIMITER ;
