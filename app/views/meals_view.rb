class MealsView
    def display_list(meals)
        meals.each_with_index do |meal, id|
            puts "#{id + 1}. #{meal.name.capitalize} - #{meal.price}€"
        end
    end

    def ask_name
        puts "What's the name?"
        return gets.chomp
    end

    def ask_price
        puts "What's the price?"
        return gets.chomp.to_i
    end
end