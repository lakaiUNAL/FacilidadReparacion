class Worker < ApplicationRecord
  
  has_many :supports
  has_many :complete_works
  has_many :skills
  has_many :services, through: :skills
  has_many :schedules
  has_many :payments
  has_many :comments

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
  
  # Para los archivos adjuntos (ver gema papercut)
  has_attached_file :picture,  styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
end
