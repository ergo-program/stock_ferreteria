json.array!(@motives) do |motive|
  json.extract! motive, :id, :descripcion
  json.url motive_url(motive, format: :json)
end
