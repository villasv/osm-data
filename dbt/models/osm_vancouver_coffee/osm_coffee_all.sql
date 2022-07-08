
select * from {{ source('osm', 'planet_nodes') }}
where id in
(
    select id from {{ ref('osm_amenity_cafe') }}
    union distinct
    select id from {{ ref('osm_coffee_sales') }}
    union distinct
    select id from {{ ref('osm_coffee_yes') }}
    union distinct
    select id from {{ ref('osm_cuisine_coffee_shop') }}
    union distinct
    select id from {{ ref('osm_drink_coffee') }}
    union distinct
    select id from {{ ref('osm_shop_coffee') }}
    union distinct
    select id from {{ ref('osm_vending_coffee') }}
)
