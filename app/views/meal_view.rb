class MealView
  def display_all(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} #{meal.price}"
    end
  end

  def meal_info
    info = {}
    puts 'Adding new meal:'
    puts 'What is the meal called?'
    info[:name] = gets.chomp
    puts 'what is the price of this meal?'
    info[:price] = gets.chomp.to_f
    info
  end
end
