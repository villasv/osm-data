with vancouver as (
  select geometry from `osm_walkability.gdal_administrative_regions`
  where name = 'Vancouver'
)
select
  planet_node.*
from {{ source('osm', 'planet_nodes') }} as planet_node, vancouver
where
  ST_DWithin(vancouver.geometry, planet_node.geometry, 0)
