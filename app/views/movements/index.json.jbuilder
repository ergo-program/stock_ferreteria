json.array!(@movements) do |movement|
  json.extract! movement, :id, :fecha, :motive_id, :tipo, :person_id
  json.url movement_url(movement, format: :json)
end
