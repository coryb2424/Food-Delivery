require_relative 'base_repository'

class EmployeeRepository < BaseRepo
  undef_method :add, :save_csv

  def initialize(filepath)
    super(filepath, Employee)
    load_csv if File.exist?(@filepath)
  end

  def load_csv
    super do |row|
      { id: row['id'].to_i,
        username: row['username'],
        password: row['password'],
        role: row['role'] }
    end
  end

  def all_delivery_guys
    @elements.select { |empl| empl.delivery_guy? }
  end

  def all_managers
    @elements.select { |empl| empl.manager? }
  end

  def find_by_username(username)
    @elements.find { |empl| empl.username == username}
  end
end
