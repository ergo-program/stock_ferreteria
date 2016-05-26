class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  
  delegate :nombre, to: :brand, prefix: true, allow_nil: true
  delegate :nombre, to: :category, prefix: true, allow_nil: true

    validates :codigo, 	:length => { in: 1..20 , message: "debe tener entre 1 y 20 caracteres"},
  						:uniqueness => {:message => "Este numero ya existe, vuelva a intentarlo"}
end
