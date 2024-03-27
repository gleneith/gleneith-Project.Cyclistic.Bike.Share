data cleaning and validation 

- checking for any duplicated data in ride(ride_id)
  
select count(ride) as duplication
from `stately-minutia-402911.bikeshare.bikesharing`
group by ride having count(ride) >1


- verifying duplication in ride(ride_id)
  
select ride from `stately-minutia-402911.bikeshare.bikesharing`
where ride = '3.95E+15'


- deletion  of any duplicated ride(ride_id)
  
delete from `stately-minutia-402911.bikeshare.bikesharing`
where ride
in (select ride
    from `stately-minutia-402911.bikeshare.bikesharing`
    group by ride having count(ride)>1)

- count total number of rows
  
select count(ride) as total_rides
from `stately-minutia-402911.bikeshare.bikesharing`


- find null values in data
select *
from `stately-minutia-402911.bikeshare.bikesharing`
where null
