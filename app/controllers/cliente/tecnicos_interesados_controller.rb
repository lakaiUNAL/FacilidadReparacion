class Cliente::TecnicosInteresadosController < ApplicationController
  
  before_action :authenticate_customer!
  def index
    @peticiones = current_customer.tecnicos_postulados
  end

  def show
  end

  def destroy
  end
end
