with answer1 as (
select count(*) as count1, country
from (select distinct customerid, country from practice_tables.retail_data)
group by country
),

answer2 as (
select count(distinct(customerid)) as count2, country
from practice_tables.retail_data
group by country
)

select *
from (
select a1.country,
count1,
count2,
count1 - count2 as diff
from answer1 as a1
left join answer2 as a2
on a1.country = a2.country
)
where diff != 0


select
SUM(
case when customerid is null then 1 else 0 end) as null,
SUM(
case when customerid is not null then 1 else 0 end) as not_null
from practice_tables.retail_data

select country, sum(quantity)
from practice_tables.retail_data rd 
group by rd.country

select country, to_char(invoicedate, 'MM') as month, sum(quantity)
from practice_tables.retail_data rd 
group by country, to_char(invoicedate, 'MM')