class Tecnico::AgendaController < ApplicationController
  before_action :authenticate_worker!
  
  def trabajos
    @Pendientes = current_worker.peticiones_pendientes(params[:pendientes_page])
    @Agendadas = current_worker.schedules
  end

  def cancelar
    Proposal.destroy( params[:destr] )
    redirect_to tecnico_agenda_trabajos_path
  end

  

end
