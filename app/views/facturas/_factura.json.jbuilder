json.extract! factura, :id, :cod_pago, :fecha_venta, :cant_product, :created_at, :updated_at
json.url factura_url(factura, format: :json)
