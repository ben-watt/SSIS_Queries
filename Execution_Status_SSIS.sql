;WITH le AS (
	SELECT folder_name, 
		project_name,
		package_name, 
		CASE e.object_type WHEN 20 THEN 'Project' ELSE 'Pacakge' END AS object_type,
		object_id AS project_id, 
		parameter_value, 
		MAX(e.execution_id) AS last_execution_id
	FROM SSISDB.catalog.executions AS e
		LEFT JOIN SSISDB.catalog.execution_parameter_values AS p
			ON p.execution_id = e.execution_id
			AND parameter_name = 'Type'
	GROUP BY folder_name, project_name, package_name, e.object_type, object_id, parameter_value
)

SELECT le.*,
CASE e.status 
	WHEN 1 THEN 'Created'
	WHEN 2 THEN 'Running'
	WHEN 3 THEN 'Cancelled'
	WHEN 4 THEN 'Failed'
	WHEN 5 THEN 'Pending'
	WHEN 6 THEN 'Ended Unexpectedly'
	WHEN 7 THEN 'Succeeded'
	WHEN 8 THEN 'Stopping'
	WHEN 9 THEN 'Completed'
END AS status,
e.start_time,
e.end_time,
DATEDIFF(SS, e.start_time, e.end_time) AS execution_time_seconds
FROM le 
	INNER JOIN SSISDB.catalog.executions AS e
		ON e.execution_id = le.last_execution_id
ORDER BY le.folder_name