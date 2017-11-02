class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def tecnicos
    return Worker.all 
  end
  
  def servicios
    return Service.joins(request: :customer)
  end
  
  def clientes
    
    eliminar_nulos = Customer.all
    eliminar_nulos.each do |element|
      if element == nil
        eliminar_nulos.delete(element)
      end
    end
  return eliminar_nulos    
  end
  
  def habilidades
    return Skill.joins(:worker)
  end
end
