class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :request
  has_many :payment
  has_many :comment
  has_many :schedule

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
