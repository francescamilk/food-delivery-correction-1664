require "csv"
require_relative "../models/meal"

class MealRepository
    def initialize(csv_filepath)
        @csv_filepath = csv_filepath
        @meals        = []
        @next_id      = 1

        load_csv() if File.exist?(@csv_filepath)
    end

    def all
        @meals
    end

    def find(id)
        @meals.find do |meal|
            # return the 'meal' where the below condition is verified
            meal.id == id
        end
    end

    def create(meal)
        meal.id = @next_id
        @next_id += 1

        @meals << meal

        save_csv()
    end

    private

    def load_csv
        CSV.foreach(@csv_filepath, headers: :first_row, header_converters: :symbol) do |row|
            # conversions

            row[:id]    = row[:id].to_i
            row[:price] = row[:price].to_i

            # create instance
            meal = Meal.new(row)

            # populate the in-memory Array
            @meals << meal
        end

        # increment next_id
        @next_id = @meals.empty? ? 1 : @meals.last.id + 1
    end

    def save_csv
        CSV.open(@csv_filepath, "wb") do |csv|
            csv << [ "id", "name", "price" ]

            @meals.each do |meal|
                csv << [ meal.id, meal.name, meal.price ]
            end
        end
    end
end