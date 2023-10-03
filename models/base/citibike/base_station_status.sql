with stg_station_status as (
    select * from {{ ref('stg_station_status') }}
)
select
    to_timestamp(v:last_updated) as timestamp,
    s.value:station_id as station_id,
    s.value:num_docks_disabled as num_docks_disabled,
    s.value:num_docks_available as num_docks_available,
    s.value:is_renting as is_renting,
    s.value:is_installed as is_installed,
    s.value:num_bikes_available as num_bikes_available,
    s.value:num_ebikes_available as num_ebikes_available,
    s.value:is_returning as is_returning,
    s.value:num_bikes_disabled as num_bikes_disabled,
    s.value:legacy_id as legacy_id,
    s.value:last_reported as last_reported,
    s.value:eightd_has_available_keys as eightd_has_available_keys
from
    stg_station_status,
    table(flatten(v:data.stations)) s
