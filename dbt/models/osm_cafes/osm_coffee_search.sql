select *
from {{ source('osm', 'planet_nodes') }}
where exists (
  select * from unnest(all_tags)
  where key like '%coffee%' or value like '%coffee%'
    or key like '%cafe%' or value like '%cafe%'
    or key like '%café%' or value like '%café%'
)
