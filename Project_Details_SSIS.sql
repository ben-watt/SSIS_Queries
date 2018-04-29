SELECT f.name, 
f.created_time, 
pr.name, 
pr.last_deployed_time, 
pa.name, 
pa.version_major, 
pa.version_minor, 
pa.version_build
FROM SSISDB.catalog.folders AS f
	INNER JOIN SSISDB.catalog.projects AS pr
		ON f.folder_id = pr.folder_id
	INNER JOIN SSISDB.catalog.packages AS pa
		ON pa.project_id = pr.project_id