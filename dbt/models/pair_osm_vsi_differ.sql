select
  *
from {{ ref('pair_osm_vsi') }} as p
where not exists (
  select 1
  from {{ ref('pair_osm_vsi_match') }} as m
  where (p.osm_id, p.vsi_id) = (m.osm_id, m.vsi_id)
)
