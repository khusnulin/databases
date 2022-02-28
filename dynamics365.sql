/* Show Regions Revenue  */
SELECT Telephone3, SUM(Revenue) as total_rev
from [_MSCRM].[dbo].[AccountBase]
group by Telephone3
order by total_rev desc


/*   Update Industry      */
Update [_MSCRM].[dbo].[AccountBase]
SET IndustryCode=100000062
		Where SIC LIKE '62.%' AND IndustryCode IS NULL;
