# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#drop_table(Customer)
#drop_table(Worker)
#drop_table(Service)
#drop_table(Request)
#drop_table(Skill)

require 'faker' 

puts 'Datos Propios'
#Datos para nuestro acceso
Customer.create(name: "Cliente Gama", email: "jcgamar@prueba.co", user_name: "jcgamar", password: "juancho", confirmed_at: Time.now)
Worker.create(name: "Técnico Gama", email: "jcgamar@prueba.co", user_name: "jcgamar", password: "juancho", confirmed_at: Time.now)

puts 'Datos de Servicios'
# SERVICIOS PRESTADOS
Service.create(description:"Mantenimiento de Celulares")
Service.create(description:"Mantenimiento de Computadores")
Service.create(description:"Mantenimiento de Neveras")
Service.create(description:"Mantenimiento de lavadoras")
Service.create(description:"Cerrajeria")
Service.create(description:"Mampostería")

n_services = Service.count
puts "Cantidad de servicios #{n_services}"

#TÉCNICOS CREADOS CON GEMA FAKER
40.times do |i|
    Worker.create(
        name: Faker::Name.name_with_middle,
        email: Faker::Internet.email,
        birth_date: Faker::Date.backward(23_75),
        #el numero de tarjeta estaba como Faker::Bank.iban pero me generaba error :/
        number_card: nil,
        address: Faker::Address.street_address,
        phone_number: Faker::PhoneNumber.cell_phone,
        user_name: Faker::Internet.user_name,
        #Comentado para poder probar el login de los usuarios
        #password: Faker::Internet.password(8))
        password: "david_testeando",
        confirmed_at: Time.now
    )
end
n_workers = Worker.count
puts "Cantidad de técnicos #{n_workers}"

# CLIENTES CREADOS CON GEMA FAKER
40.times do |i|
    Customer.create(
        name: Faker::Name.name_with_middle,
        email: Faker::Internet.email,
        birth_date: Faker::Date.backward(23_75),
        #el numero de tarjeta estaba como Faker::Bank.iban pero me generaba error :/
        number_card: nil,
        address: Faker::Address.street_address,
        phone_number: Faker::PhoneNumber.cell_phone,
        user_name: Faker::Internet.user_name,
        #Comentado para poder probar el login de los usuarios
        #password: Faker::Internet.password(8))
        password: "david_testeando",
        confirmed_at: Time.now
    )
end
n_customers = Customer.count
puts "Cantidad de clientes #{n_customers}"

# HABILIDADES DE LOS TÉCNICOS
# Al rededor de 3 por técnico
n_workers.times do |tecnico|
    n_services.times do |service|
        if rand < 3/Float(n_services)
            Skill.create(worker_id: tecnico, service_id: service)
        end
    end
end
n_skills = Skill.count
puts "Total de habilidades #{n_skills}"

# PETICIONES DE USUARIO
# Al rededor de 1 por usuario
n_customers.times do |user|
    n_services.times do |service|
        if rand < 1.5/Float(n_services)
            Request.create(customer_id: user, service_id: service, article: "Articulo que necesita reparación", description: "Descripcion del daño")
        end
    end
end
n_request = Request.count
puts "Total de peticiones de usuario #{n_request}"