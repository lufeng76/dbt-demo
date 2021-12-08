{% set partitions_to_replace = [
  'current_date()',
  'current_date() - 1'
] %}

{{ config(
    materialized='incremental',
    partition_by={
      "field": "dd",
      "data_type": "date",
      "granularity": "day"
    },
    incremental_strategy = 'insert_overwrite'
)}}

with events as (

    select * from {{ source('gsod','gsod2021') }}

    {% if is_incremental() %}
        -- recalculate yesterday + today
        where date in ({{ partitions_to_replace | join(',') }})
    {% endif %}

)

select
    stn,
    wban,
    date as dd,
    temp
from events
