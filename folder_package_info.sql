SELECT f.name,
pr.name AS project_name,
pa.name AS package_name,
last_deployed_time AS last_deployed,
deployed_by_name,
CONCAT(
version_major, '.',
version_minor, '.',
version_build) AS package_version
FROM SSISDB.catalog.folders AS f
 INNER JOIN SSISDB.catalog.projects AS pr
	ON pr.folder_id = f.folder_id
 INNER JOIN SSISDB.catalog.packages AS pa
	ON pr.project_id = pa.project_id
ORDER BY f.name, pr.name, pa.name