class DMovement < ActiveRecord::Base
  belongs_to :movement
  belongs_to :product

  validates :product_id, :presence => {:message => "seleccione un producto"}
  validates :cantidad,	:length => { in: 1..5, message: "debe tener entre 1 y 5 digitos"},
  						:numericality => {:greater_than => 0, :message => "debe ser un numero positivo"}

end
