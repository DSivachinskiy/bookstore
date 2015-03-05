json.array!(@costumers) do |costumer|
  json.extract! costumer, :id
  json.url costumer_url(costumer, format: :json)
end
