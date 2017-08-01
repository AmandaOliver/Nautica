class OrderItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  def validate
    errors.add(:amount, "debería ser más de uno") unless amount.nil? || amount > 0
    errors.add(:price, "debería de ser un número positivo") unless price.nil? || price > 0.0
  end

end
