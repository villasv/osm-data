select
  *
from
  {{ ref('pair_osm_vsi_10m') }}
where
  osm_name = vsi_name
