with stg_station_info as (
    select * from {{ ref('stg_station_info') }}
)
select
    s.value:has_kiosk as has_kiosk, 
    s.value:short_name as short_name,
    s.value:lon as lon,
    s.value:lat as lat,
    s.value:external_id as external_id,
    s.value:station_type as station_type,
    s.value:capacity as capacity,
    s.value:electric_bike_surcharge_waiver as electric_bike_surcharge_waiver,
    s.value:eightd_has_key_dispenser as eightd_has_key_dispenser,
    s.value:station_id as station_id,
    s.value:name as name
from
    stg_station_info,
    table(flatten(v:data.stations)) s