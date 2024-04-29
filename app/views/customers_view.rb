class CustomersView
    def display_list(customers)
        customers.each_with_index do |customer, i|
            puts "#{i + 1}. #{customer.name} - #{customer.address}"
        end
    end

    def ask_name
        puts "What's the name?"
        return gets.chomp
    end

    def ask_address
        puts "What's the address?"
        return gets.chomp
    end
end