
CREATE PROCEDURE [etl].[uspInsertDimDate]
AS
BEGIN

	DROP TABLE IF EXISTS [etl].[DimDate]
	CREATE TABLE	[etl].[DimDate]
		(	[DateKey] INT primary key, 
			[Date] DATE,
			[DayOfMonth] VARCHAR(2), 
			[DaySuffix] VARCHAR(4), 
			[DayName] VARCHAR(9), 
			[DayShortName] VARCHAR(3),
			[DayOfWeek] CHAR(1),
			[IsWeekday] BIT,
			[WeekStartDate] DATE,
			[WeekStartDateShortName] VARCHAR(50),
			[WeekStartDateSortKey] INT,
			[WeekOfMonth] VARCHAR(1),
			[WeekOfQuarter] VARCHAR(2), 
			[WeekOfYear] VARCHAR(2),
			[Month] VARCHAR(2), 
			[MonthName] VARCHAR(9),
			[MonthShortName] VARCHAR(3),
			[MonthStartDate] DATE,
			[MonthStartDateShortName] VARCHAR(50),
			[MonthStartDateSortKey] INT,
			[MonthEndDate] DATE,
			[MonthEndDateShortName] VARCHAR(50),
			[MonthEndDateSortKey] INT,
			[MonthOfQuarter] VARCHAR(2),
			[Quarter] CHAR(1),
			[QuarterName] VARCHAR(9),
			[QuarterStartDate] DATE,
			[QuarterStartDateShortName] VARCHAR(50),
			[QuarterStartDateSortKey] INT,
			[QuarterEndDate] DATE,
			[QuarterEndDateShortName] VARCHAR(50),
			[QuarterEndDateSortKey] INT,
			[Year] CHAR(4),
			[MonthYearName] CHAR(10), 
			[YYYY-WW] CHAR(7),
			[YearStartDate] DATE,
			[YearStartDateShortName] VARCHAR(50),
			[YearStartDateSortKey] INT,
			[YearEndDate] DATE,
			[YearEndDateShortName] VARCHAR(50),
			[YearEndDateSortKey] INT,
			[IsHolidayUSA] BIT,
			[HolidayUSA] VARCHAR(50),
			[IsWorkingdayUSA] BIT
		)

	DECLARE @StartDate DATETIME = '01/01/2000' 
	DECLARE @EndDate DATETIME = '01/01/2050' 

	DECLARE
		@WeekOfMonth INT,
		@CurrentYear INT,
		@CurrentMonth INT,
		@CurrentQuarter INT


	DECLARE @CurrentDate AS DATETIME = @StartDate
	SET @CurrentMonth = DATEPART(MM, @CurrentDate)
	SET @CurrentYear = DATEPART(YY, @CurrentDate)
	SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)

	WHILE @CurrentDate < @EndDate
	BEGIN
	
		INSERT INTO [etl].[DimDate]
		SELECT
			CONVERT (char(8),@CurrentDate,112) AS DateKey
			,CAST(@CurrentDate AS Date) AS Date
			,DATEPART(DD, @CurrentDate) AS DayOfMonth
			,CASE 
				WHEN DATEPART(DD,@CurrentDate) IN (11,12,13) 
				THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th'
				WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 1 
				THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'st'
				WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 2 
				THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'nd'
				WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 3 
				THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'rd'
				ELSE CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th' 
			END AS DaySuffix
		
			,DATENAME(DW, @CurrentDate) AS DayName
			,CAST(DATENAME(DW, @CurrentDate) as varchar(3)) AS DayShortName
			,DATEPART(DW, @CurrentDate) AS DayOfWeek
		
			,CASE WHEN DATEPART(DW, @CurrentDate) BETWEEN 1 AND 5 THEN 1
				ELSE 0
			END AS IsWeekday

			,dateadd(day,1-(DATEPART(DW, @CurrentDate)),@CurrentDate) AS WeekStartDate
			,CONCAT(LEFT(CONVERT(VARCHAR(100),  dateadd(day,1-(DATEPART(DW, @CurrentDate)),@CurrentDate), 107),8) , RIGHT(CONVERT(VARCHAR(100),  dateadd(day,1-(DATEPART(DW, @CurrentDate)),@CurrentDate), 107),2)) AS WeekStartDateShortName
			,CONVERT(INT, NULL) AS WeekStartDateSortKey
				
			,DATEPART(WW, @CurrentDate) + 1 - DATEPART(WW, CONVERT(VARCHAR, DATEPART(MM, @CurrentDate)) + '/1/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS WeekOfMonth
			,(DATEDIFF(DD, DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0), @CurrentDate) / 7) + 1 AS WeekOfQuarter
			,RIGHT(CONCAT('00', DATEPART(week, @CurrentDate)), 2) AS WeekOfYear
		
			,DATEPART(MM, @CurrentDate) AS Month
			,DATENAME(MM, @CurrentDate) AS MonthName
			,CAST(DATENAME(MM, @CurrentDate) AS VARCHAR(3)) AS MonthShortName

			,CAST(DATEADD(month, DATEDIFF(month, 0, @CurrentDate), 0) AS DATE) AS MonthStartDate
			,CONVERT(VARCHAR(100), DATEADD(month, DATEDIFF(month, 0, @CurrentDate), 0), 107) AS MonthStartDateShortName
			,CONVERT(INT, NULL) AS MonthStartDateSortKey

			,EOMONTH(@CurrentDate) AS MonthEndDate
			,CONVERT(VARCHAR(100),EOMONTH(@CurrentDate),107) AS MonthEndDateShortName
			,CONVERT(INT, NULL) AS MonthEndDateSortKey

			,CASE
				WHEN DATEPART(MM, @CurrentDate) IN (1, 4, 7, 10) THEN 1
				WHEN DATEPART(MM, @CurrentDate) IN (2, 5, 8, 11) THEN 2
				WHEN DATEPART(MM, @CurrentDate) IN (3, 6, 9, 12) THEN 3
				END AS MonthOfQuarter
			,DATEPART(QQ, @CurrentDate) AS Quarter
			,CASE DATEPART(QQ, @CurrentDate)
				WHEN 1 THEN 'Q1'
				WHEN 2 THEN 'Q2'
				WHEN 3 THEN 'Q3'
				WHEN 4 THEN 'Q4'
				END AS QuarterName

			,DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0) AS QuarterStartDate
			,CONVERT(VARCHAR(100),DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0),107) AS QuarterStartDateShortName
			,CONVERT(INT, NULL) AS QuarterStartDateSortKey

			,DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1) AS QuarterEndDate
			,CONVERT(VARCHAR(100),DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1),107) As QuarterEndDateShortName
			,CONVERT(INT, NULL) AS QuarterEndDateSortKey

			,DATEPART(YEAR, @CurrentDate) AS Year
			,LEFT(DATENAME(MM, @CurrentDate), 3) + '-' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) AS MonthYearName
			,NULL AS [YYYY-WW]
		
			,NULL AS YearStartDate
			,NULL AS YearStartDateShortName
			,CONVERT(INT, NULL) AS YearStartDateSortKey

			,NULL AS YearEndDate
			,NULL AS YearEndDateShortName
			,CONVERT(INT, NULL) AS YearEndDateSortKey

			,NULL AS IsHolidayUSA
			,NULL AS HolidayUSA
			,NULL AS IsWorkingdayUSA

		SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
	END

	
	UPDATE DD 
	SET DD.IsHolidayUSA= CASE WHEN DD.DATE= CH.HolidayDate THEN 1 ELSE 0 END ,
		DD.HolidayUSA=CH.HolidayDescription,
		DD.IsWorkingdayUSA=CASE WHEN DD.DATE = CH.HolidayDate OR DD.IsWeekday = 0 THEN 0 ELSE 1 END
		FROM [etl].[DimDate] DD
		LEFT OUTER JOIN [dbo].[CountryHoliday] CH
		ON DD.DATE= CH.HolidayDate;
		
	UPDATE DD
	SET DD.WeekStartDateSortKey=DS.WeekStartDateSortKey
	    ,DD.MonthStartDateSortKey=DS.MonthStartDateSortKey
		,DD.MonthEndDateSortKey=DS.MonthEndDateSortKey
		,DD.QuarterStartDateSortKey=DS.QuarterStartDateSortKey
		,DD.QuarterEndDateSortKey=DS.QuarterEndDateSortKey
		,DD.[YYYY-WW] = CONCAT(DS.[Year] , '-' , DS.[WeekOfYear])
		,DD.YearStartDate = '01/01/' + DS.[Year]
		,DD.YearStartDateShortName=CONVERT(VARCHAR(50),'01/01/' + DS.[Year],107)
		,DD.YearStartDateSortKey=DS.YearStartDateSortKey
		,DD.YearEndDate = '12/31/' + DS.[Year]
		,DD.YearEndDateShortName=CONVERT(VARCHAR(50),'12/31/' + DS.[Year],107)
		,DD.YearEndDateSortKey=DS.YearEndDateSortKey

	FROM [etl].[DimDate] DD
		INNER JOIN 
		(
			SELECT DateKey
				,[Year]
				,[Month]
				,[WeekOfYear]
				,DENSE_RANK() OVER(ORDER BY WeekStartDate) AS WeekStartDateSortKey
				,DENSE_RANK() OVER(ORDER BY MonthStartDate) AS MonthStartDateSortKey
				,DENSE_RANK() OVER(ORDER BY MonthEndDate) AS MonthEndDateSortKey
				,DENSE_RANK() OVER(ORDER BY QuarterStartDate) AS QuarterStartDateSortKey
				,DENSE_RANK() OVER(ORDER BY QuarterEndDate) AS QuarterEndDateSortKey
				,DENSE_RANK() OVER(ORDER BY [Year]) AS YearStartDateSortKey
				,DENSE_RANK() OVER(ORDER BY [Year]) AS YearEndDateSortKey
			FROM [etl].[DimDate]
		) DS
			ON DD.DateKey=DS.DateKey
		
END
