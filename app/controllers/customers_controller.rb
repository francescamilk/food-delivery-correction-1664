require_relative "../views/customers_view"

class CustomersController
    def initialize(repo)
        @repo = repo
        @view = CustomersView.new
    end

    def list
        customers = @repo.all

        @view.display_list(customers)
    end

    def add
        name    = @view.ask_name
        address = @view.ask_address

        customer = Customer.new(name: name, address: address)

        @repo.create(customer)
    end
end