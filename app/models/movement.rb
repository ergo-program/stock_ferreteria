class Movement < ActiveRecord::Base
  belongs_to :motive
  belongs_to :person
  has_many :d_movements, dependent: :destroy

  delegate :nombre, to: :person, prefix: true, allow_nil: true
  delegate :descripcion, to: :motive, prefix: true, allow_nil: true

  accepts_nested_attributes_for :d_movements, :allow_destroy => true
end
