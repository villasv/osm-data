/* cuisine=* describes the type of food served at an eating place. If a venue
serves many different types, they are concatenated with a semi-colon value
separator. https://wiki.openstreetmap.org/wiki/Tag:cuisine%3Dcoffee_shop */

select *
from {{ source('osm', 'planet_nodes') }}
where exists (
    select * from unnest(all_tags)
    where key = 'cuisine' and value like '%coffee_shop%'
)
