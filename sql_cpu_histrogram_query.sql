/* See all XE sessions on the server */
SELECT * FROM sys.[dm_xe_sessions] [dxs] WHERE [dxs].[name] LIKE 'sql_cpu_histrogram%';

/* Derived query to get events details and then present a the summary */
SELECT SYSDATETIME() [DataPointDateTime]
	  ,@@SERVERNAME [server_name]
      ,[xe].[login]
      ,SUM([xe].[batches]) [batches]
      ,SUM([xe].[ms_total]) [cpu_time]
FROM
	(
		SELECT	[xed].[slot_data].[value]('(value)[1]', 'NVARCHAR(128)') [login]
			   ,CONVERT(INT,(RIGHT([t].[name],5))) [ms]
			   ,CONVERT(BIGINT,[xed].[slot_data].[value]('(@count)[1]', 'BIGINT')) [batches]
			   ,CONVERT(INT,(RIGHT([t].[name],5))) * CONVERT(BIGINT,[xed].[slot_data].[value]('(@count)[1]', 'BIGINT')) [ms_total]
			   --,[t].[name] [TimeframeName]
			   --,[t].[XECreatedDateTime]
		FROM	 (	 SELECT [xe].[name]
						  , [xe].[create_time] [XECreatedDateTime]
						  , CAST([xet].[target_data] AS XML) [target_data]
						  , [xe].[dropped_event_count]
					 --,xet.*
					 FROM	[sys].[dm_xe_session_targets] [xet]
					 JOIN	[sys].[dm_xe_sessions] [xe] ON ([xe].[address]=[xet].[event_session_address])
					 WHERE	[xe].[name] LIKE 'sql_cpu_histrogram%'
							AND [xet].[target_name]='histogram') [t]
		CROSS APPLY [t].[target_data].[nodes]('//HistogramTarget/Slot') [xed]([slot_data])
	) xe
GROUP BY [xe].[login]
ORDER BY [cpu_time] DESC;