require 'csv'

class BaseRepo
  def initialize(filepath, ele_class)
    @filepath = filepath
    @elements = []
    @ele_class = ele_class
    @next_id = 1
  end

  def all
    @elements
  end

  def add(obj)
    obj.id = @next_id
    @next_id += 1
    @elements << obj
  end

  def find(id)
    @elements.find { |ele| ele.id == id.to_i }
  end

  def load_csv
    CSV.foreach(@filepath, headers: true) do |row|
      @elements << @ele_class.new(
        yield(row)
      )
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@filepath, 'wb', csv_options) do |csv|
      yield(csv)
    end
  end
end
