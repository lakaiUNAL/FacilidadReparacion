class Worker < ApplicationRecord
  # worker has many supports (association)
  has_many :supports
  # worker has many complete works (association)
  has_many :complete_works
  # worker has many complete skills (association)
  has_many :skills
  has_many :services, through: :skills
  # worker has many complete schedules (association)
  has_many :schedules
  # worker has many complete payments (association)
  has_many :payments
  # worker has many complete comments (association)
  has_many :comments
  # Name no null 
  validates :name , presence: true
  # Email no null
  validates :email , presence: true
  # Username  no null
  validates :user_name , presence: true
  # Password no null
  validates :encrypted_password , presence: true
  # Validate associate
  validates_associated :supports
  validates_associated :complete_works
  #validates_associated :services
  validates_associated :schedules
  validates_associated :payments
  validates_associated :comments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  
  
end
