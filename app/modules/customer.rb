class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders

    def self.names
        pluck :name
    end

    def order_coffee(coffee_title, price)
        coffee = Coffee.find_or_create_by title: coffee_title
        Order.create customer: self, coffee: coffee, price: price
        puts "#{name} ordered a #{coffee.title} for $#{price}"
    end

    def total_purchases_amount
        orders.sum :price
    end

    def dislike_coffee(coffee_title)
        coffee = Coffee.find_by title: coffee_title
        order = orders.find_by coffee_id: coffee.id
        order.destroy
        puts "#{name} has been refunded $#{order.price}"
    end
end