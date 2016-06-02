class Brand < ActiveRecord::Base

	validates   :nombre, 	:presence => {:message => "no puede estar en blanco"},
							:uniqueness => {:message => "ya existe"},
							:length => { in: 2..50 , message: "debe tener entre 2 y 50 caracteres"}

end
