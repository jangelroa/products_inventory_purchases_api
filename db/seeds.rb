# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create([
  { title: "Product 1", desc: "My product", count: 10 },
  { title: "Product 2", desc: "My other product", count: 1 }
])

Purchase.create([
  { amount: 100 },
  { amount: 200 }
])

Purchase.first.products << Product.first
Purchase.last.products << Product.last