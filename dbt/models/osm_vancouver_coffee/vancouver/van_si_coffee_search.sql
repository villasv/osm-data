select * from {{ source('vancouver', 'storefronts_inventory') }}
where
    lower(business_name) like '%coffee%'
    or lower(business_name) like '%cafe%'
    or lower(business_name) like '%café%'
