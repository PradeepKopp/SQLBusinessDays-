

/*write a user defined functions  which takes 2 input parameters of DATE data type. 
The function should return no of business days between the 2 dates. */


CREATE FUNCTION dbo.GetBusinessDaysCount(@StartDate DATE, @EndDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @BusinessDays INT = 0
    DECLARE @CurrentDate DATE = @StartDate

    WHILE @CurrentDate <= @EndDate
    BEGIN
        -- Check if the current day is a weekday (Monday to Friday)
        IF DATEPART(WEEKDAY, @CurrentDate) BETWEEN 2 AND 6
        BEGIN
            SET @BusinessDays = @BusinessDays + 1
        END

        -- Move to the next day
        SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
    END

    RETURN @BusinessDays
END


SELECT dbo.GetBusinessDaysCount('2023-10-16', '2023-10-22') AS BusinessDaysCount;
