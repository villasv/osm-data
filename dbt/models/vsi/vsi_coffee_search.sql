with storefronts_inventory_ranked as (
select
  *,
  rank() over (partition by id order by year_recorded desc) as rank
from {{ source('vancouver', 'storefronts_inventory') }}
)

select
  id,
  business_name,
  st_geogpoint(
    cast(split(geo_point_2d, ',')[offset(1)] as float64),
    cast(split(geo_point_2d, ',')[OFFSET(0)] as float64)
  ) as geometry
from storefronts_inventory_ranked
where
    rank = 1
    and (
      lower(business_name) like '%coffee%'
      or lower(business_name) like '%cafe%'
      or lower(business_name) like '%café%'
    )
