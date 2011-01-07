class Calculator::PerWeight < Calculator
  preference :amount, :decimal, :default => 0

  def self.description
    "Flat Rate Per Weight"
  end

  def self.register
    super
    Coupon.register_calculator(self)
    ShippingMethod.register_calculator(self)
    ShippingRate.register_calculator(self)
  end

  def compute(object=nil)
    self.preferred_amount * object.collect{|li|li.variant}.collect{|li|li.weight || 0}.sum
  end
end
