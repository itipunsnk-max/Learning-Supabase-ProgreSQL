let
    Source = PostgreSQL.Database(SupabaseHost, SupabaseDatabase),
    WorkOrders = Source{[Schema="public",Item="v_work_order_reporting"]}[Data],
    Typed = Table.TransformColumnTypes(WorkOrders, {{"reported_at", type datetime}, {"aging_hours", type number}})
in
    Typed
