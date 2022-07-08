/* amenity=cafe is used for a generally informal place with sit-down facilities
selling beverages and light meals and/or snacks. This includes coffee-shops and
tea shops selling perhaps tea, coffee and cakes through to bistros selling meals
with alcoholic drinks. https://wiki.openstreetmap.org/wiki/Tag:amenity%3Dcafe */

select *
from {{ source('osm', 'planet_nodes') }}
where ('amenity', 'cafe') in unnest(all_tags)
