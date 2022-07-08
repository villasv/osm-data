with vancouver as (
  select geometry from {{ ref('gdal_administrative_regions') }}
  where name = 'Vancouver'
)
select
  planet_node.id,
  (select value from unnest(all_tags) where key = 'name') as name,
  planet_node.visible,
  planet_node.osm_timestamp,
  planet_node.geometry,
  planet_node.all_tags
from {{ source('osm', 'planet_nodes') }} as planet_node, vancouver
where
  st_dwithin(planet_node.geometry, vancouver.geometry, 0)
  and exists (
  select * from unnest(all_tags)
  where key like '%coffee%' or value like '%coffee%'
    or key like '%cafe%' or value like '%cafe%'
    or key like '%café%' or value like '%café%'
)
