select
  *
from unnest([
  struct<
    id integer,
    geo_point_2d string
  >
  --
  (2390, '49.28209661058832, -123.11847795890671')
]) as location_fix
