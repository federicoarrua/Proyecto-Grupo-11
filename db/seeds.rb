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
admin.save

user=User.new
user.password="password"
user.password_confirmation="password"
user.email="ejemplo@couchinn.com"
user.nombre="Ejemplo"
user.apellido="Apellido"
user.fecha=Date.new(1990,1,1)
user.save

couch=Couch.create
couch.imageurl= 'http://ojodecasas.com/wp-content/uploads/2015/07/PR_FOTO_2220_quillay_v02.jpg'
couch.descripcion = "Hermosa casa con ubicacion excelente"
couch.capacidad = 4
couch.user_id = 1
couch.tipo_id = 1
couch.save

couch=Couch.create
couch.imageurl= 'http://www.casadivina.net/wp-content/uploads/2015/01/CasaDivinaWebsite.jpg'
couch.descripcion = "Bonita casa con propietarios ansiosos de conocer gente nueva"
couch.capacidad = 10
couch.user_id = 2
couch.tipo_id = 2
couch.save

couch=Couch.create
couch.imageurl= 'http://casas-de-aldea.com/wp-content/uploads/2015/10/fotos-de-casas-lindas-vluzvjzsa.jpg'
couch.descripcion = "Casa amplia con muchas ventanas y muy buena vista"
couch.capacidad = 5
couch.user_id = 2
couch.tipo_id = 1
couch.save
