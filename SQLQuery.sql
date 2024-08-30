-- UNION will remove duplicate rows

select *  from [dbo].[bike_share_yr_0]
union
select *  from [dbo].[bike_share_yr_1]

-- UNION ALL gets back everything => no duplicate rows!
select *  from [dbo].[bike_share_yr_0]
union all
select *  from [dbo].[bike_share_yr_1]

select * from cost_table

-- Use CTE

with cte as(
select *  from [dbo].[bike_share_yr_0]
union all
select *  from [dbo].[bike_share_yr_1]
)

select * from cte a
left join cost_table b
on a.yr=b.yr

-- only indicate columns needd
select
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders*price as revenue,
riders*price - COGS as profit
FROM cte a
left join cost_table b
on a.yr=b.yr
