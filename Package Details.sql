--===================================
-- Packages
--===================================

SELECT f.name, 
f.created_time, 
pr.name,
SUM((version_major * 100) +  (version_minor * 10) +  version_build) AS version_hash
FROM SSISDB.catalog.folders AS f
	INNER JOIN SSISDB.catalog.projects AS pr
		ON f.folder_id = pr.folder_id
	INNER JOIN SSISDB.catalog.packages AS pa
		ON pa.project_id = pr.project_id
GROUP BY f.name, 
f.created_time, 
pr.name




-- Folder + Status + Version
-- Folder -- Package + Status + Version
-- Folder -- Package 
