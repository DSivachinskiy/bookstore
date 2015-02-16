json.array!(@billing_adresses) do |billing_adress|
  json.extract! billing_adress, :id, :adress, :zipcode, :city, :phone, :country
  json.url billing_adress_url(billing_adress, format: :json)
end
