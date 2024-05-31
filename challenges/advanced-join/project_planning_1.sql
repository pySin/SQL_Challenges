# Project Planning 1

WITH ShufflePP AS
(WITH FPP AS
(SELECT PP1.task_id, PP1.Start_Date, PP1.End_Date, CASE
	WHEN End_Date = (SELECT Start_Date FROM recall_2024.project_planning AS PP2
					WHERE PP2.task_id = PP1.task_id + 1)
	     OR Start_Date = (SELECT End_Date FROM recall_2024.project_planning AS PP3
					WHERE PP3.task_id = PP1.task_id - 1)
	THEN 2
    ELSE 4
    END AS p_group
FROM recall_2024.project_planning AS PP1)
SELECT FPP.task_id, FPP.Start_Date, FPP.End_Date, CASE
	WHEN FPP.Start_Date != (SELECT PP4.End_Date FROM recall_2024.project_planning AS PP4
						WHERE FPP.task_id - 1 = PP4.task_id)
	THEN p_group + 1
    ELSE p_group
    END AS group_shuffle
FROM FPP)
SELECT ShufflePP.task_id, ShufflePP.Start_Date, ShufflePP.End_Date, CASE
	WHEN ShufflePP.group_shuffle < (SELECT group_shuffle FROM ShufflePP AS SPP
						 WHERE SPP.task_id = ShufflePP.task_id - 1)
	THEN (SELECT group_shuffle FROM ShufflePP AS SPP
						 WHERE SPP.task_id = ShufflePP.task_id - 1)
	ELSE ShufflePP.group_shuffle
    END AS group_shuffleUP
FROM ShufflePP;
