class Parameter < ActiveRecord::Base

	validates   :nombre, 	:length => { in: 1..50 , message: "debe tener entre 1 y 50 caracteres"},
						 	:presence => {:message => "no puede estar en blanco"},
						 	:format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'solo permite letras'}

	validates   :direccion,	:length => { in: 1..50 , message: "debe tener entre 1 y 50 caracteres"},
							:presence => {:message => "no puede estar en blanco"}

	validates   :telefono, 	:length => { in: 1..10 , message: "debe tener entre 1 y 10 caracteres"},
							:presence => {:message => "no puede estar en blanco"}


end
