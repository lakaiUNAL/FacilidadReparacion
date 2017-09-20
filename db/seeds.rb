# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Datos para nuestro acceso
Customer.create(name: "Cliente Gama", email: "jcgamar@prueba.co", user_name: "jcgamar", password: "juancho")
Customer.create(name: "Técnico Gama", email: "jcgamar@prueba.co", user_name: "jcgamar", password: "juancho")



#Datos de prueba aleatorios
40.times do |i|
	user = Customer.new
	user.name = "User Customer #{i}"             
    user.email = "customer_#{i}@prueba.co"
    user.birth_date = (1-i).year.ago
    user.number_card = nil
    user.address = nil
    user.phone_number = nil
    user.user_name = "customer_#{i}"
    user.password = "1234567890"
    user.save
end

40.times do |i|
	user = Worker.new
	user.name = "User Worker #{i} "             
    user.email = "worker_#{i}@prueba.co"
    user.birth_date = (1-i).year.ago
    user.number_card = nil
    user.address = nil
    user.phone_number = nil
    user.user_name = "worker_#{i}"
    user.password = "1234567890"
    user.save
end