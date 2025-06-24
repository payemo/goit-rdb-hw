use pandemic;

select
	year,
    year_diff(year) as year_diff
from cases;