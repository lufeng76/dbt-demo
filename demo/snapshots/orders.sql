{% snapshot orders_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='check',
      check_cols=['status'],
    )
}}

select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}