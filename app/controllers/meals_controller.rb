require_relative "../views/meals_view"

class MealsController
    def initialize(repo)
        @repo = repo
        @view = MealsView.new
    end

    def list
        # fetch meals from repo
        meals = @repo.all

        # pass meals to view
        @view.display_list(meals)
    end

    def add
        # ask the user for name
        name  = @view.ask_name
        # ask the user for price
        price = @view.ask_price

        # create Meal instance
        meal = Meal.new(name: name, price: price)

        # add it to the repo
        @repo.create(meal)
    end
end