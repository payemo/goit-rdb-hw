use pandemic;

select
	l.entity,
    l.code,
    round(avg(c.number_rabies), 2) as avg_rabies,
    min(c.number_rabies) as min_rabies,
    max(c.number_rabies) as max_rabies,
    sum(c.number_rabies) as sum_rabies
from locations as l
inner join cases as c
	on c.location_id = l.id
group by l.entity, l.code
order by avg_rabies desc
limit 10;

with cases_dates as (
	select
		c.year,
        curdate() as now,
		str_to_date(concat(c.year, '-01-01'), '%Y-%m-%d') as year_start
	from cases as c
)
select
	cd.*,
    timestampdiff(year, cd.year_start, cd.now) as year_diff
from cases_dates as cd;