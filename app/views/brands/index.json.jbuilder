json.array!(@brands) do |brand|
  json.extract! brand, :id, :nombre
  json.url brand_url(brand, format: :json)
end
