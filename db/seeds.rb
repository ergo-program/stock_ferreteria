# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#evita el error cuando nombre es nulo
 Parameter.create(nombre: 'Empresa', direccion: "Encarnacion", telefono: "999", email: "empresa@gmail.com")
 