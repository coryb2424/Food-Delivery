class CustomerView
  def display_all(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} - #{customer.address}"
    end
  end

  def customer_info
    info = {}
    puts 'Adding new customer:'
    puts 'Name?'
    info[:name] = gets.chomp
    puts 'Address?'
    info[:address] = gets.chomp
    info
  end
end
