class Worker < ApplicationRecord
  # worker has many supports (association)
  has_many :supports
  # worker has many complete works (association)
  has_many :complete_works
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
