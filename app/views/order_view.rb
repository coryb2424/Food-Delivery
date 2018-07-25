class OrderView
  def display_orders(orders)
    orders.each do |order|
      puts "#{order.id}. Customer: #{order.customer.name}. "\
           "Meal: #{order.meal.name}. "\
           "Address: #{order.customer.address}."
    end
  end

  def ask_order_info
    info = {}
    puts "Creating new Order!"
    puts "Which meal?"
    info[:meal_id] = gets.chomp
    puts "Which customer?"
    info[:customer_id] = gets.chomp
    puts "Which employee?"
    info[:employee_id] = gets.chomp
    info
  end

  def ask_order_id
    puts 'Which order has been delivered?'
    gets.chomp
  end
end
