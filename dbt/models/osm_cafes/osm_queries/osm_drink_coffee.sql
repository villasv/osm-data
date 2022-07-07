-- drink:coffee=*, drink:espresso=*
-- https://wiki.openstreetmap.org/wiki/Key:drink

select *
from {{ source('osm', 'planet_nodes') }}
where ('drink:coffee', 'yes') in unnest(all_tags)
