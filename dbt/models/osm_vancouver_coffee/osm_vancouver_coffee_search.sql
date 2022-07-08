select *
from {{ ref('osm_vancouver') }}
where exists (
  select * from unnest(all_tags)
  where key like '%coffee%' or value like '%coffee%'
    or key like '%cafe%' or value like '%cafe%'
    or key like '%café%' or value like '%café%'
)
