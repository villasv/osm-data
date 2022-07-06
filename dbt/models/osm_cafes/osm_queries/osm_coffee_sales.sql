/* coffee:sales=* is added to a feature such as a shop, to specify whether or
not it sells coffee. https://wiki.openstreetmap.org/wiki/Key%3Acoffee%3Asales */

select *
from {{ source('osm', 'planet_nodes') }}
where ('coffee:sales', 'yes') in unnest(all_tags)
