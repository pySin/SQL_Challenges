# Project Planning 3

SET @date_group = 0;
WITH project_planning_window AS
(SELECT PP1.task_id, PP1.Start_Date, PP1.End_date, CASE
	WHEN PP1.Start_Date - 1 = (SELECT Start_Date FROM recall_2024.project_planning AS PP2
						  WHERE PP1.task_id = PP2.task_id + 1)
	THEN @date_group
    ELSE @date_group:=@date_group+1
    END AS consequent_date_group
FROM recall_2024.project_planning AS PP1)
# SELECT task_id, MIN(Start_Date), MAX(End_date), consequent_date_group
SELECT MIN(Start_Date) AS Start_Date_Begin, MAX(End_date) AS End_Date_Finish
FROM project_planning_window
GROUP BY consequent_date_group
ORDER BY DATEDIFF(MIN(Start_Date), MAX(End_date)) DESC, Start_Date_Begin ASC;
