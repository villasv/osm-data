select
  (select value from unnest(all_tags) where key = 'name:en') as name,
  (select value from unnest(all_tags) where key = 'admin_level') as admin_level,
  geometry
from {{ source('osm', 'planet_features')}}
where
  feature_type="multipolygons"
  and 'name:en' in (select key from unnest(all_tags))
  and ('boundary', 'administrative') in unnest(all_tags)
  and (select value from unnest(all_tags) where key = 'admin_level') in ('2', '3', '4')
