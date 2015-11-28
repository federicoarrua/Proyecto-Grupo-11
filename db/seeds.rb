# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tipo=Tipo.new
tipo.tipo="Sofa"
tipo.save

tipo=Tipo.new
tipo.tipo="Cama"
tipo.save

admin=User.new
admin.password="administrador"
admin.password_confirmation="administrador"
admin.email="admin@couchinn.com"
admin.nombre="Admin"
admin.apellido="Admin"
admin.fecha=Date.new(1990,1,1)
admin.admin=true
admin.cuenta=nil
admin.punt=5
admin.cant=1
admin.save

user=User.new
user.password="password"
user.password_confirmation="password"
user.email="ejemplo@couchinn.com"
user.nombre="Ejemplo"
user.apellido="Apellido"
user.fecha=Date.new(1990,1,1)
user.cuenta="Base"
user.punt=5
user.cant=1
user.save

couch=Couch.create
couch.descripcion = "Hermosa casa con ubicacion excelente"
couch.foto = File.open('app/assets/images/casa.jpg')
couch.capacidad = 4
couch.ciudad = "Ushuaia"
couch.user_id = 1
couch.tipo_id = 1
couch.punt=5
couch.cant=1
couch.save

couch=Couch.create
couch.descripcion = "Bonita casa con propietarios ansiosos de conocer gente nueva"
couch.foto = File.open('app/assets/images/casa2.jpg')
couch.capacidad = 10
couch.ciudad = "Bariloche"
couch.user_id = 2
couch.tipo_id = 2
couch.punt=5
couch.cant=1
couch.save

couch=Couch.create
couch.descripcion = "Casa amplia con muchas ventanas y muy buena vista"
couch.foto = File.new('app/assets/images/casa3.png')
couch.capacidad = 5
couch.ciudad = "Neuquen"
couch.user_id = 2
couch.tipo_id = 1
couch.punt=5
couch.cant=1
couch.save
