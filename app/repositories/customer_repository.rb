require "csv"
require_relative "../models/customer"

class CustomerRepository
    def initialize(csv_filepath)
        @csv_filepath = csv_filepath
        @customers    = []
        @next_id      = 1

        load_csv() if File.exist?(@csv_filepath)
    end

    def all
        @customers
    end

    def find(id)
        @customers.find { |customer| customer.id == id }
    end

    def create(customer)
        customer.id = @next_id
        @next_id += 1

        @customers << customer

        save_csv()
    end

    private

    def load_csv
        CSV.foreach(@csv_filepath, headers: :first_row, header_converters: :symbol) do |row|
            # conversions
            row[:id] = row[:id].to_i

            # create instance
            customer = Customer.new(row)

            # populate @customers Array
            @customers << customer
        end

        # increment next_id by last used
        @next_id = @customers.empty? ? 1 : @customers.last.id + 1
    end

    def save_csv
        CSV.open(@csv_filepath, "wb") do |csv|
            csv << [ "id", "name", "address" ]

            @customers.each do |customer|
                csv << [ customer.id, customer.name, customer.address ]
            end
        end
    end
end