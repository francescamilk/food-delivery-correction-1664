require_relative "router"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/sessions_controller"


meal_repo        = MealRepository.new("data/meals.csv")
meals_controller = MealsController.new(meal_repo)

customer_repo        = CustomerRepository.new("data/customers.csv")
customers_controller = CustomersController.new(customer_repo)

employee_repo       = EmployeeRepository.new("data/employees.csv")
sessions_controller = SessionsController.new(employee_repo)

router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run