SELECT
    *
FROM
    {{ source('citibike', 'station_status') }}