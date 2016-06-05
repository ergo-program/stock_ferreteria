class DMovement < ActiveRecord::Base
  belongs_to :movement
  belongs_to :product

  validates :product_id, :presence => {:message => "seleccione un producto"}
  validates :cantidad,	:length => { in: 1..5, message: "debe tener entre 1 y 5 digitos"},
  						:numericality => {:greater_than => 0, :message => "debe ser un numero positivo"}
  validate :stock_negativo



  protected

  #controla que haya stock suficiente
  def stock_negativo
    errors.add(:cantidad, "supera el stock exixtente") if Product.find(product_id).cantidad < cantidad
  end

end
