class CreateProductsPurchases < ActiveRecord::Migration
  def change
    create_table :products_purchases do |t|
      t.references :product, index: true
      t.references :purchase, index: true
    end
  end
end
