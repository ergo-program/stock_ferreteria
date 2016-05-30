class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  
  delegate :nombre, to: :brand, prefix: true, allow_nil: true
  delegate :nombre, to: :category, prefix: true, allow_nil: true

  validates 	:codigo, 	:length => { in: 1..20 , message: "debe tener entre 1 y 20 caracteres"},
  							:uniqueness => {:message => "existente, vuelva a intentarlo"}

	validates 	:nombre, 	:length => { in: 1..50 , message: "debe tener entre 1 y 50 caracteres"},
  							:presence => {:message => "no puede estar en blanco"},
  							:format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'solo permite letras'}

	validates 	:unidad_medida,	:length => { in: 1..20 , message: "debe tener entre 1 y 20 caracteres"}

 	validates 	:descripcion,	:length => { in: 1..80 , message: "debe tener entre 1 y 80 caracteres"}

 	validates 	:costo,		:presence => {:message => "no puede estar en blanco"},
  							:length => { in: 1..10 , message: "debe tener entre 1 y 80 caracteres"},
  							:numericality => {:only_double => true,:greater_than => 0, :message => "debe ser un numero"}

	validates 	:precio_venta,	:length => { in: 1..10 , message: "debe tener entre 1 y 80 caracteres"},
  							:numericality => {:only_double => true,:greater_than => 0, :message => "debe ser un numero"}

  validates 	:brand,	:presence => {:message => "no puede estar en blanco"}

  validates 	:category,	:presence => {:message => "no puede estar en blanco"}

end
