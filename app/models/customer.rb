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

  has_attached_file :picture,  styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/defauls_user_img.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable
end
