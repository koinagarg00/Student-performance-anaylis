use project1 ;

select * from `studentsperformance[1]` ;

-- Find the maximun marks in all subjects individualy
SELECT 
    MAX(`math score`)
FROM
    `studentsperformance[1]`;
SELECT 
    MAX(`reading score`)
FROM
    `studentsperformance[1]`;
SELECT 
    MAX(`writing score`)
FROM
    `studentsperformance[1]`;

-- 1 Total number of student
SELECT 
    COUNT(*)
FROM
    `studentsperformance[1]`;

-- 2 Find the average score
SELECT 
    AVG(`math score`) AS avg_math,
    AVG(`reading score`) AS avg_reading,
    AVG(`writing score`) AS avg_writing
FROM
    `studentsperformance[1]`;

--  3 find the average score by gender
SELECT 
    gender,
    AVG(`math score`) AS avg_math,
    AVG(`reading score`) AS avg_reading,
    AVG(`writing score`) AS avg_writing
FROM
    `studentsperformance[1]`
GROUP BY gender;

-- 4 find the average score by lunch type
SELECT 
    lunch,
    AVG(`math score`) AS avg_math,
    AVG(`reading score`) AS avg_reading,
    AVG(`writing score`) AS avg_writing
FROM
    `studentsperformance[1]`
GROUP BY lunch;

-- 5  find the average score by race/ethnicity 
SELECT 
    `race/ethnicity`,
    AVG(`math score`) AS avg_math,
    AVG(`reading score`) AS avg_reading,
    AVG(`writing score`) AS avg_writing
FROM
    `studentsperformance[1]`
GROUP BY `race/ethnicity`
ORDER BY `race/ethnicity`;

-- 6 find the students who scored more than 90 marks
SELECT 
    *
FROM
    `studentsperformance[1]`
WHERE
    `math score` > 90
        AND `writing score` > 90
        AND `reading score` > 90;

-- 7 Make the custome column for students who got marks in all subject above 55 they are pass else fail
SELECT 
    *,
    CASE
        WHEN
            `math score` AND `writing score`
                AND `reading score` >= 55
        THEN
            'PASS'
        ELSE 'FAIL'
    END AS Result
FROM
    `studentsperformance[1]`;

-- 8 find out the total score of every student
SELECT 
    *,
    (`math score` + `writing score` + `reading score`) AS total_score
FROM
    `studentsperformance[1]`;

-- 9 Find the top ten students whose total_score is more than 200
SELECT 
    *,
    (`math score` + `writing score` + `reading score`) AS total_score
FROM
    `studentsperformance[1]`
HAVING total_score > 200
ORDER BY total_score DESC
LIMIT 10;

-- 10 Make the custome column of division for those students whose total_score is more than 250 'first' , 
-- whose total score is more than 200  'second' and whose total score score is more than 150  'third ' else pass
SELECT 
    *,
    (`math score` + `writing score` + `reading score`) AS total_score,
    CASE
        WHEN (`math score` + `writing score` + `reading score`) > 250 THEN 'First'
        WHEN (`math score` + `writing score` + `reading score`) > 200 THEN 'Second'
        WHEN (`math score` + `writing score` + `reading score`) > 150 THEN 'Third'
        ELSE 'Pass'
    END AS division
FROM
    `studentsperformance[1]`;

-- 11 Find the avg score by parentail level education
SELECT 
    `parental level of education`,
    AVG(`math score`) AS avg_math,
    AVG(`reading score`) AS avg_reading,
    AVG(`writing score`) AS avg_writing
FROM
    `studentsperformance[1]`
GROUP BY `parental level of education`;

-- 12 Find the avg of total score
select avg(`math score` + `writing score` + `reading score`) as avg_of_total_score from `studentsperformance[1]`;

-- 13 find the avg score based on test prepration course
SELECT 
    `test preparation course`,
    avg(`math score` + `writing score` + `reading score`) AS total_score
FROM
    `studentsperformance[1]`
GROUP BY `test preparation course`;

-- 14 Find the count od student by lunch type
SELECT 
    lunch, COUNT(*) AS total_count
FROM
    `studentsperformance[1]`
GROUP BY lunch;

-- 15 Find the avg total score based on lunch type;
SELECT 
    `lunch`,
    avg(`math score` + `writing score` + `reading score`) AS total_score
FROM
    `studentsperformance[1]`
GROUP BY `lunch`;

-- 16 Find the students who got full marks in all subjects
SELECT 
    *
FROM
    `studentsperformance[1]`
WHERE
    `math score` = 100
        AND `writing score` = 100
        AND `reading score` = 100;

-- 17 Find the students who got full marks in any subject
SELECT 
    *
FROM
    `studentsperformance[1]`
WHERE
    `math score` = 100
        OR `writing score` = 100
        OR `reading score` = 100;

-- 18  Rank students by total score
select *,(`math score` + `writing score` + `reading score`) AS total_score,rank()over(order by (`math score` + `writing score` + `reading score`)desc) as overall_rank from `studentsperformance[1]`;

-- Same for dense rank
select *,(`math score` + `writing score` + `reading score`) AS total_score,dense_rank()over(order by (`math score` + `writing score` + `reading score`)desc) as overall_rank from `studentsperformance[1]`;

-- 19 Rank student within gender
select *,(`math score` + `writing score` + `reading score`) AS total_score,rank()over(partition by gender order by (`math score` + `writing score` + `reading score`)desc) as overall_rank from `studentsperformance[1]`;

-- 20 Find the total_score which is more than the avg total score 
SELECT 
    *,
    (`math score` + `writing score` + `reading score`) AS total_score
FROM
    `studentsperformance[1]`
WHERE
    (`math score` + `writing score` + `reading score`) > (SELECT 
            AVG(`math score` + `writing score` + `reading score`)
        FROM
            `studentsperformance[1]`)
ORDER BY total_score DESC;
 
 -- 21 







