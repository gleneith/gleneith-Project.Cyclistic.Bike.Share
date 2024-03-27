data analysis

- count membership total(casuals and members)
  
select membership,count(membership) as membership_total
from `stately-minutia-402911.bikeshare.bikesharing`
group by membership

- count type of rides total
  
select type_of_ride, count(type_of_ride) as type_of_ride_total
from `stately-minutia-402911.bikeshare.bikesharing`
group by type_of_ride
order by type_of_ride_total desc

- count preferred type of rides by membership
  
select membership,  type_of_ride, count(type_of_ride) as type_of_ride_total
from `stately-minutia-402911.bikeshare.bikesharing`
group by type_of_ride,membership
order by type_of_ride_total desc

- count rides per day
  
select day, count(type_of_ride) as rides_per_day
from `stately-minutia-402911.bikeshare.bikesharing`
group by day
order by rides_per_day desc

- count rides per day with casual(membership)
  
select day, count(type_of_ride) as rides_per_day
from `stately-minutia-402911.bikeshare.bikesharing`
where membership = 'casual'
group by day
order by rides_per_day desc

- count rides per day with member(membership)
  
select day, count(type_of_ride) as rides_per_day
from `stately-minutia-402911.bikeshare.bikesharing`
where membership = 'member'
group by day
order by rides_per_day desc

- count rides per month
  
select month, count(type_of_ride) as rides_per_month
from `stately-minutia-402911.bikeshare.bikesharing`
group by month
order by rides_per_month desc

- count rides per month with casual(membership)
  
select month, count(type_of_ride) as rides_per_month
from `stately-minutia-402911.bikeshare.bikesharing`
where membership = 'casual'
group by month
order by rides_per_month desc

- count rides per month with member(membership)
  
select month, count(type_of_ride) as rides_per_month
from `stately-minutia-402911.bikeshare.bikesharing`
where membership = 'member'
group by month
order by rides_per_month desc

- count rides per season 
  
select season, count(type_of_ride) as rides_per_month
from `stately-minutia-402911.bikeshare.bikesharing`
group by season
order by rides_per_month desc

- average duration 
  
select
count(ride) as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_duration
from `stately-minutia-402911.bikeshare.bikesharing`


- average duration per membership
  
select
count(ride) as ride_count,membership,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_duration
from `stately-minutia-402911.bikeshare.bikesharing`
group by membership


- average ride duration per month per membership
  
select membership,month,
count(ride) as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_duration
from `stately-minutia-402911.bikeshare.bikesharing`
group by membership,month
order by membership

- average ride duration per day of the week by  membership
  
select membership,day,
count(ride) as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_duration
from `stately-minutia-402911.bikeshare.bikesharing`
group by membership,day
order by membership

- average ride duration per season
  
select season,
count(ride) as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_duration
from `stately-minutia-402911.bikeshare.bikesharing`
group by season
order by avg_duration desc

- average rides duration with the same name for started and ended station name 
  
select  
start_station_name,
end_station_name,
count(ride)as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_ride_duration
from `stately-minutia-402911.bikeshare.bikesharing`
where start_station_name = end_station_name
group by start_station_name, end_station_name

- average rides duration for stations with the same name for started and ended station name by membership (casual)
  
select
start_station_name,
end_station_name,
count(ride)as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_ride_duration
from `stately-minutia-402911.bikeshare.bikesharing`
where membership = 'casual'
and start_station_name = end_station_name
group by start_station_name, end_station_name

- average rides duration for stations with the same name for started and ended station name by membership (member)
  
select
start_station_name,
end_station_name,
count(ride)as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_ride_duration
from `stately-minutia-402911.bikeshare.bikesharing`
where membership = 'member'
and start_station_name = end_station_name
group by start_station_name, end_station_name

- average rides duration with stations with different started and ended name by membership (casual)
  
select
start_station_name,
end_station_name,
count(ride)as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_ride_duration
from `stately-minutia-402911.bikeshare.bikesharing`
where membership = 'casual'
and start_station_name != end_station_name
group by start_station_name, end_station_name

- average rides duration with stations with different started and ended name by membership (member)
  
select
start_station_name,
end_station_name,
count(ride)as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_ride_duration
from `stately-minutia-402911.bikeshare.bikesharing`
where membership = 'member'
and start_station_name != end_station_name
group by start_station_name, end_station_name

- ride count  and average rides during weekdays and weekend for membership( casual and members)
  
select membership,
case
when day in ('monday', 'tuesday','wednesday', 'thursday', 'friday') then 'weekday'
when day in ('saturday', 'sunday') then 'weekend'
else 'unknown'
end as weekday_or_weekend,
count(ride) as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_ride_duration
from `stately-minutia-402911.bikeshare.bikesharing`
group by membership,weekday_or_weekend
order by membership

- ride count and average rides from start  to  end station during the weekdays and weekends for causal(membership)
  
select
start_station_name,
end_station_name,
case
when day in ('monday', 'tuesday','wednesday', 'thursday', 'friday') then 'weekday'
when day in ('saturday', 'sunday') then 'weekend'
else 'unknown'
end as weekday_or_weekend,
count(ride) as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_ride_duration
from `stately-minutia-402911.bikeshare.bikesharing`
where  membership = 'casual'
group by start_station_name,end_station_name,weekday_or_weekend

- ride count and average rides from start  to  end station during the weekdays and weekends for memberl(membership)
  
select
start_station_name,
end_station_name,
case
when day in ('monday', 'tuesday','wednesday', 'thursday', 'friday') then 'weekday'
when day in ('saturday', 'sunday') then 'weekend'
else 'unknown'
end as weekday_or_weekend,
count(ride) as ride_count,
round(avg(time_diff(ended_time,started_time,minute)),0) as avg_ride_duration
from `stately-minutia-402911.bikeshare.bikesharing`
where  membership = 'member'
group by start_station_name,end_station_name,weekday_or_weekend
