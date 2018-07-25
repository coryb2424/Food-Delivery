require_relative 'base_repository'

class MealRepository < BaseRepo
  def initialize(filepath)
    super(filepath, Meal)
    load_csv if File.exist?(@filepath)
  end

  def add(meal)
    super(meal)
    save_csv
  end

  def load_csv
    super do |row|
      { id: row['id'].to_i, name: row['name'], price: row['price'].to_i }
    end
  end

  def save_csv
    super do |csv|
      csv << %w[id name price]
      @elements.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
