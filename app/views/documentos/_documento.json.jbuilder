json.extract! documento, :id, :cod_tipdoc, :cod_pedido, :nom_documento, :ruta_archivo, :created_at, :updated_at
json.url documento_url(documento, format: :json)
