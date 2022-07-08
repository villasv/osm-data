select
  vsi.id as vsi_id,
  osm.id as osm_id,
  vsi.business_name as vsi_name,
  osm.name as osm_name,
  vsi.geometry as vsi_geometry,
  osm.geometry as osm_geometry,
  st_distance(vsi.geometry, osm.geometry) as distance
from {{ ref('osm_coffee_search') }} as osm
join {{ ref('vsi_coffee_search') }} as vsi
  on st_distance(vsi.geometry, osm.geometry) <= 10
