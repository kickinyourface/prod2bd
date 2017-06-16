json.extract! pedido, :id, :cod_factura, :cod_transporte, :cod_cliente, :fecha_pedido, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
