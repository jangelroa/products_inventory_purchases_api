json.extract! @purchase, :id, :amount, :created_at, :updated_at
json.products @purchase.products, :title, :created_at