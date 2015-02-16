json.array!(@orders) do |order|
  json.extract! order, :id, :total_price, :completed_date, :state
  json.url order_url(order, format: :json)
end
