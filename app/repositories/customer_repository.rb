require_relative 'base_repository'

class CustomerRepository < BaseRepo
  def initialize(filepath)
    super(filepath, Customer)
    load_csv if File.exist?(@filepath)
  end

  def add(customer)
    super(customer)
    save_csv
  end

  def load_csv
    super do |row|
      { id: row['id'].to_i, name: row['name'], address: row['address'] }
    end
  end

  def save_csv
    super do |csv|
      csv << %w[id name address]
      @elements.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
