require_relative "../views/sessions_view"

class SessionsController
    def initialize(employee_repo)
        @employee_repo = employee_repo
        @view          = SessionsView.new
    end

    def login
        # ask for username
        username = @view.ask_for("username")
        # ask for password
        password = @view.ask_for("password")

        # find the employee
        employee = @employee_repo.find_by_username(username)

        # verify credentials
        if employee && (employee.password == password)
            @view.welcome(username)
            return employee
        else
            @view.wrong_credentials
        end
    end
end