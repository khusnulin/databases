/* Show Regions Revenue  */
SELECT Telephone3, SUM(Revenue) as total_rev
from [_MSCRM].[dbo].[AccountBase]
group by Telephone3
order by total_rev desc
