json.array!(@products) do |product|
  json.extract! product, :id, :name, :producer, :fat, :carbohydrate, :protein, :sugar, :weight
  json.url product_url(product, format: :json)
end
