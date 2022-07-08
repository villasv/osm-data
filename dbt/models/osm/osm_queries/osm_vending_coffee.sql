/* A machine vending coffee.
https://wiki.openstreetmap.org/wiki/Tag%3Avending%3Dcoffee */

select *
from {{ source('osm', 'planet_nodes') }}
where ('vending', 'coffee') in unnest(all_tags)
