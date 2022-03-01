class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders

    def self.names
        pluck :name
    end

    def order_coffee(coffee_title, price)
        Order.create(coffee_id: coffee_title, price: price)
        puts "#{self.name} ordered a #{self.coffees.title} for $#{self.orders.price}"
    end
end