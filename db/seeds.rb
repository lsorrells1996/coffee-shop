puts "Seeding..."

15.times do
    Customer.create(name: Faker::Name.name)
end

15.times do
    Coffee.create(title: Faker::Coffee.blend_name)
end

50.times do
    Order.create(price: rand(1..7), customer: Customer.all.sample, coffee: Coffee.all.sample)
end

puts "Seeding finished!"