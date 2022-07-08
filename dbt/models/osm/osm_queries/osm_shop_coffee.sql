-- shop=coffee is used for a shop focused on selling different kinds of coffee
-- (coffee beans and coffee powder)
-- https://wiki.openstreetmap.org/wiki/Tag:shop%3Dcoffee

select *
from {{ source('osm', 'planet_nodes') }}
where ('shop', 'coffee') in unnest(all_tags)
