
SELECT f.name,
SUM((version_major * 100) +  (version_minor * 10) +  version_build) AS version_hash,
COUNT(pa.package_id) AS package_count
FROM SSISDB.catalog.folders AS f
 INNER JOIN SSISDB.catalog.projects AS pr
	ON pr.folder_id = f.folder_id
 INNER JOIN SSISDB.catalog.packages AS pa
	ON pr.project_id = pa.project_id
GROUP BY f.name

