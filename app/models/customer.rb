class Customer
    def initialize(attributes = {})
        @id      = attributes[:id]
        @name    = attributes[:name]
        @address = attributes[:address]
    end

    attr_accessor :id, :name, :address
end
