class Router
    def initialize(meals_controller, customers_controller, sessions_controller)
        @meals_controller     = meals_controller
        @customers_controller = customers_controller
        @sessions_controller  = sessions_controller

        @run          = true
        @current_user = nil # instance of Employee
    end

    def run
        while @current_user.nil?
            @current_user = @sessions_controller.login
        end

        while @run
            if @current_user.role == "manager"
                puts "TODO - Display manager menu"
            elsif @current_user.role == "rider"
                puts "TODO - Display rider menu"
            end

            # puts "\nWhat do you want to do?"
            # puts "1 - Add a new meal"
            # puts "2 - See all meals"
            # puts "3 - Add a new customer"
            # puts "4 - See all customers"
            # puts "5 - Quit the program"

            # choice = gets.chomp.to_i

            # # routing logic (call the right controller#action base on choice)
            # case choice
            # when 1 then @meals_controller.add
            # when 2 then @meals_controller.list
            # when 3 then @customers_controller.add
            # when 4 then @customers_controller.list
            # when 5 then @run = false
            # end
        end
    end
end