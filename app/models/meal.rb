class Meal
    def initialize(attributes = {})
        @id    = attributes[:id]
        @name  = attributes[:name]
        @price = attributes[:price]
    end

    attr_accessor :id, :name, :price
end