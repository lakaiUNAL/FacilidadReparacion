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
  
  #Para la integracion de google maps 
  geocoded_by :address      #Puede ser una direccion ip tambien (ojo con esto)
  after_validation :geocode 

  has_attached_file :picture,  styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/defauls_user_img.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable 

  devise :omniauthable, :omniauth_providers => [:facebook]       


  def self.new_with_session(params, session)
    super.tap do |customer|
      if data = session["devise.facebook"] && session["devise.facebook"]["extra"]["raw_info"]
        customer.email = data["email"] if customer.email.blank?
      end
    end
  end

  ##def self.from_omniauth(auth)
  def self.from_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
    #where(facebook_id: auth.uid).first_or_create do |customer|
      customer.email = auth.info.email
      customer.name = auth.info.name
      customer.user_name = auth.info.email.split('@')[0]
      customer.password = Devise.friendly_token[0,20]
      customer.skip_confirmation!
      # customer.name = auth.info.name   # assuming the user model has a name
    end
  end         
end  