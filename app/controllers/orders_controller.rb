require_relative '../views/order_view.rb'
require_relative '../models/order.rb'

class OrdersController
  def initialize(meal_repo, employee_repo, customer_repo, order_repo)
    @meal_repo = meal_repo
    @employee_repo = employee_repo
    @customer_repo = customer_repo
    @order_repo = order_repo
    @view = OrderView.new
  end

  def list_undelivered_orders
    orders = @order_repo.undelivered_orders
    @view.display_orders(orders)
  end

  def add
    info = @view.ask_order_info
    order = @order_repo.build_order(info)
    @order_repo.add(order)
  end

  def list_my_orders(employee)
    orders = @order_repo.find_by_employee_id(employee.id)
    orders = orders.reject { |order| order.delivered? }
    @view.display_orders(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    order_id = @view.ask_order_id
    order = @order_repo.find(order_id)
    order.deliver!
    @order_repo.save_csv
  end
end
