/*	
	This script will deploy 18 extended events that target histograms registering CPU time
	Each extended event covers a different CPU use timeframe that when registered, increments its histogram
	
	The actual value that will be used to measure the range will be the middle point of the timeframe
	For example, for [sql_cpu_histrogram_LT11_00005], >=1ms <10ms the assigned value will be 5ms

*/

/* Greater or equal to 1 millisecond and less than or equal to 10 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_LT11_00005]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(999) AND [cpu_time]<(10001) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(999) AND [cpu_time]<(10001) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_LT11_00005] ON SERVER STATE=START;
GO

/* Greater than 10 milliseconds and less than 51 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT10LT51_00030] 
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(10000) AND [cpu_time]<(50001) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(10000) AND [cpu_time]<(50001) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT10LT51_00030] ON SERVER STATE=START;
GO

/* Greater than 50 milliseconds and less than 101 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT50LT101_00075] 
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(50000) AND [cpu_time]<(101000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(50000) AND [cpu_time]<(101000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT50LT101_00075] ON SERVER STATE=START;
GO

/* Greater than 100 milliseconds and less than 201 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT100LT201_00150]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(100000) AND [cpu_time]<(201000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(100000) AND [cpu_time]<(201000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT100LT201_00150] ON SERVER STATE=START;
GO

/* Greater than 200 milliseconds and less than 351 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT200LT351_00275] 
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(200000) AND [cpu_time]<(350000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(200000) AND [cpu_time]<(350000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT200LT351_00275] ON SERVER STATE=START;
GO

/* Greater than 350 milliseconds and less than 501 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT350LT501_00425] 
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(350000) AND [cpu_time]<(501000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(350000) AND [cpu_time]<(501000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT350LT501_00425] ON SERVER STATE=START;
GO

/* Greater than 500 milliseconds and less than 751 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT500LT751_00625] 
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(500000) AND [cpu_time]<(751000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(500000) AND [cpu_time]<(751000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT500LT751_00625] ON SERVER STATE=START;
GO

/* Greater than 750 milliseconds and less than 1001 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT750LT1001_00875] 
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(750000) AND [cpu_time]<(1001000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(750000) AND [cpu_time]<(1001000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT750LT1001_00875] ON SERVER STATE=START;
GO


/* Greater than 1000 milliseconds and less than 1501 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT1000LT1501_01250]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(1000000) AND [cpu_time]<(1501000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(1000000) AND [cpu_time]<(1501000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT1000LT1501_01250] ON SERVER STATE=START;
GO


/* Greater than 1500 milliseconds and less than 2001 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT1500LT2001_01750]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(1500000) AND [cpu_time]<(2001000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(1500000) AND [cpu_time]<(2001000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT1500LT2001_01750] ON SERVER STATE=START;
GO

/* Greater than 2000 milliseconds and less than 3001 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT2000LT3001_02500]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(2000000) AND [cpu_time]<(3001000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(2000000) AND [cpu_time]<(3001000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT2000LT3001_02500] ON SERVER STATE=START;
GO

/* Greater than 3000 milliseconds and less than 5001 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT3000LT5001_04000]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(3000000) AND [cpu_time]<(5001000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(3000000) AND [cpu_time]<(5001000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT3000LT5001_04000] ON SERVER STATE=START;
GO

/* Greater than 5000 milliseconds and less than 7501 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT5000LT7501_06250]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(5000000) AND [cpu_time]<(7501000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(5000000) AND [cpu_time]<(7501000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT5000LT7501_06250] ON SERVER STATE=START;
GO

/* Greater than 7500 milliseconds and less than 10001 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT7500LT10001_08750]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(7500000) AND [cpu_time]<(10001000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(7500000) AND [cpu_time]<(10001000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT7500LT10001_08750] ON SERVER STATE=START;
GO

/* Greater than 10000 milliseconds and less than 15001 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT10000LT15001_12500]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(10000000) AND [cpu_time]<(15001000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(10000000) AND [cpu_time]<(15001000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT10000LT15001_12500] ON SERVER STATE=START;
GO

/* Greater than 15000 milliseconds and less than 20001 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT15000LT20001_17500]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(15000000) AND [cpu_time]<(20001000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(15000000) AND [cpu_time]<(20001000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT15000LT20001_17500] ON SERVER STATE=START;
GO

/* Greater than 20000 milliseconds and less than 30001 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT20000LT30001_25000]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(20000000) AND [cpu_time]<(30001000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(20000000) AND [cpu_time]<(30001000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT20000LT30001_25000] ON SERVER STATE=START;
GO

/* Greater than 30000 milliseconds */
CREATE EVENT SESSION [sql_cpu_histrogram_GT30000_30000]
ON SERVER
	ADD EVENT sqlserver.sql_batch_completed
		(
		 SET collect_batch_text=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(30000000) AND (is_system=0) )
		 )
	,ADD EVENT sqlserver.rpc_completed
		(
		 SET collect_statement=(0)
   		 ACTION (sqlserver.is_system,sqlserver.server_principal_name)
		 WHERE ( [cpu_time]>(30000000) AND (is_system=0) )
		 )
	ADD TARGET package0.histogram
		(SET  slots= (128)
			, source=N'sqlserver.server_principal_name'
			, source_type= (1)
		 )
WITH (MAX_MEMORY=8MB
	, EVENT_RETENTION_MODE=ALLOW_MULTIPLE_EVENT_LOSS
	, STARTUP_STATE=OFF);
GO
ALTER EVENT SESSION [sql_cpu_histrogram_GT30000_30000] ON SERVER STATE=START;
GO

/*
--DROP EVENT SESSION [sql_cpu_histrogram_0_00000] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_LT11_00005] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT10LT51_00030] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT50LT101_00075] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT100LT201_00150] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT200LT351_00275] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT350LT501_00425] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT500LT751_00625] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT750LT1001_00875] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT1000LT1501_01250] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT1500LT2001_01750] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT2000LT3001_02500] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT3000LT5001_04000] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT5000LT7501_06250] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT7500LT10001_08750] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT10000LT15001_12500] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT15000LT20001_17500] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT20000LT30001_25000] ON SERVER;
DROP EVENT SESSION [sql_cpu_histrogram_GT30000_30000] ON SERVER;
*/

/* See all XE sessions on the server */
SELECT * FROM sys.[dm_xe_sessions] [dxs] WHERE [name] LIKE 'sql_cpu_histrogram%'