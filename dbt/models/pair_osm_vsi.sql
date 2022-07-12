with pair_osm_vsi_ranked as (
  select
    osm.id as osm_id,
    vsi.id as vsi_id,
    osm.name as osm_name,
    vsi.business_name as vsi_name,
    {{ normalize('osm.name') }} as norm_osm_name,
    {{ normalize('vsi.business_name') }} as norm_vsi_name,
    osm.geometry as osm_geometry,
    vsi.geometry as vsi_geometry,
    st_distance(vsi.geometry, osm.geometry) as distance,
    rank() over (partition by vsi.id order by st_distance(vsi.geometry, osm.geometry)) as rank
  from {{ ref('osm_coffee_search') }} as osm
  join {{ ref('vsi_coffee_search') }} as vsi
    on st_distance(vsi.geometry, osm.geometry) <= 1000
)

select
  osm_id,
  vsi_id,
  osm_name,
  vsi_name,
  norm_osm_name,
  norm_vsi_name,
  osm_geometry,
  vsi_geometry,
  distance
from pair_osm_vsi_ranked
where rank = 1
