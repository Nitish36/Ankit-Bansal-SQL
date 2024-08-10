create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

#SOLUTION

WITH CTE AS
(
		SELECT Team_1 as team_name,
        CASE WHEN Team_1 = Winner then 1 ELSE 0 END AS WIN_FLAG
        FROM icc_world_cup
        UNION ALL
        SELECT Team_2 as team_name,
        CASE WHEN Team_2 = Winner then 1 ELSE 0 END AS WIN_FLAG
        FROM icc_world_cup
)
SELECT team_name,COUNT(1) as no_of_matches_played,SUM(WIN_FLAG) as no_of_matches_won,
count(1)-SUM(WIN_FLAG) as no_of_matches_lost
FROM CTE
GROUP BY team_name
ORDER BY no_of_matches_won DESC;
