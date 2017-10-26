class Cliente::TecnicosInteresadosController < ApplicationController
  before_action :authenticate_customer!

  def index
    @peticiones = current_customer.tecnicos_postulados
  end

  def show
  end

  def destroy
  end

  # TODO: Verificar que el tecnico este en la lista de postulados 
  # para que no acceda a peticiones fantasma o no autorizadas

  def citar
  	@tecnico = Worker.find(params[:tecnico_id])
  	@horarios_ocupados = @tecnico.citas_agendadas(params[:year].to_i, params[:week].to_i)
  end

  private 
end
