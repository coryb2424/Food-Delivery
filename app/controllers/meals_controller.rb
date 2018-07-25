require_relative '../views/meal_view.rb'
require_relative '../models/meal.rb'

class MealsController
  def initialize(repo)
    @repo = repo
    @view = MealView.new
  end

  def list
    meals = @repo.all
    @view.display_all(meals)
  end

  def add
    info = @view.meal_info
    @repo.add(Meal.new(info))
  end
end
