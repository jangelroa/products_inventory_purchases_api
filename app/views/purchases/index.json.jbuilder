json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :amount
  json.url purchase_url(purchase, format: :json)
  json.products purchase.products, :title, :created_at
end


# [
#   {
#     "id":1,
#     "amount":100,
#     "url":"http://localhost:3000/purchases/1.json",
#     "products":[
#       {"title":"Product 1","created_at":"2014-12-02T04:04:04.766Z"}
#     ]
#   },
#   {
#     "id":2,
#     "amount":200,
#     "url":"http://localhost:3000/purchases/2.json",
#     "products":[
#       {"title":"Product 2","created_at":"2014-12-02T04:04:04.777Z"}
#     ]
#   }
# ]