require_relative 'app/controllers/customers_controller.rb'
require_relative 'app/controllers/meals_controller.rb'
require_relative 'app/controllers/sessions_controller.rb'
require_relative 'app/controllers/orders_controller.rb'
require_relative 'app/repositories/customer_repository.rb'
require_relative 'app/repositories/employee_repository.rb'
require_relative 'app/repositories/meal_repository.rb'
require_relative 'app/repositories/order_repository.rb'
require_relative 'router.rb'

meal_csv = 'data/meals.csv'
employee_csv = 'data/employees.csv'
customer_csv = 'data/customers.csv'
order_csv = 'data/orders.csv'

meal_repository = MealRepository.new(meal_csv)
employee_repository = EmployeeRepository.new(employee_csv)
customer_repository = CustomerRepository.new(customer_csv)
order_repository = OrderRepository.new(order_csv,
                                       meal_repository,
                                       employee_repository,
                                       customer_repository)

meal_controller = MealsController.new(meal_repository)
customer_controller = CustomersController.new(customer_repository)
session_controller = SessionsController.new(employee_repository)
order_controller = OrdersController.new(meal_repository,
                                        employee_repository,
                                        customer_repository,
                                        order_repository)

router = Router.new(meal_cont: meal_controller,
                    sess_cont: session_controller,
                    cust_cont: customer_controller,
                    ordr_cont: order_controller)
# Start the app
router.run
