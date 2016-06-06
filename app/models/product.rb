class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  
  delegate :nombre, to: :brand, prefix: true, allow_nil: true
  delegate :nombre, to: :category, prefix: true, allow_nil: true


  validates   :nombre, :length => { in: 1..50 , message: "debe tener entre 1 y 50 caracteres"},
                       :presence => {:message => "no puede estar en blanco"},
                       :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'solo permite letras'}

  validates   :unidad_medida, :length => { in: 0..20 , message: "debe tener entre 1 y 20 caracteres"}

  validates   :descripcion, :length => { in: 0..80 , message: "debe tener entre 1 y 80 caracteres"}

  validates   :costo,  :presence => {:message => "no puede estar en blanco"},
                     :length => { in: 1..10 , message: "debe tener entre 1 y 10 caracteres"},
                     :numericality => {:only_double => false,:greater_than => 0, :message => "debe ser un numero"}

  validates   :precio_venta,  :length => { in: 0..10 , message: "debe tener entre 1 y 10 caracteres"},
                              :presence => {:message => "no puede estar en blanco"},
                              :numericality => {:only_double => false,:greater_than => 0, :message => "debe ser un numero"}


  validates   :codigo,  :length => { in: 0..20 , message: "hasta 20 caracteres"},
                        :uniqueness => {:message => "ya existe"}, 
                        :allow_nil  => true, :allow_blank => true

  validates   :canitdad_min, :length => { in: 0..10 , message: "debe tener entre 0 y 10 caracteres"}

  validates   :brand,  :presence => {:message => "no puede estar en blanco"}

  validates   :category,  :presence => {:message => "no puede estar en blanco"}

end

