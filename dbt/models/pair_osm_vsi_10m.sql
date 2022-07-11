select
  osm.id as osm_id,
  vsi.id as vsi_id,
  osm.name as osm_name,
  vsi.business_name as vsi_name,
  osm.geometry as osm_geometry,
  vsi.geometry as vsi_geometry,
  st_distance(vsi.geometry, osm.geometry) as distance
from {{ ref('osm_coffee_search') }} as osm
join {{ ref('vsi_coffee_search') }} as vsi
  on st_distance(vsi.geometry, osm.geometry) <= 10
