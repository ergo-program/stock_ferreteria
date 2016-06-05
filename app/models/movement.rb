class Movement < ActiveRecord::Base
  belongs_to :motive
  belongs_to :person
  has_many :d_movements, dependent: :destroy

  delegate :nombre, to: :person, prefix: true, allow_nil: true
  delegate :descripcion, to: :motive, prefix: true, allow_nil: true

  accepts_nested_attributes_for :d_movements, :allow_destroy => true
 
  after_create :ac_movement
  
  validates :fecha, :presence => {:message => "seleccione una fecha"}
  validates :motive_id, :presence => {:message => "seleccione un motivo"}

  validate :no_detalle

  protected

  def no_detalle
  	errors.add(:fecha, "debe tener al menos un producto") if detalle_vacio? 
  end

  def detalle_vacio?
    d_movements.empty?
  end

  

  #una vez creado actualiza el stock del producto
  def ac_movement
    self.d_movements.each do |child|
      product = Product.find(child.product_id)
      DMovement.update(child, :precio => product.precio_venta)
      cantidad = product.cantidad - child.cantidad
      Product.update(product, :cantidad => cantidad)
    end
  end
  
end
