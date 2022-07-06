/* coffee=yes describes a business in which coffee is served.
https://wiki.openstreetmap.org/wiki/Key:coffee */

select *
from {{ source('osm', 'planet_nodes') }}
where ('coffee', 'yes') in unnest(all_tags)
