json.array!(@orders) do |order|
  json.extract! order, :id, :address, :phone_number, :city
  json.url order_url(order, format: :json)
end
