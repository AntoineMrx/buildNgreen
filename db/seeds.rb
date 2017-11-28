# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# puts 'Creating 50 fake buyers...'
# 50.times do
#   buyer = Buyer.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password: "azerty",
#     email: Faker::Internet.email,
#     address: "#{Faker::Address.street_address} #{Faker::Address.zip_code} #{Faker::Address.city}"
#   )
# end
# puts 'Finished buyers!'


# puts 'Creating 25 fake sellers...'
# 25.times do
#   seller = Seller.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password: "azerty",
#     email: Faker::Internet.email,
#     company_name: Faker::Company.name,
#     address: "#{Faker::Address.street_address} #{Faker::Address.zip_code} #{Faker::Address.city}",
#     description: Faker::Lorem.paragraph(2, false, 4),
#     website: Faker::Internet.url,
#     delivery_time: 3,
#     delivery_fee: 25,
#     delivery_free_from: 100,
#   )
# end


puts 'Creating 200 fake orders with baskets...'
5.times do
  order = Order.new(
    order_date: Faker::Date.between(200.days.ago, Date.today),
    status: ["En attente de validation", "Validé", "Livraison en cours", "Livré", "Annulé"].sample,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip_code} #{Faker::Address.city}",
    buyer_id: (1..2).to_a.sample,
  )
  order.save!
  (1..5).to_a.sample.times do
    basket = Basket.new(
      quantity: (1..5).to_a.sample,
      product_price: (1..200).to_a.sample,
      vat: 20,
      order_id: order.id,
      product_id: (1..10).to_a.sample,
      )
    basket.save!
  end
end

puts 'Finished!'

