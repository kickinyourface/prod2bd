json.extract! producto, :id, :cod_producto, :nom_producto, :precio_unit, :cantidad, :created_at, :updated_at
json.url producto_url(producto, format: :json)
