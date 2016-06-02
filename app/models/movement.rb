class Movement < ActiveRecord::Base
  belongs_to :motive
  belongs_to :person
  has_many :d_movements, dependent: :destroy
  accepts_nested_attributes_for :d_movements, :allow_destroy => true

  validates :fecha, :presence => {:message => "seleccione una fecha"}
  validates :tipo, :presence => {:message => "seleccione un tipo"}
  validates :motive_id, :presence => {:message => "seleccione un motivo"}


end
