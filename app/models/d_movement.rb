class DMovement < ActiveRecord::Base
  belongs_to :movement
  belongs_to :product

  validates :product_id, :presence => {:message => "seleccione un producto"}
  validates :cantidad,	:length => { in: 1..5, message: "debe tener entre 1 y 5 digitos"},
  						:numericality => {:greater_than => 0, :message => "debe ser un numero positivo"}
  validate :stock_negativo

  after_create :ac_movement



  protected

  #una vez creado actualiza el stock del producto
  def ac_movement
  	product = Product.find(self.product_id)
  	self.precio = product.precio_venta
  	Product.update(product, :cantidad => (product.cantidad - self.cantidad))
  end

  #controla que haya stock suficiente
  def stock_negativo
    errors.add(:cantidad, "la cantidad supera el stock exixtente") if Product.find(product_id).cantidad < cantidad
  end

end
