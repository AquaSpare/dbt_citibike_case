SELECT
    *
FROM
    {{ source('citibike', 'station_info') }}