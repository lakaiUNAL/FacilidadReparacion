class Worker < ApplicationRecord
  
  has_many :supports
  has_many :complete_works
  has_many :skills
  has_many :services, through: :skills
  has_many :schedules
  has_many :payments
  has_many :comments
  has_many :proposal

  validates :name , presence: true
  validates :email , presence: true
  validates :user_name , presence: true
  validates :encrypted_password , presence: true
  
  # Validate associate
  validates_associated :supports
  validates_associated :complete_works
  validates_associated :schedules
  validates_associated :payments
  validates_associated :comments
  
  #Para la integracion de google maps 
  geocoded_by :address      #Puede ser una direccion ip tambien (ojo con esto)
  after_validation :geocode 
  
  # Para los archivos adjuntos (ver gema papercut)
  has_attached_file :picture,  styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/defauls_user_img.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # Servicios a los que el tecnico puede aplicar
  def myFreeServices_paginate(curr_page)
    services = self.services  # Verificar que servicios presta el tecnico
    peticiones = Request.where( service_id: services.ids ) # Consultar a qué peticiones puede aplicar
    peticiones.paginate(page: curr_page, per_page: 10) # Páginar los resultados
  end
  
  # Peticiones pendidentes por aceptar por el cliente
  def peticiones_pendientes(curr_page)
    self.proposal.paginate(page: curr_page, per_page: 10)
  end

  # Citas que ya han sido aceptadas por ambas partes 
  # Es un hash con clave el numero de dia de la semana y contiene una lista con la hora ya ocupada
  def citas_agendadas(año, semana)
    init = Date.commercial(year = año, cweek = semana)
    citas = self.schedules.where(date: (init)..(init + 5.days))

    semanario = {}

    citas.each do |c|
      if semanario[c.date.strftime('%u').to_i].nil? 
        semanario[c.date.strftime('%u').to_i] = []
      end
      semanario[c.date.strftime('%u').to_i].append( c.date.strftime('%H').to_i )
    end

    semanario
  end
  # Worker.first.citas_agendadas(2018,4).count
end
