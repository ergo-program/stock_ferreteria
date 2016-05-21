json.array!(@parameters) do |parameter|
  json.extract! parameter, :id, :nombre, :direccion, :telefono, :email, :imagen, :tiempo_espera
  json.url parameter_url(parameter, format: :json)
end
