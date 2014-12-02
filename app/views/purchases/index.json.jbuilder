json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :amount
  json.url purchase_url(purchase, format: :json)
  json.products purchase.products, :title, :created_at
end
