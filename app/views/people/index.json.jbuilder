json.array!(@people) do |person|
  json.extract! person, :id, :nombre, :telefono, :direccion, :documento, :tipo
  json.url person_url(person, format: :json)
end
