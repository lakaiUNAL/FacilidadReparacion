class Worker < ApplicationRecord
  # worker has many supports (association)
  has_many :supports
  # worker has many complete works (association)
  has_many :complete_works
  # worker has many complete skills (association)
  has_many :services, through :skills
  # worker has many complete schedules (association)
  has_many :schedules
  # worker has many complete payments (association)
  has_many :payments
  # worker has many complete comments (association)
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
