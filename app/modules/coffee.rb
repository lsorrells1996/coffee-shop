class Coffee < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def unique_customer_names
        customers.pluck(:name).uniq
        #customers.distinct.pluck :name
    end

    def self.most_ordered
        all.max_by {|c| c.orders.length}
        #all.includes(:orders).max_by{|coffee| coffee.orders.length}
    end
end