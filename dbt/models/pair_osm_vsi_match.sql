select
  *
from
  {{ ref('pair_osm_vsi') }}
where
  norm_osm_name = norm_vsi_name
  or regexp_contains(norm_osm_name, norm_vsi_name)
  or regexp_contains(norm_vsi_name, norm_osm_name)