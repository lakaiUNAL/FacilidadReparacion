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

###################################### FUNCIONES Y UTILERIA
def rand_in_range(from, to)
  rand * (to - from) + from
end


###################################### INICIO DE SEED

puts 'Datos Propios'
Admin.create(email: "god@power.com", encrypted_password: "Hola")
#Datos para nuestro acceso
Customer.create(
    name: "Cliente Gama", 
    email: "jcgamar@prueba.co", 
    user_name: "jcgamar", 
    password: "juancho",
    address: "Cl. 34 #90 c 33 sur Bogota, Colombia",
    confirmed_at: Time.now
)
Worker.create(
    name: "Worker Gama", 
    email: "jcgamar@prueba.co", 
    user_name: "jcgamar", 
    password: "juancho",
    address: "Cl. 3 #50 a 05 sur Bogota, Colombia",
    confirmed_at: Time.now
)

Customer.create(
    name: "David Felipe R", 
    email: "dafrodriguezro@test.com", 
    user_name: "dafrodriguezro", 
    password: "popo056",
    address: "La picota, Bogota",
    confirmed_at: Time.now
)

Worker.create(name: "David Felipe R", email: "dafrodriguezro@test.com", user_name: "dafrodriguezro", password: "popo056", confirmed_at: Time.now)

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
        #address: Faker::Address.street_address,
        address: "Cl. 50 #20-26, Bogotá, Cundinamarca, Colombia",
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
        #address: Faker::Address.street_address,
        address: "La Aldea De Los Gerreros, Cl. 25d #37-2, Bogotá",
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
            #Request.create(customer_id: user, service_id: service, article: "Articulo que necesita reparación", description: "Descripcion del daño", fecha_servicio: Faker::Date.backward(23_75))
            Request.create(customer_id: user, service_id: service, article: "Articulo que necesita reparación", description: "Descripcion del daño")
        end
    end
end
n_request = Request.count
puts "Total de peticiones de usuario #{n_request}"


# CITAS AGENDADAS
# Al rededor de 1 por usuario
Worker.all.each do |w|
    n_services.times do |s|
        if rand < 7/Float(n_services)
            hora = 7 + rand(10)
            dia = rand(60)
            fecha = Date.today + dia.days + hora.hours
            customer = rand(n_customers)

            Schedule.create(date: fecha, worker_id: w.id, customer_id: customer, service_id: w.service_ids.sample(1)[0] )
        end
    end
end
n_chedules = Schedule.count
puts "Total de citas agendadas #{n_chedules}"