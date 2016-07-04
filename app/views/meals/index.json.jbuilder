json.array!(@meals) do |meal|
  json.extract! meal, :id, :user_id, :name, :description, :private
  json.url meal_url(meal, format: :json)
end
