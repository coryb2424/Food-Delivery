require_relative 'base_repository'
require_relative '../models/order.rb'

class OrderRepository < BaseRepo
  def initialize(filepath, meal_repo, empl_repo, cust_repo)
    super(filepath, Order)
    @meal_repository = meal_repo
    @employee_repository = empl_repo
    @customer_repository = cust_repo

    load_csv if File.exist?(@filepath)
  end

  def add(order)
    super(order)
    save_csv
  end

  def undelivered_orders
    @elements.reject { |ele| ele.delivered? }
  end

  def find_by_employee_id(employee_id)
    @elements.select { |ele| ele.employee.id == employee_id }
  end

  def load_csv
    CSV.foreach(@filepath, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << build_order(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def build_order(info)
    info[:customer] = @customer_repository.find(info[:customer_id])
    info[:meal] = @meal_repository.find(info[:meal_id])
    info[:employee] = @employee_repository.find(info[:employee_id])
    info[:delivered] = info[:delivered] == 'true'
    Order.new(info)
  end

  def save_csv
    super do |csv|
      csv << %w[id customer_id meal_id employee_id delivered]
      @elements.each do |order|
        csv << [order.id,
                order.customer.id,
                order.meal.id,
                order.employee.id,
                order.delivered]
      end
    end
  end
end
