# Data Dictionary

| **Table**         | **Number of Records** | **Table Description**                 | **Column**      | **Column Description**                 |
| :---------------  | --------------------: | :------------------------------------ | :------------   | :-----------------------------------   |
| 365_student_info  | 35,230                | Stores information about the students | student_id      | The unique identification of a student |
|                        |                       |                                       | student_country | The country a student has filled in    |
|                        |                       |                                       | date_registered | The student's registration date        |
| 365_student_purchases  | 3,041                | Stores information about the student's subcription purchases | purchase_id      | The unique number of each subscription purchased |
|                        |                       |                                       | student_id | The unique identification of a student |
|                        |                       |                                       | purchase_type | The type of subscription a student has purchased, which can be: |
|                        |                       |                                       |               | 0 - Monthly |
|                        |                       |                                       |               | 1 - Quarterly |
|                        |                       |                                       |               | 2 - Annual |
|                        |                       |                                       | date_purchased | The date of purchase |
| 365_student_learning  | 64,535                | Stores information about the courses a student has watched, how much of each course they have watched and the date watched | student_id      | The unique identification of a student |
|                        |                       |                                       | course_id | The unique identification of a course |
|                        |                       |                                       | minutes_watched | The minutes watched by the given student, on the given date, of the given course |
|                        |                       |                                       | date_watched | The date student watched the course |
 365_course_info  | 46                | Stores information about the courses on the platform | course_id      | The unique identification of course |
|                        |                       |                                       | course_title | The title of a course |
| 365_course_ratings  | 2,500                | Stores information about the ratings each course has received | student_id      | The unique identification of a student |
|                        |                       |                                       | course_id | The unique identification of a course |
|                        |                       |                                       | course_rating | The rating a student has given |
|                        |                       |                                       | date_rated | The date the student rated the course |
| 365_student_quizzes  | 147,029                | Stores information about the students' performance on the quizzes | student_id      | The unique identification of a student |
|                        |                       |                                       | quiz_id | The unique identification of a quiz |
|                        |                       |                                       | question_id | The unique identification of a question |
|                        |                       |                                       | answer_id | The unique identification of the answer a student has marked as correct |
| 365_quiz_info  | 4,741                | Stores information about the quizzes on the platform | quiz_id      | The unique identification of a quiz |
|                        |                       |                                       | answer_correct | whether the answer to the quiz is correct or not. The notation is as follows: |
|                        |                       |                                       |  | n - no (incorrect) |
|                        |                       |                                       |  | y - yes (correct) |
|                        |                       |                                       | question_id | The unique identification of a quiz |
|                        |                       |                                       | answer_id | The unique identification of the answer a student has marked as correct |
| 365_student_exams  | 34,030                | Stores information about the students' performance on the exams | exam_attempt_id      | The unique identification of any exam any student has taken |
|                        |                       |                                       | student_id | The unique identification of a student |
|                        |                       |                                       | exam_id | The unique identification of an exam |
|                        |                       |                                       | exam_result | The exam result the student has received (in percentages) |
|                        |                       |                                       | exam_completion_time | The time it took the student completed the exam in minutes |
|                        |                       |                                       | date_exam_completed | The date the student completed the exam |
| 365_exam_info  | 156                | Stores information about the exams available on the platform | exam_id      | The unique identification of an exam |
|                        |                       |                                       | exam_category | The category of the exam, which can be: |
|                        |                       |                                       |  | 1 - Course exam |
|                        |                       |                                       |  | 2 - Practice exam  |
|                        |                       |                                       |  | 4 - Career track exam |
|                        |                       |                                       | exam_duration | The maximum time allowed to complete the exam (in minutes) |
| 365_student_engagement  | 65,371                | Stores information about the students' daily engagement with the platform | engagement_id      | The unique number of each engagement, which can be: |
|                        |                       |                                       |  | - Attempting a quiz |
|                        |                       |                                       |  | - Attempting an exam |
|                        |                       |                                       |  | - Watching a lesson  |
|                        |                       |                                       | student_id | The unique identification of a student |
|                        |                       |                                       | engagemenet_quizzes | whether a student has attempted a quiz on the given date: |
|                        |                       |                                       |  | 0 - no |
|                        |                       |                                       |  | 1 - yes |
|                        |                       ||engagemenet_exams | whether a student has attempted a exam on the given date: |
|                        |                       |                                       |  | 0 - no |
|                        |                       |                                       |  | 1 - yes |
| | | |engagemenet_lessons | whether a student has watched a video on the given date: |
|                        |                       |                                       |  | 0 - no |
|                        |                       |                                       |  | 1 - yes |
| | | | date_engaged | The date of the engagement |
| 365_student_hub_questions  | 827                | Stores information about the questions asked by students in the Q&A hub | hub_question_id      | The unique identification of a question in the Q&A hub |
|                        |                       |                                       | student_id | The unique identification of a student |
|                        |                       |                                       | date_question_asked | The date the question has been asked |