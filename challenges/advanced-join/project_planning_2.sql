# Project Planning 2

SELECT PP1.Start_Date, MIN(PP2.End_Date) Consecutive_End_Date FROM recall_2024.project_planning AS PP1
JOIN recall_2024.project_planning AS PP2
WHERE PP1.Start_Date NOT IN (SELECT PP3.End_Date FROM recall_2024.project_planning AS PP3)
AND PP2.End_Date NOT IN (SELECT PP4.Start_Date FROM recall_2024.project_planning AS PP4)
AND PP1.Start_Date < PP2.End_Date
GROUP BY PP1.Start_Date
ORDER BY DATEDIFF(PP1.Start_Date, Consecutive_End_Date) ASC, PP1.Start_Date ASC;
