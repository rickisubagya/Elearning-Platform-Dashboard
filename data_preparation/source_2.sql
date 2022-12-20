DELIMITER $$
CREATE PROCEDURE source_2()
BEGIN
WITH student_purchases_mod AS
(
SELECT
	sp.purchase_id,
    sp.student_id,
    sp.purchase_type,
    MAX(sp.date_purchased) AS last_purchased,
    CASE
	WHEN purchase_type = "Annual" THEN DATE_ADD(MAX(sp.date_purchased), INTERVAL 1 YEAR)
    WHEN purchase_type = "Monthly" THEN DATE_ADD(MAX(sp.date_purchased), INTERVAL 1 MONTH)
    ELSE DATE_ADD(MAX(sp.date_purchased), INTERVAL 1 QUARTER)
    END expired_date
FROM
	365_database.365_student_purchases sp
GROUP BY sp.student_id
ORDER BY expired_date
),
student_engagement_mod AS
(
SELECT DISTINCT
	se.student_id
FROM
	365_database.365_student_engagement se
)
SELECT
	sl.*,
    IF(sp.expired_date >= "2022-10-20", "Paid", "Free") AS user_type,
    IFNULL(sp.purchase_type, "Free") AS subscription_type,
    si.date_registered,
    si.student_country,
    IF(se.student_id IS NOT NULL, "Onboarded", "Not-Onboarded") AS onboarded_status
FROM
	365_database.365_student_learning sl
LEFT JOIN
	student_purchases_mod sp ON sl.student_id = sp.student_id
JOIN
	365_database.365_student_info si ON sl.student_id = si.student_id
LEFT JOIN
	student_engagement_mod se ON sl.student_id = se.student_id;
END $$
DELIMITER ;

CALL 365_database.source_2;