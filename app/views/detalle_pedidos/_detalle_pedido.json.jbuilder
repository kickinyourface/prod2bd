json.extract! detalle_pedido, :id, :cod_producto, :cantidad_venta, :created_at, :updated_at
json.url detalle_pedido_url(detalle_pedido, format: :json)
