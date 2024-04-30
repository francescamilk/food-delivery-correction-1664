require "csv"
require_relative "../models/employee"

class EmployeeRepository
    def initialize(csv_filepath)
        @csv_filepath = csv_filepath
        @employees    = []
        @next_id      = 1

        load_csv()
    end

    def find(id)
        @employees.find { |employee| employee.id == id }
    end

    def find_by_username(username)
        @employees.find { |employee| employee.username == username }        
    end

    private

    def load_csv
        CSV.foreach(@csv_filepath, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i

            employee = Employee.new(row)

            @employees << employee
        end
        @next_id = @employees.empty? ? 1 : @employees.last.id + 1
    end
end