json.array!(@products) do |product|
  json.extract! product, :id, :codigo, :nombre, :descripcion, :unidad_medida, :costo, :precio_venta, :cantidad, :canitdad_min, :brand_id, :category_id
  json.url product_url(product, format: :json)
end
