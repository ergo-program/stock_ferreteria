json.array!(@configurations) do |configuration|
  json.extract! configuration, :id, :nombre, :direccion, :telefono, :email, :imagen, :tiempo_espera
  json.url configuration_url(configuration, format: :json)
end
