json.extract! tipo_pago, :id, :cod_pago, :nom_pago, :created_at, :updated_at
json.url tipo_pago_url(tipo_pago, format: :json)
