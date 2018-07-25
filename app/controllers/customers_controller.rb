require_relative '../views/customer_view.rb'
require_relative '../models/customer.rb'

class CustomersController
  def initialize(repo)
    @repo = repo
    @view = CustomerView.new
  end

  def list
    customers = @repo.all
    @view.display_all(customers)
  end

  def add
    info = @view.customer_info
    @repo.add(Customer.new(info))
  end
end
