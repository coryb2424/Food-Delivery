class Order
  attr_reader :customer, :meal, :employee, :delivered
  attr_accessor :id

  def initialize(attr)
    @customer = attr[:customer]
    @meal = attr[:meal]
    @employee = attr[:employee]
    @delivered = attr[:delivered] || false
    @id = attr[:id]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
