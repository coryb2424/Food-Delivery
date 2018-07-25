class Router
  def initialize(attr)
    @meal_cont = attr[:meal_cont]
    @sess_cont = attr[:sess_cont]
    @cust_cont = attr[:cust_cont]
    @ordr_cont = attr[:ordr_cont]
    @running = true
  end

  def run
    puts "Welcome to Your Restaurent!\n"\
         "           --           "
    employee = @sess_cont.sign_in
    while @running
      if employee.manager?
        display_manager_tasks
        action = gets.chomp.to_i
        print `clear`
        route_manager_action(action)
      else
        display_delivery_tasks
        action = gets.chomp.to_i
        print `clear`
        route_delivery_action(action, employee)
      end
    end
  end

  private

  def stop
    @running = false
  end

  def route_manager_action(action)
    case action
    when 1 then @meal_cont.list
    when 2 then @meal_cont.add
    when 3 then @cust_cont.list
    when 4 then @cust_cont.add
    when 5 then @ordr_cont.list_undelivered_orders
    when 6 then @ordr_cont.add
    when 7 then stop
    else
      puts "Please press 1, 2, 3, 4, 5, 6 or 7"
    end
  end

  def display_manager_tasks
    puts "\n\nWhat do you want to do next?\n"\
         "1 - List all meals\n"\
         "2 - Create a new meal\n"\
         "3 - List all customers\n"\
         "4 - Create a new customer\n"\
         "5 - List undelivered orders\n"\
         "6 - Create a new order\n"\
         "7 - Stop and exit the program\n"
  end

  #  I can view all the undelivered orders
  # As a manager, I can add an order for a customer and assign it to a delivery guy

  def route_delivery_action(action, employee)
    case action
    when 1 then @ordr_cont.list_my_orders(employee)
    when 2 then @ordr_cont.mark_as_delivered(employee)
    when 3 then stop
    else
      puts "Please press 1, 2 or 3"
    end
  end

  def display_delivery_tasks
    puts "\n\nWhat do you want to do next?\n"\
         "1 - List undelivered orders\n"\
         "2 - Mark order as delivered\n"\
         "3 - Stop and exit the program\n"
  end
end
