DELIMITER $$
CREATE PROCEDURE source_1()
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
)
SELECT DISTINCT
	si.*,
    IF(se.student_id IS NOT NULL, "Onboarded", "Not-Onboarded") AS onboarded_status,
    IF(sp.expired_date >= "2022-10-20", "Paid", "Free") AS user_type,
    IFNULL(sp.purchase_type, "Free") AS subscription_type
FROM
	365_database.365_student_info si
LEFT JOIN
	365_database.365_student_engagement se ON si.student_id = se.student_id
LEFT JOIN
	student_purchases_mod sp ON si.student_id = sp.student_id;
END $$
DELIMITER ;

CALL 365_database.source_1;