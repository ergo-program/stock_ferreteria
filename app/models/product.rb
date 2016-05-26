class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  
  delegate :nombre, to: :brand, prefix: true, allow_nil: true
  delegate :nombre, to: :category, prefix: true, allow_nil: true

  validates :codigo, :presence => {:message => "No puede estar en blanco"}
end
