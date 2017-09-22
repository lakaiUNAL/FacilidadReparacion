class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :request
  has_many :payment
  has_many :comment
  has_many :schedule
  
  # Name no null
  validates :name , presence: true
  #Email no null
  validates :email , presence: true
  #User name no null
  validates :user_name, presence: true
  # Password no null
  validates :encrypted_password , presence: true
  # Validate associate
  #validates_associated :requests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
