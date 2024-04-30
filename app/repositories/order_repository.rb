require "csv"
require_relative "../models/order"

class OrderRepository
    def initialize(
            csv_filepath, 
            meal_repository, 
            customer_repository, 
            employee_repository
        )
        
        @csv_filepath        = csv_filepath
        @meal_repository     = meal_repository
        @customer_repository = customer_repository
        @employee_repository = employee_repository
        
        @orders  = []
        @next_id = 1

        load_csv()
    end
    
    private

    def load_csv
        CSV.foreach(@csv_filepath, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i

            order = Order.new(row)

            # connect the Order to its Meal, Customer, & Employee
            # (they should be instances!)
            meal     = @meal_repository.find(row[:meal_id].to_i)
            customer = @customer_repository.find(row[:customer_id].to_id)
            employee = @employee_repository.find(row[:employee_id].to_i)

            # associations
            order.meal     = meal
            order.customer = customer
            order.employee = employee

            @orders << order
        end
        # TODO - Increment @next_id
    end
end

# <Oder:0x087324 @id=1 @meal=<Meal:0x01247 @id=1 @name=pizza> @customer=<Customer 0x8713867...>....>