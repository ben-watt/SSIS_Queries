--=============================
-- Project Details
--=============================

SELECT f.name, 
f.created_time, 
pr.name, 
pr.last_deployed_time, 
pa.name, 
CAST(pa.version_major AS VARCHAR(10)) + '.' +
CAST(pa.version_minor AS VARCHAR(10)) + '.' +  
CAST(pa.version_build AS VARCHAR(10)) AS [version]
FROM SSISDB.catalog.folders AS f
	INNER JOIN SSISDB.catalog.projects AS pr
		ON f.folder_id = pr.folder_id
	INNER JOIN SSISDB.catalog.packages AS pa
		ON pa.project_id = pr.project_id