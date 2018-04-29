DECLARE @execution_id INT = 40310

SELECT * 
FROM SSISDB.catalog.executable_statistics
WHERE execution_id = @execution_id
ORDER BY start_time ASC
	
DECLARE @execution_path NVARCHAR(500) = '\sharedoEtl\Dimensions\DIM_TeamRelationships'

SELECT * 
FROM SSISDB.catalog.event_messages AS em
WHERE execution_path = @execution_path
	AND operation_id = @execution_id
ORDER BY message_time 

DECLARE @message_id INT = 12072850

SELECT * 
FROM SSISDB.catalog.event_message_context
WHERE event_message_id = @message_id