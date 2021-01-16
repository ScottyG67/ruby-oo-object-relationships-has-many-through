
require 'pry'
class Waiter
    attr_accessor :name, :experiance

    @@all =[]
    def initialize (name, experiance)
        @name = name
        @experiance = experiance
        @@all << self
    end 

    def self.all
        @@all
    end
    def new_meal(customer, total, tip)
        Meal.new(self,customer,total,tip)
    end
    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        meals.max_by {|meal| meal.tip }.customer
    end
end