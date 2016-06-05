class Movement < ActiveRecord::Base
  belongs_to :motive
  belongs_to :person
  has_many :d_movements, dependent: :destroy

  delegate :nombre, to: :person, prefix: true, allow_nil: true
  delegate :descripcion, to: :motive, prefix: true, allow_nil: true

  accepts_nested_attributes_for :d_movements, :allow_destroy => true

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
  
end
